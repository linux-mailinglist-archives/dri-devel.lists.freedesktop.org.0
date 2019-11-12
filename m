Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A1F9CE8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8216EC05;
	Tue, 12 Nov 2019 22:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507A36EC05
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:23:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 14:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="198241065"
Received: from nperf12.hd.intel.com ([10.127.88.161])
 by orsmga008.jf.intel.com with ESMTP; 12 Nov 2019 14:23:08 -0800
From: Brian Welty <brian.welty@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH libdrm] intel: Handle GET_TILING errors on unsupported
 platforms
Date: Tue, 12 Nov 2019 17:23:53 -0500
Message-Id: <20191112222353.2100-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.21.0
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

Rm9yIGdlbjEyKyBhcmNoaXRlY3R1cmVzLCBpOTE1IG5vIGxvbmdlciBzdXBwb3J0cyB1c2Ugb2Yg
R0VUX1RJTElORwppb2N0bCBbMV0uICBUaGlzIGJyZWFrcyB0aGUgdXNhZ2Ugb2YgdHdvIGxpYmRy
bSBmdW5jdGlvbnMgb24gdGhvc2UKcGxhdGZvcm1zOgogIGRybV9pbnRlbF9ib19nZW1fY3JlYXRl
X2Zyb21fbmFtZSgpIGFuZAogIGRybV9pbnRlbF9ib19nZW1fY3JlYXRlX2Zyb21fcHJpbWUoKS4K
V2UgYWxzbyBoYXZlIElHVHMgd2hpY2ggdGVzdCBkcm1faW50ZWxfZ2VtX2JvX2ZsaW5rKCkgZm9s
bG93ZWQgYnkKZHJtX2ludGVsX2JvX2dlbV9jcmVhdGVfZnJvbV9uYW1lKCksIHdoaWNoIG5vdyBm
YWlsIG9uIHRoZXNlCnBsYXRmb3Jtcy4KCkFzIEkgZG9uJ3Qga25vdyBiZXN0IGZpeCwgdGhpcyBw
YXRjaCBpcyBtYWlubHkgdG8gc2hvdyB0aGUgcHJvYmxlbSBhbmQKZ2V0IGZlZWRiYWNrIG9uIHdo
YXQgaXMgcHJlZmVycmVkIHNvbHV0aW9uLgpUaGUgcHJvcG9zZWQgc29sdXRpb24gaGVyZSBpcyB0
byBzaW1wbHkgaGF2ZSBsaWJkcm0gaWdub3JlIEVPUE5PVFNVUFAKZXJyb3JzIGFuZCBsZWF2ZSB0
aGUgdGlsaW5nIG1vZGUgc2V0IHRvIDAgdXBvbiByZWNlaXZpbmcgdGhhdCBlcnJvci4KClsxXSBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9pbnRlbC1nZngvMjAxOS1BdWd1
c3QvMjEwOTYwLmh0bWwKClNpZ25lZC1vZmYtYnk6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0eUBp
bnRlbC5jb20+Ci0tLQogaW50ZWwvaW50ZWxfYnVmbWdyX2dlbS5jIHwgNyArKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2ludGVsL2ludGVsX2J1Zm1ncl9nZW0uYyBiL2ludGVsL2ludGVsX2J1Zm1ncl9nZW0uYwppbmRl
eCBhMGNlY2M5Ni4uNTE2MGFlZjEgMTAwNjQ0Ci0tLSBhL2ludGVsL2ludGVsX2J1Zm1ncl9nZW0u
YworKysgYi9pbnRlbC9pbnRlbF9idWZtZ3JfZ2VtLmMKQEAgLTExNTIsNyArMTE1Miw4IEBAIGRy
bV9pbnRlbF9ib19nZW1fY3JlYXRlX2Zyb21fbmFtZShkcm1faW50ZWxfYnVmbWdyICpidWZtZ3Is
CiAJcmV0ID0gZHJtSW9jdGwoYnVmbWdyX2dlbS0+ZmQsCiAJCSAgICAgICBEUk1fSU9DVExfSTkx
NV9HRU1fR0VUX1RJTElORywKIAkJICAgICAgICZnZXRfdGlsaW5nKTsKLQlpZiAocmV0ICE9IDAp
CisJLyogZm9yIEVPUE5PVFNVUFAsIGp1c3QgdXNlIHRpbGluZ19tb2RlIG9mIDAgKi8KKwlpZiAo
cmV0ICE9IDAgJiYgZXJybm8gIT0gRU9QTk9UU1VQUCkKIAkJZ290byBlcnJfdW5yZWY7CiAKIAli
b19nZW0tPnRpbGluZ19tb2RlID0gZ2V0X3RpbGluZy50aWxpbmdfbW9kZTsKQEAgLTI3NTMsNyAr
Mjc1NCw5IEBAIGRybV9pbnRlbF9ib19nZW1fY3JlYXRlX2Zyb21fcHJpbWUoZHJtX2ludGVsX2J1
Zm1nciAqYnVmbWdyLCBpbnQgcHJpbWVfZmQsIGludCBzCiAJaWYgKGRybUlvY3RsKGJ1Zm1ncl9n
ZW0tPmZkLAogCQkgICAgIERSTV9JT0NUTF9JOTE1X0dFTV9HRVRfVElMSU5HLAogCQkgICAgICZn
ZXRfdGlsaW5nKSkKLQkJZ290byBlcnI7CisJCS8qIGZvciBFT1BOT1RTVVBQLCBqdXN0IHVzZSB0
aWxpbmdfbW9kZSBvZiAwICovCisJCWlmIChlcnJubyAhPSBFT1BOT1RTVVBQKQorCQkJZ290byBl
cnI7CiAKIAlib19nZW0tPnRpbGluZ19tb2RlID0gZ2V0X3RpbGluZy50aWxpbmdfbW9kZTsKIAli
b19nZW0tPnN3aXp6bGVfbW9kZSA9IGdldF90aWxpbmcuc3dpenpsZV9tb2RlOwotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
