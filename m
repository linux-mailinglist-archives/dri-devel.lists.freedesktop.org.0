Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E23A2EE7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 07:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BC46E231;
	Fri, 30 Aug 2019 05:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B5196E231
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 05:27:46 +0000 (UTC)
X-UUID: d155563031be49d3bcfcda7a07ac0e3d-20190830
X-UUID: d155563031be49d3bcfcda7a07ac0e3d-20190830
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 924913638; Fri, 30 Aug 2019 13:27:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 13:27:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 13:27:43 +0800
Message-ID: <1567142858.5942.6.camel@mtksdaap41>
Subject: Re: [PATCH v5, 12/32] drm/mediatek: add mmsys private data for ddp
 path config
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 13:27:38 +0800
In-Reply-To: <1567090254-15566-13-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-13-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0403CC6CAD71087F131AA535FE8BA4CF0B137D41514B8E4735E8F6BDD168E4142000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgbW1zeXMgcHJpdmF0ZSBk
YXRhIGZvciBkZHAgcGF0aCBjb25maWcKPiBhbGwgdGhlc2UgcmVnaXN0ZXIgb2Zmc2V0IGFuZCB2
YWx1ZSB3aWxsIGJlIGRpZmZlcmVudCBpbiBmdXR1cmUgU09DCj4gYWRkIHRoZXNlIGRlZmluZSBp
bnRvIG1tc3lzIHByaXZhdGUgZGF0YQo+IAl1MzIgb3ZsMF9tb3V0X2VuOwo+IAl1MzIgcmRtYTFf
c291dF9zZWxfaW47Cj4gCXUzMiByZG1hMV9zb3V0X2RzaTA7Cj4gCXUzMiBkcGkwX3NlbF9pbjsK
PiAJdTMyIGRwaTBfc2VsX2luX3JkbWExOwo+IAl1MzIgZHNpMF9zZWxfaW47Cj4gCXUzMiBkc2kw
X3NlbF9pbl9yZG1hMTsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jIHwgIDQgKysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMgIHwgODYgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5oICB8ICA1ICsrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAzICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5oICB8ICAzICsrCj4gIDUgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0
aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4gCgpbc25pcF0KCj4gIAo+ICB2b2lkIG10a19kZHBf
YWRkX2NvbXBfdG9fcGF0aCh2b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzLAo+ICsJCQkgICAgICBj
b25zdCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhICpyZWdfZGF0YSwKPiAgCQkJICAgICAgZW51
bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+ICAJCQkgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBu
ZXh0KQo+ICB7Cj4gIAl1bnNpZ25lZCBpbnQgYWRkciwgdmFsdWUsIHJlZzsKPiAgCj4gLQl2YWx1
ZSA9IG10a19kZHBfbW91dF9lbihjdXIsIG5leHQsICZhZGRyKTsKPiArCXZhbHVlID0gbXRrX2Rk
cF9tb3V0X2VuKHJlZ19kYXRhLCBjdXIsIG5leHQsICZhZGRyKTsKPiAgCWlmICh2YWx1ZSkgewo+
ICAJCXJlZyA9IHJlYWRsX3JlbGF4ZWQoY29uZmlnX3JlZ3MgKyBhZGRyKSB8IHZhbHVlOwo+ICAJ
CXdyaXRlbF9yZWxheGVkKHJlZywgY29uZmlnX3JlZ3MgKyBhZGRyKTsKPiAgCX0KPiAgCj4gLQlt
dGtfZGRwX3NvdXRfc2VsKGNvbmZpZ19yZWdzLCBjdXIsIG5leHQpOwo+ICsJdmFsdWUgPSBtdGtf
ZGRwX3NvdXRfc2VsKHJlZ19kYXRhLCBjdXIsIG5leHQsICZhZGRyKTsKPiArCWlmICh2YWx1ZSkK
PiArCQl3cml0ZWxfcmVsYXhlZCh2YWx1ZSwgY29uZmlnX3JlZ3MgKyBhZGRyKTsKCkkgdGhpbmsg
dGhlIHJlZ2lzdGVyIGNvdWxkIGJlIHdyaXR0ZW4gaW5zaWRlIG10a19kZHBfc291dF9zZWwoKSwg
d2h5IGRvCnlvdSBtb3ZlIG91dCBvZiB0aGF0IGZ1bmN0aW9uPwoKUmVnYXJkcywKQ0sKCj4gIAo+
IC0JdmFsdWUgPSBtdGtfZGRwX3NlbF9pbihjdXIsIG5leHQsICZhZGRyKTsKPiArCXZhbHVlID0g
bXRrX2RkcF9zZWxfaW4ocmVnX2RhdGEsIGN1ciwgbmV4dCwgJmFkZHIpOwo+ICAJaWYgKHZhbHVl
KSB7Cj4gIAkJcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpIHwgdmFsdWU7
Cj4gIAkJd3JpdGVsX3JlbGF4ZWQocmVnLCBjb25maWdfcmVncyArIGFkZHIpOwo+IEBAIC00MjAs
MTggKzQ1NSwxOSBAQCB2b2lkIG10a19kZHBfYWRkX2NvbXBfdG9fcGF0aCh2b2lkIF9faW9tZW0g
KmNvbmZpZ19yZWdzLAo+ICB9Cj4gIAo+ICAKPiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
