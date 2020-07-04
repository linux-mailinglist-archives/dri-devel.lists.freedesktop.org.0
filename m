Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C621490A
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 00:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B50A6EBE5;
	Sat,  4 Jul 2020 22:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F41C6EBE5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 22:32:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 992042100A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593901948;
 bh=JDgxeDc0q77mn2Bfmub/zIa2vh8KeOhsnmJmESnVl2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OU2Bcdj8eCRQq8bAmhgE0cftlYY58Yxm5cABJyNij191smRipqOnrccERDDwgDzvh
 0MbRVPb51d4BQjFO2kjLhRMssRQ/uR5jhrGvor4tNUsC39LEY4vE568Hl4KKZZy/AR
 hil1WKo3XVAUlPSWNvZD0kFhNY/zehPelTPTa/P0=
Received: by mail-ed1-f41.google.com with SMTP id g20so31005300edm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 15:32:28 -0700 (PDT)
X-Gm-Message-State: AOAM530FS8CW5TU/9dHfzSFoglD9+eqVJ2Ph46HA31UAmjukEmlm4hor
 mIN1OET48R5bJ8CNyGM5krN+q+oyNCDriwzxIw==
X-Google-Smtp-Source: ABdhPJxIh4GPX7JSDq52xIUF04T9azFXrk5ce1qys5ZdT5X5tZvDB1t9DiHPJQy7D2fBh8P/jxN/It9MNTUvgHMpkkk=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr38014412edb.271.1593901947136; 
 Sat, 04 Jul 2020 15:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200519094045.2447940-1-enric.balletbo@collabora.com>
 <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
In-Reply-To: <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 06:32:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__YSVs5dFPSBcAfpkxZLQcc+Ky_MaO7QmCnXKXYa82=7A@mail.gmail.com>
Message-ID: <CAAOTY__YSVs5dFPSBcAfpkxZLQcc+Ky_MaO7QmCnXKXYa82=7A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const
 variables
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NeaciDE55pelIOmAseS6jCDkuIvljYgxMToxMuWvq+mBk++8mgo+Cj4gSGksIEVucmlj
Ogo+Cj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNv
bT4g5pa8IDIwMjDlubQ15pyIMTnml6Ug6YCx5LqMIOS4i+WNiDU6NDDlr6vpgZPvvJoKPiA+Cj4g
PiBUaGVyZSBhcmUgc29tZSBgc3RhdGljIGNvbnN0IHU4YCB2YXJpYWJsZXMgdGhhdCBhcmUgbm90
IHVzZWQsIHRoaXMKPiA+IHRyaWdnZXJzIGEgd2FybmluZyBidWlsZGluZyB3aXRoIGBtYWtlIFc9
MWAsIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZW0sCj4gPiBzbyBkbyBpdCBhbmQgbWFrZSB0aGUg
Y29tcGlsZXIgbW9yZSBoYXBweS4KPiA+Cj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1maXhlcyBb
MV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMK
ClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRi
byBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPgo+ID4g
IC4uLi9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxNzNfaGRtaV9waHkuYyAgICB8IDQ4IC0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDggZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlf
cGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jCj4g
PiBpbmRleCAxYzM1NzUzNzIyMzAuLjgyN2I5Mzc4NmZhYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMKPiA+IEBAIC0xMDcsNTQg
KzEwNyw2IEBACj4gPiAgI2RlZmluZSBSR1NfSERNSVRYXzVUMV9FREcgICAgICAgICAgICAgKDB4
ZiA8PCA0KQo+ID4gICNkZWZpbmUgUkdTX0hETUlUWF9QTFVHX1RTVCAgICAgICAgICAgIEJJVCgw
KQo+ID4KPiA+IC1zdGF0aWMgY29uc3QgdTggUFJFRElWWzNdWzRdID0gewo+ID4gLSAgICAgICB7
MHgwLCAweDAsIDB4MCwgMHgwfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDEs
IDB4MSwgMHgxfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDEsIDB4MSwgMHgx
fSAgICAvKiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBUWERJ
VlszXVs0XSA9IHsKPiA+IC0gICAgICAgezB4MywgMHgzLCAweDMsIDB4Mn0sICAgLyogMjdNaHog
Ki8KPiA+IC0gICAgICAgezB4MiwgMHgxLCAweDEsIDB4MX0sICAgLyogNzRNaHogKi8KPiA+IC0g
ICAgICAgezB4MSwgMHgwLCAweDAsIDB4MH0gICAgLyogMTQ4TWh6ICovCj4gPiAtfTsKPiA+IC0K
PiA+IC1zdGF0aWMgY29uc3QgdTggRkJLU0VMWzNdWzRdID0gewo+ID4gLSAgICAgICB7MHgxLCAw
eDEsIDB4MSwgMHgxfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDAsIDB4MSwg
MHgxfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDAsIDB4MSwgMHgxfSAgICAv
KiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBGQktESVZbM11b
NF0gPSB7Cj4gPiAtICAgICAgIHsxOSwgMjQsIDI5LCAxOX0sICAgICAgIC8qIDI3TWh6ICovCj4g
PiAtICAgICAgIHsxOSwgMjQsIDE0LCAxOX0sICAgICAgIC8qIDc0TWh6ICovCj4gPiAtICAgICAg
IHsxOSwgMjQsIDE0LCAxOX0gICAgICAgIC8qIDE0OE1oeiAqLwo+ID4gLX07Cj4gPiAtCj4gPiAt
c3RhdGljIGNvbnN0IHU4IERJVkVOWzNdWzRdID0gewo+ID4gLSAgICAgICB7MHgyLCAweDEsIDB4
MSwgMHgyfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDIsIDB4MiwgMHgyfSwg
ICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDIsIDB4MiwgMHgyfSAgICAvKiAxNDhN
aHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBIVFBMTEJQWzNdWzRdID0g
ewo+ID4gLSAgICAgICB7MHhjLCAweGMsIDB4OCwgMHhjfSwgICAvKiAyN01oeiAqLwo+ID4gLSAg
ICAgICB7MHhjLCAweGYsIDB4ZiwgMHhjfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHhj
LCAweGYsIDB4ZiwgMHhjfSAgICAvKiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRp
YyBjb25zdCB1OCBIVFBMTEJDWzNdWzRdID0gewo+ID4gLSAgICAgICB7MHgyLCAweDMsIDB4Mywg
MHgyfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDMsIDB4MywgMHgyfSwgICAv
KiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDMsIDB4MywgMHgyfSAgICAvKiAxNDhNaHog
Ki8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBIVFBMTEJSWzNdWzRdID0gewo+
ID4gLSAgICAgICB7MHgxLCAweDEsIDB4MCwgMHgxfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAg
ICB7MHgxLCAweDIsIDB4MiwgMHgxfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAw
eDIsIDB4MiwgMHgxfSAgICAvKiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gIHN0YXRpYyBp
bnQgbXRrX2hkbWlfcGxsX3ByZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gPiAgewo+ID4gICAg
ICAgICBzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3BoeSA9IHRvX210a19oZG1pX3BoeShodyk7
Cj4gPiAtLQo+ID4gMi4yNi4yCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
