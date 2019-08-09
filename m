Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668C87897
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 13:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD5D6EDA2;
	Fri,  9 Aug 2019 11:30:30 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEB46EDA2
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 11:30:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 04:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="199369014"
Received: from bvonhage-mobl2.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.35.153])
 by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2019 04:30:28 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@freedesktop.org
Subject: [PATCH v4 0/1] drm/syncobj: add syncobj sideband payload for threaded
 submission
Date: Fri,  9 Aug 2019 14:30:29 +0300
Message-Id: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
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

Tm93IHdpdGggYSBzaW5nbGUgaW9jdGwoKS4KCkNoZWVycywKCkxpb25lbCBMYW5kd2VybGluICgx
KToKICBkcm0vc3luY29iajogYWRkIHNpZGViYW5kIHBheWxvYWQKCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2ludGVybmFsLmggfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jICAgIHwg
IDMgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jICB8IDU1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2RybV9zeW5jb2JqLmggICAgICB8ICA5
ICsrKysrKwogaW5jbHVkZS91YXBpL2RybS9kcm0uaCAgICAgICAgIHwgMTcgKysrKysrKysrKysK
IDUgZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0KMi4y
My4wLnJjMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
