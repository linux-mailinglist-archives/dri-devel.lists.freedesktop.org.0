Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D22C6550
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA156ECD4;
	Fri, 27 Nov 2020 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CED6ED08;
 Fri, 27 Nov 2020 12:11:35 +0000 (UTC)
IronPort-SDR: jvYwlDGoot0dcI2ETcLJuwdB1R9PtdsPFH5kp5r3oHlZO7R8H6Mniyk2dcGqL6sA16lr+iGJwT
 HY+VuWp9DcvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092911"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092911"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:35 -0800
IronPort-SDR: 2rr6c5fqKorJNaJUgroGQYjUzZltQ7hTxp5UdJOc5QRc0K9qX2kyqznhayM9ajtDSrX++QoE/L
 ORZcY5+CC0Eg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029821"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:33 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 126/162] drm/i915/gem: Update shmem available memory
Date: Fri, 27 Nov 2020 12:06:42 +0000
Message-Id: <20201127120718.454037-127-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQm9tbXUgS3Jpc2huYWlhaCA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+CgpVcGRh
dGUgc2htZW0gYXZhaWxhYmxlIG1lbW9yeSBpbiDigJxpbnRlbF9tZW1vcnlfcmVnaW9u4oCdCgpT
aWduZWQtb2ZmLWJ5OiBCb21tdSBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNv
bT4KQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwu
Y29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+CkNjOiBDUSBUYW5nIDxjcS50YW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9zaG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3NobWVt
LmMKaW5kZXggYjRkZDdhNzA5ODAwLi5mNGJhYzcyYjNjY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jCkBAIC0zMCw2ICszMCw3IEBAIHN0YXRpYyBpbnQgc2ht
ZW1fZ2V0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopCiAJc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KG9iai0+YmFzZS5kZXYpOwogCXN0cnVjdCBp
bnRlbF9tZW1vcnlfcmVnaW9uICptZW0gPSBvYmotPm1tLnJlZ2lvbjsKIAljb25zdCB1bnNpZ25l
ZCBsb25nIHBhZ2VfY291bnQgPSBvYmotPmJhc2Uuc2l6ZSAvIFBBR0VfU0laRTsKKwlyZXNvdXJj
ZV9zaXplX3Qgc2l6ZSA9IG9iai0+YmFzZS5zaXplOwogCXVuc2lnbmVkIGxvbmcgaTsKIAlzdHJ1
Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZzsKIAlzdHJ1Y3Qgc2dfdGFibGUgKnN0OwpAQCAtMTg0
LDYgKzE4NSw4IEBAIHN0YXRpYyBpbnQgc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9n
ZW1fb2JqZWN0ICpvYmopCiAKIAlfX2k5MTVfZ2VtX29iamVjdF9zZXRfcGFnZXMob2JqLCBzdCwg
c2dfcGFnZV9zaXplcyk7CiAKKwltZW0tPmF2YWlsIC09IHNpemU7CisKIAlyZXR1cm4gMDsKIAog
ZXJyX3NnOgpAQCAtMjk4LDYgKzMwMSw4IEBAIF9faTkxNV9nZW1fb2JqZWN0X3JlbGVhc2Vfc2ht
ZW0oc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKIAogdm9pZCBpOTE1X2dlbV9vYmpl
Y3RfcHV0X3BhZ2VzX3NobWVtKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCBzZ190YWJsZSAqcGFnZXMpCiB7CisJc3RydWN0IGludGVsX21lbW9yeV9yZWdpb24gKm1lbSA9
IG9iai0+bW0ucmVnaW9uOworCXJlc291cmNlX3NpemVfdCBzaXplID0gb2JqLT5iYXNlLnNpemU7
CiAJc3RydWN0IHNndF9pdGVyIHNndF9pdGVyOwogCXN0cnVjdCBwYWdldmVjIHB2ZWM7CiAJc3Ry
dWN0IHBhZ2UgKnBhZ2U7CkBAIC0zMjYsNiArMzMxLDggQEAgdm9pZCBpOTE1X2dlbV9vYmplY3Rf
cHV0X3BhZ2VzX3NobWVtKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBz
Z18KIAkJY2hlY2tfcmVsZWFzZV9wYWdldmVjKCZwdmVjKTsKIAlvYmotPm1tLmRpcnR5ID0gZmFs
c2U7CiAKKwltZW0tPmF2YWlsICs9IHNpemU7CisKIAlzZ19mcmVlX3RhYmxlKHBhZ2VzKTsKIAlr
ZnJlZShwYWdlcyk7CiB9Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
