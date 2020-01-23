Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D00A146D38
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 16:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047856FD94;
	Thu, 23 Jan 2020 15:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA236FD93;
 Thu, 23 Jan 2020 15:45:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 07:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="259899084"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 23 Jan 2020 07:45:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Jan 2020 17:45:49 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Give aux channels a better name
Date: Thu, 23 Jan 2020 17:45:42 +0200
Message-Id: <20200123154542.12271-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123154542.12271-1-ville.syrjala@linux.intel.com>
References: <20200123154542.12271-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBhdXggY2ggaXMgdXNlZCBmb3IgbW9yZSB0aGFuIEREQywgc28gbGV0J3MgZ2l2ZSBpdCBhIGJl
dHRlcgpuYW1lLiBGb3IgbWF4aW11bSBlYXNlIGxldCdzIGluY2x1ZGUgYm90aCB0aGUgQVVYIGNo
IGlkZW50aWZpZXIKYW5kIHRoZSBwb3J0IGlkZW50aWZpZXIgKGZvciBjYXNlcyB3aGVyZSB0aGUg
VkJUIGhhcyByZWRlZmluZWQKdGhlIHJlbGF0aW9uc2hpcCBvZiB0aGUgdHdvKS4KClNpZ25lZC1v
ZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggOTQxZjBmNmQ1NWMxLi5iNmNlODUxMGYwYWUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKQEAgLTE3NDAsNyArMTc0
MCw4IEBAIGludGVsX2RwX2F1eF9pbml0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApCiAJZHJt
X2RwX2F1eF9pbml0KCZpbnRlbF9kcC0+YXV4KTsKIAogCS8qIEZhaWx1cmUgdG8gYWxsb2NhdGUg
b3VyIHByZWZlcnJlZCBuYW1lIGlzIG5vdCBjcml0aWNhbCAqLwotCWludGVsX2RwLT5hdXgubmFt
ZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiRFBEREMtJWMiLAorCWludGVsX2RwLT5hdXgubmFt
ZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiQVVYICVjL3BvcnQgJWMiLAorCQkJCSAgICAgICBh
dXhfY2hfbmFtZShkaWdfcG9ydC0+YXV4X2NoKSwKIAkJCQkgICAgICAgcG9ydF9uYW1lKGVuY29k
ZXItPnBvcnQpKTsKIAlpbnRlbF9kcC0+YXV4LnRyYW5zZmVyID0gaW50ZWxfZHBfYXV4X3RyYW5z
ZmVyOwogfQotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
