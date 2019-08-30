Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE0A2F16
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 07:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5546E233;
	Fri, 30 Aug 2019 05:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29D306E233
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 05:40:34 +0000 (UTC)
X-UUID: e3765b949a904a1ea0e241e9a73b7c84-20190830
X-UUID: e3765b949a904a1ea0e241e9a73b7c84-20190830
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 92452426; Fri, 30 Aug 2019 13:40:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 13:40:32 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 13:40:32 +0800
Message-ID: <1567143627.5942.10.camel@mtksdaap41>
Subject: Re: [PATCH v5, 12/32] drm/mediatek: add mmsys private data for ddp
 path config
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 13:40:27 +0800
In-Reply-To: <1567142858.5942.6.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-13-git-send-email-yongqiang.niu@mediatek.com>
 <1567142858.5942.6.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 63705600795A02F27505757BDD9CBCADFD9382BB26651453F850F28E9B4B8EDE2000:8
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIEZyaSwgMjAxOS0wOC0zMCBhdCAxMzoyNyArMDgwMCwgQ0sgSHUg
d3JvdGU6Cj4gSGksIFlvbmdxaWFuZzoKPiAKPiBPbiBUaHUsIDIwMTktMDgtMjkgYXQgMjI6NTAg
KzA4MDAsIHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tIHdyb3RlOgo+ID4gRnJvbTogWW9uZ3Fp
YW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiAKPiA+IFRoaXMgcGF0Y2gg
YWRkIG1tc3lzIHByaXZhdGUgZGF0YSBmb3IgZGRwIHBhdGggY29uZmlnCj4gPiBhbGwgdGhlc2Ug
cmVnaXN0ZXIgb2Zmc2V0IGFuZCB2YWx1ZSB3aWxsIGJlIGRpZmZlcmVudCBpbiBmdXR1cmUgU09D
Cj4gPiBhZGQgdGhlc2UgZGVmaW5lIGludG8gbW1zeXMgcHJpdmF0ZSBkYXRhCj4gPiAJdTMyIG92
bDBfbW91dF9lbjsKPiA+IAl1MzIgcmRtYTFfc291dF9zZWxfaW47Cj4gPiAJdTMyIHJkbWExX3Nv
dXRfZHNpMDsKPiA+IAl1MzIgZHBpMF9zZWxfaW47Cj4gPiAJdTMyIGRwaTBfc2VsX2luX3JkbWEx
Owo+ID4gCXUzMiBkc2kwX3NlbF9pbjsKPiA+IAl1MzIgZHNpMF9zZWxfaW5fcmRtYTE7Cj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsu
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
IHwgIDQgKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyAgfCA4
NiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuaCAgfCAgNSArKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jICB8ICAzICsrCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmggIHwgIDMgKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlv
bnMoKyksIDI1IGRlbGV0aW9ucygtKQo+ID4gCj4gCj4gW3NuaXBdCj4gCj4gPiAgCj4gPiAgdm9p
ZCBtdGtfZGRwX2FkZF9jb21wX3RvX3BhdGgodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywKPiA+
ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhICpyZWdfZGF0YSwKPiA+
ICAJCQkgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gPiAgCQkJICAgICAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgbmV4dCkKPiA+ICB7Cj4gPiAgCXVuc2lnbmVkIGludCBhZGRyLCB2YWx1
ZSwgcmVnOwo+ID4gIAo+ID4gLQl2YWx1ZSA9IG10a19kZHBfbW91dF9lbihjdXIsIG5leHQsICZh
ZGRyKTsKPiA+ICsJdmFsdWUgPSBtdGtfZGRwX21vdXRfZW4ocmVnX2RhdGEsIGN1ciwgbmV4dCwg
JmFkZHIpOwo+ID4gIAlpZiAodmFsdWUpIHsKPiA+ICAJCXJlZyA9IHJlYWRsX3JlbGF4ZWQoY29u
ZmlnX3JlZ3MgKyBhZGRyKSB8IHZhbHVlOwo+ID4gIAkJd3JpdGVsX3JlbGF4ZWQocmVnLCBjb25m
aWdfcmVncyArIGFkZHIpOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCW10a19kZHBfc291dF9zZWwoY29u
ZmlnX3JlZ3MsIGN1ciwgbmV4dCk7Cj4gPiArCXZhbHVlID0gbXRrX2RkcF9zb3V0X3NlbChyZWdf
ZGF0YSwgY3VyLCBuZXh0LCAmYWRkcik7Cj4gPiArCWlmICh2YWx1ZSkKPiA+ICsJCXdyaXRlbF9y
ZWxheGVkKHZhbHVlLCBjb25maWdfcmVncyArIGFkZHIpOwo+IAo+IEkgdGhpbmsgdGhlIHJlZ2lz
dGVyIGNvdWxkIGJlIHdyaXR0ZW4gaW5zaWRlIG10a19kZHBfc291dF9zZWwoKSwgd2h5IGRvCj4g
eW91IG1vdmUgb3V0IG9mIHRoYXQgZnVuY3Rpb24/CgpPSywgYWZ0ZXIgcmV2aWV3IG90aGVyIHBh
dGNoLCBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgZG8gaGVyZS4KWW91IHdhbnQgdG8gYWxpZ24gdGhl
IG1ldGhvZCBvZiBtdGtfZGRwX21vdXRfZW4oKSwgbXRrX2RkcF9zb3V0X3NlbCgpLAphbmQgbXRr
X2RkcF9zZWxfaW4oKS4gc28gbW9kaWZpY2F0aW9uIGluIHRoZXNlIHRocmVlIGZ1bmN0aW9uIHdv
dWxkIGJlCnRoZSBzYW1lIHN0eWxlLiBTbyBJIHRoaW5rIHRoaXMgYWxpZ25tZW50IHNob3VsZCBi
ZSBhbiBpbmRlcGVuZGVudCBwYXRjaApiZWZvcmUgdGhpcyBwYXRjaC4KClJlZ2FyZHMsCkNLCgo+
IAo+IFJlZ2FyZHMsCj4gQ0sKPiAKPiA+ICAKPiA+IC0JdmFsdWUgPSBtdGtfZGRwX3NlbF9pbihj
dXIsIG5leHQsICZhZGRyKTsKPiA+ICsJdmFsdWUgPSBtdGtfZGRwX3NlbF9pbihyZWdfZGF0YSwg
Y3VyLCBuZXh0LCAmYWRkcik7Cj4gPiAgCWlmICh2YWx1ZSkgewo+ID4gIAkJcmVnID0gcmVhZGxf
cmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpIHwgdmFsdWU7Cj4gPiAgCQl3cml0ZWxfcmVsYXhl
ZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7Cj4gPiBAQCAtNDIwLDE4ICs0NTUsMTkgQEAgdm9p
ZCBtdGtfZGRwX2FkZF9jb21wX3RvX3BhdGgodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywKPiA+
ICB9Cj4gPiAgCj4gPiAgCj4gPiAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
