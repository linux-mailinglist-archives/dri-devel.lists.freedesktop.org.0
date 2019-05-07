Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F716176
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 11:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EA189E11;
	Tue,  7 May 2019 09:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id C5C9089E11
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 09:52:24 +0000 (UTC)
X-UUID: 703808d8e3e34ab59b7730dc354c3c30-20190507
X-UUID: 703808d8e3e34ab59b7730dc354c3c30-20190507
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1425543058; Tue, 07 May 2019 17:52:18 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33N1.mediatek.inc (172.27.4.75) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 17:52:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 May 2019 17:52:15 +0800
Message-ID: <1557222735.3498.11.camel@mtksdaap41>
Subject: Re: [v2 1/5] drm/mediatek: move mipi_dsi_host_register to probe
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Tue, 7 May 2019 17:52:15 +0800
In-Reply-To: <20190416060501.76276-2-jitao.shi@mediatek.com>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-2-jitao.shi@mediatek.com>
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

SGksIEppdGFvOgoKT24gVHVlLCAyMDE5LTA0LTE2IGF0IDE0OjA0ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gRFNJIHBhbmVsIGRyaXZlciBuZWVkIGF0dGFjaCBmdW5jdGlvbiB3aGljaCBpcyBp
bmN1bGRlIGluCj4gbWlwaV9kc2lfaG9zdF9vcHMuCj4gCj4gSWYgbWlwaV9kc2lfaG9zdF9yZWdp
c3RlciBpcyBub3QgaW4gcHJvYmUsIGRzaSBwYW5lbCB3aWxsCj4gcHJvYmUgZmFpbCBvciBtb3Jl
IGRlbGF5LgoKSSB0aGluayB0aGlzIHBhdGNoIGp1c3QgcHJldmVudCBkZWxheSwgbm90IHRvIHBy
ZXZlbnQgZHNpIHBhbmVsIHByb2JlCmZhaWwuIEluIFsxXSwgeW91IG1lbnRpb24gbWlwaV9kc2lf
YXR0YWNoKCkgaXMgY2FsbGVkIGluCnBhbmVsX3NpbXBsZV9kc2lfcHJvYmUoKSwgYnV0IHBhbmVs
X3NpbXBsZV9kc2lfcHJvYmUoKSBpcyB0cmlnZ2VyIGJ5Cm1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIo
KSwgc28gdGhlIHByb2JlIHdvdWxkIHN1Y2Nlc3MuCgpbMV0KaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jP2g9djUuMC1yYzYjbjI5ODcKCgo+IAo+IFNv
IG1vdmUgdGhlIG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIgdG8gcHJvYmUgZnJvbSBiaW5kLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDUwICsrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggYjAw
ZWIyZDJlMDg2Li42YzRhYzM3Zjk4M2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiBAQCAtMTA0NSwxMiArMTA0NSw2IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ICAJCXJl
dHVybiByZXQ7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigmZHNp
LT5ob3N0KTsKPiAtCWlmIChyZXQgPCAwKSB7Cj4gLQkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8g
cmVnaXN0ZXIgRFNJIGhvc3Q6ICVkXG4iLCByZXQpOwo+IC0JCWdvdG8gZXJyX2RkcF9jb21wX3Vu
cmVnaXN0ZXI7Cj4gLQl9Cj4gLQo+ICAJcmV0ID0gbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoZHJt
LCBkc2kpOwo+ICAJaWYgKHJldCkgewo+ICAJCURSTV9FUlJPUigiRW5jb2RlciBjcmVhdGUgZmFp
bGVkIHdpdGggJWRcbiIsIHJldCk7Cj4gQEAgLTEwNjAsOCArMTA1NCw2IEBAIHN0YXRpYyBpbnQg
bXRrX2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2
b2lkICpkYXRhKQo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBlcnJfdW5yZWdpc3RlcjoKPiAtCW1pcGlf
ZHNpX2hvc3RfdW5yZWdpc3RlcigmZHNpLT5ob3N0KTsKPiAtZXJyX2RkcF9jb21wX3VucmVnaXN0
ZXI6Cj4gIAltdGtfZGRwX2NvbXBfdW5yZWdpc3Rlcihkcm0sICZkc2ktPmRkcF9jb21wKTsKPiAg
CXJldHVybiByZXQ7Cj4gIH0KPiBAQCAtMTA5NywzMSArMTA4OSwzNyBAQCBzdGF0aWMgaW50IG10
a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4gIAlkc2ktPmhv
c3Qub3BzID0gJm10a19kc2lfb3BzOwo+ICAJZHNpLT5ob3N0LmRldiA9IGRldjsKPiArCWRzaS0+
ZGV2ID0gZGV2OwoKV2h5IGRvIHRoaXM/CgpSZWdhcmRzLApDSwoKPiArCXJldCA9IG1pcGlfZHNp
X2hvc3RfcmVnaXN0ZXIoJmRzaS0+aG9zdCk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERTSSBob3N0OiAlZFxuIiwgcmV0KTsKPiArCQly
ZXR1cm4gcmV0Owo+ICsJfQo+ICAKPiAgCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRn
ZShkZXYtPm9mX25vZGUsIDAsIDAsCj4gIAkJCQkJICAmZHNpLT5wYW5lbCwgJmRzaS0+YnJpZGdl
KTsKPiAgCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiArCQlnb3RvIGVycl91bnJlZ2lzdGVy
X2hvc3Q7Cj4gIAo+ICAJZHNpLT5lbmdpbmVfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImVuZ2lu
ZSIpOwo+ICAJaWYgKElTX0VSUihkc2ktPmVuZ2luZV9jbGspKSB7Cj4gIAkJcmV0ID0gUFRSX0VS
Uihkc2ktPmVuZ2luZV9jbGspOwo+ICAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBlbmdp
bmUgY2xvY2s6ICVkXG4iLCByZXQpOwo+IC0JCXJldHVybiByZXQ7Cj4gKwkJZ290byBlcnJfdW5y
ZWdpc3Rlcl9ob3N0Owo+ICAJfQo+ICAKPiAgCWRzaS0+ZGlnaXRhbF9jbGsgPSBkZXZtX2Nsa19n
ZXQoZGV2LCAiZGlnaXRhbCIpOwo+ICAJaWYgKElTX0VSUihkc2ktPmRpZ2l0YWxfY2xrKSkgewo+
ICAJCXJldCA9IFBUUl9FUlIoZHNpLT5kaWdpdGFsX2Nsayk7Cj4gIAkJZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gZ2V0IGRpZ2l0YWwgY2xvY2s6ICVkXG4iLCByZXQpOwo+IC0JCXJldHVybiByZXQ7
Cj4gKwkJZ290byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+ICAJfQo+ICAKPiAgCWRzaS0+aHNfY2xr
ID0gZGV2bV9jbGtfZ2V0KGRldiwgImhzIik7Cj4gIAlpZiAoSVNfRVJSKGRzaS0+aHNfY2xrKSkg
ewo+ICAJCXJldCA9IFBUUl9FUlIoZHNpLT5oc19jbGspOwo+ICAJCWRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIGdldCBocyBjbG9jazogJWRcbiIsIHJldCk7Cj4gLQkJcmV0dXJuIHJldDsKPiArCQln
b3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gIAl9Cj4gIAo+ICAJcmVncyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
