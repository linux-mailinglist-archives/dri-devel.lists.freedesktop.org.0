Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55A2BB26
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 22:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E590D8982D;
	Mon, 27 May 2019 20:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980248982D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 20:11:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4F86B80376;
 Mon, 27 May 2019 22:11:41 +0200 (CEST)
Date: Mon, 27 May 2019 22:11:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH 3/6] drm/bridge: extract some Analogix I2C DP common code
Message-ID: <20190527201139.GA27782@ravnborg.org>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065352.8FD7668B05@newverein.lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523065352.8FD7668B05@newverein.lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=1z2v1k-a1PjaIlATdV0A:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9yc3Rlbi4KCj4gaW5kZXggMDAwMDAwMDAwMDAwLi45Y2IzMDk2MjAzMmUKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1p
MmMtZHB0eC5jCj4gQEAgLTAsMCArMSwxNjkgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKPiArLyoKPiArICogQ29weXJpZ2h0KGMpIDIwMTcgSWNlbm93eSBaaGVuZyA8
aWNlbm93eUBhb3NjLmlvPgo+ICsgKgo+ICsgKiBCYXNlZCBvbiBhbmFsb2dpeC1hbng3OHh4LmMs
IHdoaWNoIGlzOgo+ICsgKiAgIENvcHlyaWdodChjKSAyMDE2LCBBbmFsb2dpeCBTZW1pY29uZHVj
dG9yLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ICsKPiArI2luY2x1ZGUgPGRy
bS9kcm0uaD4KPiArI2luY2x1ZGUgPGRybS9kcm1QLmg+CgpDYW4gd2UgcGxlYXNlIGF2b2lkIGRy
bVAuaCBpbiBuZXcgZmlsZXMuClRoZSBoZWFkZXIgZmlsZSBpcyBkZXByZWNhdGVkIGFuZCB3ZSB0
cnkgdG8gZ2V0IHJpZCBvZiBpdC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
