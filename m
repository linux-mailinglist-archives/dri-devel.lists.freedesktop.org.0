Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D52267F
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 11:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076F189174;
	Sun, 19 May 2019 09:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C4289174
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 09:36:37 +0000 (UTC)
X-UUID: d12b4a05a9b64d70967a0e5e6e081a9b-20190519
X-UUID: d12b4a05a9b64d70967a0e5e6e081a9b-20190519
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2136039972; Sun, 19 May 2019 17:36:34 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 17:36:32 +0800
Received: from [10.16.6.141] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 19 May 2019 17:36:29 +0800
Message-ID: <1558258588.367.5.camel@mszsdaap41>
Subject: Re: [v2 1/5] drm/mediatek: move mipi_dsi_host_register to probe
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Sun, 19 May 2019 17:36:28 +0800
In-Reply-To: <1557222735.3498.11.camel@mtksdaap41>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-2-jitao.shi@mediatek.com>
 <1557222735.3498.11.camel@mtksdaap41>
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
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com, Ajay
 Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul
 Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA1LTA3IGF0IDE3OjUyICswODAwLCBDSyBIdSB3cm90ZToKPiBIaSwgSml0
YW86Cj4gCj4gT24gVHVlLCAyMDE5LTA0LTE2IGF0IDE0OjA0ICswODAwLCBKaXRhbyBTaGkgd3Jv
dGU6Cj4gPiBEU0kgcGFuZWwgZHJpdmVyIG5lZWQgYXR0YWNoIGZ1bmN0aW9uIHdoaWNoIGlzIGlu
Y3VsZGUgaW4KPiA+IG1pcGlfZHNpX2hvc3Rfb3BzLgo+ID4gCj4gPiBJZiBtaXBpX2RzaV9ob3N0
X3JlZ2lzdGVyIGlzIG5vdCBpbiBwcm9iZSwgZHNpIHBhbmVsIHdpbGwKPiA+IHByb2JlIGZhaWwg
b3IgbW9yZSBkZWxheS4KPiAKPiBJIHRoaW5rIHRoaXMgcGF0Y2gganVzdCBwcmV2ZW50IGRlbGF5
LCBub3QgdG8gcHJldmVudCBkc2kgcGFuZWwgcHJvYmUKPiBmYWlsLiBJbiBbMV0sIHlvdSBtZW50
aW9uIG1pcGlfZHNpX2F0dGFjaCgpIGlzIGNhbGxlZCBpbgo+IHBhbmVsX3NpbXBsZV9kc2lfcHJv
YmUoKSwgYnV0IHBhbmVsX3NpbXBsZV9kc2lfcHJvYmUoKSBpcyB0cmlnZ2VyIGJ5Cj4gbWlwaV9k
c2lfaG9zdF9yZWdpc3RlcigpLCBzbyB0aGUgcHJvYmUgd291bGQgc3VjY2Vzcy4KPiAKPiBbMV0K
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmM/aD12
NS4wLXJjNiNuMjk4Nwo+IAo+IAoKWWVzLCB0aGlzIGp1c3QgcHJldmVudCBkZWxheS4KCj4gPiAK
PiA+IFNvIG1vdmUgdGhlIG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIgdG8gcHJvYmUgZnJvbSBiaW5k
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNTAg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMKPiA+IGluZGV4IGIwMGViMmQyZTA4Ni4uNmM0YWMzN2Y5ODNkIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gQEAgLTEwNDUsMTIgKzEwNDUsNiBAQCBz
dGF0aWMgaW50IG10a19kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSkKPiA+ICAJCXJldHVybiByZXQ7Cj4gPiAgCX0KPiA+ICAKPiA+
IC0JcmV0ID0gbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigmZHNpLT5ob3N0KTsKPiA+IC0JaWYgKHJl
dCA8IDApIHsKPiA+IC0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERTSSBob3N0
OiAlZFxuIiwgcmV0KTsKPiA+IC0JCWdvdG8gZXJyX2RkcF9jb21wX3VucmVnaXN0ZXI7Cj4gPiAt
CX0KPiA+IC0KPiA+ICAJcmV0ID0gbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoZHJtLCBkc2kpOwo+
ID4gIAlpZiAocmV0KSB7Cj4gPiAgCQlEUk1fRVJST1IoIkVuY29kZXIgY3JlYXRlIGZhaWxlZCB3
aXRoICVkXG4iLCByZXQpOwo+ID4gQEAgLTEwNjAsOCArMTA1NCw2IEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lk
ICpkYXRhKQo+ID4gIAlyZXR1cm4gMDsKPiA+ICAKPiA+ICBlcnJfdW5yZWdpc3RlcjoKPiA+IC0J
bWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmhvc3QpOwo+ID4gLWVycl9kZHBfY29tcF91
bnJlZ2lzdGVyOgo+ID4gIAltdGtfZGRwX2NvbXBfdW5yZWdpc3Rlcihkcm0sICZkc2ktPmRkcF9j
b21wKTsKPiA+ICAJcmV0dXJuIHJldDsKPiA+ICB9Cj4gPiBAQCAtMTA5NywzMSArMTA4OSwzNyBA
QCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+ICAKPiA+ICAJZHNpLT5ob3N0Lm9wcyA9ICZtdGtfZHNpX29wczsKPiA+ICAJZHNpLT5ob3N0
LmRldiA9IGRldjsKPiA+ICsJZHNpLT5kZXYgPSBkZXY7Cj4gCj4gV2h5IGRvIHRoaXM/Cj4gCj4g
UmVnYXJkcywKPiBDSwo+IAoKVGhlcmUgYXJlIHNvbWUgZXJyb3IgbWVzc2FnZSByZXF1aXJlIHRo
aXMgcG93ZXJvbigpLgoKPiA+ICsJcmV0ID0gbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigmZHNpLT5o
b3N0KTsKPiA+ICsJaWYgKHJldCA8IDApIHsKPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRv
IHJlZ2lzdGVyIERTSSBob3N0OiAlZFxuIiwgcmV0KTsKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiAr
CX0KPiA+ICAKPiA+ICAJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGRldi0+b2Zf
bm9kZSwgMCwgMCwKPiA+ICAJCQkJCSAgJmRzaS0+cGFuZWwsICZkc2ktPmJyaWRnZSk7Cj4gPiAg
CWlmIChyZXQpCj4gPiAtCQlyZXR1cm4gcmV0Owo+ID4gKwkJZ290byBlcnJfdW5yZWdpc3Rlcl9o
b3N0Owo+ID4gIAo+ID4gIAlkc2ktPmVuZ2luZV9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiZW5n
aW5lIik7Cj4gPiAgCWlmIChJU19FUlIoZHNpLT5lbmdpbmVfY2xrKSkgewo+ID4gIAkJcmV0ID0g
UFRSX0VSUihkc2ktPmVuZ2luZV9jbGspOwo+ID4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8g
Z2V0IGVuZ2luZSBjbG9jazogJWRcbiIsIHJldCk7Cj4gPiAtCQlyZXR1cm4gcmV0Owo+ID4gKwkJ
Z290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+ID4gIAl9Cj4gPiAgCj4gPiAgCWRzaS0+ZGlnaXRh
bF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiZGlnaXRhbCIpOwo+ID4gIAlpZiAoSVNfRVJSKGRz
aS0+ZGlnaXRhbF9jbGspKSB7Cj4gPiAgCQlyZXQgPSBQVFJfRVJSKGRzaS0+ZGlnaXRhbF9jbGsp
Owo+ID4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGRpZ2l0YWwgY2xvY2s6ICVkXG4i
LCByZXQpOwo+ID4gLQkJcmV0dXJuIHJldDsKPiA+ICsJCWdvdG8gZXJyX3VucmVnaXN0ZXJfaG9z
dDsKPiA+ICAJfQo+ID4gIAo+ID4gIAlkc2ktPmhzX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJo
cyIpOwo+ID4gIAlpZiAoSVNfRVJSKGRzaS0+aHNfY2xrKSkgewo+ID4gIAkJcmV0ID0gUFRSX0VS
Uihkc2ktPmhzX2Nsayk7Cj4gPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgaHMgY2xv
Y2s6ICVkXG4iLCByZXQpOwo+ID4gLQkJcmV0dXJuIHJldDsKPiA+ICsJCWdvdG8gZXJyX3VucmVn
aXN0ZXJfaG9zdDsKPiA+ICAJfQo+ID4gIAo+ID4gIAlyZWdzID0gcGxhdGZvcm1fZ2V0X3Jlc291
cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiAKPiAKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
