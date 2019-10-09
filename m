Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E85D12F2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47FE6E9DE;
	Wed,  9 Oct 2019 15:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA86E9DE;
 Wed,  9 Oct 2019 15:37:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:44 -0700
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; d="scan'208";a="184099200"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/print: cleanup and new drm_device based logging
Date: Wed,  9 Oct 2019 18:37:27 +0300
Message-Id: <cover.1570635293.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHN0YXJ0ZXJzIHNvbWUgZmFpcmx5IGJlbmlnbiBjbGVhbnVwLCBhbmQgYSBwcm9wb3NhbCBm
b3IgbmV3IHN0cnVjdApkcm1fZGV2aWNlIGJhc2VkIGRybSBsb2dnaW5nIG1hY3JvcyBhbmFsb2d1
b3VzIHRvIGNvcmUga2VybmVsIHN0cnVjdApkZXZpY2UgYmFzZWQgbWFjcm9zLgoKQlIsCkphbmku
CgoKSmFuaSBOaWt1bGEgKDgpOgogIGRybS9pOTE1OiB1c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0
byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmllcwogIGRybS9ub3V2ZWF1OiB1c2UgZHJtX2RlYnVn
X2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmllcwogIGRybS9hbWRncHU6IHVz
ZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCiAgZHJt
L3ByaW50OiByZW5hbWUgZHJtX2RlYnVnIHRvIF9fZHJtX2RlYnVnIHRvIGRpc2NvdXJhZ2UgdXNl
CiAgZHJtL3ByaW50OiB1bmRlcnNjb3JlIHByZWZpeCBmdW5jdGlvbnMgdGhhdCBzaG91bGQgYmUg
cHJpdmF0ZSB0byBwcmludAogIGRybS9wcmludDogY29udmVydCBkZWJ1ZyBjYXRlZ29yeSBtYWNy
b3MgaW50byBhbiBlbnVtCiAgZHJtL3ByaW50OiBncm91cCBsb2dnaW5nIGZ1bmN0aW9ucyBieSBw
cmluayBvciBkZXZpY2UgYmFzZWQKICBkcm0vcHJpbnQ6IGludHJvZHVjZSBuZXcgc3RydWN0IGRy
bV9kZXZpY2UgYmFzZWQgbG9nZ2luZyBtYWNyb3MKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zbXVfdjExXzBfaTJjLmMgICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5j
ICAgICAgICAgICAgICAgICAgfCAgMTggKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jIHwgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyAg
ICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmggICAg
ICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmMgICAg
ICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyAgICAgICAg
ICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaCAg
ICAgIHwgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oICAgICAg
ICB8ICAgNCArLQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggICAgICAgICAgICAgICAgICAgICAg
fCAzMDQgKysrKysrKysrKysrLS0tLS0tLQogMTEgZmlsZXMgY2hhbmdlZCwgMjI0IGluc2VydGlv
bnMoKyksIDEyNCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
