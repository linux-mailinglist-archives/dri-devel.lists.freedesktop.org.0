Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3AF81FD4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3978189CCE;
	Mon,  5 Aug 2019 15:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBA889CCE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:11:06 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id f187so29623775ywa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 08:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xpk6f+iULzta9MKqDdvJJrwYV01nAnI8/sskf5srO6w=;
 b=A9tD+01zFQy9hrYfT9I7vO9fMLc5WO6u/GhVp6ObewRJaqH2rbVRy2y6baAAyIgXkv
 KAt8BT52CvEczIkRABtBLKJHet6JgjFWvFY4IJc4ImtzKifECm+zMl8jR5MZx2HA4dAv
 7ds4ckJVZs+NPzOHFO59ni+DCidnsnMIMBJJKGRsmCprDg/wX9myRPWtM7ftJSR+8QRP
 FAhf9UqKP732e3MnsRhCm/Km9Q4k9JnnrxdqoR6p9IGWnnSGPcB2TKS+Mlv/L+SW8mvR
 dYIn3Ic6x2LO98/8mT1JuQ32+k2ZVz87q5w4DDLIVtWPtpK6W0w1DKePJvjG7tXEm916
 xcyQ==
X-Gm-Message-State: APjAAAUTl1JjK94tX1qaRox9ipkA7gqjr/7aPvX0tT3yEvkafaZS2iMO
 BRNKO6YVxwQRGNptwiwb6jqs8A==
X-Google-Smtp-Source: APXvYqwucyKIizPhyNVHyc8xvnzNgJysm59poTBqYa8cImRwlOnzSuOS8zREscvyu0uqoevbAyXDUA==
X-Received: by 2002:a81:1d11:: with SMTP id d17mr96208542ywd.9.1565017865628; 
 Mon, 05 Aug 2019 08:11:05 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w188sm18900454ywc.93.2019.08.05.08.11.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 08:11:04 -0700 (PDT)
Date: Mon, 5 Aug 2019 11:11:03 -0400
From: Sean Paul <sean@poorly.run>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/rockchip: Suspend DP late
Message-ID: <20190805151103.GY104440@art_vandelay>
References: <20190802184616.44822-1-dianders@chromium.org>
 <20190802192629.GX104440@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802192629.GX104440@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xpk6f+iULzta9MKqDdvJJrwYV01nAnI8/sskf5srO6w=;
 b=Yc8iF9Tg6K4ZUygMSzIbAg7TgFHqn+DDIs7uLPE5xrDqID2IWXqNk6LvPQ9rUJHn/y
 iwBv+kyYjwO2lD6X/Fbjg+YcSnkIRz0Leri50AKvtchFjaw+ayZguSVOSk2X/dILnpWv
 l05vTy1Q3eSFfnRT62uEMfRaxksSOQIg4guRvn5xGyPW/ul2eM9FFdAE7qOmM6HojDz0
 hxSRDLNwD1Y46nxRF8OvkBl4oPTboz1hP1ZPsSs4wUZj6mCajEVFQtOiN5fzjDm955Jb
 YEDhkh4JZe7a4k1yOwZ76mQBkUFzfK0sAxWkzheCnCCnGz6AvAqPROj/zx2UuM4Ya+HD
 ntyw==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mka@chromium.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDM6MjY6MjlQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDExOjQ2OjE2QU0gLTA3MDAsIERvdWdsYXMgQW5k
