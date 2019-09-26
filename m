Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48D9BEDD9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB16EE89;
	Thu, 26 Sep 2019 08:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9470C6EE89
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:52:04 +0000 (UTC)
X-UUID: a22f5eac59524dd9923fc8fb005c475a-20190926
X-UUID: a22f5eac59524dd9923fc8fb005c475a-20190926
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 109915688; Thu, 26 Sep 2019 16:52:01 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Sep 2019 16:51:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Sep 2019 16:51:59 +0800
Message-ID: <1569487920.9612.3.camel@mtksdaap41>
Subject: Re: [PATCH v7 9/9] drm/mediatek: add dphy reset after setting lanes
 number
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Thu, 26 Sep 2019 16:52:00 +0800
In-Reply-To: <20190919065806.111016-10-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-10-jitao.shi@mediatek.com>
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gVGh1LCAyMDE5LTA5LTE5IGF0IDE0OjU4ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gQWRkIGRwaHkgcmVzZXQgYWZ0ZXIgc2V0dGluZyBsYW5lcyBudW1iZXIgdG8gYXZv
aWQgZHBoeSBmaWZvIGVmZm9yLgoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDkgKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiBpbmRleCBiMDIzNzNiMDQ4NDguLjhjMjYyMGVhMThkMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0zNyw2ICszNyw3IEBACj4gICNkZWZp
bmUgRFNJX0NPTl9DVFJMCQkweDEwCj4gICNkZWZpbmUgRFNJX1JFU0VUCQkJQklUKDApCj4gICNk
ZWZpbmUgRFNJX0VOCQkJCUJJVCgxKQo+ICsjZGVmaW5lIERQSFlfUkVTRVQJCQlCSVQoMikKPiAg
Cj4gICNkZWZpbmUgRFNJX01PREVfQ1RSTAkJMHgxNAo+ICAjZGVmaW5lIE1PREUJCQkJKDMpCj4g
QEAgLTI4MCw2ICsyODEsMTIgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9yZXNldF9lbmdpbmUoc3Ry
dWN0IG10a19kc2kgKmRzaSkKPiAgCW10a19kc2lfbWFzayhkc2ksIERTSV9DT05fQ1RSTCwgRFNJ
X1JFU0VULCAwKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbXRrX2RzaV9yZXNldF9kcGh5KHN0
cnVjdCBtdGtfZHNpICpkc2kpCj4gK3sKPiArCW10a19kc2lfbWFzayhkc2ksIERTSV9DT05fQ1RS
TCwgRFBIWV9SRVNFVCwgRFBIWV9SRVNFVCk7Cj4gKwltdGtfZHNpX21hc2soZHNpLCBEU0lfQ09O
X0NUUkwsIERQSFlfUkVTRVQsIDApOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBtdGtfZHNpX2Ns
a191bHBfbW9kZV9lbnRlcihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICB7Cj4gIAltdGtfZHNpX21h
c2soZHNpLCBEU0lfUEhZX0xDQ09OLCBMQ19IU19UWF9FTiwgMCk7Cj4gQEAgLTY1MCw2ICs2NTcs
OCBAQCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAJ
bXRrX2RzaV9waHlfdGltY29uZmlnKGRzaSk7Cj4gIAo+ICAJbXRrX2RzaV9yeHR4X2NvbnRyb2wo
ZHNpKTsKPiArCXVzbGVlcF9yYW5nZSgzMCwgMTAwKTsKPiArCW10a19kc2lfcmVzZXRfZHBoeShk
c2kpOwo+ICAJbXRrX2RzaV9wc19jb250cm9sX3ZhY3QoZHNpKTsKPiAgCW10a19kc2lfc2V0X3Zt
X2NtZChkc2kpOwo+ICAJbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhkc2kpOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
