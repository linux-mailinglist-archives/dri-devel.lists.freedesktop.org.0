Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0955CE058
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FD16E566;
	Mon,  7 Oct 2019 11:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDC86E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:26:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ52u122307;
 Mon, 7 Oct 2019 06:26:05 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ5Uc038045;
 Mon, 7 Oct 2019 06:26:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 06:26:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 06:26:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ4dZ024278;
 Mon, 7 Oct 2019 06:26:05 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 4/8] drm/omap: cleanup OMAP_BO flags
Date: Mon, 7 Oct 2019 13:25:51 +0200
Message-ID: <20191007112555.25278-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007112555.25278-1-jjhiblot@ti.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570447565;
 bh=9EhmjkByqc9yQn1jXmBokEn/jgfmINUvb+h85iVasbk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=kTIpXq753ykex2fjw13qmla/WUJSFp0Rb8eQeOfUrJgYoS3JoySfsoXKcgO3ySB/F
 BuOiGR3aB9Q+vcqom47Bw4uBFUGIh4qYv0/SKRBkxaKCV/twrXhRdv9DLoM6W6qAaG
 Ux5BjyB12Ho2FsRhbK8kmOdkxzy5LSPsKPHjcHGk=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
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
