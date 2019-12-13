Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AD11E95C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0109C6EBB0;
	Fri, 13 Dec 2019 17:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F736EBA6;
 Fri, 13 Dec 2019 17:44:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 09:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="216500513"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 13 Dec 2019 09:44:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Dec 2019 19:44:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/edid: Make sure the CEA mode arrays have the
 correct amount of modes
Date: Fri, 13 Dec 2019 19:43:48 +0200
Message-Id: <20191213174348.27261-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213174348.27261-1-ville.syrjala@linux.intel.com>
References: <20191213174348.27261-1-ville.syrjala@linux.intel.com>
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
Cc: Hans Verkuil <hansverk@cisco.com>,
 Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 Thomas Anderson <thomasanderson@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGRlcGVuZCBvbiBhIHNwZWNpZmljIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBWSUMgbnVtYmVy
IGFuZCB0aGUKaW5kZXggaW4gdGhlIENFQSBtb2RlIGFycmF5cy4gQXNzZXJ0IHRoYXQgdGhlIGFy
cmF5cyBoYXZlIHRoZSBleHBlY3RlZApzaXplIHRvIG1ha2Ugc3VyZSB3ZSd2ZSBub3QgYWNjaWRl
bnRhbGx5IGxlZnQgaG9sZXMgaW4gdGhlbS4KCnYyOiBQaW1wIHRoZSBCVUlMRF9CVUdfT04oKXMK
djM6IEZpeCB0eXBvcyAoTWFuYXNpKQoKQ2M6IEhhbnMgVmVya3VpbCA8aGFuc3ZlcmtAY2lzY28u
Y29tPgpSZXZpZXdlZC1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNv
bT4KUmV2aWV3ZWQtYnk6IFRob21hcyBBbmRlcnNvbiA8dGhvbWFzYW5kZXJzb25AZ29vZ2xlLmNv
bT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCA4YmM2OWRhNTNjMmUu
LmVjNWI4ODEyMDQyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTMyMTMsNiArMzIxMyw5IEBAIHN0YXRp
YyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpjZWFfbW9kZV9mb3JfdmljKHU4
IHZpYykKIHsKKwlCVUlMRF9CVUdfT04oMSArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkg
LSAxICE9IDEyNyk7CisJQlVJTERfQlVHX09OKDE5MyArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9k
ZXNfMTkzKSAtIDEgIT0gMjE5KTsKKwogCWlmICh2aWMgPj0gMSAmJiB2aWMgPCAxICsgQVJSQVlf
U0laRShlZGlkX2NlYV9tb2Rlc18xKSkKIAkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAt
IDFdOwogCWlmICh2aWMgPj0gMTkzICYmIHZpYyA8IDE5MyArIEFSUkFZX1NJWkUoZWRpZF9jZWFf
bW9kZXNfMTkzKSkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
