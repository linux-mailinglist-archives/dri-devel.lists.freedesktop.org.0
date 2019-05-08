Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979D16F18
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 04:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030BF6E85F;
	Wed,  8 May 2019 02:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 504816E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 02:39:13 +0000 (UTC)
X-UUID: 5c2410f0ce734c189fe4165f79ed32a3-20190508
X-UUID: 5c2410f0ce734c189fe4165f79ed32a3-20190508
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1437165598; Wed, 08 May 2019 10:39:08 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 May 2019 10:39:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 May 2019 10:39:05 +0800
Message-ID: <1557283144.31731.4.camel@mtksdaap41>
Subject: Re: [v2 2/5] drm/mediatek: CMDQ reg address of mt8173 is different
 with mt2701
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 8 May 2019 10:39:04 +0800
In-Reply-To: <20190416060501.76276-3-jitao.shi@mediatek.com>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-3-jitao.shi@mediatek.com>
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

T24gVHVlLCAyMDE5LTA0LTE2IGF0IDE0OjA0ICswODAwLCBKaXRhbyBTaGkgd3JvdGU6Cj4gQ29u
ZmlnIHRoZSBkaWZmZXJlbnQgQ01EUSByZWcgYWRkcmVzcyBpbiBkcml2ZXIgZGF0YS4KPiAKRm9y
IE1UODE3MywgeW91IGNoYW5nZSByZWdfY21kX29mZiBmcm9tIDB4MTgwIHRvIDB4MjAwLCBzbyB0
aGlzIHBhdGNoIGlzCmEgYnVnIGZpeC4gWW91IHNob3VsZCBhZGQgYSAnRml4ZXMnIHRhZy4KCj4g
U2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMzkgKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IDZjNGFj
MzdmOTgzZC4uNTczZTZiZWM2ZDM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gQEAgLTEzMSw3ICsxMzEsNiBAQAo+ICAjZGVmaW5lIFZNX0NNRF9FTgkJCUJJVCgwKQo+ICAj
ZGVmaW5lIFRTX1ZGUF9FTgkJCUJJVCg1KQo+ICAKPiAtI2RlZmluZSBEU0lfQ01EUTAJCTB4MTgw
Cj4gICNkZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8IDApCj4gICNkZWZpbmUgU0hPUlRfUEFDS0VU
CQkJMAo+ICAjZGVmaW5lIExPTkdfUEFDS0VUCQkJMgo+IEBAIC0xNTYsNiArMTU1LDEwIEBACj4g
IAo+ICBzdHJ1Y3QgcGh5Owo+ICAKPiArc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewo+ICsJ
Y29uc3QgdTMyIHJlZ19jbWRxX29mZjsKPiArfTsKPiArCj4gIHN0cnVjdCBtdGtfZHNpIHsKPiAg
CXN0cnVjdCBtdGtfZGRwX2NvbXAgZGRwX2NvbXA7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4g
QEAgLTE4Miw2ICsxODUsNyBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gIAlib29sIGVuYWJsZWQ7Cj4g
IAl1MzIgaXJxX2RhdGE7Cj4gIAl3YWl0X3F1ZXVlX2hlYWRfdCBpcnFfd2FpdF9xdWV1ZTsKPiAr
CXN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhICpkcml2ZXJfZGF0YTsKPiAgfTsKPiAgCj4gIHN0
YXRpYyBpbmxpbmUgc3RydWN0IG10a19kc2kgKmVuY29kZXJfdG9fZHNpKHN0cnVjdCBkcm1fZW5j
b2RlciAqZSkKPiBAQCAtOTM0LDYgKzkzOCw3IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY21kcShz
dHJ1Y3QgbXRrX2RzaSAqZHNpLCBjb25zdCBzdHJ1Y3QgbWlwaV9kc2lfbXNnICptc2cpCj4gIAlj
b25zdCBjaGFyICp0eF9idWYgPSBtc2ctPnR4X2J1ZjsKPiAgCXU4IGNvbmZpZywgY21kcV9zaXpl
LCBjbWRxX29mZiwgdHlwZSA9IG1zZy0+dHlwZTsKPiAgCXUzMiByZWdfdmFsLCBjbWRxX21hc2ss
IGk7Cj4gKwl1MzIgcmVnX2NtZHFfb2ZmID0gZHNpLT5kcml2ZXJfZGF0YS0+cmVnX2NtZHFfb2Zm
Owo+ICAKPiAgCWlmIChNVEtfRFNJX0hPU1RfSVNfUkVBRCh0eXBlKSkKPiAgCQljb25maWcgPSBC
VEE7Cj4gQEAgLTk1Myw5ICs5NTgsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jbWRxKHN0cnVj
dCBtdGtfZHNpICpkc2ksIGNvbnN0IHN0cnVjdCBtaXBpX2RzaV9tc2cgKm1zZykKPiAgCX0KPiAg
Cj4gIAlmb3IgKGkgPSAwOyBpIDwgbXNnLT50eF9sZW47IGkrKykKPiAtCQl3cml0ZWIodHhfYnVm
W2ldLCBkc2ktPnJlZ3MgKyBEU0lfQ01EUTAgKyBjbWRxX29mZiArIGkpOwo+ICsJCW10a19kc2lf
bWFzayhkc2ksIChyZWdfY21kcV9vZmYgKyBjbWRxX29mZiArIGkpICYgKH4weDNVKSwKPiArCQkJ
ICAgICAoMHhmZlVMIDw8ICgoKGkgKyBjbWRxX29mZikgJiAzVSkgKiA4VSkpLAo+ICsJCQkgICAg
IHR4X2J1ZltpXSA8PCAoKChpICsgY21kcV9vZmYpICYgM1UpICogOFUpKTsKCllvdSBzYXkgeW91
IHdvdWxkIGZvbGxvdyBOaWNvbGFzJyBzdWdnZXN0aW9uIGhlcmUuCgo+ICAKPiAtCW10a19kc2lf
bWFzayhkc2ksIERTSV9DTURRMCwgY21kcV9tYXNrLCByZWdfdmFsKTsKPiArCW10a19kc2lfbWFz
ayhkc2ksIHJlZ19jbWRxX29mZiwgY21kcV9tYXNrLCByZWdfdmFsKTsKPiAgCW10a19kc2lfbWFz
ayhkc2ksIERTSV9DTURRX1NJWkUsIENNRFFfU0laRSwgY21kcV9zaXplKTsKPiAgfQo+ICAKPiBA
QCAtMTA3NCwxMCArMTA4MSwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9vcHMg
bXRrX2RzaV9jb21wb25lbnRfb3BzID0gewo+ICAJLnVuYmluZCA9IG10a19kc2lfdW5iaW5kLAo+
ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIG10ODE3
M19kc2lfZHJpdmVyX2RhdGEgPSB7Cj4gKwkucmVnX2NtZHFfb2ZmID0gMHgyMDAsCj4gK307Cj4g
Kwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgbXQyNzAxX2RzaV9k
cml2ZXJfZGF0YSA9IHsKPiArCS5yZWdfY21kcV9vZmYgPSAweDE4MCwKPiArfTsKPiArCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kc2lfb2ZfbWF0Y2hbXSA9IHsKPiAr
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRzaSIsCj4gKwkgIC5kYXRhID0gJm10
MjcwMV9kc2lfZHJpdmVyX2RhdGEgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTczLWRzaSIsCj4gKwkgIC5kYXRhID0gJm10ODE3M19kc2lfZHJpdmVyX2RhdGEgfSwKPiArCXsg
fSwKPiArfTsKPiArCj4gIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgbXRrX2RzaSAqZHNpOwo+ICAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiArCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9m
X2lkOwo+ICAJc3RydWN0IHJlc291cmNlICpyZWdzOwo+ICAJaW50IGlycV9udW07Cj4gIAlpbnQg
Y29tcF9pZDsKPiBAQCAtMTEwMSw2ICsxMTI1LDkgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gZXJy
X3VucmVnaXN0ZXJfaG9zdDsKPiAgCj4gKwlvZl9pZCA9IG9mX21hdGNoX2RldmljZShtdGtfZHNp
X29mX21hdGNoLCAmcGRldi0+ZGV2KTsKPiArCWRzaS0+ZHJpdmVyX2RhdGEgPSBvZl9pZC0+ZGF0
YTsKCk1heWJlIHVzZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBpcyBhIG1vcmUgc2ltcGxl
IHdheS4gWW91IGNvdWxkCnJlZmVyIHRvIFsxXS4KClsxXQpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS4xL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMjTDMwMAoKUmVnYXJkcywKQ0sKCj4gKwo+ICAJZHNpLT5lbmdpbmVfY2xrID0gZGV2bV9j
bGtfZ2V0KGRldiwgImVuZ2luZSIpOwo+ICAJaWYgKElTX0VSUihkc2ktPmVuZ2luZV9jbGspKSB7
Cj4gIAkJcmV0ID0gUFRSX0VSUihkc2ktPmVuZ2luZV9jbGspOwo+IEBAIC0xMTkzLDEyICsxMjIw
LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIG10a19kc2lfb2ZfbWF0Y2hbXSA9IHsKPiAtCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQyNzAxLWRzaSIgfSwKPiAtCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRz
aSIgfSwKPiAtCXsgfSwKPiAtfTsKPiAtCj4gIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2Rz
aV9kcml2ZXIgPSB7Cj4gIAkucHJvYmUgPSBtdGtfZHNpX3Byb2JlLAo+ICAJLnJlbW92ZSA9IG10
a19kc2lfcmVtb3ZlLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
