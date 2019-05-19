Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6FA22677
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 11:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5E78916A;
	Sun, 19 May 2019 09:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BC98916A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 09:33:34 +0000 (UTC)
X-UUID: 6b997abffce94d0daa373200c36ade18-20190519
X-UUID: 6b997abffce94d0daa373200c36ade18-20190519
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jitao.shi@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 349479096; Sun, 19 May 2019 17:33:30 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs01n2.mediatek.inc
 (172.21.101.79) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 17:33:28 +0800
Received: from [10.16.6.141] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 19 May 2019 17:33:26 +0800
Message-ID: <1558258406.367.2.camel@mszsdaap41>
Subject: Re: [v2 2/5] drm/mediatek: CMDQ reg address of mt8173 is different
 with mt2701
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Sun, 19 May 2019 17:33:26 +0800
In-Reply-To: <1557283144.31731.4.camel@mtksdaap41>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-3-jitao.shi@mediatek.com>
 <1557283144.31731.4.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 17F19A267425E9C381A65E5780EDC955404235D6C9C3F08D93A1787A5C4050F52000:8
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

T24gV2VkLCAyMDE5LTA1LTA4IGF0IDEwOjM5ICswODAwLCBDSyBIdSB3cm90ZToKPiBPbiBUdWUs
IDIwMTktMDQtMTYgYXQgMTQ6MDQgKzA4MDAsIEppdGFvIFNoaSB3cm90ZToKPiA+IENvbmZpZyB0
aGUgZGlmZmVyZW50IENNRFEgcmVnIGFkZHJlc3MgaW4gZHJpdmVyIGRhdGEuCj4gPiAKPiBGb3Ig
TVQ4MTczLCB5b3UgY2hhbmdlIHJlZ19jbWRfb2ZmIGZyb20gMHgxODAgdG8gMHgyMDAsIHNvIHRo
aXMgcGF0Y2ggaXMKPiBhIGJ1ZyBmaXguIFlvdSBzaG91bGQgYWRkIGEgJ0ZpeGVzJyB0YWcuCj4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMzkgKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Ywo+ID4gaW5kZXggNmM0YWMzN2Y5ODNkLi41NzNlNmJlYzZkMzYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiBAQCAtMTMxLDcgKzEzMSw2IEBACj4gPiAgI2RlZmlu
ZSBWTV9DTURfRU4JCQlCSVQoMCkKPiA+ICAjZGVmaW5lIFRTX1ZGUF9FTgkJCUJJVCg1KQo+ID4g
IAo+ID4gLSNkZWZpbmUgRFNJX0NNRFEwCQkweDE4MAo+ID4gICNkZWZpbmUgQ09ORklHCQkJCSgw
eGZmIDw8IDApCj4gPiAgI2RlZmluZSBTSE9SVF9QQUNLRVQJCQkwCj4gPiAgI2RlZmluZSBMT05H
X1BBQ0tFVAkJCTIKPiA+IEBAIC0xNTYsNiArMTU1LDEwIEBACj4gPiAgCj4gPiAgc3RydWN0IHBo
eTsKPiA+ICAKPiA+ICtzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSB7Cj4gPiArCWNvbnN0IHUz
MiByZWdfY21kcV9vZmY7Cj4gPiArfTsKPiA+ICsKPiA+ICBzdHJ1Y3QgbXRrX2RzaSB7Cj4gPiAg
CXN0cnVjdCBtdGtfZGRwX2NvbXAgZGRwX2NvbXA7Cj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsK
PiA+IEBAIC0xODIsNiArMTg1LDcgQEAgc3RydWN0IG10a19kc2kgewo+ID4gIAlib29sIGVuYWJs
ZWQ7Cj4gPiAgCXUzMiBpcnFfZGF0YTsKPiA+ICAJd2FpdF9xdWV1ZV9oZWFkX3QgaXJxX3dhaXRf
cXVldWU7Cj4gPiArCXN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhICpkcml2ZXJfZGF0YTsKPiA+
ICB9Owo+ID4gIAo+ID4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IG10a19kc2kgKmVuY29kZXJfdG9f
ZHNpKHN0cnVjdCBkcm1fZW5jb2RlciAqZSkKPiA+IEBAIC05MzQsNiArOTM4LDcgQEAgc3RhdGlj
IHZvaWQgbXRrX2RzaV9jbWRxKHN0cnVjdCBtdGtfZHNpICpkc2ksIGNvbnN0IHN0cnVjdCBtaXBp
X2RzaV9tc2cgKm1zZykKPiA+ICAJY29uc3QgY2hhciAqdHhfYnVmID0gbXNnLT50eF9idWY7Cj4g
PiAgCXU4IGNvbmZpZywgY21kcV9zaXplLCBjbWRxX29mZiwgdHlwZSA9IG1zZy0+dHlwZTsKPiA+
ICAJdTMyIHJlZ192YWwsIGNtZHFfbWFzaywgaTsKPiA+ICsJdTMyIHJlZ19jbWRxX29mZiA9IGRz
aS0+ZHJpdmVyX2RhdGEtPnJlZ19jbWRxX29mZjsKPiA+ICAKPiA+ICAJaWYgKE1US19EU0lfSE9T
VF9JU19SRUFEKHR5cGUpKQo+ID4gIAkJY29uZmlnID0gQlRBOwo+ID4gQEAgLTk1Myw5ICs5NTgs
MTEgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jbWRxKHN0cnVjdCBtdGtfZHNpICpkc2ksIGNvbnN0
IHN0cnVjdCBtaXBpX2RzaV9tc2cgKm1zZykKPiA+ICAJfQo+ID4gIAo+ID4gIAlmb3IgKGkgPSAw
OyBpIDwgbXNnLT50eF9sZW47IGkrKykKPiA+IC0JCXdyaXRlYih0eF9idWZbaV0sIGRzaS0+cmVn
cyArIERTSV9DTURRMCArIGNtZHFfb2ZmICsgaSk7Cj4gPiArCQltdGtfZHNpX21hc2soZHNpLCAo
cmVnX2NtZHFfb2ZmICsgY21kcV9vZmYgKyBpKSAmICh+MHgzVSksCj4gPiArCQkJICAgICAoMHhm
ZlVMIDw8ICgoKGkgKyBjbWRxX29mZikgJiAzVSkgKiA4VSkpLAo+ID4gKwkJCSAgICAgdHhfYnVm
W2ldIDw8ICgoKGkgKyBjbWRxX29mZikgJiAzVSkgKiA4VSkpOwo+IAo+IFlvdSBzYXkgeW91IHdv
dWxkIGZvbGxvdyBOaWNvbGFzJyBzdWdnZXN0aW9uIGhlcmUuCj4gCgpJZiBpIHJlcGxhY2UgbXRr
X2RzaV9tYXNrIHdpdGggd3JpdGViLCBpIGNhbid0IGdldCByaWdodCB2YWx1ZSBmcm9tCnJlZ2lz
dGVycy4gSSBkb24ndCBrbm93IHdoeSB0aGlzLgoKPiA+ICAKPiA+IC0JbXRrX2RzaV9tYXNrKGRz
aSwgRFNJX0NNRFEwLCBjbWRxX21hc2ssIHJlZ192YWwpOwo+ID4gKwltdGtfZHNpX21hc2soZHNp
LCByZWdfY21kcV9vZmYsIGNtZHFfbWFzaywgcmVnX3ZhbCk7Cj4gPiAgCW10a19kc2lfbWFzayhk
c2ksIERTSV9DTURRX1NJWkUsIENNRFFfU0laRSwgY21kcV9zaXplKTsKPiA+ICB9Cj4gPiAgCj4g
PiBAQCAtMTA3NCwxMCArMTA4MSwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9v
cHMgbXRrX2RzaV9jb21wb25lbnRfb3BzID0gewo+ID4gIAkudW5iaW5kID0gbXRrX2RzaV91bmJp
bmQsCj4gPiAgfTsKPiA+ICAKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kc2lfZHJpdmVy
X2RhdGEgbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSA9IHsKPiA+ICsJLnJlZ19jbWRxX29mZiA9IDB4
MjAwLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZl
cl9kYXRhIG10MjcwMV9kc2lfZHJpdmVyX2RhdGEgPSB7Cj4gPiArCS5yZWdfY21kcV9vZmYgPSAw
eDE4MCwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG10a19kc2lfb2ZfbWF0Y2hbXSA9IHsKPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDI3MDEtZHNpIiwKPiA+ICsJICAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZlcl9kYXRhIH0sCj4g
PiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRzaSIsCj4gPiArCSAgLmRhdGEg
PSAmbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSB9LAo+ID4gKwl7IH0sCj4gPiArfTsKPiA+ICsKPiA+
ICBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+ICB7Cj4gPiAgCXN0cnVjdCBtdGtfZHNpICpkc2k7Cj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7Cj4gPiArCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOwo+
ID4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlZ3M7Cj4gPiAgCWludCBpcnFfbnVtOwo+ID4gIAlpbnQg
Y29tcF9pZDsKPiA+IEBAIC0xMTAxLDYgKzExMjUsOSBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJaWYgKHJldCkKPiA+ICAJCWdv
dG8gZXJyX3VucmVnaXN0ZXJfaG9zdDsKPiA+ICAKPiA+ICsJb2ZfaWQgPSBvZl9tYXRjaF9kZXZp
Y2UobXRrX2RzaV9vZl9tYXRjaCwgJnBkZXYtPmRldik7Cj4gPiArCWRzaS0+ZHJpdmVyX2RhdGEg
PSBvZl9pZC0+ZGF0YTsKPiAKPiBNYXliZSB1c2Ugb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkg
aXMgYSBtb3JlIHNpbXBsZSB3YXkuIFlvdSBjb3VsZAo+IHJlZmVyIHRvIFsxXS4KPiAKPiBbMV0K
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xL3NvdXJjZS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMjTDMwMAo+IAo+IFJlZ2FyZHMsCj4gQ0sKPiAK
CkknbGwgZml4IGl0IG5leHQgdmVyc2lvbi4KCj4gPiArCj4gPiAgCWRzaS0+ZW5naW5lX2NsayA9
IGRldm1fY2xrX2dldChkZXYsICJlbmdpbmUiKTsKPiA+ICAJaWYgKElTX0VSUihkc2ktPmVuZ2lu
ZV9jbGspKSB7Cj4gPiAgCQlyZXQgPSBQVFJfRVJSKGRzaS0+ZW5naW5lX2Nsayk7Cj4gPiBAQCAt
MTE5MywxMiArMTIyMCw2IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+ICAJcmV0dXJuIDA7Cj4gPiAgfQo+ID4gIAo+ID4gLXN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kc2lfb2ZfbWF0Y2hbXSA9IHsKPiA+IC0J
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZHNpIiB9LAo+ID4gLQl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiIH0sCj4gPiAtCXsgfSwKPiA+IC19Owo+ID4gLQo+
ID4gIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2RzaV9kcml2ZXIgPSB7Cj4gPiAgCS5wcm9i
ZSA9IG10a19kc2lfcHJvYmUsCj4gPiAgCS5yZW1vdmUgPSBtdGtfZHNpX3JlbW92ZSwKPiAKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
