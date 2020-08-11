Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC1242062
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 21:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D486E5CD;
	Tue, 11 Aug 2020 19:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE56E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 19:34:57 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id di22so9940946edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ah3lUsESswIBvsG7GUkwJ/Tbq6leOyOr927dHZOaN8w=;
 b=MZIeTQJNlBRuUT36FAXz96xcV0RKdEaLq32GS7+9XDg74iQ1ih60INzseIKuWzvCE1
 /NtNLjhuCIMDZZYZZxkU2CjxOX1qp56RILCpcmIfAW6OggUGDclZFAvex783gT5tEogC
 j2vZeDB1zU1uLipU+D5io34fDB952krOv4WtmbPBjp+ttIhSafllXYcJ4CqkVNiLw9Kr
 MBSSdKrH0ifbtRih7mVZpzJEP+4VjtgsSXsbsc/pBIgZcHZ3b5cfrjLXQfj3xpHxSieu
 NXiOuntphVCFVgpSnRzp3jmegzZCeOvvIHx1vu3spt9NYwm/Ri+D77JYhZaXh+9KQOWf
 /q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ah3lUsESswIBvsG7GUkwJ/Tbq6leOyOr927dHZOaN8w=;
 b=C63DzmVDFqvL0rSaKV3XkNnlJpA2C1FdGlP7GychHOk8snUh78Bjb2hE5Wp6i6NjZN
 oKQ2u7FxhbXdUjlewPcHz0Gw0ZWrt5Zcx27x/jVJd1GE425Urye32OGzzT3WWd1AHqVo
 fNgTvruCvTVF/PZ9IwbvFB8FAGh99l12YRmoUjQMcO/aT3xi3RBXWeamUeJW8eiAts3y
 Vabv4QJFJmdkwkRxOL9+ZEX4/21SHU3dMYIfi6MQJ81Zu1Y+c512U6sgYLv58KbL/P6T
 FuVVWbvI4zG1X2uOwlARtHezpeG7hOewnOe2ZHkZQzCb4CQWeldNUkL/5r9ege4pl2jc
 nxWg==
X-Gm-Message-State: AOAM530nM+064u5Vu1kIeuUYy9eKIgAGgF0/xCtZXchHXoL/aXTzV7Ne
 AjOSH5aN3i8mAbxElOtr1yBStxd7eR0tzDGGVPhaXQ==
X-Google-Smtp-Source: ABdhPJwEGtudVeTt3IqodUn3DQMjOo9jNHU5kU/lbjVEuKoIihjXVqO3XxnBp/9WH0rptf3J2fYy/w4oKsHAHr7H59I=
X-Received: by 2002:a50:fd0b:: with SMTP id i11mr20202808eds.298.1597174496138; 
 Tue, 11 Aug 2020 12:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200811092400.188124-1-christian.koenig@amd.com>
 <bbeaca4b-189d-c4dd-6d3a-e1489d6b0e4f@gmail.com>
 <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
 <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
 <e42482e1-6dc0-d4c5-4fd0-c6b15737e67c@gmail.com>
In-Reply-To: <e42482e1-6dc0-d4c5-4fd0-c6b15737e67c@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 12 Aug 2020 05:34:44 +1000
Message-ID: <CAPM=9tyUBMXMWbPbXLsNV7j10svYWRHnsYrNOeksQm_EPp-0VA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: revert "make TT creation purely optional v3"
To: "Koenig, Christian" <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMiBBdWcgMjAyMCBhdCAwMzoxMSwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMTEuMDguMjAgdW0gMTg6NDIg
c2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiA+IE9uIDIwMjAtMDgtMTEgMjo1MyBwLm0uLCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4+IEFtIDExLjA4LjIwIHVtIDE0OjUyIHNjaHJpZWIgQ2hy
aXN0aWFuIEvDtm5pZzoKPiA+Pj4gQW0gMTEuMDguMjAgdW0gMTE6MjQgc2NocmllYiBDaHJpc3Rp
YW4gS8O2bmlnOgo+ID4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCAyZGRlZjE3Njc4YmMyZWExZDIw
NTE3ZGQyYjRlZDRhYTk2N2ZmYThiLgo+ID4+Pj4KPiA+Pj4+IEFzIGl0IHR1cm5lZCBvdXQgVk1X
R0ZYIG5lZWRzIGEgbXVjaCB3aWRlciBhdWRpdCB0byBmaXggdGhpcy4KPiA+Pj4+Cj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4gPj4+IERhcmUgdG8gZ2l2ZSBtZSBhbiByYiBmb3IgdGhpcz8gSSBhbHJlYWR5IHRlc3RlZCBv
biBhbWRncHUgYW5kIGl0Cj4gPj4+IHNob3VsZCBiZSBmaXhpbmcgdGhlIFZNV0dGWCBwcm9ibGVt
cyB3ZSBjdXJyZW50bHkgaGF2ZS4KPiA+PiBVcHMsIHRoYXQgd2FzIHlvdXIgb2xkIEFNRCBhZGRy
ZXNzIDopCj4gPj4KPiA+PiBTbyBvbmNlIG1vcmUgd2l0aCBmZWVsaW5nLAo+ID4gOikKPiA+Cj4g
PiBIb3dldmVyLCBJJ20gYWZyYWlkIEknbSBub3QgZGVlcCBlbm91Z2ggaW50byBUVE0gY29kZSBh
bnltb3JlIHRvIGdpdmUKPiA+IHlvdSBhbiBSLWIsIGdpdmVuIGl0J3Mgbm90IGEgc3RyYWlnaHQg
cmV2ZXJ0IChwcmVzdW1hYmx5IGR1ZSB0byBvdGhlcgo+ID4gY2hhbmdlcyBpbiB0aGUgbWVhbnRp
bWUpLgo+Cj4gWWVhaCwgaW5kZWVkIGhhZCB0byBrZWVwIERhdmVzIGNoYW5nZXMgaW50YWN0Lgo+
Cj4gRGF2ZSBjYW4geW91IHRha2UgYSBsb29rIHRoZW4/CgpZdXAganVzdCBjYW1lIGluIGFmdGVy
IG15ICJzdG9wIHdvcmtpbmcgRGF2ZSIgdGltZS4KCkRpZCB5b3UgaGF2ZSBhbiBhbWRncHUgcGF0
Y2ggdGhhdCB3b3JrZWQgb24gdG9wIG9mIHRoaXM/IGRvZXMgdGhhdApuZWVkIHJldmVydGluZyBv
ciBkaWQgaXQgbm90IGxhbmQgeWV0PwoKT3RoZXJ3aXNlLAoKUmV2aWV3ZWQtYnk6IERhdmUgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
