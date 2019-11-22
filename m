Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9C1076CB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 18:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F816E446;
	Fri, 22 Nov 2019 17:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFD66E446;
 Fri, 22 Nov 2019 17:56:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="205534175"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 22 Nov 2019 09:56:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2019 19:56:23 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/rect: Bugfixes and selftests
Date: Fri, 22 Nov 2019 19:56:19 +0200
Message-Id: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk15
IGVhcmxpZXIgZml4ZXMgZm9yIGRybV9yZWN0ICsgZGl2LWJ5LXplcm8gZml4ICsgc29tZQpzZWxm
dGVzdHMgdGhhdCBEYW5pZWwgcmVxdWVzdGVkLgoKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAc3QuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgoKVmlsbGUgU3lyasOkbMOkICg0KToKICBkcm0vcmVjdDogQXZvaWQgZGl2aXNpb24gYnkgemVy
bwogIGRybS9yZWN0OiBLZWVwIHRoZSBzY2FsZWQgY2xpcCBib3VuZGVkCiAgZHJtL3JlY3Q6IEtl
ZXAgdGhlIGNsaXBwZWQgZHN0IHJlY3RhbmdsZSBpbiBwbGFjZQogIGRybS9zZWxmdGVzdHM6IEFk
ZCBkcm1fcmVjdCBzZWxmdGVzdHMKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3JlY3QuYyAgICAgICAg
ICAgICAgICAgICAgfCAgMzYgKy0tCiBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL01ha2VmaWxl
ICAgICAgICAgICAgfCAgIDMgKy0KIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fbW9kZXNldF9z
ZWxmdGVzdHMuaCB8ICAgNCArCiAuLi4vZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tb2Rlc2V0X2Nv
bW1vbi5oICAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9yZWN0
LmMgICAgIHwgMjIwICsrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX3JlY3QuaCAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIDYgZmlsZXMgY2hhbmdlZCwgMjU3IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fcmVjdC5jCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
