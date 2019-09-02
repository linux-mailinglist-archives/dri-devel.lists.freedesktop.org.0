Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C1A5782
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3F889B11;
	Mon,  2 Sep 2019 13:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46F489B05;
 Mon,  2 Sep 2019 13:15:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 06:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="189556376"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 02 Sep 2019 06:15:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2019 16:15:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/edid: Have cea_db_offsets() zero start/end when the
 data block collection isn't found
Date: Mon,  2 Sep 2019 16:15:46 +0300
Message-Id: <20190902131546.4691-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902131546.4691-1-ville.syrjala@linux.intel.com>
References: <20190902131546.4691-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIG1ha2UgY2VhX2RiX29mZnNldHMoKSBhIGJpdCBtb3JlIGNvbnZlbmllbnQgdG8gdXNlIGJ5
CnNldHRpbmcgdGhlIHN0YXJ0L2VuZCBvZmZzZXRzIHRvIHplcm8gd2hlbmV2ZXIgdGhlIGRhdGEg
YmxvY2sKY29sbGVjdGlvbiBpc24ndCBwcmVzZW50LiBUaGlzIG1ha2VzIGl0IHNhZmUgZm9yIHRo
ZSBjYWxsZXIKdG8gYmxpbmRseSBpdGVyYXRlIHRoZSBkYXRhIGJsb2NrcyBldmVuIGlmIHRoZXJl
IGFyZSBub25lLgoKQ2M6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA3YjMw
NzJmYzU1MGIuLmU1OTA1ZGM3NjRjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTM2OTAsNiArMzY5MCw5
IEBAIGNlYV9yZXZpc2lvbihjb25zdCB1OCAqY2VhKQogc3RhdGljIGludAogY2VhX2RiX29mZnNl
dHMoY29uc3QgdTggKmNlYSwgaW50ICpzdGFydCwgaW50ICplbmQpCiB7CisJKnN0YXJ0ID0gMDsK
KwkqZW5kID0gMDsKKwogCWlmIChjZWFfcmV2aXNpb24oY2VhKSA8IDMpCiAJCXJldHVybiAtRU5P
VFNVUFA7CiAKQEAgLTQxMTYsMTAgKzQxMTksNyBAQCBzdGF0aWMgdm9pZCBkcm1fZWRpZF90b19l
bGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGVkaWQgKmVkaWQpCiAJ
aWYgKGNlYV9yZXZpc2lvbihjZWEpID49IDMpIHsKIAkJaW50IGksIHN0YXJ0LCBlbmQ7CiAKLQkJ
aWYgKGNlYV9kYl9vZmZzZXRzKGNlYSwgJnN0YXJ0LCAmZW5kKSkgewotCQkJc3RhcnQgPSAwOwot
CQkJZW5kID0gMDsKLQkJfQorCQljZWFfZGJfb2Zmc2V0cyhjZWEsICZzdGFydCwgJmVuZCk7CiAK
IAkJZm9yX2VhY2hfY2VhX2RiKGNlYSwgaSwgc3RhcnQsIGVuZCkgewogCQkJZGIgPSAmY2VhW2ld
OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
