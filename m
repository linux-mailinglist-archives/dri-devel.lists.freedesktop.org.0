Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702332C845
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA31D89DC0;
	Tue, 28 May 2019 14:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DF489DC0;
 Tue, 28 May 2019 14:06:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 07:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,523,1549958400"; d="scan'208";a="179214285"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 28 May 2019 07:06:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 May 2019 17:06:55 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Skip SINK_COUNT read on CH7511
Date: Tue, 28 May 2019 17:06:50 +0300
Message-Id: <20190528140650.19230-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528140650.19230-1-ville.syrjala@linux.intel.com>
References: <20190528140650.19230-1-ville.syrjala@linux.intel.com>
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
Cc: "David S ." <david@majinbuu.com>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNI
NzUxMSBkb2Vzbid0IHVwZGF0ZSBTSU5LX0NPVU5UIHByb3Blcmx5IHNvIGluIG9yZGVyIHRvIGRl
dGVjdAp0aGUgZGV2aWNlIGFzIGNvbm5lY3RlZCB3ZSBoYXZlIHRvIGlnbm9yZSBTSU5LX0NPVU5U
LgoKSW4gb3JkZXIgdG8gaGF2ZSBhY2Nlc3MgdG8gdGhlIHF1aXJrIGxpc3QgZWFybHkgZW5vdWdo
IHdlCm11c3QgbW92ZSB0aGUgZHJtX2RwX3JlYWRfZGVzYygpIGNhbGwgdG8gaGFwcGVuIGVhcmxp
ZXIuCldlIGNhbiBhbHNvIHNraXAgcmUtcmVhZGluZyB0aGlzIG9uIGVEUCBzaW5jZSB3ZSBrbm93
IGl0Cndvbid0IGNoYW5nZS4KCkNjOiBEYXZpZCBTLiA8ZGF2aWRAbWFqaW5idXUuY29tPgpDYzog
UGV0ZXJpcyBSdWR6dXNpa3MgPHBldGVyaXMucnVkenVzaWtzQGdtYWlsLmNvbT4KVGVzdGVkLWJ5
OiBQZXRlcmlzIFJ1ZHp1c2lrcyA8cGV0ZXJpcy5ydWR6dXNpa3NAZ21haWwuY29tPgpCdWd6aWxs
YTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NDA2ClNp
Z25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHAuYyB8IDE0ICsrKysrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9kcC5jCmluZGV4IDI0YjU2YjJhNzZjOC4uOGZlNjU3MWNkYThmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2RwLmMKQEAgLTQyNDIsOCArNDI0MiwxNCBAQCBpbnRlbF9kcF9nZXRf
ZHBjZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQogCWlmICghaW50ZWxfZHBfcmVhZF9kcGNk
KGludGVsX2RwKSkKIAkJcmV0dXJuIGZhbHNlOwogCi0JLyogRG9uJ3QgY2xvYmJlciBjYWNoZWQg
ZURQIHJhdGVzLiAqLworCS8qCisJICogRG9uJ3QgY2xvYmJlciBjYWNoZWQgZURQIHJhdGVzLiBB
bHNvIHNraXAgcmUtcmVhZGluZworCSAqIHRoZSBPVUkvSUQgc2luY2Ugd2Uga25vdyBpdCB3b24n
dCBjaGFuZ2UuCisJICovCiAJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKSB7CisJCWRy
bV9kcF9yZWFkX2Rlc2MoJmludGVsX2RwLT5hdXgsICZpbnRlbF9kcC0+ZGVzYywKKwkJCQkgZHJt
X2RwX2lzX2JyYW5jaChpbnRlbF9kcC0+ZHBjZCkpOworCiAJCWludGVsX2RwX3NldF9zaW5rX3Jh
dGVzKGludGVsX2RwKTsKIAkJaW50ZWxfZHBfc2V0X2NvbW1vbl9yYXRlcyhpbnRlbF9kcCk7CiAJ
fQpAQCAtNDI1Miw3ICs0MjU4LDggQEAgaW50ZWxfZHBfZ2V0X2RwY2Qoc3RydWN0IGludGVsX2Rw
ICppbnRlbF9kcCkKIAkgKiBTb21lIGVEUCBwYW5lbHMgZG8gbm90IHNldCBhIHZhbGlkIHZhbHVl
IGZvciBzaW5rIGNvdW50LCB0aGF0IGlzIHdoeQogCSAqIGl0IGRvbid0IGNhcmUgYWJvdXQgcmVh
ZCBpdCBoZXJlIGFuZCBpbiBpbnRlbF9lZHBfaW5pdF9kcGNkKCkuCiAJICovCi0JaWYgKCFpbnRl
bF9kcF9pc19lZHAoaW50ZWxfZHApKSB7CisJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHAp
ICYmCisJICAgICFkcm1fZHBfaGFzX3F1aXJrKCZpbnRlbF9kcC0+ZGVzYywgRFBfRFBDRF9RVUlS
S19OT19TSU5LX0NPVU5UKSkgewogCQl1OCBjb3VudDsKIAkJc3NpemVfdCByOwogCkBAIC01NTg2
LDkgKzU1OTMsNiBAQCBpbnRlbF9kcF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwKIAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMSkKIAkJaW50ZWxfZHBfZ2V0X2Rz
Y19zaW5rX2NhcChpbnRlbF9kcCk7CiAKLQlkcm1fZHBfcmVhZF9kZXNjKCZpbnRlbF9kcC0+YXV4
LCAmaW50ZWxfZHAtPmRlc2MsCi0JCQkgZHJtX2RwX2lzX2JyYW5jaChpbnRlbF9kcC0+ZHBjZCkp
OwotCiAJaW50ZWxfZHBfY29uZmlndXJlX21zdChpbnRlbF9kcCk7CiAKIAlpZiAoaW50ZWxfZHAt
PmlzX21zdCkgewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
