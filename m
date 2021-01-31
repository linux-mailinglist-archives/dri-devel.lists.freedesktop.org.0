Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCB309A23
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 04:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A79D6E174;
	Sun, 31 Jan 2021 03:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467846E174
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 03:56:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9E6864E24
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 03:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612065385;
 bh=o/wMeATxWK4/ovdl3osu4aT+CFWCCeBZhexp7L0XdJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X1d2jLQRNnuuWQcvT0TPUItmebn9K6KbW8KUg2BElCc89in1n8kuXMUQeIv3VNg01
 L89XNnwL3W7rakrcIbEwznIMlxjRk9EJoN+ceFiZFVRJ+yjhbiq8160FOgkjLVBnhH
 GxMXbuxVGjHodB3vbIwX1Giz7gJcv0YH40U5hDBrihf8jczoezCvoBMuZsW74puSco
 vKLwIX0xfJeO7grnszPHa3bhMIKhs/cfmGQMWOVaYUtoq2eeu0n8u3klYQSfkf3tWe
 v1nsutxHEkEeaYqzKszBWAUnPlEzrQzaui5nxz8c41koUA8ZjFst4Tiq9iSnkrerbL
 ZYRuZrEhNdrMg==
Received: by mail-ej1-f48.google.com with SMTP id g12so18955288ejf.8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 19:56:24 -0800 (PST)
X-Gm-Message-State: AOAM531T1lq77dnqJqtqts6pVf/paeQZi+2mhSdkGGRkm1nGv6tsfhl+
 BpLe3FdkV04AQfebnmgEHVv4CwgOpBttPfcdwQ==
X-Google-Smtp-Source: ABdhPJxNc0ogbTJjvcRGvMFzWpYCh+9GlGCriZvuZocH6kJJP4x6oFAwWInkVL7LXNp6GnE9l1E7LPwRxCKYeiir/b0=
X-Received: by 2002:a17:906:8a59:: with SMTP id
 gx25mr3777247ejc.310.1612065383304; 
 Sat, 30 Jan 2021 19:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-5-hsinyi@chromium.org>
 <1611908500.31184.6.camel@mtksdaap41>
In-Reply-To: <1611908500.31184.6.camel@mtksdaap41>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 31 Jan 2021 11:56:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8PhKLEuwq4u9tK7z0yfbU=La+DQ8+Ahg1OTe0d5o4qhw@mail.gmail.com>
Message-ID: <CAAOTY_8PhKLEuwq4u9tK7z0yfbU=La+DQ8+Ahg1OTe0d5o4qhw@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
To: CK Hu <ck.hu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDHmnIgy
OeaXpSDpgLHkupQg5LiL5Y2INDoyMeWvq+mBk++8mgo+Cj4gSGksIEhzaW4tWWk6Cj4KPiBPbiBG
cmksIDIwMjEtMDEtMjkgYXQgMTU6MzQgKzA4MDAsIEhzaW4tWWkgV2FuZyB3cm90ZToKPiA+IEZy
b206IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4KPiA+IGVu
YWJsZSBPVkxfTEFZRVJfU01JX0lEX0VOIGZvciBtdWx0aS1sYXllciB1c2VjYXNlLCB3aXRob3V0
IHRoaXMgcGF0Y2gsCj4gPiBvdmwgd2lsbCBoYW5nIHVwIHdoZW4gbW9yZSB0aGFuIDEgbGF5ZXIg
ZW5hYmxlZC4KPgo+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKQXBw
bGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0
L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDE3
ICsrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gPiBpbmRleCBk
YTdlMzhhMjg3NTliLi45NjFmODdmOGQ0ZDE1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiA+IEBAIC0yNCw2ICsyNCw3IEBACj4gPiAgI2RlZmluZSBE
SVNQX1JFR19PVkxfUlNUICAgICAgICAgICAgICAgICAgICAgMHgwMDE0Cj4gPiAgI2RlZmluZSBE
SVNQX1JFR19PVkxfUk9JX1NJWkUgICAgICAgICAgICAgICAgICAgICAgICAweDAwMjAKPiA+ICAj
ZGVmaW5lIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04gICAgICAgICAgICAweDAwMjQKPiA+ICsj
ZGVmaW5lIE9WTF9MQVlFUl9TTUlfSURfRU4gICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgw
KQo+ID4gICNkZWZpbmUgT1ZMX0JHQ0xSX1NFTF9JTiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQklUKDIpCj4gPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUk9JX0JHQ0xSICAgICAgICAgICAg
ICAgICAgICAgICAweDAwMjgKPiA+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9TUkNfQ09OICAgICAg
ICAgICAgICAgICAweDAwMmMKPiA+IEBAIC02Miw2ICs2Myw3IEBAIHN0cnVjdCBtdGtfZGlzcF9v
dmxfZGF0YSB7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgZ21jX2JpdHM7Cj4gPiAgICAgICB1bnNp
Z25lZCBpbnQgbGF5ZXJfbnI7Cj4gPiAgICAgICBib29sIGZtdF9yZ2I1NjVfaXNfMDsKPiA+ICsg
ICAgIGJvb2wgc21pX2lkX2VuOwo+ID4gIH07Cj4gPgo+ID4gIC8qKgo+ID4gQEAgLTEzNCw2ICsx
MzYsMTMgQEAgdm9pZCBtdGtfb3ZsX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICB7Cj4g
PiAgICAgICBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
PiA+Cj4gPiArICAgICBpZiAob3ZsLT5kYXRhLT5zbWlfaWRfZW4pIHsKPiA+ICsgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHJlZzsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgcmVnID0gcmVhZGwo
b3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4gPiArICAgICAgICAgICAg
IHJlZyA9IHJlZyB8IE9WTF9MQVlFUl9TTUlfSURfRU47Cj4gPiArICAgICAgICAgICAgIHdyaXRl
bF9yZWxheGVkKHJlZywgb3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4g
PiArICAgICB9Cj4gPiAgICAgICB3cml0ZWxfcmVsYXhlZCgweDEsIG92bC0+cmVncyArIERJU1Bf
UkVHX09WTF9FTik7Cj4gPiAgfQo+ID4KPiA+IEBAIC0xNDIsNiArMTUxLDE0IEBAIHZvaWQgbXRr
X292bF9zdG9wKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAgICAgIHN0cnVjdCBtdGtfZGlzcF9v
dmwgKm92bCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4KPiA+ICAgICAgIHdyaXRlbF9yZWxh
eGVkKDB4MCwgb3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0VOKTsKPiA+ICsgICAgIGlmIChvdmwt
PmRhdGEtPnNtaV9pZF9lbikgewo+ID4gKyAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmVnOwo+
ID4gKwo+ID4gKyAgICAgICAgICAgICByZWcgPSByZWFkbChvdmwtPnJlZ3MgKyBESVNQX1JFR19P
VkxfREFUQVBBVEhfQ09OKTsKPiA+ICsgICAgICAgICAgICAgcmVnID0gcmVnICYgfk9WTF9MQVlF
Ul9TTUlfSURfRU47Cj4gPiArICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgb3ZsLT5y
ZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAg
fQo+ID4KPiA+ICB2b2lkIG10a19vdmxfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50IHcsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
