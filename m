Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC12297855
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 22:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1556E823;
	Fri, 23 Oct 2020 20:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778186E823;
 Fri, 23 Oct 2020 20:40:01 +0000 (UTC)
IronPort-SDR: /AafczF3owKnhh13c+aG9EnEnAsOSsyY/u9wjOQB/WLXwiweneXHeAOgW2fya4Gu134fqap+n0
 5u8jmtCvWBlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="231920964"
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="231920964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 13:40:00 -0700
IronPort-SDR: xpqGVB7Nlr5ymj9xZcxRPT6JQsOqTlH5910zgpYNMGZQtLziAmg9pkw3ww4orwob0T9RIPXz76
 YrBPA0e1TH7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; d="scan'208";a="360339594"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 23 Oct 2020 13:39:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Oct 2020 23:39:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Don't create the IN_FORMATS blob when the driver does
 not provide .format_mod_supported()
Date: Fri, 23 Oct 2020 23:39:57 +0300
Message-Id: <20201023203957.3255-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
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
ZSBjb2RlIHJlc3BvbnNpYmxlIGZvciBjcmVhdGluZyB0aGUgSU5fRk9STUFUUwpibG9iIGlzIGJy
b2tlbiB3aGVuIHRoZSBkcml2ZXIgZG9lc24ndCBwcm92aWRlIGEKLmZvcm1hdF9tb2Rfc3VwcG9y
dGVkKCkgaG9vay4gSXQganVzdCBjb3BpZXMgaW4KdGhlIGZvcm1hdCBsaXN0LCBidXQgbGVhdmVz
IGFsbCB0aGUgbW9kaWZpZXIgaW5mb3JtYXRpb24KemVyb2VkLiBUaGF0IHdvdWxkIGluZGljYXRl
IChpbiBhIHZlcnkgc2lsbHkgd2F5KSB0aGF0CnRoZXJlIGFyZSBpbiBmYWN0IG5vIHN1cHBvcnRl
ZCBmb3JtYXQrbW9kaWZpZXIgY29tYmluYXRpb25zLgpUaGF0IGlzIHV0dGVyIG5vbnNlbnNlLgoK
TGV0J3MganVzdCBub3QgY3JlYXRlIHRoZSBibG9iIGF0IGFsbCBpbiB0aGF0IGNhc2UuIFRoZQph
bHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBhc3N1bWUgYWxsIGZvcm1hdCttb2QgY29tYm9zIHdpbGwK
d29yayBhbmQgcG9wdWxhdGUgaXQgYWNjb3JkaW5nbHkuIEJ1dCBJJ20gbm90IGNvbnZpbmNlZCB3
ZQpjYW4gbWFrZSB0aGF0IHByb21pc2UgdG8gdXNlcnNwYWNlIGZvciBhbGwgdGhlIGRyaXZlcnMu
CgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDcgKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUu
YwppbmRleCBlNjIzMTk0N2Y5ODcuLjIwMmEyYjY4MDk0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwpAQCAt
MTI0LDEwICsxMjQsNiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQogCiAJbWVtY3B5KGZvcm1h
dHNfcHRyKGJsb2JfZGF0YSksIHBsYW5lLT5mb3JtYXRfdHlwZXMsIGZvcm1hdHNfc2l6ZSk7CiAK
LQkvKiBJZiB3ZSBjYW4ndCBkZXRlcm1pbmUgc3VwcG9ydCwganVzdCBiYWlsICovCi0JaWYgKCFw
bGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKQotCQlnb3RvIGRvbmU7Ci0KIAltb2Qg
PSBtb2RpZmllcnNfcHRyKGJsb2JfZGF0YSk7CiAJZm9yIChpID0gMDsgaSA8IHBsYW5lLT5tb2Rp
Zmllcl9jb3VudDsgaSsrKSB7CiAJCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50
OyBqKyspIHsKQEAgLTE0NSw3ICsxNDEsNiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRf
YmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQogCQlt
b2QrKzsKIAl9CiAKLWRvbmU6CiAJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5i
YXNlLCBjb25maWctPm1vZGlmaWVyc19wcm9wZXJ0eSwKIAkJCQkgICBibG9iLT5iYXNlLmlkKTsK
IApAQCAtMjgxLDcgKzI3Niw3IEBAIGludCBkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCWRybV9vYmplY3Rf
YXR0YWNoX3Byb3BlcnR5KCZwbGFuZS0+YmFzZSwgY29uZmlnLT5wcm9wX3NyY19oLCAwKTsKIAl9
CiAKLQlpZiAoY29uZmlnLT5hbGxvd19mYl9tb2RpZmllcnMpCisJaWYgKGNvbmZpZy0+YWxsb3df
ZmJfbW9kaWZpZXJzICYmIGZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCkKIAkJY3JlYXRlX2lu
X2Zvcm1hdF9ibG9iKGRldiwgcGxhbmUpOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjI2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
