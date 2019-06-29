Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFE5ABA9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 16:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFF96E9A7;
	Sat, 29 Jun 2019 14:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49A96E9A7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 14:09:41 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hhE2n-00029i-Fh; Sat, 29 Jun 2019 16:09:33 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Date: Sat, 29 Jun 2019 16:09:32 +0200
Message-ID: <2169143.hEFa8b2HQR@diego>
In-Reply-To: <20190628171342.GA2238@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
 <20190628171342.GA2238@ravnborg.org>
MIME-Version: 1.0
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
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?ISO-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKQW0gRnJlaXRhZywgMjguIEp1bmkgMjAxOSwgMTk6MTM6NDIgQ0VTVCBzY2hyaWVi
IFNhbSBSYXZuYm9yZzoKPiBIaSBEb3VnLgo+IAo+ID4gU2FtOiBPaCEgIEkgaGFkbid0IG5vdGlj
ZWQgdGhhdCB5b3UndmUgYmVlbiBhZGRlZCBhcyBhIHBhbmVsCj4gPiBtYWludGFpbmVyIGluIGNv
bW1pdCBlZjBkYjk0Zjk0YTAgKCJNQUlOVEFJTkVSUzogQWRkIFNhbSBhcyByZXZpZXdlcgo+ID4g
Zm9yIGRybS9wYW5lbCIpLiAgRG9lcyB0aGF0IG1lYW4geW91IGFyZSBhYmxlIHRvIHByb3ZpZGUg
c29tZSBhZHZpY2UKPiA+IGZvciBob3cgdG8gbGFuZCB0aGlzIHNlcmllcz8KPiBSZXZpZXdlciBv
bmx5LCBub3QgbWFpbnRhaW5lci4uLi4KPiAKPiBJdCBpcyBvbiBteSBUT0RPIGxpc3QgZm9yIHRo
ZSB3ZWVrZW5kIHRvIGdvIHRocm91Z2ggdGhlIHBhdGNoIHNldCBpbgo+IGRldGFpbHMgYW5kIHBy
b3ZpZGUgZmVlZGJhY2suIEkgaGF2ZSByZWFkIHRoZW0gYmVmb3JlLCBidXQgSSBtaXNzIHRvIGRv
Cj4gYSBtb3JlIGRldGFpbGVkIHJlYWQgdGhyb3VnaC4KPiAKPiBCdXQgSSBjYW5ub3QgYXBwbHkg
dGhpcyB1bmxlc3MgVGhpZXJyeSBvciBvbmUgb2YgdGhlIERSTSBtYWludGFpbmVycwo+IGFjayBp
dC4KPiBXZSBzaW1wbHkgbmVlZCBzb21lb25lIHdpdGggYSBiZXR0ZXIgZ2VuZXJhbCBrbm93bGVk
Z2Ugb2YgRFJNIHRvIGFjayBpdAo+IHRoYW4gSSBoYXZlLgoKU28gVGhpZXJyeSB3YXMgYWJsZSB0
byBsb29rIGF0IHRoZSBwYXRjaGVzIHllc3RlcmRheSBpdCBzZWVtcyBhbmQgaGFzIEFja2VkCmFs
bCB0aGUgcmVsZXZhbnQgb25lcy4gQXMgYSBkcm0tbWlzYy1jb250cmlidXRvciBJIGNvdWxkIGFs
c28gYXBwbHkgdGhlbQpteXNlbGYsIGJ1dCBub3cgZG9uJ3Qgd2FudCB0byBwcmVlbXB0IGFueSBh
ZGRpdGlvbmFsIGNvbW1lbnRzIHlvdSBtaWdodApoYXZlIDstKSAuIFNvIEkgZ3Vlc3MgbXkgcXVl
c3Rpb24gd291bGQgYmUgaWYgeW91IHN0aWxsIHdhbnQgdG8gZG8gYSByZXZpZXcKb3IgaWYgSSBz
aG91bGQgYXBwbHkgdGhlbS4KCgpJbiBhbnkgY2FzZSwgSSdkIGxpa2UgdG8gdGFrZSB0aGUgYWN0
dWFsIGR0cyBwYXRjaGVzIChwYXRjaGVzIDMrNis3IGlmCkknbSBub3QgbWlzdGFrZW4pIHRocm91
Z2ggbXkgdHJlZSB1cCB0byBhcm0tc29jIGFmdGVyIHRoZSBmYWN0LCB0bwpwcmV2ZW50IGNvbmZs
aWN0cy4KClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
