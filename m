Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533165485
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 12:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397E56E188;
	Thu, 11 Jul 2019 10:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029E06E188;
 Thu, 11 Jul 2019 10:32:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 03:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,478,1557212400"; d="scan'208";a="166352353"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 11 Jul 2019 03:32:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Jul 2019 13:32:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/edid: Make sure the CEA mode arrays have the
 correct amount of modes
Date: Thu, 11 Jul 2019 13:32:34 +0300
Message-Id: <20190711103234.6294-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711103234.6294-1-ville.syrjala@linux.intel.com>
References: <20190711103234.6294-1-ville.syrjala@linux.intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Hans Verkuil <hansverk@cisco.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGRlcGVuZCBvbiBhIHNwZWNpZmljIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBWSUMgbnVtYmVy
IGFuZCB0aGUKaW5kZXggaW4gdGhlIENFQSBtb2RlIGFycmF5cy4gQXNzZXJ0IHRoYXQgdGhlIGFy
cmF5cyBoYXZlIHRoZSBleGNwZWN0ZWQKc2l6ZSB0byBtYWtlIHN1cmUgd2UndmUgbm90IGFjY2lk
ZW50YWxseSBsZWZ0IGhvbGVzIGluIHRoZW0uCgpDYzogSGFucyBWZXJrdWlsIDxoYW5zdmVya0Bj
aXNjby5jb20+CkNjOiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAzICsrKwogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggZTZiMWU3ODVkMTU4Li5m
MGI0NDkyMjU3MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0zMjA5LDYgKzMyMDksOSBAQCBzdGF0aWMg
dTggKmRybV9maW5kX2NlYV9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpCiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2
aWMpCiB7CisJQlVJTERfQlVHX09OKEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkgIT0gMTI3
KTsKKwlCVUlMRF9CVUdfT04oQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xOTMpICE9IDI3KTsK
KwogCWlmICh2aWMgPj0gMSAmJiB2aWMgPCAxICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18x
KSkKIAkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAtIDFdOwogCWlmICh2aWMgPj0gMTkz
ICYmIHZpYyA8IDE5MyArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMTkzKSkKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
