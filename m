Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5728A56C1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210F8890BD;
	Mon,  2 Sep 2019 12:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2F890B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:54:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x82Csl9x021199;
 Mon, 2 Sep 2019 07:54:47 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x82CslOj001773
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Sep 2019 07:54:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 2 Sep
 2019 07:54:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 2 Sep 2019 07:54:46 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x82CsYYO126767;
 Mon, 2 Sep 2019 07:54:45 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 6/7] drm/omap: dss: platform_register_drivers() to dss.c and
 remove core.c
Date: Mon, 2 Sep 2019 15:53:58 +0300
Message-ID: <20190902125359.18001-7-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190902125359.18001-1-tomi.valkeinen@ti.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567428887;
 bh=ATKB1xFKvObYPQajP+fTxsf/toAdg3Hail6ZLLBXGBQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TddWFT1NH4NwGUpXHsyai/kBA6yC4ODOq6XagFlXNdM7QWCdnmWGUVXJ9HUrzhfRX
 CGFaOBF/9cBLLRQKzAMT/o+wfDECHeaEYrDrsycvVUi/iTB435RmNQU+Ck/K03y1GE
 v9NxTA6T2fsK0C/adg5qPspl77iViO3PXH2eEBfw=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KClRoZSBjb3JlLmMganVzdCBmb3IgcmVn
