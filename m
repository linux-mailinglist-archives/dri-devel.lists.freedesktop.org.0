Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593C1C12CF
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 15:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED74E6EC92;
	Fri,  1 May 2020 13:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0926EC8E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 13:24:49 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8760424960
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588339489;
 bh=d8OPxjX6yuJbdOTlfUXM7Zvc614YcSXkktA7q5/FxRY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oRiwD0Q+jvvpP6sMUM7uXKK++I/eOZnt6Ikrp6rtJBAPD/6vZl/OFq4Uxzqg573dr
 HXTT0bMxoz2GibxZPq00kqvlqfP1GYpMyc+LbA3Tf2Ofs9mJFJf4NsfNvEueN0i/ZY
 ldEXuawf8h0p2ODo+BCBInJ2O4GxSh/bcIMpNLxQ=
Received: by mail-ed1-f50.google.com with SMTP id l3so7216862edq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 06:24:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuaRog9lLuH48ofooYFPfnnJ1xYUHgbOvzqndMaQttxp79+NHlmU
 dIU0tBpHTim8H89Ow5I4U79IbiHlsmaOeLY6xg==
X-Google-Smtp-Source: APiQypKel2U1e5MRHXKLL7Rnuz1U41FBCv2Ii6mcl2FuZrvIApbgp6jSgjZ93cS0z2rzE3pcCu/kvy2F5YvYBuZXTp0=
X-Received: by 2002:aa7:dd95:: with SMTP id g21mr3461314edv.148.1588339487975; 
 Fri, 01 May 2020 06:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
 <20200417150614.2631786-6-enric.balletbo@collabora.com>
In-Reply-To: <20200417150614.2631786-6-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 1 May 2020 21:24:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Gc9uCtfcp+qo=KnVOYfyjw4rDpe15A1q6G2A-iXpSow@mail.gmail.com>
Message-ID: <CAAOTY_9Gc9uCtfcp+qo=KnVOYfyjw4rDpe15A1q6G2A-iXpSow@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/mediatek: mtk_dsi: Use simple encoder
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ05pyIMTfml6Ug6YCx5LqUIOS4i+WNiDExOjA25a+r6YGT77ya
Cj4KPiBUaGUgbXRrX2RzaSBkcml2ZXIgdXNlcyBhbiBlbXB0eSBpbXBsZW1lbnRhdGlvbiBmb3Ig
aXRzIGVuY29kZXIuIFJlcGxhY2UKPiB0aGUgY29kZSB3aXRoIHRoZSBnZW5lcmljIHNpbXBsZSBl
bmNvZGVyLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwu
b3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjM6
IE5vbmUKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYyB8IDE0ICsrKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gaW5kZXggODY5YWUwYTJlOWY4Li5kNjg2OTRmZjAwZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiBAQCAtMjIsNiArMjIsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9w
YW5lbC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9wcm9iZV9oZWxwZXIuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
aD4KPgo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIgo+Cj4gQEAgLTc4OCwxNSArNzg5
LDYgQEAgc3RhdGljIHZvaWQgbXRrX291dHB1dF9kc2lfZGlzYWJsZShzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQo+ICAgICAgICAgZHNpLT5lbmFibGVkID0gZmFsc2U7Cj4gIH0KPgo+IC1zdGF0aWMgdm9p
ZCBtdGtfZHNpX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4g
LXsKPiAtICAgICAgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7Cj4gLX0KPiAtCj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgbXRrX2RzaV9lbmNvZGVyX2Z1bmNz
ID0gewo+IC0gICAgICAgLmRlc3Ryb3kgPSBtdGtfZHNpX2VuY29kZXJfZGVzdHJveSwKPiAtfTsK
PiAtCj4gIHN0YXRpYyBpbnQgbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwgc3RydWN0IG10a19kc2kgKmRzaSk7Cj4gIHN0YXRpYyB2b2lkIG10a19kc2lfZGVz
dHJveV9jb25uX2VuYyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKTsKPgo+IEBAIC0xMTQwLDggKzExMzIs
OCBAQCBzdGF0aWMgaW50IG10a19kc2lfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sIHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIHsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAg
ICAgIHJldCA9IGRybV9lbmNvZGVyX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVyLCAmbXRrX2RzaV9l
bmNvZGVyX2Z1bmNzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9F
TkNPREVSX0RTSSwgTlVMTCk7Cj4gKyAgICAgICByZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5p
dChkcm0sICZkc2ktPmVuY29kZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUk1fTU9ERV9FTkNPREVSX0RTSSk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gICAgICAg
ICAgICAgICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIGVuY29kZXIgaW5pdCB0byBkcm1cbiIpOwo+
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi4yNS4xCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
