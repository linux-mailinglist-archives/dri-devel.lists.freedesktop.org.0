Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F93F84D8B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765389CE3;
	Wed,  7 Aug 2019 13:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4279689CE3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 13:38:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 06:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="176196862"
Received: from unknown (HELO delly.ger.corp.intel.com) ([10.252.52.138])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2019 06:37:49 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/syncobj: add syncobj sideband payload for threaded
 submission
Date: Wed,  7 Aug 2019 16:37:43 +0300
Message-Id: <20190807133745.4110-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: zhoucm1@amd.com, Christian.Koenig@amd.com, jason@jlekstrand.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGUgZ29hbCBvZiB0aGlzIGZlYXR1cmUgaXMgdG8gc29sdmUgYW4gaXNzdWUgdGhhdCB3
YXMgc2VlbiBpbiBvdXIKdGVzdGluZy4gQWZ0ZXIgZGlzY3Vzc2luZyBvbiBbMV0gSSB0aG91Z2h0
IHdlIGNvdWxkIHNvbHZlIHRoaXMgcHJvYmxlbQp3aXRoIHN0YWxsaW5nIHRoZSBhcHBsaWNhdGlv
biB0aHJlYWQgYWZ0ZXIgZWFjaCB2a1F1ZXVlU3VibWl0KCkgY2FsbAp3aGVyZSBhIGJpbmFyeSBz
ZW1hcGhvcmUgaXMgc2lnbmFsZWQgYnV0IEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QKb3B0aW9u
IGJlY2F1c2Ugb2YgcGVyZm9ybWFuY2UgaW1wYWN0cyBvbiB0aGUgYXBwbGljYXRpb24uCgpVbmZv
cnR1bmF0ZWx5IHRoZXJlIGlzbid0IGEgZ29vZCB3YXkgdG8gcmVwcm9kdWNlIHRoaXMgcHJvYmxl
bSAxMDAlCmJlY2F1c2UgaXQgZXNzZW50aWFsbHkgZXhwb3NlcyBhIHJhY2UgYmV0d2VlbiB0aGUg
YXBwbGljYXRpb24gdGhyZWFkCmFuZCB0aGUgc3VibWlzc2lvbiB0aHJlYWQuCgpJJ3ZlIHVwbG9h
ZGVkIHRlc3RzIGluIHRoZSBLaHJvbm9zIHJlcG9zaXRvcnkgdG8gdHJ5IHRvIGV4cG9zZSB0aGUK
aXNzdWUuCgpUaGFua3MsCgpbMV0gOiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNo
aXZlcy9kcmktZGV2ZWwvMjAxOS1BdWd1c3QvMjI5MTg4Lmh0bWwKCkxpb25lbCBMYW5kd2VybGlu
ICgyKToKICBkcm0vc3luY29iajogYWRkIHNpZGViYW5kIHBheWxvYWQKICBkcm0vc3luY29iajog
YWRkIHN1Ym1pdCBwb2ludCBxdWVyeSBjYXBhYmlsaXR5CgogZHJpdmVycy9ncHUvZHJtL2RybV9z
eW5jb2JqLmMgfCAxMzIgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogaW5jbHVk
ZS9kcm0vZHJtX3N5bmNvYmouaCAgICAgfCAgIDkgKysrCiBpbmNsdWRlL3VhcGkvZHJtL2RybS5o
ICAgICAgICB8ICAgNSArLQogMyBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwgNDYg
ZGVsZXRpb25zKC0pCgotLQoyLjIzLjAucmMxCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