aXN0ZXJpbmcgdGhlIGRyaXZlcnMgaXMga2luZCBvZiB1c2VsZXNzLiBMZXQncwpnZXQgcmlkIG9m
IGl0IGFuZCByZWdpc3RlciB0aGUgZHNzIGRyaXZlcnMgaW4gZHNzLmMuCgpTaWduZWQtb2ZmLWJ5
OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rz
cy9NYWtlZmlsZSB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvY29yZS5jICAg
fCA1NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZHNzLmMgICAgfCAzNyArKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9jb3JlLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kc3MvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
TWFrZWZpbGUKaW5kZXggOTA0MTAxYzVlNzlkLi41OTUwYzNmNTJjMmUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvTWFrZWZpbGUKQEAgLTYsNyArNiw3IEBAIG9tYXBkc3MtYmFzZS15IDo9IGJh
c2UubyBkaXNwbGF5Lm8gZHNzLW9mLm8gb3V0cHV0Lm8KIAogb2JqLSQoQ09ORklHX09NQVAyX0RT
UykgKz0gb21hcGRzcy5vCiAjIENvcmUgRFNTIGZpbGVzCi1vbWFwZHNzLXkgOj0gY29yZS5vIGRz
cy5vIGRpc3BjLm8gZGlzcGNfY29lZnMubyBcCitvbWFwZHNzLXkgOj0gZHNzLm8gZGlzcGMubyBk
aXNwY19jb2Vmcy5vIFwKIAlwbGwubyB2aWRlby1wbGwubwogb21hcGRzcy0kKENPTkZJR19PTUFQ
Ml9EU1NfRFBJKSArPSBkcGkubwogb21hcGRzcy0kKENPTkZJR19PTUFQMl9EU1NfVkVOQykgKz0g
dmVuYy5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvY29yZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2NvcmUuYwpkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggNmFjNDk3YjYzNzExLi4wMDAwMDAwMDAwMDAKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL2NvcmUuYworKysgL2Rldi9udWxsCkBAIC0xLDU1ICswLDAgQEAKLS8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKLS8qCi0gKiBDb3B5cmlnaHQgKEMp
IDIwMDkgTm9raWEgQ29ycG9yYXRpb24KLSAqIEF1dGhvcjogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQHRpLmNvbT4KLSAqCi0gKiBTb21lIGNvZGUgYW5kIGlkZWFzIHRha2VuIGZyb20g
ZHJpdmVycy92aWRlby9vbWFwLyBkcml2ZXIKLSAqIGJ5IEltcmUgRGVhay4KLSAqLwotCi0jZGVm
aW5lIERTU19TVUJTWVNfTkFNRSAiQ09SRSIKLQotI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgot
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgotI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgotCi0jaW5jbHVkZSAib21hcGRzcy5oIgotI2luY2x1ZGUgImRzcy5oIgotCi0vKiBJTklU
ICovCi1zdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciAqIGNvbnN0IG9tYXBfZHNzX2RyaXZl
cnNbXSA9IHsKLQkmb21hcF9kc3Nod19kcml2ZXIsCi0JJm9tYXBfZGlzcGNod19kcml2ZXIsCi0j
aWZkZWYgQ09ORklHX09NQVAyX0RTU19EU0kKLQkmb21hcF9kc2lod19kcml2ZXIsCi0jZW5kaWYK
LSNpZmRlZiBDT05GSUdfT01BUDJfRFNTX1ZFTkMKLQkmb21hcF92ZW5jaHdfZHJpdmVyLAotI2Vu
ZGlmCi0jaWZkZWYgQ09ORklHX09NQVA0X0RTU19IRE1JCi0JJm9tYXBkc3NfaGRtaTRod19kcml2
ZXIsCi0jZW5kaWYKLSNpZmRlZiBDT05GSUdfT01BUDVfRFNTX0hETUkKLQkmb21hcGRzc19oZG1p
NWh3X2RyaXZlciwKLSNlbmRpZgotfTsKLQotc3RhdGljIGludCBfX2luaXQgb21hcF9kc3NfaW5p
dCh2b2lkKQotewotCXJldHVybiBwbGF0Zm9ybV9yZWdpc3Rlcl9kcml2ZXJzKG9tYXBfZHNzX2Ry
aXZlcnMsCi0JCQkJCSBBUlJBWV9TSVpFKG9tYXBfZHNzX2RyaXZlcnMpKTsKLX0KLQotc3RhdGlj
IHZvaWQgX19leGl0IG9tYXBfZHNzX2V4aXQodm9pZCkKLXsKLQlwbGF0Zm9ybV91bnJlZ2lzdGVy
X2RyaXZlcnMob21hcF9kc3NfZHJpdmVycywKLQkJCQkgICAgQVJSQVlfU0laRShvbWFwX2Rzc19k
cml2ZXJzKSk7Ci19Ci0KLW1vZHVsZV9pbml0KG9tYXBfZHNzX2luaXQpOwotbW9kdWxlX2V4aXQo
b21hcF9kc3NfZXhpdCk7Ci0KLU1PRFVMRV9BVVRIT1IoIlRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Iik7Ci1NT0RVTEVfREVTQ1JJUFRJT04oIk9NQVAyLzMgRGlzcGxheSBT
dWJzeXN0ZW0iKTsKLU1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKLQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2Rzcy5jCmluZGV4IGUyMjYzMjRhZGI2OS4uNDFkNDk1YTM2MGQ4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vZHNzL2Rzcy5jCkBAIC0xNTk4LDMgKzE1OTgsNDAgQEAgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBvbWFwX2Rzc2h3X2RyaXZlciA9IHsKIAkJLnN1cHByZXNzX2JpbmRfYXR0cnMgPSB0cnVl
LAogCX0sCiB9OworCisvKiBJTklUICovCitzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciAq
IGNvbnN0IG9tYXBfZHNzX2RyaXZlcnNbXSA9IHsKKwkmb21hcF9kc3Nod19kcml2ZXIsCisJJm9t
YXBfZGlzcGNod19kcml2ZXIsCisjaWZkZWYgQ09ORklHX09NQVAyX0RTU19EU0kKKwkmb21hcF9k
c2lod19kcml2ZXIsCisjZW5kaWYKKyNpZmRlZiBDT05GSUdfT01BUDJfRFNTX1ZFTkMKKwkmb21h
cF92ZW5jaHdfZHJpdmVyLAorI2VuZGlmCisjaWZkZWYgQ09ORklHX09NQVA0X0RTU19IRE1JCisJ
Jm9tYXBkc3NfaGRtaTRod19kcml2ZXIsCisjZW5kaWYKKyNpZmRlZiBDT05GSUdfT01BUDVfRFNT
X0hETUkKKwkmb21hcGRzc19oZG1pNWh3X2RyaXZlciwKKyNlbmRpZgorfTsKKworc3RhdGljIGlu
dCBfX2luaXQgb21hcF9kc3NfaW5pdCh2b2lkKQoreworCXJldHVybiBwbGF0Zm9ybV9yZWdpc3Rl
cl9kcml2ZXJzKG9tYXBfZHNzX2RyaXZlcnMsCisJCQkJCSBBUlJBWV9TSVpFKG9tYXBfZHNzX2Ry
aXZlcnMpKTsKK30KKworc3RhdGljIHZvaWQgX19leGl0IG9tYXBfZHNzX2V4aXQodm9pZCkKK3sK
KwlwbGF0Zm9ybV91bnJlZ2lzdGVyX2RyaXZlcnMob21hcF9kc3NfZHJpdmVycywKKwkJCQkgICAg
QVJSQVlfU0laRShvbWFwX2Rzc19kcml2ZXJzKSk7Cit9CisKK21vZHVsZV9pbml0KG9tYXBfZHNz
X2luaXQpOworbW9kdWxlX2V4aXQob21hcF9kc3NfZXhpdCk7CisKK01PRFVMRV9BVVRIT1IoIlRv
bWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Iik7CitNT0RVTEVfREVTQ1JJUFRJ
T04oIk9NQVAyLzMvNC81IERpc3BsYXkgU3Vic3lzdGVtIik7CitNT0RVTEVfTElDRU5TRSgiR1BM
IHYyIik7Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
