Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3BA100C77
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 21:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467656E81C;
	Mon, 18 Nov 2019 20:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ADB6E81C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:03:32 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 94so15644619oty.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PDaqtIBFBkrRQtsY42nVpJi6m3lJCgdaGJOcPD9Eus=;
 b=Nd6zDVdmLzfKMdF/qvoaugKUighiLjugCKd1F8rtPoQcvaSyN6Dm71+nh8xNpYJgYf
 vqNcC0tAhfwunhli/rrxRRK3Ts6v9IipziNtlO10ik7hh9WGxNhlmYqEfMzihHTuTwBY
 CoXCTzmcCzg3bT/sze/3vBgOWMHSIHukDalV3RAXSYixx7MKFPpx4QNFQ6kJFSkrnDd8
 YC6m71fcEZd0Uyou9MhIn4QU4Z6R1V2ci0LFb1MYZPDfyLyjaBlZgosBxeD0cNCIQOpZ
 57gZkVdGueYUmEfLbkRx1eHV4+8DQsybyQu2B/mG3jBpsDGVPhQPJIDuppMEnyKd3NeA
 nbzA==
X-Gm-Message-State: APjAAAV2PQdYr9+RqlLfhyMqkEniOuIXEx106zDd4+HYIrirQx+9x0AA
 mT9b2TYVopyNWhrUtmpkVtNhsfmCFTZwZTBNhYgWVg==
X-Google-Smtp-Source: APXvYqxmAHc8pVLhK0Y0804VQwtyYsvapomac1UHPu9BRJmQq3WYdIqSwK6xX5pOlFN607Lp+Hp7TwzWoW9x/GPS1/Q=
X-Received: by 2002:a05:6830:22d0:: with SMTP id
 q16mr849080otc.188.1574107411531; 
 Mon, 18 Nov 2019 12:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20191114132436.7232-1-wambui.karugax@gmail.com>
 <8736ep1hm2.fsf@intel.com> <20191118192450.GA135013@art_vandelay>
In-Reply-To: <20191118192450.GA135013@art_vandelay>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 18 Nov 2019 21:03:20 +0100
Message-ID: <CAKMK7uG7Tb6oocrRgRFvq5oB2Rxjy+JmyOSXQtjo6Gt_WH91+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] add new DRM_DEV_WARN macro
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2PDaqtIBFBkrRQtsY42nVpJi6m3lJCgdaGJOcPD9Eus=;
 b=UxPgDGEUGSS2r8QojZ/ioqZmAmyhiiIEOQoy9RtBqwwu3kaOweSHsI8J4m2K+HhZA2
 mjvPBHZeE6rg6BOyz/I2PnBSCrqeMEqNQ6qYLKjizgjbfQauOxWanDCnsw3hAhfcpw40
 76vwRpGOIpHjgHlFudj72VJL3sr8VtLtvfikY=
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgODoyNCBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4gT24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDE6NTI6NTNQTSArMDIwMCwgSmFu
aSBOaWt1bGEgd3JvdGU6Cj4gPiBPbiBUaHUsIDE0IE5vdiAyMDE5LCBXYW1idWkgS2FydWdhIDx3
YW1idWkua2FydWdheEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBUaGlzIGFkZHMgYSBuZXcgRFJN
X0RFVl9XQVJOIGhlbHBlciBtYWNybyBmb3Igd2FybmluZ3MgbG9nIG91dHB1dCB0aGF0IGluY2x1
ZGUKPiA+ID4gZGV2aWNlIHBvaW50ZXJzLiBJdCBhbHNvIGluY2x1ZGVzIHRoZSB1c2Ugb2YgdGhl
IERSTV9ERVZfV0FSTiBtYWNybyBpbgo+ID4gPiBkcm0vcm9ja2NoaXAgdG8gcmVwbGFjZSBkZXZf
d2Fybi4KPiA+Cj4gPiBJJ20gdHJ5aW5nIHRvIHNvbGljaXQgbmV3IHN0cnVjdCBkcm1fZGV2aWNl
IGJhc2VkIGxvZ2dpbmcgbWFjcm9zLCBhbmQKPiA+IHN0YXJ0aW5nIHRvIGNvbnZlcnQgdG8gdGhv
c2UuIFsxXQo+ID4KPgo+IFRoaXMgc291bmRzIGdvb2QgdG8gbWUsIEknZCBtdWNoIHByZWZlciB0
aGUgbm9uLWNhcHMgdmVyc2lvbnMgb2YgdGhlc2UKPiBmdW5jdGlvbnMuIFNvIGxldCdzIHdhaXQg
Zm9yIHRob3NlIHRvIGJ1YmJsZSB1cCBhbmQgdGhlbiBjb252ZXJ0IHJvY2tjaGlwIHRvCj4gZHJt
X2Rldl8qCgpDYXJlIHRvIGFjayBKYW5pJ3MgcGF0Y2ggZGlyZWN0bHksIHNvIHRoaXMgaXMgYWxs
IGZvcm1hbD8KCkphbmksIGNhbiB5b3UgcGxzIGFsc28gYWRkIGEgdG9kby5yc3QgcGF0Y2ggb24g
dG9wIHRvIGFkanVzdCB0aGUKcmVsZXZhbnQgaXRlbSB0byB0aGUgbmV3IGNvbG9yIGNob2ljZT8K
CldhbWJ1aSwgSSBndWVzcyBzbGlnaHQgY2hhbmdlIG9mIHBsYW5zLCBpdCBoYXBwZW5zIC4uLgoK
Q2hlZXJzLCBEYW5pZWwKCj4KPiBTZWFuCj4KPiA+IEJSLAo+ID4gSmFuaS4KPiA+Cj4gPgo+ID4g
WzFdIGh0dHA6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzYzZDFlNzJi
OTllOWMxM2VlNWIxYjM2MmE2NTNmZjljMjFlMTkxMjQuMTU3MjI1ODkzNi5naXQuamFuaS5uaWt1
bGFAaW50ZWwuY29tCj4gPgo+ID4KPiA+Cj4gPgo+ID4gPgo+ID4gPiBXYW1idWkgS2FydWdhICgy
KToKPiA+ID4gICBkcm0vcHJpbnQ6IGFkZCBEUk1fREVWX1dBUk4gbWFjcm8KPiA+ID4gICBkcm0v
cm9ja2NoaXA6IHVzZSBEUk1fREVWX1dBUk4gbWFjcm8gaW4gZGVidWcgb3V0cHV0Cj4gPiA+Cj4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmMgfCAzICsrLQo+ID4gPiAg
aW5jbHVkZS9kcm0vZHJtX3ByaW50LmggICAgICAgICAgICAgIHwgOSArKysrKysrKysKPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IC0tCj4gPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCj4K
PiAtLQo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9T
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
