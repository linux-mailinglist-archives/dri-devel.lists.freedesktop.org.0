Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C293D267B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768E16EAE0;
	Thu, 10 Oct 2019 09:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E44B6EAE0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:35:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9ZCc2013392;
 Thu, 10 Oct 2019 04:35:12 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A9ZC7g087952
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 04:35:12 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:35:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:35:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9ZBFi101065;
 Thu, 10 Oct 2019 04:35:11 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 4/8] drm/omap: cleanup OMAP_BO flags
Date: Thu, 10 Oct 2019 11:34:41 +0200
Message-ID: <20191010093445.11069-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010093445.11069-1-jjhiblot@ti.com>
References: <20191010093445.11069-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570700112;
 bh=x6CFEyQ5hZGLdJM9om0YP8uZogPODV92P5gME8H8Uq0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hk5quowyQckEgENsR2j6e96a+wewuU+AK5BYPTxtHCx2+NfjRBI3NC3sY/4SfE01j
 h+g76BS1abI7kVm3Updq2nW/pp2QCed0tWwl63W+mMV6UYU/zn3mJ+tfMgW7y5DNxR
 F9Tc+YrhnZ0ojE/hlA3qXQgEyZ/6ZizaPjmexlh4=
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
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpSZXZpZXdlZC1ieTogSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0vb21hcF9k
cm0uaCB8IDE3ICsrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vb21hcF9k
cm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vb21hcF9kcm0uaAppbmRleCAxZmNjZmZlZjllMjcuLmQ4
ZWUyZjg0MDY5NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9vbWFwX2RybS5oCisrKyBi
L2luY2x1ZGUvdWFwaS9kcm0vb21hcF9kcm0uaApAQCAtMzgsMTkgKzM4LDIwIEBAIHN0cnVjdCBk
cm1fb21hcF9wYXJhbSB7CiAJX191NjQgdmFsdWU7CQkJLyogaW4gKHNldF9wYXJhbSksIG91dCAo
Z2V0X3BhcmFtKSAqLwogfTsKIAotI2RlZmluZSBPTUFQX0JPX1NDQU5PVVQJCTB4MDAwMDAwMDEJ
Lyogc2Nhbm91dCBjYXBhYmxlIChwaHlzIGNvbnRpZ3VvdXMpICovCi0jZGVmaW5lIE9NQVBfQk9f
Q0FDSEVfTUFTSwkweDAwMDAwMDA2CS8qIGNhY2hlIHR5cGUgbWFzaywgc2VlIGNhY2hlIG1vZGVz
ICovCi0jZGVmaW5lIE9NQVBfQk9fVElMRURfTUFTSwkweDAwMDAwZjAwCS8qIHRpbGVkIG1hcHBp
bmcgbWFzaywgc2VlIHRpbGVkIG1vZGVzICovCisvKiBTY2Fub3V0IGJ1ZmZlciwgY29uc3VtYWJs
ZSBieSBEU1MgKi8KKyNkZWZpbmUgT01BUF9CT19TQ0FOT1VUCQkweDAwMDAwMDAxCiAKLS8qIGNh
Y2hlIG1vZGVzICovCi0jZGVmaW5lIE9NQVBfQk9fQ0FDSEVECQkweDAwMDAwMDAwCS8qIGRlZmF1
bHQgKi8KLSNkZWZpbmUgT01BUF9CT19XQwkJMHgwMDAwMDAwMgkvKiB3cml0ZS1jb21iaW5lICov
Ci0jZGVmaW5lIE9NQVBfQk9fVU5DQUNIRUQJMHgwMDAwMDAwNAkvKiBzdHJvbmdseS1vcmRlcmVk
ICh1bmNhY2hlZCkgKi8KKy8qIEJ1ZmZlciBDUFUgY2FjaGluZyBtb2RlOiBjYWNoZWQsIHdyaXRl
LWNvbWJpbmluZyBvciB1bmNhY2hlZC4gKi8KKyNkZWZpbmUgT01BUF9CT19DQUNIRUQJCTB4MDAw
MDAwMDAKKyNkZWZpbmUgT01BUF9CT19XQwkJMHgwMDAwMDAwMgorI2RlZmluZSBPTUFQX0JPX1VO
Q0FDSEVECTB4MDAwMDAwMDQKKyNkZWZpbmUgT01BUF9CT19DQUNIRV9NQVNLCTB4MDAwMDAwMDYK
IAotLyogdGlsZWQgbW9kZXMgKi8KKy8qIFVzZSBUSUxFUiBmb3IgdGhlIGJ1ZmZlci4gVGhlIFRJ
TEVSIGNvbnRhaW5lciB1bml0IGNhbiBiZSA4LCAxNiBvciAzMiBiaXRzLiAqLwogI2RlZmluZSBP
TUFQX0JPX1RJTEVEXzgJCTB4MDAwMDAxMDAKICNkZWZpbmUgT01BUF9CT19USUxFRF8xNgkweDAw
MDAwMjAwCiAjZGVmaW5lIE9NQVBfQk9fVElMRURfMzIJMHgwMDAwMDMwMAorI2RlZmluZSBPTUFQ
X0JPX1RJTEVEX01BU0sJMHgwMDAwMGYwMAogI2RlZmluZSBPTUFQX0JPX1RJTEVECQkoT01BUF9C
T19USUxFRF84IHwgT01BUF9CT19USUxFRF8xNiB8IE9NQVBfQk9fVElMRURfMzIpCiAKIHVuaW9u
IG9tYXBfZ2VtX3NpemUgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
