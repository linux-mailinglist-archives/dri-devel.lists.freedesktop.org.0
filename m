Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1A22F05
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685C5894C1;
	Mon, 20 May 2019 08:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 871BD89394
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:34:23 +0000 (UTC)
X-UUID: b58bd22e58254f2384bdf69571e7c1ac-20190520
X-UUID: b58bd22e58254f2384bdf69571e7c1ac-20190520
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1035860400; Mon, 20 May 2019 16:34:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS33N1.mediatek.inc (172.27.4.75) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 20 May 2019 16:34:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 20 May 2019 16:34:09 +0800
Message-ID: <1558341248.7311.42.camel@mtksdaap41>
Subject: Re: [v2 2/5] drm/mediatek: CMDQ reg address of mt8173 is different
 with mt2701
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 20 May 2019 16:34:08 +0800
In-Reply-To: <1558258406.367.2.camel@mszsdaap41>
References: <20190416060501.76276-1-jitao.shi@mediatek.com>
 <20190416060501.76276-3-jitao.shi@mediatek.com>
 <1557283144.31731.4.camel@mtksdaap41> <1558258406.367.2.camel@mszsdaap41>
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

SGksIEppdGFvOgoKT24gU3VuLCAyMDE5LTA1LTE5IGF0IDE3OjMzICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gT24gV2VkLCAyMDE5LTA1LTA4IGF0IDEwOjM5ICswODAwLCBDSyBIdSB3cm90ZToK
PiA+IE9uIFR1ZSwgMjAxOS0wNC0xNiBhdCAxNDowNCArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+
ID4gPiBDb25maWcgdGhlIGRpZmZlcmVudCBDTURRIHJlZyBhZGRyZXNzIGluIGRyaXZlciBkYXRh
Lgo+ID4gPiAKPiA+IEZvciBNVDgxNzMsIHlvdSBjaGFuZ2UgcmVnX2NtZF9vZmYgZnJvbSAweDE4
MCB0byAweDIwMCwgc28gdGhpcyBwYXRjaCBpcwo+ID4gYSBidWcgZml4LiBZb3Ugc2hvdWxkIGFk
ZCBhICdGaXhlcycgdGFnLgo+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+ID4g
Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiBpbmRleCA2YzRhYzM3Zjk4
M2QuLjU3M2U2YmVjNmQzNiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gPiA+IEBAIC0xMzEsNyArMTMxLDYgQEAKPiA+ID4gICNkZWZpbmUgVk1fQ01EX0VOCQkJ
QklUKDApCj4gPiA+ICAjZGVmaW5lIFRTX1ZGUF9FTgkJCUJJVCg1KQo+ID4gPiAgCj4gPiA+IC0j
ZGVmaW5lIERTSV9DTURRMAkJMHgxODAKPiA+ID4gICNkZWZpbmUgQ09ORklHCQkJCSgweGZmIDw8
IDApCj4gPiA+ICAjZGVmaW5lIFNIT1JUX1BBQ0tFVAkJCTAKPiA+ID4gICNkZWZpbmUgTE9OR19Q
QUNLRVQJCQkyCj4gPiA+IEBAIC0xNTYsNiArMTU1LDEwIEBACj4gPiA+ICAKPiA+ID4gIHN0cnVj
dCBwaHk7Cj4gPiA+ICAKPiA+ID4gK3N0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIHsKPiA+ID4g
Kwljb25zdCB1MzIgcmVnX2NtZHFfb2ZmOwo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiAgc3RydWN0
IG10a19kc2kgewo+ID4gPiAgCXN0cnVjdCBtdGtfZGRwX2NvbXAgZGRwX2NvbXA7Cj4gPiA+ICAJ
c3RydWN0IGRldmljZSAqZGV2Owo+ID4gPiBAQCAtMTgyLDYgKzE4NSw3IEBAIHN0cnVjdCBtdGtf
ZHNpIHsKPiA+ID4gIAlib29sIGVuYWJsZWQ7Cj4gPiA+ICAJdTMyIGlycV9kYXRhOwo+ID4gPiAg
CXdhaXRfcXVldWVfaGVhZF90IGlycV93YWl0X3F1ZXVlOwo+ID4gPiArCXN0cnVjdCBtdGtfZHNp
X2RyaXZlcl9kYXRhICpkcml2ZXJfZGF0YTsKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gIHN0YXRp
YyBpbmxpbmUgc3RydWN0IG10a19kc2kgKmVuY29kZXJfdG9fZHNpKHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZSkKPiA+ID4gQEAgLTkzNCw2ICs5MzgsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NtZHEo
c3RydWN0IG10a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNpX21zZyAqbXNnKQo+ID4g
PiAgCWNvbnN0IGNoYXIgKnR4X2J1ZiA9IG1zZy0+dHhfYnVmOwo+ID4gPiAgCXU4IGNvbmZpZywg
Y21kcV9zaXplLCBjbWRxX29mZiwgdHlwZSA9IG1zZy0+dHlwZTsKPiA+ID4gIAl1MzIgcmVnX3Zh
bCwgY21kcV9tYXNrLCBpOwo+ID4gPiArCXUzMiByZWdfY21kcV9vZmYgPSBkc2ktPmRyaXZlcl9k
YXRhLT5yZWdfY21kcV9vZmY7Cj4gPiA+ICAKPiA+ID4gIAlpZiAoTVRLX0RTSV9IT1NUX0lTX1JF
QUQodHlwZSkpCj4gPiA+ICAJCWNvbmZpZyA9IEJUQTsKPiA+ID4gQEAgLTk1Myw5ICs5NTgsMTEg
QEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jbWRxKHN0cnVjdCBtdGtfZHNpICpkc2ksIGNvbnN0IHN0
cnVjdCBtaXBpX2RzaV9tc2cgKm1zZykKPiA+ID4gIAl9Cj4gPiA+ICAKPiA+ID4gIAlmb3IgKGkg
PSAwOyBpIDwgbXNnLT50eF9sZW47IGkrKykKPiA+ID4gLQkJd3JpdGViKHR4X2J1ZltpXSwgZHNp
LT5yZWdzICsgRFNJX0NNRFEwICsgY21kcV9vZmYgKyBpKTsKPiA+ID4gKwkJbXRrX2RzaV9tYXNr
KGRzaSwgKHJlZ19jbWRxX29mZiArIGNtZHFfb2ZmICsgaSkgJiAofjB4M1UpLAo+ID4gPiArCQkJ
ICAgICAoMHhmZlVMIDw8ICgoKGkgKyBjbWRxX29mZikgJiAzVSkgKiA4VSkpLAo+ID4gPiArCQkJ
ICAgICB0eF9idWZbaV0gPDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAqIDhVKSk7Cj4gPiAKPiA+
IFlvdSBzYXkgeW91IHdvdWxkIGZvbGxvdyBOaWNvbGFzJyBzdWdnZXN0aW9uIGhlcmUuCj4gPiAK
PiAKPiBJZiBpIHJlcGxhY2UgbXRrX2RzaV9tYXNrIHdpdGggd3JpdGViLCBpIGNhbid0IGdldCBy
aWdodCB2YWx1ZSBmcm9tCj4gcmVnaXN0ZXJzLiBJIGRvbid0IGtub3cgd2h5IHRoaXMuCgpJIHJl
bWVtYmVyIHRoYXQgU2hhb21pbmcgaGFzIGFsc28gbWVldCBzb21lIGVycm9yIGFib3V0IHdyaXRl
YigpLCBidXQgaGUKZmluYWxseSBmaXggdGhpcyBidWcuIFlvdSBtYXkgZ2V0IHNvbWUgaGludCBm
cm9tIGhpbS4gSWYgd2UgY2FuIG5vdCB1c2UKd3JpdGViKCksIHRoaXMgbW9kaWZpY2F0aW9uIHNo
b3VsZCBiZSB0d28gcGF0Y2hlczogb25lIGlzIGNoYW5naW5nCkRTSV9DTURRMCB0byByZWdfY21k
cV9vZmYsIGFub3RoZXIgb25lIGlzIGNoYW5naW5nIHdyaXRlYigpIHRvCm10a19kc2lfbWFzaygp
LgoKUmVnYXJkcywKQ0sKCj4gCj4gPiA+ICAKPiA+ID4gLQltdGtfZHNpX21hc2soZHNpLCBEU0lf
Q01EUTAsIGNtZHFfbWFzaywgcmVnX3ZhbCk7Cj4gPiA+ICsJbXRrX2RzaV9tYXNrKGRzaSwgcmVn
X2NtZHFfb2ZmLCBjbWRxX21hc2ssIHJlZ192YWwpOwo+ID4gPiAgCW10a19kc2lfbWFzayhkc2ks
IERTSV9DTURRX1NJWkUsIENNRFFfU0laRSwgY21kcV9zaXplKTsKPiA+ID4gIH0KPiA+ID4gIAo+
ID4gPiBAQCAtMTA3NCwxMCArMTA4MSwyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVu
dF9vcHMgbXRrX2RzaV9jb21wb25lbnRfb3BzID0gewo+ID4gPiAgCS51bmJpbmQgPSBtdGtfZHNp
X3VuYmluZCwKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2RzaV9kcml2ZXJfZGF0YSBtdDgxNzNfZHNpX2RyaXZlcl9kYXRhID0gewo+ID4gPiArCS5yZWdf
Y21kcV9vZmYgPSAweDIwMCwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDI3MDFfZHNpX2RyaXZlcl9kYXRhID0gewo+ID4g
PiArCS5yZWdfY21kcV9vZmYgPSAweDE4MCwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kc2lfb2ZfbWF0Y2hbXSA9IHsKPiA+ID4g
Kwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kc2kiLAo+ID4gPiArCSAgLmRhdGEg
PSAmbXQyNzAxX2RzaV9kcml2ZXJfZGF0YSB9LAo+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTczLWRzaSIsCj4gPiA+ICsJICAuZGF0YSA9ICZtdDgxNzNfZHNpX2RyaXZlcl9k
YXRhIH0sCj4gPiA+ICsJeyB9LAo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiAgc3RhdGljIGludCBt
dGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICB7Cj4gPiA+
ICAJc3RydWN0IG10a19kc2kgKmRzaTsKPiA+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Owo+ID4gPiArCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOwo+ID4gPiAg
CXN0cnVjdCByZXNvdXJjZSAqcmVnczsKPiA+ID4gIAlpbnQgaXJxX251bTsKPiA+ID4gIAlpbnQg
Y29tcF9pZDsKPiA+ID4gQEAgLTExMDEsNiArMTEyNSw5IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgCWlmIChyZXQpCj4gPiA+
ICAJCWdvdG8gZXJyX3VucmVnaXN0ZXJfaG9zdDsKPiA+ID4gIAo+ID4gPiArCW9mX2lkID0gb2Zf
bWF0Y2hfZGV2aWNlKG10a19kc2lfb2ZfbWF0Y2gsICZwZGV2LT5kZXYpOwo+ID4gPiArCWRzaS0+
ZHJpdmVyX2RhdGEgPSBvZl9pZC0+ZGF0YTsKPiA+IAo+ID4gTWF5YmUgdXNlIG9mX2RldmljZV9n
ZXRfbWF0Y2hfZGF0YSgpIGlzIGEgbW9yZSBzaW1wbGUgd2F5LiBZb3UgY291bGQKPiA+IHJlZmVy
IHRvIFsxXS4KPiA+IAo+ID4gWzFdCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92NS4xL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMjTDMw
MAo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gQ0sKPiA+IAo+IAo+IEknbGwgZml4IGl0IG5leHQgdmVy
c2lvbi4KPiAKPiA+ID4gKwo+ID4gPiAgCWRzaS0+ZW5naW5lX2NsayA9IGRldm1fY2xrX2dldChk
ZXYsICJlbmdpbmUiKTsKPiA+ID4gIAlpZiAoSVNfRVJSKGRzaS0+ZW5naW5lX2NsaykpIHsKPiA+
ID4gIAkJcmV0ID0gUFRSX0VSUihkc2ktPmVuZ2luZV9jbGspOwo+ID4gPiBAQCAtMTE5MywxMiAr
MTIyMCw2IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiA+ID4gIAlyZXR1cm4gMDsKPiA+ID4gIH0KPiA+ID4gIAo+ID4gPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RzaV9vZl9tYXRjaFtdID0gewo+ID4gPiAt
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRzaSIgfSwKPiA+ID4gLQl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiIH0sCj4gPiA+IC0JeyB9LAo+ID4gPiAtfTsK
PiA+ID4gLQo+ID4gPiAgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfZHNpX2RyaXZlciA9IHsK
PiA+ID4gIAkucHJvYmUgPSBtdGtfZHNpX3Byb2JlLAo+ID4gPiAgCS5yZW1vdmUgPSBtdGtfZHNp
X3JlbW92ZSwKPiA+IAo+ID4gCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
