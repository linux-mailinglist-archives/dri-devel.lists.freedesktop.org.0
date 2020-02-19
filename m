Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38B164FFE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 21:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DC26EC9E;
	Wed, 19 Feb 2020 20:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94336EC9C;
 Wed, 19 Feb 2020 20:35:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 12:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="229914690"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 19 Feb 2020 12:35:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2020 22:35:47 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] drm: Nuke mode->hsync
Date: Wed, 19 Feb 2020 22:35:33 +0200
Message-Id: <20200219203544.31013-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIGp1c3QgY2FsY3VsYXRlIHRoZSBoc3luYyByYXRlIG9uIGRlbWFuZC4gTm8gcG9pbnQgaW4g
d2FzdGluZwpzcGFjZSBzdG9yaW5nIGl0IGFuZCByaXNraW5nIHRoZSBjYWNoZWQgdmFsdWUgZ2V0
dGluZyBvdXQgb2Ygc3luYwp3aXRoIHJlYWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZXMuYyAgICAgICAgICAgICAgICAgIHwgMTQgKystLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgIDEgLQogaW5jbHVkZS9k
cm0vZHJtX21vZGVzLmggICAgICAgICAgICAgICAgICAgICAgfCAxMCAtLS0tLS0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
cy5jCmluZGV4IGQ0ZDY0NTE4ZTExYi4uZmU3ZTg3MmE2MjM5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCkBA
IC03NTIsMjQgKzc1MiwxNCBAQCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX3NldF9uYW1lKTsKICAq
IEBtb2RlOiBtb2RlCiAgKgogICogUmV0dXJuczoKLSAqIEBtb2RlcydzIGhzeW5jIHJhdGUgaW4g
a0h6LCByb3VuZGVkIHRvIHRoZSBuZWFyZXN0IGludGVnZXIuIENhbGN1bGF0ZXMgdGhlCi0gKiB2
YWx1ZSBmaXJzdCBpZiBpdCBpcyBub3QgeWV0IHNldC4KKyAqIEBtb2RlcydzIGhzeW5jIHJhdGUg
aW4ga0h6LCByb3VuZGVkIHRvIHRoZSBuZWFyZXN0IGludGVnZXIKICAqLwogaW50IGRybV9tb2Rl
X2hzeW5jKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQogewotCXVuc2lnbmVk
IGludCBjYWxjX3ZhbDsKLQotCWlmIChtb2RlLT5oc3luYykKLQkJcmV0dXJuIG1vZGUtPmhzeW5j
OwotCiAJaWYgKG1vZGUtPmh0b3RhbCA8PSAwKQogCQlyZXR1cm4gMDsKIAotCWNhbGNfdmFsID0g
KG1vZGUtPmNsb2NrICogMTAwMCkgLyBtb2RlLT5odG90YWw7IC8qIGhzeW5jIGluIEh6ICovCi0J
Y2FsY192YWwgKz0gNTAwOwkJCQkvKiByb3VuZCB0byAxMDAwSHogKi8KLQljYWxjX3ZhbCAvPSAx
MDAwOwkJCQkvKiB0cnVuY2F0ZSB0byBrSHogKi8KLQotCXJldHVybiBjYWxjX3ZhbDsKKwlyZXR1
cm4gRElWX1JPVU5EX0NMT1NFU1QobW9kZS0+Y2xvY2ssIG1vZGUtPmh0b3RhbCk7CiB9CiBFWFBP
UlRfU1lNQk9MKGRybV9tb2RlX2hzeW5jKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXkuYwppbmRleCBlZTdkNTRjY2QzZTYuLmZhYjkxNDgxOTQ4OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKQEAgLTg4Njcs
NyArODg2Nyw2IEBAIHZvaWQgaW50ZWxfbW9kZV9mcm9tX3BpcGVfY29uZmlnKHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlLAogCiAJbW9kZS0+Y2xvY2sgPSBwaXBlX2NvbmZpZy0+aHcuYWRq
dXN0ZWRfbW9kZS5jcnRjX2Nsb2NrOwogCi0JbW9kZS0+aHN5bmMgPSBkcm1fbW9kZV9oc3luYyht
b2RlKTsKIAltb2RlLT52cmVmcmVzaCA9IGRybV9tb2RlX3ZyZWZyZXNoKG1vZGUpOwogCWRybV9t
b2RlX3NldF9uYW1lKG1vZGUpOwogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVz
LmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAppbmRleCA5OTEzNGQ0ZjM1ZWIuLjdkYWI3ZjE3
MjQzMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtX21vZGVzLmgKQEAgLTM5MCwxNiArMzkwLDYgQEAgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgewogCSAqLwogCWludCB2cmVmcmVzaDsKIAotCS8qKgotCSAqIEBoc3luYzoKLQkgKgotCSAq
IEhvcml6b250YWwgcmVmcmVzaCByYXRlLCBmb3IgZGVidWcgb3V0cHV0IGluIGh1bWFuIHJlYWRh
YmxlIGZvcm0uIE5vdAotCSAqIHVzZWQgaW4gYSBmdW5jdGlvbmFsIHdheS4KLQkgKgotCSAqIFRo
aXMgdmFsdWUgaXMgaW4ga0h6LgotCSAqLwotCWludCBoc3luYzsKLQogCS8qKgogCSAqIEBwaWN0
dXJlX2FzcGVjdF9yYXRpbzoKIAkgKgotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
