Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAD214941
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jul 2020 02:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FDF6E041;
	Sun,  5 Jul 2020 00:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C058D6E041
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 00:15:34 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B6D22100A
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 00:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593908134;
 bh=iH3aDb4sdbfsSHuXjwPQYPJDHIzy2wXOVaJjcjHJR7g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fo/T8nV8UTUf3nPFZcibQZ67/VzukqzyFnAcDMStbL5s7VdtB5HV5cZ6Qj6U4Wbrx
 0PXAfaa611CB5ksiokKPx83nI5/emE1xVDTgqmmY76bzRtjyclvLJdLq6axogE0qmN
 8Dl5YoLtQStEYxfv2PWmvSgHsQ/ii7Mta8rH98EI=
Received: by mail-ej1-f44.google.com with SMTP id ga4so38674418ejb.11
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 17:15:34 -0700 (PDT)
X-Gm-Message-State: AOAM530d56ogNdIGzU2/c1/yYhZjCsZQkeGvxgzMst+WClQbtEJP8yEz
 g2KkpJ9JM7V6HasIcyWOvvba36842R/g6YvLKw==
X-Google-Smtp-Source: ABdhPJxQ+wC/XJRg4BJi7j8MwPEO2LRrUvPEFsb+AncSiOFdIMEvNbByzzgnJE/FF0ztSDbqe10F4PqIjLWZrCH2az8=
X-Received: by 2002:a17:906:1e83:: with SMTP id
 e3mr23125845ejj.7.1593908132783; 
 Sat, 04 Jul 2020 17:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200615203108.786083-8-enric.balletbo@collabora.com>
In-Reply-To: <20200615203108.786083-8-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 08:15:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9i-ForE-kWfdi5A9QNRT2JjrFwAPYk25KupQeWwFDVSg@mail.gmail.com>
Message-ID: <CAAOTY_9i-ForE-kWfdi5A9QNRT2JjrFwAPYk25KupQeWwFDVSg@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 7/7] drm/mediatek: mtk_dsi: Create connector for
 bridges
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
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ25pyIMTbml6Ug6YCx5LqMIOS4iuWNiDQ6MzHlr6vpgZPvvJoK
Pgo+IFVzZSB0aGUgZHJtX2JyaWRnZV9jb25uZWN0b3IgaGVscGVyIHRvIGNyZWF0ZSBhIGNvbm5l
Y3RvciBmb3IgcGlwZWxpbmVzCj4gdGhhdCB1c2UgZHJtX2JyaWRnZS4gVGhpcyBhbGxvd3Mgc3Bs
aXR0aW5nIGNvbm5lY3RvciBvcGVyYXRpb25zIGFjcm9zcwo+IG11bHRpcGxlIGJyaWRnZXMgd2hl
biBuZWNlc3NhcnksIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBsYXN0IGJyaWRnZSBpbgo+IHRoZSBj
aGFpbiBjcmVhdGluZyB0aGUgY29ubmVjdG9yIGFuZCBoYW5kbGluZyBhbGwgY29ubmVjdG9yIG9w
ZXJhdGlvbnMKPiBpbnRlcm5hbGx5LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0s
IHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNl
cnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY0OiBOb25lCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIE1vdmUgdGhlIGJyaWRnZS50eXBlIGxpbmUgdG8gdGhlIHBhdGNoIHRo
YXQgYWRkcyBkcm1fYnJpZGdlIHN1cHBvcnQuIChMYXVyZW50IFBpbmNoYXJ0KQo+Cj4gQ2hhbmdl
cyBpbiB2MjogTm9uZQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAx
MyArKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0ZjNiZDA5
NWMxZWVlLi40NzFmY2FmZGYzNDg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gQEAgLTE3LDYgKzE3LDcgQEAKPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVy
Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9i
cmlkZ2VfY29ubmVjdG9yLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+Cj4gQEAg
LTE4Myw2ICsxODQsNyBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgZW5jb2RlcjsKPiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKPiAgICAg
ICAgIHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsKPiArICAgICAgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3I7Cj4gICAgICAgICBzdHJ1Y3QgcGh5ICpwaHk7Cj4KPiAgICAg
ICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiBAQCAtOTc3LDEwICs5NzksMTkgQEAgc3RhdGljIGlu
dCBtdGtfZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRr
X2RzaSAqZHNpKQo+ICAgICAgICAgICovCj4gICAgICAgICBkc2ktPmVuY29kZXIucG9zc2libGVf
Y3J0Y3MgPSAxOwo+Cj4gLSAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmZHNpLT5lbmNv
ZGVyLCAmZHNpLT5icmlkZ2UsIE5VTEwsIDApOwo+ICsgICAgICAgcmV0ID0gZHJtX2JyaWRnZV9h
dHRhY2goJmRzaS0+ZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKTsKPiAgICAg
ICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXBfZW5jb2RlcjsK
Pgo+ICsgICAgICAgZHNpLT5jb25uZWN0b3IgPSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0KGRy
bSwgJmRzaS0+ZW5jb2Rlcik7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGRzaS0+Y29ubmVjdG9yKSkg
ewo+ICsgICAgICAgICAgICAgICBEUk1fRVJST1IoIlVuYWJsZSB0byBjcmVhdGUgYnJpZGdlIGNv
bm5lY3RvclxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHNpLT5jb25uZWN0
b3IpOwo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwX2VuY29kZXI7Cj4gKyAgICAg
ICB9Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGRzaS0+Y29ubmVjdG9y
LCAmZHNpLT5lbmNvZGVyKTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPgo+ICBlcnJfY2xlYW51
cF9lbmNvZGVyOgo+IC0tCj4gMi4yNy4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
