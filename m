Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CDE91AB7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 03:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A096E062;
	Mon, 19 Aug 2019 01:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EA446E062
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 01:30:35 +0000 (UTC)
X-UUID: 5576cacccd1f4e5599be91181be40850-20190819
X-UUID: 5576cacccd1f4e5599be91181be40850-20190819
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
 with ESMTP id 1586978274; Mon, 19 Aug 2019 09:30:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 19 Aug 2019 09:30:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 19 Aug 2019 09:30:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 19 Aug 2019 09:30:31 +0800
Message-ID: <1566178231.7536.1.camel@mtksdaap41>
Subject: Re: [PATCH] gpu: drm: mediatek: mtk_drm_drv.c: Add of_node_put()
 before goto
From: CK Hu <ck.hu@mediatek.com>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Date: Mon, 19 Aug 2019 09:30:31 +0800
In-Reply-To: <20190706133021.3308-1-nishkadg.linux@gmail.com>
References: <20190706133021.3308-1-nishkadg.linux@gmail.com>
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
Cc: airlie@linux.ie, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5pc2hrYToKCk9uIFNhdCwgMjAxOS0wNy0wNiBhdCAxOTowMCArMDUzMCwgTmlzaGthIERh
c2d1cHRhIHdyb3RlOgo+IEVhY2ggaXRlcmF0aW9uIG9mIGZvcl9lYWNoX2NoaWxkX29mX25vZGUg
cHV0cyB0aGUgcHJldmlvdXMKPiBub2RlLCBidXQgaW4gdGhlIGNhc2Ugb2YgYSBnb3RvIGZyb20g
dGhlIG1pZGRsZSBvZiB0aGUgbG9vcCwgdGhlcmUgaXMKPiBubyBwdXQsIHRodXMgY2F1c2luZyBh
IG1lbW9yeSBsZWFrLiBIZW5jZSBhZGQgYW4gb2Zfbm9kZV9wdXQgYmVmb3JlIHRoZQo+IGdvdG8g
aW4gdHdvIHBsYWNlcy4KPiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuCgpBcHBsaWVkIHRv
IG1lZGlhdGVrLWRybS1maXhlcy01LjMgWzFdLCB0aGFua3MuCgpbMV0KaHR0cHM6Ly9naXRodWIu
Y29tL2NraHUtbWVkaWF0ZWsvbGludXguZ2l0LXRhZ3MvdHJlZS9tZWRpYXRlay1kcm0tZml4ZXMt
NS4zCgpSZWdhcmRzLApDSwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5p
c2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Ywo+IGluZGV4IDk1ZmRiZDBmYmNhYy4uMmRmZmJjOGM2ZDczIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBAQCAtNTI0LDEyICs1MjQsMTUgQEAgc3RhdGljIGlu
dCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJCWNvbXAg
PSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmNvbXApLCBHRlBfS0VSTkVMKTsKPiAgCQkJaWYg
KCFjb21wKSB7Cj4gIAkJCQlyZXQgPSAtRU5PTUVNOwo+ICsJCQkJb2Zfbm9kZV9wdXQobm9kZSk7
Cj4gIAkJCQlnb3RvIGVycl9ub2RlOwo+ICAJCQl9Cj4gIAo+ICAJCQlyZXQgPSBtdGtfZGRwX2Nv
bXBfaW5pdChkZXYsIG5vZGUsIGNvbXAsIGNvbXBfaWQsIE5VTEwpOwo+IC0JCQlpZiAocmV0KQo+
ICsJCQlpZiAocmV0KSB7Cj4gKwkJCQlvZl9ub2RlX3B1dChub2RlKTsKPiAgCQkJCWdvdG8gZXJy
X25vZGU7Cj4gKwkJCX0KPiAgCj4gIAkJCXByaXZhdGUtPmRkcF9jb21wW2NvbXBfaWRdID0gY29t
cDsKPiAgCQl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
