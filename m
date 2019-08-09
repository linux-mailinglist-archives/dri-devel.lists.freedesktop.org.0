Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D487B92
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 15:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40E76EE03;
	Fri,  9 Aug 2019 13:43:45 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3566EE03
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 13:43:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 06:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="182912915"
Received: from bvonhage-mobl2.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.35.153])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2019 06:43:43 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@freedesktop.org
Subject: [PATCH v5 0/1] drm/syncobj: add syncobj sideband payload for threaded
 submission
Date: Fri,  9 Aug 2019 16:43:48 +0300
Message-Id: <20190809134349.4102-1-lionel.g.landwerlin@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBidW5jaCBvZiBmaXhlcyA6KQoKTGlvbmVsIExhbmR3ZXJsaW4gKDEpOgogIGRybS9zeW5jb2Jq
OiBhZGQgc2lkZWJhbmQgcGF5bG9hZAoKIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCB8
ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgICAgfCAgMyArKwogZHJpdmVycy9n
cHUvZHJtL2RybV9zeW5jb2JqLmMgIHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQogaW5jbHVkZS9kcm0vZHJtX3N5bmNvYmouaCAgICAgIHwgIDkgKysrKysrCiBpbmNsdWRl
L3VhcGkvZHJtL2RybS5oICAgICAgICAgfCAxNyArKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQs
IDg4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjMuMC5yYzEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
