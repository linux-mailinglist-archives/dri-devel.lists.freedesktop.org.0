Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E807964684
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C936E0C4;
	Wed, 10 Jul 2019 12:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9CF6E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:51:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="166062382"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 10 Jul 2019 05:51:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 15:51:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm: Include prototype for drm_need_swiotlb()
Date: Wed, 10 Jul 2019 15:51:41 +0300
Message-Id: <20190710125143.9965-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNw
YXJzZSBpcyBub3QgaGFwcHk6Ci4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmM6MTU5OjY6
IHdhcm5pbmc6IHN5bWJvbCAnZHJtX25lZWRfc3dpb3RsYicgd2FzIG5vdCBkZWNsYXJlZC4gU2hv
dWxkIGl0IGJlIHN0YXRpYz8KCkluY2x1ZGUgdGhlIGNvcnJlY3QgaGVhZGVyIGZvciBkcm1fbmVl
ZF9zd2lvdGxiKCkgcHJvdG90eXBlLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21l
bW9yeS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1v
cnkuYwppbmRleCBiNjM0ZTE2NzAxOTAuLjQ3NzkzN2JiOTAyZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tZW1vcnkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5j
CkBAIC00MCw2ICs0MCw3IEBACiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogCiAjaW5jbHVkZSA8ZHJt
L2RybV9hZ3BzdXBwb3J0Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9jYWNoZS5oPgogI2luY2x1ZGUg
PGRybS9kcm1fZGV2aWNlLmg+CiAKICNpbmNsdWRlICJkcm1fbGVnYWN5LmgiCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
