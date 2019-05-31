Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED330660
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 03:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E696E184;
	Fri, 31 May 2019 01:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 748166E184
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 01:51:06 +0000 (UTC)
X-UUID: 536ab7e78a6a489b8e6edd02f9c9b29e-20190531
X-UUID: 536ab7e78a6a489b8e6edd02f9c9b29e-20190531
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 645292041; Fri, 31 May 2019 09:50:54 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 May 2019 09:50:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 May 2019 09:50:52 +0800
Message-ID: <1559267452.9102.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: add dsi module reset driver
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 31 May 2019 09:50:52 +0800
In-Reply-To: <20190519111513.73919-1-jitao.shi@mediatek.com>
References: <20190519111513.73919-1-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry
 Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy
 Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gU3VuLCAyMDE5LTA1LTE5IGF0IDE5OjE1ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gUmVzZXQgZHNpIEhXIHRvIGRlZmF1bHQgd2hlbiBwb3dlciBvbi4gUHJldmVudCB0
aGUgc2V0dGluZyBkaWZmZXJldAo+IGJldHdlZW4gYm9vdGxvYWRlciBhbmQga2VybmVsLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDM1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGIwMGViMmQyZTA4Ni4uMzljY2Iz
NGE3YzdmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTIxLDEwICsy
MSwxMiBAQAo+ICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lycS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
bWZkL3N5c2Nvbi5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L29mX3BsYXRmb3JtLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+
ICAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+Cj4gICNpbmNsdWRlIDx2aWRlby92aWRl
b21vZGUuaD4KPiAgCj4gQEAgLTE0Niw2ICsxNDgsOCBAQAo+ICAjZGVmaW5lIFRfSFNfRVhJVAk3
Cj4gICNkZWZpbmUgVF9IU19aRVJPCTEwCj4gIAo+ICsjZGVmaW5lIE1NU1lTX1NXX1JTVF9EU0lf
QiBCSVQoMjUpCj4gKwo+ICAjZGVmaW5lIE5TX1RPX0NZQ0xFKG4sIGMpICAgICgobikgLyAoYykg
KyAoKChuKSAlIChjKSkgPyAxIDogMCkpCj4gIAo+ICAjZGVmaW5lIE1US19EU0lfSE9TVF9JU19S
RUFEKHR5cGUpIFwKPiBAQCAtMTY1LDYgKzE2OSw4IEBAIHN0cnVjdCBtdGtfZHNpIHsKPiAgCXN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsOwo+ICAJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKPiAg
CXN0cnVjdCBwaHkgKnBoeTsKPiArCXN0cnVjdCByZWdtYXAgKm1tc3lzX3N3X3JzdF9iOwo+ICsJ
dTMyIHN3X3JzdF9iOwo+ICAKPiAgCXZvaWQgX19pb21lbSAqcmVnczsKPiAgCj4gQEAgLTIzOCw2
ICsyNDQsMTYgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9kaXNhYmxlKHN0cnVjdCBtdGtfZHNpICpk
c2kpCj4gIAltdGtfZHNpX21hc2soZHNpLCBEU0lfQ09OX0NUUkwsIERTSV9FTiwgMCk7Cj4gIH0K
PiAgCj4gK3N0YXRpYyB2b2lkIG10a19kc2lfcmVzZXRfYWxsKHN0cnVjdCBtdGtfZHNpICpkc2kp
Cj4gK3sKPiArCXJlZ21hcF91cGRhdGVfYml0cyhkc2ktPm1tc3lzX3N3X3JzdF9iLCBkc2ktPnN3
X3JzdF9iLAo+ICsJCQkgICBNTVNZU19TV19SU1RfRFNJX0IsIH5NTVNZU19TV19SU1RfRFNJX0Ip
Owo+ICsJdXNsZWVwX3JhbmdlKDEwMDAsIDExMDApOwo+ICsKPiArCXJlZ21hcF91cGRhdGVfYml0
cyhkc2ktPm1tc3lzX3N3X3JzdF9iLCBkc2ktPnN3X3JzdF9iLAo+ICsJCQkgICBNTVNZU19TV19S
U1RfRFNJX0IsIE1NU1lTX1NXX1JTVF9EU0lfQik7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG10
a19kc2lfcmVzZXRfZW5naW5lKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIHsKPiAgCW10a19kc2lf
bWFzayhkc2ksIERTSV9DT05fQ1RSTCwgRFNJX1JFU0VULCBEU0lfUkVTRVQpOwo+IEBAIC04MzEs
NiArODQ3LDggQEAgc3RhdGljIGludCBtdGtfZHNpX2NyZWF0ZV9jb25uX2VuYyhzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAJCQlnb3RvIGVycl9lbmNvZGVy
X2NsZWFudXA7Cj4gIAl9Cj4gIAo+ICsJbXRrX2RzaV9yZXNldF9hbGwoZHNpKTsKPiArCj4gIAly
ZXR1cm4gMDsKPiAgCj4gIGVycl9lbmNvZGVyX2NsZWFudXA6Cj4gQEAgLTEwODcsNiArMTEwNSw3
IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAJc3RydWN0IG10a19kc2kgKmRzaTsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2
LT5kZXY7Cj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlZ3M7Cj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdt
YXA7Cj4gIAlpbnQgaXJxX251bTsKPiAgCWludCBjb21wX2lkOwo+ICAJaW50IHJldDsKPiBAQCAt
MTEzOSw2ICsxMTU4LDIyIEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+ICsJcmVnbWFwID0g
c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShkZXYtPm9mX25vZGUsCj4gKwkJCQkJCSAi
bWVkaWF0ZWssc3lzY29uLWRzaSIpOwoKV2hlcmUgaXMgdGhlIGJpbmRpbmcgZG9jdW1lbnQgZm9y
ICJtZWRpYXRlayxzeXNjb24tZHNpIj8KClJlZ2FyZHMsCkNLCgo+ICsJcmV0ID0gb2ZfcHJvcGVy
dHlfcmVhZF91MzJfaW5kZXgoZGV2LT5vZl9ub2RlLCAibWVkaWF0ZWssc3lzY29uLWRzaSIsIDEs
Cj4gKwkJCQkJICZkc2ktPnN3X3JzdF9iKTsKPiArCj4gKwlpZiAoSVNfRVJSKHJlZ21hcCkpCj4g
KwkJcmV0ID0gUFRSX0VSUihyZWdtYXApOwo+ICsKPiArCWlmIChyZXQpIHsKPiArCQlyZXQgPSBQ
VFJfRVJSKHJlZ21hcCk7Cj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IG1tc3lzIHJl
Z2lzdGVyczogJWRcbiIsIHJldCk7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwlkc2kt
Pm1tc3lzX3N3X3JzdF9iID0gcmVnbWFwOwo+ICsKPiAgCWNvbXBfaWQgPSBtdGtfZGRwX2NvbXBf
Z2V0X2lkKGRldi0+b2Zfbm9kZSwgTVRLX0RTSSk7Cj4gIAlpZiAoY29tcF9pZCA8IDApIHsKPiAg
CQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpZGVudGlmeSBieSBhbGlhczogJWRcbiIsIGNvbXBf
aWQpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
