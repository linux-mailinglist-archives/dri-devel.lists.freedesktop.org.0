Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C752B0F06
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 21:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDFB6E433;
	Thu, 12 Nov 2020 20:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E666E438
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:27:39 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0068D2001F;
 Thu, 12 Nov 2020 21:27:37 +0100 (CET)
Date: Thu, 12 Nov 2020 21:27:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 04/30] drm/via/via_dma: Remove set but unused variable
 'agp_base'
Message-ID: <20201112202736.GB3340631@ravnborg.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112190039.2785914-5-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=Yjl-dlItV_KMfdD7FBsA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLApPbiBUaHUsIE5vdiAxMiwgMjAyMCBhdCAwNzowMDoxM1BNICswMDAwLCBMZWUgSm9u
ZXMgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmco
cyk6Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jOiBJbiBmdW5jdGlvbiDigJh2
aWFfY21kYnVmX2p1bXDigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jOjU5Njox
MTogd2FybmluZzogdmFyaWFibGUg4oCYYWdwX2Jhc2XigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAKPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgpTbyB0aGlzIGlz
IHRoZW4gdGhlIGZpbmFsIGZyb20gdGhpcyBzZXQuLi4KCglTYW0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
