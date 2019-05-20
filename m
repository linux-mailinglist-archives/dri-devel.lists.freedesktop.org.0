Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DAD22C8A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 09:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2E58919F;
	Mon, 20 May 2019 07:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D3E68919F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 07:06:33 +0000 (UTC)
X-UUID: 545b483f887e4af1bf9374d578975ef1-20190520
X-UUID: 545b483f887e4af1bf9374d578975ef1-20190520
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 804019200; Mon, 20 May 2019 15:06:30 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 20 May 2019 15:06:28 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 20 May 2019 15:06:28 +0800
Message-ID: <1558335988.7311.34.camel@mtksdaap41>
Subject: Re: [v2 1/5] drm/mediatek: move mipi_dsi_host_register to probe
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 20 May 2019 15:06:28 +0800
In-Reply-To: <1558258588.367.5.camel@mszsdaap41>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-2-jitao.shi@mediatek.com>
 <1557222735.3498.11.camel@mtksdaap41> <1558258588.367.5.camel@mszsdaap41>
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

T24gU3VuLCAyMDE5LTA1LTE5IGF0IDE3OjM2ICswODAwLCBKaXRhbyBTaGkgd3JvdGU6Cj4gT24g
VHVlLCAyMDE5LTA1LTA3IGF0IDE3OjUyICswODAwLCBDSyBIdSB3cm90ZToKPiA+IEhpLCBKaXRh
bzoKPiA+IAo+ID4gT24gVHVlLCAyMDE5LTA0LTE2IGF0IDE0OjA0ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gPiA+IERTSSBwYW5lbCBkcml2ZXIgbmVlZCBhdHRhY2ggZnVuY3Rpb24gd2hpY2gg
aXMgaW5jdWxkZSBpbgo+ID4gPiBtaXBpX2RzaV9ob3N0X29wcy4KPiA+ID4gCj4gPiA+IElmIG1p
cGlfZHNpX2hvc3RfcmVnaXN0ZXIgaXMgbm90IGluIHByb2JlLCBkc2kgcGFuZWwgd2lsbAo+ID4g
PiBwcm9iZSBmYWlsIG9yIG1vcmUgZGVsYXkuCj4gPiAKPiA+IEkgdGhpbmsgdGhpcyBwYXRjaCBq
dXN0IHByZXZlbnQgZGVsYXksIG5vdCB0byBwcmV2ZW50IGRzaSBwYW5lbCBwcm9iZQo+ID4gZmFp
bC4gSW4gWzFdLCB5b3UgbWVudGlvbiBtaXBpX2RzaV9hdHRhY2goKSBpcyBjYWxsZWQgaW4KPiA+
IHBhbmVsX3NpbXBsZV9kc2lfcHJvYmUoKSwgYnV0IHBhbmVsX3NpbXBsZV9kc2lfcHJvYmUoKSBp
cyB0cmlnZ2VyIGJ5Cj4gPiBtaXBpX2RzaV9ob3N0X3JlZ2lzdGVyKCksIHNvIHRoZSBwcm9iZSB3
b3VsZCBzdWNjZXNzLgo+ID4gCj4gPiBbMV0KPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYz9oPXY1LjAtcmM2I24yOTg3Cj4gPiAKPiA+IAo+IAo+
IFllcywgdGhpcyBqdXN0IHByZXZlbnQgZGVsYXkuCj4gCj4gPiA+IAo+ID4gPiBTbyBtb3ZlIHRo
ZSBtaXBpX2RzaV9ob3N0X3JlZ2lzdGVyIHRvIHByb2JlIGZyb20gYmluZC4KPiA+ID4gCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiA+ID4g
LS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNTAgKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMKPiA+ID4gaW5kZXggYjAwZWIyZDJlMDg2Li42YzRhYzM3Zjk4M2QgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiBAQCAtMTA0NSwxMiArMTA0
NSw2IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ID4gPiAgCQlyZXR1cm4gcmV0Owo+ID4gPiAg
CX0KPiA+ID4gIAo+ID4gPiAtCXJldCA9IG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIoJmRzaS0+aG9z
dCk7Cj4gPiA+IC0JaWYgKHJldCA8IDApIHsKPiA+ID4gLQkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gcmVnaXN0ZXIgRFNJIGhvc3Q6ICVkXG4iLCByZXQpOwo+ID4gPiAtCQlnb3RvIGVycl9kZHBf
Y29tcF91bnJlZ2lzdGVyOwo+ID4gPiAtCX0KPiA+ID4gLQo+ID4gPiAgCXJldCA9IG10a19kc2lf
Y3JlYXRlX2Nvbm5fZW5jKGRybSwgZHNpKTsKPiA+ID4gIAlpZiAocmV0KSB7Cj4gPiA+ICAJCURS
TV9FUlJPUigiRW5jb2RlciBjcmVhdGUgZmFpbGVkIHdpdGggJWRcbiIsIHJldCk7Cj4gPiA+IEBA
IC0xMDYwLDggKzEwNTQsNiBAQCBzdGF0aWMgaW50IG10a19kc2lfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiA+ID4gIAlyZXR1cm4g
MDsKPiA+ID4gIAo+ID4gPiAgZXJyX3VucmVnaXN0ZXI6Cj4gPiA+IC0JbWlwaV9kc2lfaG9zdF91
bnJlZ2lzdGVyKCZkc2ktPmhvc3QpOwo+ID4gPiAtZXJyX2RkcF9jb21wX3VucmVnaXN0ZXI6Cj4g
PiA+ICAJbXRrX2RkcF9jb21wX3VucmVnaXN0ZXIoZHJtLCAmZHNpLT5kZHBfY29tcCk7Cj4gPiA+
ICAJcmV0dXJuIHJldDsKPiA+ID4gIH0KPiA+ID4gQEAgLTEwOTcsMzEgKzEwODksMzcgQEAgc3Rh
dGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+
ICAKPiA+ID4gIAlkc2ktPmhvc3Qub3BzID0gJm10a19kc2lfb3BzOwo+ID4gPiAgCWRzaS0+aG9z
dC5kZXYgPSBkZXY7Cj4gPiA+ICsJZHNpLT5kZXYgPSBkZXY7Cj4gPiAKPiA+IFdoeSBkbyB0aGlz
Pwo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gQ0sKPiA+IAo+IAo+IFRoZXJlIGFyZSBzb21lIGVycm9y
IG1lc3NhZ2UgcmVxdWlyZSB0aGlzIHBvd2Vyb24oKS4KClNvIHRoaXMgc2hvdWxkIG5vdCBiZSBp
biB0aGlzIHBhdGNoLiBUaGlzIHBhdGNoIGlzIHJlbGF0ZWQgdG8gdGhlIHRpbWluZwpvZiBtaXBp
X2RzaV9ob3N0X3JlZ2lzdGVyKCkuCgpSZWdhcmRzLApDSwoKPiAKPiA+ID4gKwlyZXQgPSBtaXBp
X2RzaV9ob3N0X3JlZ2lzdGVyKCZkc2ktPmhvc3QpOwo+ID4gPiArCWlmIChyZXQgPCAwKSB7Cj4g
PiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERTSSBob3N0OiAlZFxuIiwg
cmV0KTsKPiA+ID4gKwkJcmV0dXJuIHJldDsKPiA+ID4gKwl9Cj4gPiA+ICAKPiA+ID4gIAlyZXQg
PSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoZGV2LT5vZl9ub2RlLCAwLCAwLAo+ID4gPiAg
CQkJCQkgICZkc2ktPnBhbmVsLCAmZHNpLT5icmlkZ2UpOwo+ID4gPiAgCWlmIChyZXQpCj4gPiA+
IC0JCXJldHVybiByZXQ7Cj4gPiA+ICsJCWdvdG8gZXJyX3VucmVnaXN0ZXJfaG9zdDsKPiA+ID4g
IAo+ID4gPiAgCWRzaS0+ZW5naW5lX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJlbmdpbmUiKTsK
PiA+ID4gIAlpZiAoSVNfRVJSKGRzaS0+ZW5naW5lX2NsaykpIHsKPiA+ID4gIAkJcmV0ID0gUFRS
X0VSUihkc2ktPmVuZ2luZV9jbGspOwo+ID4gPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBn
ZXQgZW5naW5lIGNsb2NrOiAlZFxuIiwgcmV0KTsKPiA+ID4gLQkJcmV0dXJuIHJldDsKPiA+ID4g
KwkJZ290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiAgCWRz
aS0+ZGlnaXRhbF9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiZGlnaXRhbCIpOwo+ID4gPiAgCWlm
IChJU19FUlIoZHNpLT5kaWdpdGFsX2NsaykpIHsKPiA+ID4gIAkJcmV0ID0gUFRSX0VSUihkc2kt
PmRpZ2l0YWxfY2xrKTsKPiA+ID4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGRpZ2l0
YWwgY2xvY2s6ICVkXG4iLCByZXQpOwo+ID4gPiAtCQlyZXR1cm4gcmV0Owo+ID4gPiArCQlnb3Rv
IGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJZHNpLT5oc19j
bGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiaHMiKTsKPiA+ID4gIAlpZiAoSVNfRVJSKGRzaS0+aHNf
Y2xrKSkgewo+ID4gPiAgCQlyZXQgPSBQVFJfRVJSKGRzaS0+aHNfY2xrKTsKPiA+ID4gIAkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGhzIGNsb2NrOiAlZFxuIiwgcmV0KTsKPiA+ID4gLQkJ
cmV0dXJuIHJldDsKPiA+ID4gKwkJZ290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+ID4gPiAgCX0K
PiA+ID4gIAo+ID4gPiAgCXJlZ3MgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNP
VVJDRV9NRU0sIDApOwo+ID4gCj4gPiAKPiA+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
