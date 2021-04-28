Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61F36DE54
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2756E153;
	Wed, 28 Apr 2021 17:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206636E153;
 Wed, 28 Apr 2021 17:32:38 +0000 (UTC)
IronPort-SDR: Cm8omRjS9a+GfjzWQjBcb9jq7tBuPO627Z3yl0LZpKJqcU57l0yio0Lf05Maq7VAk+xnA1lxxi
 y2LcRRJb1yHA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="196361200"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="196361200"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 10:32:38 -0700
IronPort-SDR: EmXh6xiYmiUP1mmuPSRArhdxX2bXu64mdkT7O8S6LS92/qFws5pNhmQDCxJEF3Q7kOs/RDbwHN
 ZP5TAwm/Tt7Q==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="430411281"
Received: from mpawliki-mobl.amr.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.213.23.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 10:32:36 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add relocation exceptions for two other platforms
Date: Wed, 28 Apr 2021 19:30:21 +0200
Message-Id: <20210428173021.38241-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.26.0
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSBlc3RhYmxpc2hlZCBwcmV2aW91c2x5IHdlIHN0b3AgdXNpbmcgcmVsb2NhdGlvbnMg
c3RhcnRpbmcKZnJvbSBnZW4xMiBwbGF0Zm9ybXMgd2l0aCBUaWdlcmxha2UgYXMgYW4gZXhjZXB0
aW9uLiBVbmZvcnR1bmF0ZWx5CndlIG5lZWQgZXh0ZW5kIHRyYW5zaXRpb24gcGVyaW9kIGFuZCBz
dXBwb3J0IHJlbG9jYXRpb25zIGZvciB0d28Kb3RoZXIgaWdmeCBwbGF0Zm9ybXMgLSBSb2NrZXRs
YWtlIGFuZCBBbGRlcmxha2UuCgpBcyBBbGRlcmxha2UgaXMgY29taW5nIGluIHR3byB2YXJpYW50
cyAtIFMgYW5kIFAgYW5kIG9ubHkgUyBsYW5kZWQKdXBzdHJlYW0gYWxyZWFkeSB3ZSB3aWxsIG5l
ZWQgdG8gZXh0ZW5kIHRoZSByZWxvY2F0aW9uIGVuYWJsaW5nCmNvbmRpdGlvbiBvbmUgbW9yZSB0
aW1lIGZvciBQIHZlcnNpb24gaW4gdGhlIGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3
IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogRGF2ZSBB
aXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0Pgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMgfCA5ICsr
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwppbmRl
eCAyOTcxNDM1MTFmOTkuLjZkNjIxODk4Njk4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCkBAIC00OTYsMTEgKzQ5NiwxNCBAQCBlYl92YWxp
ZGF0ZV92bWEoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIsCiAJCXN0cnVjdCBkcm1faTkxNV9n
ZW1fZXhlY19vYmplY3QyICplbnRyeSwKIAkJc3RydWN0IGk5MTVfdm1hICp2bWEpCiB7Ci0JLyog
UmVsb2NhdGlvbnMgYXJlIGRpc2FsbG93ZWQgZm9yIGFsbCBwbGF0Zm9ybXMgYWZ0ZXIgVEdMLUxQ
LiAgVGhpcwotCSAqIGFsc28gY292ZXJzIGFsbCBwbGF0Zm9ybXMgd2l0aCBsb2NhbCBtZW1vcnku
CisJLyoKKwkgKiBSZWxvY2F0aW9ucyBhcmUgZGlzYWxsb3dlZCBzdGFydGluZyBmcm9tIGdlbjEy
IHdpdGggc29tZSBleGNlcHRpb25zCisJICogLSBUR0wvUktML0FETC4KIAkgKi8KIAlpZiAoZW50
cnktPnJlbG9jYXRpb25fY291bnQgJiYKLQkgICAgSU5URUxfR0VOKGViLT5pOTE1KSA+PSAxMiAm
JiAhSVNfVElHRVJMQUtFKGViLT5pOTE1KSkKKwkgICAgSU5URUxfR0VOKGViLT5pOTE1KSA+PSAx
MiAmJiAhKElTX1RJR0VSTEFLRShlYi0+aTkxNSkgfHwKKwkJCQkJICAgSVNfUk9DS0VUTEFLRShl
Yi0+aTkxNSkgfHwKKwkJCQkJICAgSVNfQUxERVJMQUtFX1MoZWItPmk5MTUpKSkKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKIAlpZiAodW5saWtlbHkoZW50cnktPmZsYWdzICYgZWItPmludmFsaWRfZmxh
Z3MpKQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
