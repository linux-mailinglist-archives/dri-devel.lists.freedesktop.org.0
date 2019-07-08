Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCD61D34
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE34389C69;
	Mon,  8 Jul 2019 10:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A965389C6B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:45:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AjWcg045625;
 Mon, 8 Jul 2019 05:45:32 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AjW66002673
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:45:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:45:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:45:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AjVI8094820;
 Mon, 8 Jul 2019 05:45:31 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/8] drm/omap: cleanup OMAP_BO flags
Date: Mon, 8 Jul 2019 12:45:16 +0200
Message-ID: <20190708104520.24217-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708104520.24217-1-jjhiblot@ti.com>
References: <20190708104520.24217-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562582732;
 bh=9EhmjkByqc9yQn1jXmBokEn/jgfmINUvb+h85iVasbk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sapXGWW9BN6FlpSA4P7a/JGCKHcN487Ue0wGRTg40da/mz6kjqCGC+YJx+J423qbD
 9MY++DOeHi7gOFXwUt4hYHsLbTfWEp7jLvw6nf5b2yrrnkGs9LL2L2BSaJdVlaCSZH
 pCz1kTxX8pKWiDDjhUBu5C9bBKckyi5KbCxm5Zlw=
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
Cc: jsarha@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KClJlb3JkZXIgT01B
UF9CTyBmbGFncyBhbmQgaW1wcm92ZSB0aGUgY29tbWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0v
b21hcF9kcm0uaCB8IDE3ICsrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0v
b21hcF9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vb21hcF9kcm0uaAppbmRleCAxZmNjZmZlZjll
MjcuLmQ4ZWUyZjg0MDY5NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9vbWFwX2RybS5o
CisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vb21hcF9kcm0uaApAQCAtMzgsMTkgKzM4LDIwIEBAIHN0
cnVjdCBkcm1fb21hcF9wYXJhbSB7CiAJX191NjQgdmFsdWU7CQkJLyogaW4gKHNldF9wYXJhbSks
IG91dCAoZ2V0X3BhcmFtKSAqLwogfTsKIAotI2RlZmluZSBPTUFQX0JPX1NDQU5PVVQJCTB4MDAw
MDAwMDEJLyogc2Nhbm91dCBjYXBhYmxlIChwaHlzIGNvbnRpZ3VvdXMpICovCi0jZGVmaW5lIE9N
QVBfQk9fQ0FDSEVfTUFTSwkweDAwMDAwMDA2CS8qIGNhY2hlIHR5cGUgbWFzaywgc2VlIGNhY2hl
IG1vZGVzICovCi0jZGVmaW5lIE9NQVBfQk9fVElMRURfTUFTSwkweDAwMDAwZjAwCS8qIHRpbGVk
IG1hcHBpbmcgbWFzaywgc2VlIHRpbGVkIG1vZGVzICovCisvKiBTY2Fub3V0IGJ1ZmZlciwgY29u
c3VtYWJsZSBieSBEU1MgKi8KKyNkZWZpbmUgT01BUF9CT19TQ0FOT1VUCQkweDAwMDAwMDAxCiAK
LS8qIGNhY2hlIG1vZGVzICovCi0jZGVmaW5lIE9NQVBfQk9fQ0FDSEVECQkweDAwMDAwMDAwCS8q
IGRlZmF1bHQgKi8KLSNkZWZpbmUgT01BUF9CT19XQwkJMHgwMDAwMDAwMgkvKiB3cml0ZS1jb21i
aW5lICovCi0jZGVmaW5lIE9NQVBfQk9fVU5DQUNIRUQJMHgwMDAwMDAwNAkvKiBzdHJvbmdseS1v
cmRlcmVkICh1bmNhY2hlZCkgKi8KKy8qIEJ1ZmZlciBDUFUgY2FjaGluZyBtb2RlOiBjYWNoZWQs
IHdyaXRlLWNvbWJpbmluZyBvciB1bmNhY2hlZC4gKi8KKyNkZWZpbmUgT01BUF9CT19DQUNIRUQJ
CTB4MDAwMDAwMDAKKyNkZWZpbmUgT01BUF9CT19XQwkJMHgwMDAwMDAwMgorI2RlZmluZSBPTUFQ
X0JPX1VOQ0FDSEVECTB4MDAwMDAwMDQKKyNkZWZpbmUgT01BUF9CT19DQUNIRV9NQVNLCTB4MDAw
MDAwMDYKIAotLyogdGlsZWQgbW9kZXMgKi8KKy8qIFVzZSBUSUxFUiBmb3IgdGhlIGJ1ZmZlci4g
VGhlIFRJTEVSIGNvbnRhaW5lciB1bml0IGNhbiBiZSA4LCAxNiBvciAzMiBiaXRzLiAqLwogI2Rl
ZmluZSBPTUFQX0JPX1RJTEVEXzgJCTB4MDAwMDAxMDAKICNkZWZpbmUgT01BUF9CT19USUxFRF8x
NgkweDAwMDAwMjAwCiAjZGVmaW5lIE9NQVBfQk9fVElMRURfMzIJMHgwMDAwMDMwMAorI2RlZmlu
ZSBPTUFQX0JPX1RJTEVEX01BU0sJMHgwMDAwMGYwMAogI2RlZmluZSBPTUFQX0JPX1RJTEVECQko
T01BUF9CT19USUxFRF84IHwgT01BUF9CT19USUxFRF8xNiB8IE9NQVBfQk9fVElMRURfMzIpCiAK
IHVuaW9uIG9tYXBfZ2VtX3NpemUgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
