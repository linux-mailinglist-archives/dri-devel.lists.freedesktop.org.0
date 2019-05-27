Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CFF2ACF2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 04:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7A3896F7;
	Mon, 27 May 2019 02:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8F7896F7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 02:25:09 +0000 (UTC)
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9421C2075C;
 Mon, 27 May 2019 02:25:06 +0000 (UTC)
Date: Mon, 27 May 2019 10:24:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller support
Message-ID: <20190527022401.GA6885@dragon>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508171827.GA21725@bogon.m.sigxcpu.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558923908;
 bh=PnWBJZi7tFkId/29AECHALDrxKdeCRYn68Pkw8Tj7jA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ru193l5yePtTv6ZAC+Zt6APOEXvKadKLLSPUNkUDF1jDt9dMXeEHyMfSC/Q9NhfOL
 98JJjpNXaqwyhDU8cAV/qFGKOAS34/kXb1tt5eERVkRz7jWrQNtI4+mTOfF9MZmwLH
 42zhZgJo9e65X5WRbcVAE1NUNwgYuC8poQSSXd+s=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, Robert Chiras <robert.chiras@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTg6MjdQTSArMDIwMCwgR3VpZG8gR8O8bnRoZXIg
d3JvdGU6Cj4gSWYgc29tZWJvZHkgaXMgd29ya2luZyBvbiBEQ1NTIHN1cHBvcnQgaXQnZCBiZSBj
b29sIHRvIGtub3cgc2luY2UgdGhpcwoKSSBoYXZlIHNvbWUgdGltZSBzbG90cyBoZXJlIGFuZCB3
aWxsIHN0YXJ0IGxvb2tpbmcgYXQgaXQsIGlmIG5vIG9uZSBlbHNlCmlzIGFscmVhZHkgd29ya2lu
ZyBvbiBpdC4KClNoYXduCgo+IGRyaXZlciBpcyBjdXJyZW50bHkgYSBjb21wb25lbnQgb2YgaW14
LWRpc3BsYXktc3Vic3lzdGVtIHdoaWNoIHdpbGwgb25seQo+IHdvcmsgb3V0IGlmIGRjc3MgaXMg
aGFuZGxlZCBsaWtlIHRoaXMgYXMgd2VsbC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
