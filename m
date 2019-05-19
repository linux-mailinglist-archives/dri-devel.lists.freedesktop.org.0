Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254F22682
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 11:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909389183;
	Sun, 19 May 2019 09:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB258916D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 09:37:30 +0000 (UTC)
X-UUID: 3dbb1c18d7ca41cd9a7ac571d2506051-20190519
X-UUID: 3dbb1c18d7ca41cd9a7ac571d2506051-20190519
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jitao.shi@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 896161235; Sun, 19 May 2019 17:37:24 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 19 May 2019 17:37:22 +0800
Received: from [10.16.6.141] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 19 May 2019 17:37:21 +0800
Message-ID: <1558258641.367.6.camel@mszsdaap41>
Subject: Re: [v3 3/3] drm/mediatek: add mt8183 dpi support
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Sun, 19 May 2019 17:37:21 +0800
In-Reply-To: <1557214887.3498.7.camel@mtksdaap41>
References: <20190416055242.75764-1-jitao.shi@mediatek.com>
 <20190416055242.75764-4-jitao.shi@mediatek.com>
 <1557214887.3498.7.camel@mtksdaap41>
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

T24gVHVlLCAyMDE5LTA1LTA3IGF0IDE1OjQxICswODAwLCBDSyBIdSB3cm90ZToKPiBIaSwgSml0
YW86Cj4gCj4gT24gVHVlLCAyMDE5LTA0LTE2IGF0IDEzOjUyICswODAwLCBKaXRhbyBTaGkgd3Jv
dGU6Cj4gCj4gSSBuZWVkIHRoZSBjb21taXQgbWVzc2FnZS4gRXZlbiB0aG91Z2ggdGhlIGNvZGUg
aXMgZWFzeSB0byB1bmRlcnN0YW5kLAo+IHdvcmRzIGZvciB0aGlzIHBhdGNoIGlzIHN0aWxsIG5l
Y2Vzc2FyeS4KPiAKPiBSZWdhcmRzLAo+IENLCj4gCgpJJ2xsIGZpbmUgdHVuZSB0aGUgY29tbWl0
IG1lc3NhZ2UgbmV4dCB2ZXJzaW9uLgoKQmVzdCBSZWdhcmRzCkppdGFvCgo+ID4gU2lnbmVkLW9m
Zi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKPiA+IGluZGV4IDY2NDA1MTU5MTQxYS4uZmJiMDg3MjE4Nzc1IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gQEAgLTY4MSw2ICs2ODEs
MTYgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdDI3MDFfY2FsY3VsYXRlX2ZhY3RvcihpbnQgY2xv
Y2spCj4gPiAgCQlyZXR1cm4gMjsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIHVuc2lnbmVkIGlu
dCBtdDgxODNfY2FsY3VsYXRlX2ZhY3RvcihpbnQgY2xvY2spCj4gPiArewo+ID4gKwlpZiAoY2xv
Y2sgPD0gMjcwMDApCj4gPiArCQlyZXR1cm4gODsKPiA+ICsJZWxzZSBpZiAoY2xvY2sgPD0gMTY3
MDAwKQo+ID4gKwkJcmV0dXJuIDQ7Cj4gPiArCWVsc2UKPiA+ICsJCXJldHVybiAyOwo+ID4gK30K
PiA+ICsKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxNzNfY29uZiA9
IHsKPiA+ICAJLmNhbF9mYWN0b3IgPSBtdDgxNzNfY2FsY3VsYXRlX2ZhY3RvciwKPiA+ICAJLnJl
Z19oX2ZyZV9jb24gPSAweGUwLAo+ID4gQEAgLTY5Miw2ICs3MDIsMTIgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYgPSB7Cj4gPiAgCS5lZGdlX3NlbF9lbiA9
IHRydWUsCj4gPiAgfTsKPiA+ICAKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29u
ZiBtdDgxODNfY29uZiA9IHsKPiA+ICsJLmNhbF9mYWN0b3IgPSBtdDgxODNfY2FsY3VsYXRlX2Zh
Y3RvciwKPiA+ICsJLnJlZ19oX2ZyZV9jb24gPSAweGUwLAo+ID4gKwkuZHVhbF9lZGdlID0gdHJ1
ZSwKPiA+ICt9Owo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIHsKPiA+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsKPiA+IEBAIC03ODcsNiArODAzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgbXRrX2RwaV9vZl9pZHNbXSA9IHsKPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxNzMtZHBpIiwKPiA+ICAJICAuZGF0YSA9ICZtdDgxNzNfY29uZiwKPiA+ICAJfSwK
PiA+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZHBpIiwKPiA+ICsJICAuZGF0
YSA9ICZtdDgxODNfY29uZiwKPiA+ICsJfSwKPiA+ICAJeyB9LAo+ID4gIH07Cj4gPiAgCj4gCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
