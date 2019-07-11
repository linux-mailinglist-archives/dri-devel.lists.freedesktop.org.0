Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC766009
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 21:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5400289CD9;
	Thu, 11 Jul 2019 19:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DBF89CD9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 19:35:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4568880395;
 Thu, 11 Jul 2019 21:35:41 +0200 (CEST)
Date: Thu, 11 Jul 2019 21:35:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Message-ID: <20190711193539.GA5912@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
 <20190628171342.GA2238@ravnborg.org> <2169143.hEFa8b2HQR@diego>
 <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=5PwMyr1ww-aXvGv-uLAA:9 a=CjuIK1q_8ugA:10
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
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2guCgo+ID4gU28gVGhpZXJyeSB3YXMgYWJsZSB0byBsb29rIGF0IHRoZSBwYXRjaGVz
IHllc3RlcmRheSBpdCBzZWVtcyBhbmQgaGFzIEFja2VkCj4gPiBhbGwgdGhlIHJlbGV2YW50IG9u
ZXMuIEFzIGEgZHJtLW1pc2MtY29udHJpYnV0b3IgSSBjb3VsZCBhbHNvIGFwcGx5IHRoZW0KPiA+
IG15c2VsZiwgYnV0IG5vdyBkb24ndCB3YW50IHRvIHByZWVtcHQgYW55IGFkZGl0aW9uYWwgY29t
bWVudHMgeW91IG1pZ2h0Cj4gPiBoYXZlIDstKSAuIFNvIEkgZ3Vlc3MgbXkgcXVlc3Rpb24gd291
bGQgYmUgaWYgeW91IHN0aWxsIHdhbnQgdG8gZG8gYSByZXZpZXcKPiA+IG9yIGlmIEkgc2hvdWxk
IGFwcGx5IHRoZW0uCj4gCj4gSG9wZWZ1bGx5IHlvdSBzYXcsIGJ1dCBJIHJlc3BvbmRlZCB0byBh
bGwgb2YgeW91ciByZXZpZXcgZmVlZGJhY2suICBJbgo+IHRoZSBlbmQsIEkgdGhvdWdodCBpdCdk
IGJlIE9LIHRvIGxhbmQgdGhlIHNlcmllcyBhcy1pcyBhbmQgSSBjYW4gZml4Cj4gdXAgbml0cyBp
biBhIGZvbGxvdy11cCBzZXJpZXMsIHRob3VnaCBJJ20gd2FpdGluZyBmb3IgeW91ciByZXNwb25z
ZXMKPiB0byBhIGNvdXBsZSBxdWVzdGlvbnMgZmlyc3QuCj4gCj4gSXQgd291bGQgYmUgaWRlYWwg
aWYgeW91IGNvdWxkIGNvbmZpcm0gdGhhdCB5b3UncmUgT0sgd2l0aCB0aGlzIHBsYW4KPiBldmVu
IGlmIHlvdSBkb24ndCBoYXZlIHRpbWUgdG8gcmVzcG9uZCBpbiBkZXRhaWwgdG8gbXkgZW1haWxz
IHlldC4gIEkKPiB0aGluayBIZWlrbyBjYW4gbGFuZCB0aGVtIGFsbCB0aHJvdWdoIHRoZSBhcHBy
b3ByaWF0ZSBjaGFubmVscyBzaW5jZQo+IHRoZSBwYXRjaGVzIGhhdmUgYWxsIHRoZSBwcm9wZXIg
QWNrcy4KTXkgbWFpbiBjb25jZXJuIHdhcyB0aGUgYnVnIGNvY2VybmluZyBvdmVycmlkZV9tb2Rl
IC0gd2hpY2ggdHVybmVkIG91dCB0bwpiZSBtZSBjb25mdXNlZC4KVGhlcmUgaXMgb25lIHBhcnQg
YWJvdXQgZmxhZ3MgdGhhdCBkb2VzIG5vdCB5ZXQgbWFrZXMgc2Vuc2UgYnV0CndlIGNhbiBmaXgg
aXQgbGF0ZXIuCgpQbGVhc2UgcmVzZW5kIGEgc2VyaWVzIHRoYXQgYXBwbGllcyB0byBkcm0tbWlz
Yy1uZXh0IHNvCndlIGNhbiBsYW5kIHRoaXMuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