ZXJzb24gd3JvdGU6Cj4gPiBJbiBjb21taXQgZmU2NGJhNWM2MzIzICgiZHJtL3JvY2tjaGlwOiBS
ZXN1bWUgRFAgZWFybHkiKSB3ZSBtb3ZlZAo+ID4gcmVzdW1lIHRvIGJlIGVhcmx5IGJ1dCBsZWZ0
IHN1c3BlbmQgYXQgaXRzIG5vcm1hbCB0aW1lLiAgVGhpcyBzZWVtcwo+ID4gbGlrZSBpdCBjb3Vs
ZCBiZSBPSywgYnV0IGNhc3VlcyBwcm9ibGVtcyBpZiBhIHN1c3BlbmQgZ2V0cyBpbnRlcnJ1cHRl
ZAo+ID4gcGFydHdheSB0aHJvdWdoLiAgVGhlIE9TIG9ubHkgYmFsYW5jZXMgbWF0Y2hpbmcgc3Vz
cGVuZC9yZXN1bWUgbGV2ZWxzLgo+ID4gLi4uc28gaWYgc3VzcGVuZCB3YXMgY2FsbGVkIHRoZW4g
cmVzdW1lIHdpbGwgYmUgY2FsbGVkLiAgSWYgc3VzcGVuZAo+ID4gbGF0ZSB3YXMgY2FsbGVkIHRo
ZW4gcmVzdW1lIGVhcmx5IHdpbGwgYmUgY2FsbGVkLiAgLi4uYnV0IGlmIHN1c3BlbmQKPiA+IHdh
cyBjYWxsZWQgcmVzdW1lIGVhcmx5IG1pZ2h0IG5vdCBnZXQgY2FsbGVkLiAgVGhpcyBsZWFkcyB0
byBhbgo+ID4gdW5iYWxhbmNlIGluIHRoZSBjbG9jayBlbmFibGVzIC8gZGlzYWJsZXMuCj4gPiAK
PiA+IExldHMgdGFrZSB0aGUgc2ltcGxlIGZpeCBhbmQganVzdCBtb3ZlIHN1c3BlbmQgdG8gYmUg
bGF0ZSB0byBtYXRjaC4KPiA+IFRoaXMgbWFrZXMgdGhlIFBNIGNvcmUgdGFrZSBwcm9wZXIgY2Fy
ZSBpbiBrZWVwaW5nIHRoaW5ncyBiYWxhbmNlZC4KPiA+IAo+ID4gRml4ZXM6IGZlNjRiYTVjNjMy
MyAoImRybS9yb2NrY2hpcDogUmVzdW1lIERQIGVhcmx5IikKPiA+IFNpZ25lZC1vZmYtYnk6IERv
dWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiAKPiBSZXZpZXdlZC1ieTog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gCj4gVGhpcyBzaG91bGQgZ28gaW4gLW1pc2Mt
Zml4ZXMgYW5kIGR1ZSB0byBzb21lLi4uIGFkbWluaXN0cmF0aXZlIHJlYXNvbnMuLi4gSQo+IHdp
bGwgbGVhdmUgaXQgb24gdGhlIGxpc3QgdW50aWwgTWFhcnRlbiBoYXMgYSBjaGFuY2UgdG8gZmYg
dG8gLXJjNCBvbiBNb25kYXkuCj4gSSdsbCBhcHBseSBpdCB0aGVuIHNvIGFzIHRvIG5vdCByZXF1
aXJlIGEgYmFja21lcmdlLgoKV2UncmUgbm8gbG9uZ2VyIGFibGUgdG8gZmYgZHJtLW1pc2MtZml4
ZXMgc2luY2UgYSBjb21taXQgY2FtZSBpbiBvbiBTYXR1cmRheSwgc28KSSd2ZSBwaWxlZCB0aGlz
IG9uIGFzIHdlbGwuCgpUaGFua3MsCgpTZWFuCgo+IAo+IFNlYW4KPiAKPiA+IC0tLQo+ID4gCj4g
PiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMgfCAyICst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9j
a2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9hbmFsb2dpeF9kcC1yb2NrY2hpcC5j
Cj4gPiBpbmRleCA3ZDdjYjU3NDEwZmMuLmYzOGY1ZTExM2M2YiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9hbmFsb2dpeF9kcC1yb2NrY2hpcC5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYwo+ID4gQEAgLTQz
Niw3ICs0MzYsNyBAQCBzdGF0aWMgaW50IHJvY2tjaGlwX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4gPiAgCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHJvY2tjaGlw
X2RwX3BtX29wcyA9IHsKPiA+ICAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCj4gPiAtCS5zdXNwZW5k
ID0gcm9ja2NoaXBfZHBfc3VzcGVuZCwKPiA+ICsJLnN1c3BlbmRfbGF0ZSA9IHJvY2tjaGlwX2Rw
X3N1c3BlbmQsCj4gPiAgCS5yZXN1bWVfZWFybHkgPSByb2NrY2hpcF9kcF9yZXN1bWUsCj4gPiAg
I2VuZGlmCj4gPiAgfTsKPiA+IC0tIAo+ID4gMi4yMi4wLjc3MC5nMGYyYzRhMzdmZC1nb29nCj4g
PiAKPiAKPiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJv
bWl1bSBPUwoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
