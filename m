Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC785DCA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D51389AB9;
	Thu,  8 Aug 2019 09:04:36 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0DB89AB9
 for <dri-devel@freedesktop.org>; Thu,  8 Aug 2019 09:04:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 02:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="203503761"
Received: from namburis-mobl.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.249.34.123])
 by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2019 02:04:34 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@freedesktop.org
Subject: [PATCH v2 0/1] drm/syncobj: add syncobj sideband payload for threaded
 submission
Date: Thu,  8 Aug 2019 12:04:21 +0300
Message-Id: <20190808090422.8102-1-lionel.g.landwerlin@intel.com>
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

SGkgYWxsLAoKSnVzdCBhIHNpbmdsZSBwYXRjaCB0aGlzIHRpbWUgd2l0aCBhIG5ldyBpb2N0bC4K
CkNoZWVycywKCkxpb25lbCBMYW5kd2VybGluICgxKToKICBkcm0vc3luY29iajogYWRkIHNpZGVi
YW5kIHBheWxvYWQKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmggfCAgMiArKwogZHJp
dmVycy9ncHUvZHJtL2RybV9pb2N0bC5jICAgIHwgIDMgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
c3luY29iai5jICB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIGluY2x1
ZGUvZHJtL2RybV9zeW5jb2JqLmggICAgICB8ICA5ICsrKysrCiBpbmNsdWRlL3VhcGkvZHJtL2Ry
bS5oICAgICAgICAgfCAgNSArKy0KIDUgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCi0tCjIuMjMuMC5yYzEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
