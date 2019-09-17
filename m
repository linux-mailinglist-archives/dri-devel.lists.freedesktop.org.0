Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA1B4C7B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 13:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFE46EBC7;
	Tue, 17 Sep 2019 11:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB5E6EBC7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:03:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 04:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,516,1559545200"; d="scan'208";a="361820448"
Received: from kscholl-mobl.ger.corp.intel.com (HELO delly.ger.corp.intel.com)
 ([10.252.40.27])
 by orsmga005.jf.intel.com with ESMTP; 17 Sep 2019 04:03:48 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/syncobj: add sideband payload
Date: Tue, 17 Sep 2019 14:03:42 +0300
Message-Id: <20190917110343.32371-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.23.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSnVzdCBleHBsYWluaW5nIHdoYXQgaXMgYmVpbmcgY2hhbmdlZCBoZXJlIGNvbXBh
cmVkIHRvIHY2IDoKCldlIGp1c3Qgbm90aWNlZCB0aGF0IHNvbWUgb2Ygb3VyIENUUyBydW5zIGFy
ZSBmbGFreSBiZWNhdXNlIHdoZW4KaW1wb3J0aW5nIGEgZG1hIGZlbmNlIGludG8gYSBkcm0gc3lu
Y29iaiB3ZSBkbyBub3QgdXBkYXRlIHRoZSBhdG9taWMKYmluYXJ5IHBheWxvYWQuIFRoaXMgbGVh
ZHMgdG8gaXNzdWVzIHdoZW4gdGhlIHVzZXJzcGFjZSBkcml2ZXJzIHRyaWVzCnRvIGFkZCBuZXcg
cG9pbnRzIHRvIHRoZSB0aW1lbGluZSBiZWNhdXNlIHRoZSBhdG9taWMgYmluYXJ5IHBheWxvYWQK
bWF5IHRoZW4gaGF2ZSBhIHZhbHVlIGluZmVyaW9yIHRvIHRoZSBzZXFubyBvZiB0aGUgbmV3IGlu
c3RhbGxlZApmZW5jZS4KCkNoZWVycywKCkxpb25lbCBMYW5kd2VybGluICgxKToKICBkcm0vc3lu
Y29iajogYWRkIHNpZGViYW5kIHBheWxvYWQKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFs
LmggfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jICAgIHwgIDMgKysKIGRyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0KIGluY2x1ZGUvZHJtL2RybV9zeW5jb2JqLmggICAgICB8ICA5ICsrKysrCiBpbmNs
dWRlL3VhcGkvZHJtL2RybS5oICAgICAgICAgfCAxNyArKysrKysrKysKIDUgZmlsZXMgY2hhbmdl
ZCwgOTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tCjIuMjMuMApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
