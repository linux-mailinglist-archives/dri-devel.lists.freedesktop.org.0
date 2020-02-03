Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AA15095D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082786EC2F;
	Mon,  3 Feb 2020 15:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4D6EC2F;
 Mon,  3 Feb 2020 15:14:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="224322126"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 03 Feb 2020 07:14:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:14:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/26] drm/dp: Define more downstream facing port caps
Date: Mon,  3 Feb 2020 17:13:25 +0200
Message-Id: <20200203151343.14378-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk91
ciBkZWZpbml0aW9ucyBmb3IgdGhlIERQQ0QgREZQIGNhcGFiaWxpdGllcyBhcmUgbGFja2luZy4K
QWRkIHRoZSBtaXNzaW5nIGJpdHMuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaCB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNs
dWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggZmFmMDVjZGE1MDQzLi4yZmZhNDdmODc1ZmEg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZHBfaGVscGVyLmgKQEAgLTM4NSwxMiArMzg1LDE4IEBACiAjIGRlZmluZSBEUF9EU19Q
T1JUX1RZUEVfV0lSRUxFU1MgICAgICAgICAgIDYKICMgZGVmaW5lIERQX0RTX1BPUlRfSFBECQkJ
ICAgICgxIDw8IDMpCiAvKiBvZmZzZXQgMSBmb3IgVkdBIGlzIG1heGltdW0gbWVnYXBpeGVscyBw
ZXIgc2Vjb25kIC8gOCAqLwotLyogb2Zmc2V0IDIgKi8KKy8qIG9mZnNldCAxIGZvciBEVkkvSERN
SSBpcyBtYXhpbXVtIFRNRFMgY2xvY2sgaW4gTWJwcyAvIDIuNSAqLworLyogb2Zmc2V0IDIgZm9y
IFZHQS9EVkkvSERNSSAqLwogIyBkZWZpbmUgRFBfRFNfTUFYX0JQQ19NQVNLCSAgICAgICAgICAg
ICgzIDw8IDApCiAjIGRlZmluZSBEUF9EU184QlBDCQkgICAgICAgICAgICAwCiAjIGRlZmluZSBE
UF9EU18xMEJQQwkJICAgICAgICAgICAgMQogIyBkZWZpbmUgRFBfRFNfMTJCUEMJCSAgICAgICAg
ICAgIDIKICMgZGVmaW5lIERQX0RTXzE2QlBDCQkgICAgICAgICAgICAzCisvKiBvZmZzZXQgMyBm
b3IgRFZJICovCisjIGRlZmluZSBEUF9EU19EVklfRFVBTF9MSU5LCQkgICAgKDEgPDwgMSkKKyMg
ZGVmaW5lIERQX0RTX0RWSV9ISUdIX0NPTE9SX0RFUFRICSAgICAoMSA8PCAyKQorLyogb2Zmc2V0
IDMgZm9yIEhETUkgKi8KKyMgZGVmaW5lIERQX0RTX0hETUlfRlJBTUVfU0VRX1RPX0ZSQU1FX1BB
Q0sgKDEgPDwgMCkKIAogI2RlZmluZSBEUF9NQVhfRE9XTlNUUkVBTV9QT1JUUwkJICAgIDB4MTAK
IAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
