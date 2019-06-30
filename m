Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C218A5B1B3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDA089D86;
	Sun, 30 Jun 2019 20:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25F89D86
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 20:55:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 73E048032E;
 Sun, 30 Jun 2019 22:55:15 +0200 (CEST)
Date: Sun, 30 Jun 2019 22:55:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Message-ID: <20190630205514.GA17046@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630202246.GB15102@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=zWgoevcLopjZgIZCDrAA:9 a=kLCGM-lqtgZHwNan:21 a=6SVaLwYTUbKinDPI:21
 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 mka@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2xhcy4KCj4gPiArCj4gPiArCS8qIE9ubHkgYWRkIHRpbWluZ3MgaWYgb3ZlcnJpZGUg
d2FzIG5vdCB0aGVyZSBvciBmYWlsZWQgdG8gdmFsaWRhdGUgKi8KPiA+ICsJaWYgKG51bSA9PSAw
ICYmIHBhbmVsLT5kZXNjLT5udW1fdGltaW5ncykKPiA+ICsJCW51bSA9IHBhbmVsX3NpbXBsZV9n
ZXRfdGltaW5nc19tb2RlcyhwYW5lbCk7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIE9ubHkgYWRk
IGZpeGVkIG1vZGVzIGlmIHRpbWluZ3Mvb3ZlcnJpZGUgYWRkZWQgbm8gbW9kZS4KPiAKPiBUaGlz
IHBhcnQgSSBmYWlsIHRvIHVuZGVyc3RhbmQuCj4gSWYgd2UgaGF2ZSBhIHBhbmVsIHdoZXJlIHdl
IGluIHBhbmVsLXNpbXBsZSBoYXZlIHNwZWNpZmllZCB0aGUgdGltaW5ncywKPiBhbmQgZG9uZSBz
byB1c2luZyBkaXNwbGF5X3RpbWluZyBzbyB3aXRoIHByb3BlciB7bWluLCB0eXAsIG1heH0gdGhl
biBpdAo+IHNob3VsZCBiZSBwZXJmZWN0bHkgbGVnYWwgdG8gc3BlY2lmeSBhIG1vcmUgcHJlY2lz
ZSB2YXJpYW50IGluIHRoZSBEVAo+IGZpbGUuCj4gT3Igd2hhdCBkaWQgSSBtaXNzIGhlcmU/CgpH
b3QgaXQgbm93LgpJZiBkaXNwbGF5X21vZGUgaXMgdXNlZCBmb3IgdGltaW5ncyB0aGlzIGlzIHdo
YXQgeW91IGNhbGwgImZpeGVkIG1vZGUiLgpIbW0sIGlmIEkgZ290IGNvbmZ1c2VkIHNvbWVvbmUg
ZWxzZSBtYXkgYWxzbyBiZSBjb25mdXNlZCBieSB0aGlzIG5hbWluZy4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
