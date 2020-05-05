Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09551C56C7
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 15:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFAB89701;
	Tue,  5 May 2020 13:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC2489701
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 13:26:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4BCC20838
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588685179;
 bh=Cg3Aww/DWiRcPHXAAcy63wB+BBaJMxE4W5SjVqI52xM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jl6xMq65m2X3WEe5EWx7+ejjvCPFF50UyIRkX3tbpEfiDyIj1915/uLUMrzdtJfaw
 6iqUX04UY73+GzpazFnWSkIkB5sok0LeDe9adoCvV8vdgJ9jAbOWhaT/RPnEuGXDM0
 FaX+THGQl4IkBFpR2xkMR512gckbveC1akdYSSOE=
Received: by mail-ej1-f50.google.com with SMTP id b20so1630427ejg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 06:26:18 -0700 (PDT)
X-Gm-Message-State: AGi0PuZCeGiAbJqXXUSocN9SchKZ3KSAyK9kuZvAmpqVHoDtJAE11/xm
 0F6f+mGCi7q36VaK/iOBh2FH1gzaOi9AI+on8w==
X-Google-Smtp-Source: APiQypJhGBe4KM2v2+R7Tdau70M9ldxuxhIcdizZA6GeTupSyTsy4bkN4GwbSWQLG63deM2MBxQgW+u07ypp/LcOr8Q=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr2786571eje.324.1588685177209; 
 Tue, 05 May 2020 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141408.60877-1-enric.balletbo@collabora.com>
 <20200504141408.60877-4-enric.balletbo@collabora.com>
In-Reply-To: <20200504141408.60877-4-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 5 May 2020 21:26:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pFfrKjg6qD5fF0gnuj0aLG7DZh1k0htg=YZGaJE9Hww@mail.gmail.com>
Message-ID: <CAAOTY_9pFfrKjg6qD5fF0gnuj0aLG7DZh1k0htg=YZGaJE9Hww@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_dpi: Use simple encoder
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
b3JhLmNvbT4g5pa8IDIwMjDlubQ15pyINOaXpSDpgLHkuIAg5LiL5Y2IMTA6MTTlr6vpgZPvvJoK
Pgo+IFRoZSBtdGtfZHBpIGRyaXZlciB1c2VzIGFuIGVtcHR5IGltcGxlbWVudGF0aW9uIGZvciBp
dHMgZW5jb2Rlci4gUmVwbGFjZQo+IHRoZSBjb2RlIHdpdGggdGhlIGdlbmVyaWMgc2ltcGxlIGVu
Y29kZXIuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jIHwgMTQgKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMK
PiBpbmRleCBiYWFkMTk4YzY5ZWIuLjgwNzc4YjJhYWMyYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYwo+IEBAIC0yMCw2ICsyMCw3IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2Jy
aWRnZS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJt
X29mLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4KPiAgI2lu
Y2x1ZGUgIm10a19kcGlfcmVncy5oIgo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIgo+
IEBAIC01MTAsMTUgKzUxMSw2IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2Rl
KHN0cnVjdCBtdGtfZHBpICpkcGksCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLXN0YXRp
YyB2b2lkIG10a19kcGlfZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
cikKPiAtewo+IC0gICAgICAgZHJtX2VuY29kZXJfY2xlYW51cChlbmNvZGVyKTsKPiAtfQo+IC0K
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBtdGtfZHBpX2VuY29kZXJf
ZnVuY3MgPSB7Cj4gLSAgICAgICAuZGVzdHJveSA9IG10a19kcGlfZW5jb2Rlcl9kZXN0cm95LAo+
IC19Owo+IC0KPiAgc3RhdGljIGludCBtdGtfZHBpX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGRy
bV9icmlkZ2VfYXR0YWNoX2ZsYWdzIGZsYWdzKQo+ICB7Cj4gQEAgLTU5MSw4ICs1ODMsOCBAQCBz
dGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAg
ICAgIH0KPgo+IC0gICAgICAgcmV0ID0gZHJtX2VuY29kZXJfaW5pdChkcm1fZGV2LCAmZHBpLT5l
bmNvZGVyLCAmbXRrX2RwaV9lbmNvZGVyX2Z1bmNzLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMsIE5VTEwpOwo+ICsgICAgICAgcmV0ID0gZHJt
X3NpbXBsZV9lbmNvZGVyX2luaXQoZHJtX2RldiwgJmRwaS0+ZW5jb2RlciwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX0VOQ09ERVJfVE1EUyk7Cj4gICAg
ICAgICBpZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRv
IGluaXRpYWxpemUgZGVjb2RlcjogJWRcbiIsIHJldCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8g
ZXJyX3VucmVnaXN0ZXI7Cj4gLS0KPiAyLjI2LjIKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
