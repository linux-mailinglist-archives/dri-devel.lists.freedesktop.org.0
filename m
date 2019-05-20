Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2122B7B
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C980891B3;
	Mon, 20 May 2019 05:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E18F891B3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:56:57 +0000 (UTC)
X-UUID: 05bdecd6d289420d988b3d3773fce335-20190520
X-UUID: 05bdecd6d289420d988b3d3773fce335-20190520
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1874507480; Mon, 20 May 2019 13:56:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 20 May 2019 13:56:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 20 May 2019 13:56:46 +0800
Message-ID: <1558331806.7311.26.camel@mtksdaap41>
Subject: Re: [v4 2/5] drm/mediatek: dpi dual edge support
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 20 May 2019 13:56:46 +0800
In-Reply-To: <20190518095618.18454-3-jitao.shi@mediatek.com>
References: <20190518095618.18454-1-jitao.shi@mediatek.com>
 <20190518095618.18454-3-jitao.shi@mediatek.com>
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

SGksIEppdGFvOgoKT24gU2F0LCAyMDE5LTA1LTE4IGF0IDE3OjU2ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gRFBJIHNhbXBsZSB0aGUgZGF0YSBib3RoIHJpc2luZyBhbmQgZmFsbGluZyBlZGdl
Lgo+IEl0IGNhbiByZWR1Y2UgaGFsZiBkYXRhIGlvIHBpbnMuCgpBbGwgdGhlIHJlZ2lzdGVycyB3
aGljaCB5b3UgY29udHJvbCBpbiB0aGlzIHBhdGNoIGV4aXN0IGluIE1UODE3My4gU28gSQp0aGlu
ayB0aGlzIGlzIG5vdCBhIFNvQy1sZXZlbCBmZWF0dXJlLiBUaGlzIGZlYXR1cmUgZGVwZW5kcyBv
biBob3cgbXVjaAppbyBwaW5zIHlvdSB3YW50IHRvIHVzZSBpbiB0aGlzIHBsYXRmb3JtLiBDb3Vs
ZCB3ZSBnZXQgdGhlIGlvIHBpbnMKaW5mb3JtYXRpb24gZnJvbSBkZXZpY2UgdHJlZSBvciBjYWxs
aW5nIGFueSBkcml2ZXIncyBhcGkgdG8gZ2V0PyBJZgp0aGVyZSBpcyBubyB3YXkgdG8gZ2V0IHRo
aXMgaW5mb3JtYXRpb24sIEkgY291bGQganVzdCB0ZW1wb3JhcmlseSBhcHBseQp0aGlzIHBhdGNo
IGFuZCBuZWVkIHBsYW4gdG8gZml4IHRoaXMgdGVtcG9yYXJ5IHNvbHV0aW9uLgoKUmVnYXJkcywK
Q0sKCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTMgKysrKysr
KysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IDIyZTY4YTEwMGU3Yi4u
Y2NlZjNhYzFjNTYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gQEAgLTEx
Nyw2ICsxMTcsNyBAQCBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsKPiAgCXVuc2lnbmVkIGludCAoKmNh
bF9mYWN0b3IpKGludCBjbG9jayk7Cj4gIAl1MzIgcmVnX2hfZnJlX2NvbjsKPiAgCWJvb2wgZWRn
ZV9zZWxfZW47Cj4gKwlib29sIGR1YWxfZWRnZTsKPiAgfTsKPiAgCj4gIHN0YXRpYyB2b2lkIG10
a19kcGlfbWFzayhzdHJ1Y3QgbXRrX2RwaSAqZHBpLCB1MzIgb2Zmc2V0LCB1MzIgdmFsLCB1MzIg
bWFzaykKPiBAQCAtMzUzLDYgKzM1NCwxMyBAQCBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19k
aXNhYmxlX2VkZ2Uoc3RydWN0IG10a19kcGkgKmRwaSkKPiAgCQltdGtfZHBpX21hc2soZHBpLCBk
cGktPmNvbmYtPnJlZ19oX2ZyZV9jb24sIDAsIEVER0VfU0VMX0VOKTsKPiAgfQo+ICAKPiArc3Rh
dGljIHZvaWQgbXRrX2RwaV9lbmFibGVfZHVhbF9lZGdlKHN0cnVjdCBtdGtfZHBpICpkcGkpCj4g
K3sKPiArCW10a19kcGlfbWFzayhkcGksIERQSV9ERFJfU0VUVElORywgRERSX0VOIHwgRERSXzRQ
SEFTRSwKPiArCQkgICAgIEREUl9FTiB8IEREUl80UEhBU0UpOwo+ICsJbXRrX2RwaV9tYXNrKGRw
aSwgRFBJX09VVFBVVF9TRVRUSU5HLCBFREdFX1NFTCwgRURHRV9TRUwpOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19jb2xvcl9mb3JtYXQoc3RydWN0IG10a19kcGkgKmRw
aSwKPiAgCQkJCQllbnVtIG10a19kcGlfb3V0X2NvbG9yX2Zvcm1hdCBmb3JtYXQpCj4gIHsKPiBA
QCAtNDQ0LDcgKzQ1Miw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0
cnVjdCBtdGtfZHBpICpkcGksCj4gIAlwbGxfcmF0ZSA9IGNsa19nZXRfcmF0ZShkcGktPnR2ZF9j
bGspOwo+ICAKPiAgCXZtLnBpeGVsY2xvY2sgPSBwbGxfcmF0ZSAvIGZhY3RvcjsKPiAtCWNsa19z
ZXRfcmF0ZShkcGktPnBpeGVsX2Nsaywgdm0ucGl4ZWxjbG9jayk7Cj4gKwljbGtfc2V0X3JhdGUo
ZHBpLT5waXhlbF9jbGssCj4gKwkJICAgICB2bS5waXhlbGNsb2NrICogKGRwaS0+Y29uZi0+ZHVh
bF9lZGdlID8gMiA6IDEpKTsKPiAgCXZtLnBpeGVsY2xvY2sgPSBjbGtfZ2V0X3JhdGUoZHBpLT5w
aXhlbF9jbGspOwo+ICAKPiAgCWRldl9kYmcoZHBpLT5kZXYsICJHb3QgIFBMTCAlbHUgSHosIHBp
eGVsIGNsb2NrICVsdSBIelxuIiwKPiBAQCAtNTA5LDYgKzUxOCw4IEBAIHN0YXRpYyBpbnQgbXRr
X2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksCj4gIAltdGtfZHBpX2Nv
bmZpZ19jb2xvcl9mb3JtYXQoZHBpLCBkcGktPmNvbG9yX2Zvcm1hdCk7Cj4gIAltdGtfZHBpX2Nv
bmZpZ18ybl9oX2ZyZShkcGkpOwo+ICAJbXRrX2RwaV9jb25maWdfZGlzYWJsZV9lZGdlKGRwaSk7
Cj4gKwlpZiAoZHBpLT5jb25mLT5kdWFsX2VkZ2UpCj4gKwkJbXRrX2RwaV9lbmFibGVfZHVhbF9l
ZGdlKGRwaSk7Cj4gIAltdGtfZHBpX3N3X3Jlc2V0KGRwaSwgZmFsc2UpOwo+ICAKPiAgCXJldHVy
biAwOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
