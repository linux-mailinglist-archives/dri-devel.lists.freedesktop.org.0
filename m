Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2879CC20
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 11:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89B389A57;
	Mon, 26 Aug 2019 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8449289A61
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 09:04:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 02:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; d="scan'208";a="204510229"
Received: from jbroders-mobl1.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.38.38])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2019 02:04:57 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: disallow replacing fences of timeline syncobjs
Date: Mon, 26 Aug 2019 12:04:48 +0300
Message-Id: <20190826090448.12819-4-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826090448.12819-1-lionel.g.landwerlin@intel.com>
References: <20190826090448.12819-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
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
Cc: Christian.Koenig@amd.com, jason@jlekstrand.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVy
LmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKaW5kZXggMDkyNDgz
OThmYTdiLi5mMWFmMzQ5MGY5NmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2V4ZWNidWZmZXIuYwpAQCAtMjQ5NCw2ICsyNDk0LDE0IEBAIGdldF9sZWdhY3lfZmVu
Y2VfYXJyYXkoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIsCiAJCQlnb3RvIGVycjsKIAkJfQog
CisJCWlmICgodXNlcl9mZW5jZS5mbGFncyAmIEk5MTVfRVhFQ19GRU5DRV9TSUdOQUwpICYmCisJ
CSAgICBzeW5jb2JqLT5pc190aW1lbGluZSkgeworCQkJRFJNX0RFQlVHKCJDYW5ub3QgcmVwbGFj
ZSBmZW5jZSBpbiB0aW1lbGluZSBzeW5jb2JqXG4iKTsKKwkJCWRybV9zeW5jb2JqX3B1dChzeW5j
b2JqKTsKKwkJCWVyciA9IC1FSU5WQUw7CisJCQlnb3RvIGVycjsKKwkJfQorCiAJCWlmICh1c2Vy
X2ZlbmNlLmZsYWdzICYgSTkxNV9FWEVDX0ZFTkNFX1dBSVQpIHsKIAkJCWZlbmNlID0gZHJtX3N5
bmNvYmpfZmVuY2VfZ2V0KHN5bmNvYmopOwogCQkJaWYgKCFmZW5jZSkgewotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
