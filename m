Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A673C1401A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 02:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AEB6F377;
	Fri, 17 Jan 2020 01:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A156EF44;
 Fri, 17 Jan 2020 01:58:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 17:58:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; d="scan'208";a="226191901"
Received: from josouza-mobl.jf.intel.com (HELO josouza-MOBL.intel.com)
 ([10.24.12.138])
 by orsmga003.jf.intel.com with ESMTP; 16 Jan 2020 17:58:42 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/mst: Some style improvements in
 drm_dp_mst_topology_mgr_set_mst()
Date: Thu, 16 Jan 2020 17:58:35 -0800
Message-Id: <20200117015837.402239-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117015837.402239-1-jose.souza@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZpbmcgdGhpcyBsb3NlIGNvZGUgYmxvY2sgYW5kIHJlbW92aW5nIHVubmVjZXNzYXJ5IGJy
YWNrZXQuCgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDE0ICsrKysrKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDM4YmYxMTFlNWY5Yi4uZTNhMjIzNjJhYWYyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTM0OTEsNiArMzQ5MSw4IEBA
IGludCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdCBkcm1fZHBfbXN0X3Rv
cG9sb2d5X21nciAqbWdyLCBib29sIG1zCiAJbWdyLT5tc3Rfc3RhdGUgPSBtc3Rfc3RhdGU7CiAJ
Lyogc2V0IHRoZSBkZXZpY2UgaW50byBNU1QgbW9kZSAqLwogCWlmIChtc3Rfc3RhdGUpIHsKKwkJ
c3RydWN0IGRybV9kcF9wYXlsb2FkIHJlc2V0X3BheTsKKwogCQlXQVJOX09OKG1nci0+bXN0X3By
aW1hcnkpOwogCiAJCS8qIGdldCBkcGNkIGluZm8gKi8KQEAgLTM1MjEsMTYgKzM1MjMsMTIgQEAg
aW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3Qoc3RydWN0IGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyICptZ3IsIGJvb2wgbXMKIAogCQlyZXQgPSBkcm1fZHBfZHBjZF93cml0ZWIobWdy
LT5hdXgsIERQX01TVE1fQ1RSTCwKIAkJCQkJCQkgRFBfTVNUX0VOIHwgRFBfVVBfUkVRX0VOIHwg
RFBfVVBTVFJFQU1fSVNfU1JDKTsKLQkJaWYgKHJldCA8IDApIHsKKwkJaWYgKHJldCA8IDApCiAJ
CQlnb3RvIG91dF91bmxvY2s7Ci0JCX0KIAotCQl7Ci0JCQlzdHJ1Y3QgZHJtX2RwX3BheWxvYWQg
cmVzZXRfcGF5OwotCQkJcmVzZXRfcGF5LnN0YXJ0X3Nsb3QgPSAwOwotCQkJcmVzZXRfcGF5Lm51
bV9zbG90cyA9IDB4M2Y7Ci0JCQlkcm1fZHBfZHBjZF93cml0ZV9wYXlsb2FkKG1nciwgMCwgJnJl
c2V0X3BheSk7Ci0JCX0KKwkJcmVzZXRfcGF5LnN0YXJ0X3Nsb3QgPSAwOworCQlyZXNldF9wYXku
bnVtX3Nsb3RzID0gMHgzZjsKKwkJZHJtX2RwX2RwY2Rfd3JpdGVfcGF5bG9hZChtZ3IsIDAsICZy
ZXNldF9wYXkpOwogCiAJCXF1ZXVlX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZtZ3ItPndvcmspOwog
Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
