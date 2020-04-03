Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A577C19DFA1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6305D6EC8F;
	Fri,  3 Apr 2020 20:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02B6EC93;
 Fri,  3 Apr 2020 20:40:55 +0000 (UTC)
IronPort-SDR: PGFAMT4rDYldLMfc4O8YoudPLV/LLonOO+h+h4eerK3XD0FX0UeJ648Pj1dkMFLSGcxfkcOHqY
 4JYULVd3Lujg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:40:55 -0700
IronPort-SDR: CFvkFacv0gkfzTfdksdlJmSJqlSy0fG8p3Zg+JLZqrZYTBFi7bESoiEaFDWkq4JnrUK/PS5WZ3
 DVGs9TZomKXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="238994312"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 03 Apr 2020 13:40:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:52 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/17] drm: Shrink mode->private_flags
Date: Fri,  3 Apr 2020 23:40:01 +0300
Message-Id: <20200403204008.14864-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmdt
YTUwMCBuZWVkcyA0IGJpdHMgKHRvIHN0b3JlIGEgcGl4ZWwgbXVsdGlwbGllcikgaW4gdGhlCm1v
ZGUtPnByaXZhdGVfZmxhZ3MsIGk5MTUgY3VycmVudGx5IGhhcyB0aHJlZSBiaXRzIGRlZmluZWQu
Ck5vIG9uZSBlbHNlIHVzZXMgdGhpcy4gUmVkdWNlIHRoZSBzaXplIHRvIHU4LgoKUmV2aWV3ZWQt
Ynk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
aW5jbHVkZS9kcm0vZHJtX21vZGVzLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMu
aCBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCmluZGV4IDkxNzUyN2ViODA2Ny4uOTVjMjNmODZh
ZTBjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fbW9kZXMuaApAQCAtMzc4LDcgKzM3OCw3IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
IHsKIAkgKiBieSBhdG9taWMgZHJpdmVycyBzaW5jZSB0aGV5IGNhbiBzdG9yZSBhbnkgYWRkaXRp
b25hbCBkYXRhIGJ5CiAJICogc3ViY2xhc3Npbmcgc3RhdGUgc3RydWN0dXJlcy4KIAkgKi8KLQlp
bnQgcHJpdmF0ZV9mbGFnczsKKwl1OCBwcml2YXRlX2ZsYWdzOwogCiAJLyoqCiAJICogQHBpY3R1
cmVfYXNwZWN0X3JhdGlvOgotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
