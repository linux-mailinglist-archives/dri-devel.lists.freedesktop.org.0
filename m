Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D73D0C5B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EEE6E958;
	Wed,  9 Oct 2019 10:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1FB06E958
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:14:20 +0000 (UTC)
X-UUID: e161a3e1c4144079ad3aa025114a4f4c-20191009
X-UUID: e161a3e1c4144079ad3aa025114a4f4c-20191009
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2067416950; Wed, 09 Oct 2019 17:24:14 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:24:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:24:10 +0800
Message-ID: <1570613053.7713.5.camel@mtksdaap41>
Subject: Re: [PATCH v5, 20/32] drm/mediatek: add function to background
 color input select for ovl/ovl_2l direct link
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:24:13 +0800
In-Reply-To: <1567090254-15566-21-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-21-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C02F2DEEEE6AABDA208B9E85FEC0B8B04756F0B72EEC649302F73955D5D4DFFE2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgZnVuY3Rpb24gdG8gYmFj
a2dyb3VuZCBjb2xvciBpbnB1dCBzZWxlY3QgZm9yIG92bC9vdmxfMmwgZGlyZWN0IGxpbmsKPiBm
b3Igb3ZsL292bF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLCB3ZSBuZWVkIHNldCBiYWNrZ3JvdW5k
IGNvbG9yCj4gaW5wdXQgc2VsZWN0IGZvciB0aGVzZSBoYXJkd2FyZS4KPiB0aGlzIGlzIHByZXBh
cmF0aW9uIHBhdGNoIGZvciBvdmwvb3ZsXzJsIHVzZWNhc2UKPiAKCkFwcGxpZWQgdG8gbWVkaWF0
ZWstZHJtLW5leHQtNS41IFsxXSwgdGhhbmtzLgoKWzFdCmh0dHBzOi8vZ2l0aHViLmNvbS9ja2h1
LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzL2NvbW1pdHMvbWVkaWF0ZWstZHJtLW5leHQtNS41CgpS
ZWdhcmRzLApDSwoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1
QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDE0
ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gaW5kZXggODVl
MDk2YS4uMjY4ZDQxNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaAo+IEBAIC04NCw2ICs4NCw4IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3Mg
ewo+ICAJCQkgICAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnN0YXRlKTsKPiAgCXZvaWQgKCpn
YW1tYV9zZXQpKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsCj4gIAkJCSAgc3RydWN0IGRybV9j
cnRjX3N0YXRlICpzdGF0ZSk7Cj4gKwl2b2lkICgqYmdjbHJfaW5fb24pKHN0cnVjdCBtdGtfZGRw
X2NvbXAgKmNvbXApOwo+ICsJdm9pZCAoKmJnY2xyX2luX29mZikoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCk7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3QgbXRrX2RkcF9jb21wIHsKPiBAQCAtMTY0LDYg
KzE2NiwxOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbXRrX2RkcF9nYW1tYV9zZXQoc3RydWN0IG10
a19kZHBfY29tcCAqY29tcCwKPiAgCQljb21wLT5mdW5jcy0+Z2FtbWFfc2V0KGNvbXAsIHN0YXRl
KTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9iZ2Nscl9pbl9v
bihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+ICt7Cj4gKwlpZiAoY29tcC0+ZnVuY3MgJiYg
Y29tcC0+ZnVuY3MtPmJnY2xyX2luX29uKQo+ICsJCWNvbXAtPmZ1bmNzLT5iZ2Nscl9pbl9vbihj
b21wKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9iZ2Nscl9p
bl9vZmYoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiArewo+ICsJaWYgKGNvbXAtPmZ1bmNz
ICYmIGNvbXAtPmZ1bmNzLT5iZ2Nscl9pbl9vZmYpCj4gKwkJY29tcC0+ZnVuY3MtPmJnY2xyX2lu
X29mZihjb21wKTsKPiArfQo+ICsKPiAgaW50IG10a19kZHBfY29tcF9nZXRfaWQoc3RydWN0IGRl
dmljZV9ub2RlICpub2RlLAo+ICAJCQllbnVtIG10a19kZHBfY29tcF90eXBlIGNvbXBfdHlwZSk7
Cj4gIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqY29tcF9ub2RlLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
