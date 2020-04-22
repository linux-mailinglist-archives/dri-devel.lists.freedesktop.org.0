Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB91B42F7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 13:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CF86E3DA;
	Wed, 22 Apr 2020 11:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718A56E3D8;
 Wed, 22 Apr 2020 11:18:49 +0000 (UTC)
IronPort-SDR: kZt/ijs8qFkAf0vubZuI8SUetKZZpVyX4x3mQhPhVCa0klQsl37MSbtk6kRVpclp9xP3Vk7T+d
 +/gUKAjCYCWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 04:18:49 -0700
IronPort-SDR: /jqUTqnqK3c4puUTlk0AnVdbaHjSvxjcPaFWe+mgJoEnIZ05MZOwvIC8grbuGTz+VlyXIAcL80
 XVAGnRSji6pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="456469528"
Received: from bhanu-ubuntu.iind.intel.com ([10.145.162.51])
 by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2020 04:18:46 -0700
From: bhanuprakash.modem@intel.com
To: bhanuprakash.modem@intel.com, manasi.d.navare@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [v5, 1/3] drm/dp: DRM DP helper for reading Ignore MSA from DPCD
Date: Wed, 22 Apr 2020 16:37:31 +0530
Message-Id: <20200422110733.28635-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.24.1.1.gb6d4d82bd5
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KCkZyb206IE1h
bmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+CgpEUCBzaW5rIGRldmljZSBz
ZXRzIHRoZSBJZ25vcmUgTVNBIGJpdCBpbiBpdHMKRFBfRE9XTlNUUkVBTV9QT1JUX0NPVU5UIHJl
Z2lzdGVyIHRvIGluZGljYXRlIGl0cyBhYmlsaXR5IHRvCmlnbm9yZSB0aGUgTVNBIHZpZGVvIHRp
bWluZyBwYXJhbWV0ZXJzIGFuZCBpdHMgYWJpbGl0eSB0byBzdXBwb3J0CnNlYW1sZXNzIHZpZGVv
IHRpbWluZyBjaGFuZ2Ugb3ZlciBhIHJhbmdlIG9mIHRpbWluZyBleHBvc2VkIGJ5CkRpc3BsYXlJ
RCBhbmQgRURJRC4KVGhpcyBpcyByZXF1aXJlZCBmb3IgdGhlIHNpbmsgdG8gaW5kaWNhdGUgdGhh
dCBpdCBpcyBBZGFwdGl2ZSBzeW5jCmNhcGFibGUuCgp2MzoKKiBGaSB0aGUgdHlwbyBpbiBjb21t
aXQgbWVzc2FnZSAoTWFuYXNpKQp2MjoKKiBSZW5hbWUgdG8gZGVzY3JpYmUgd2hhdCB0aGUgZnVu
Y3Rpb24gZG9lcyAoSmFuaSBOaWt1bGEpCgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxp
bnV4LmludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6
IE5pY2hvbGFzIEthemxhdXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgotLS0KIGluY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggM2JlYjJhYWM4YzRjLi44NzI2NGI1NjE2
MzIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE0NTQsNiArMTQ1NCwxNCBAQCBkcm1fZHBfYWx0ZXJu
YXRlX3NjcmFtYmxlcl9yZXNldF9jYXAoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0la
RV0pCiAJCQlEUF9BTFRFUk5BVEVfU0NSQU1CTEVSX1JFU0VUX0NBUDsKIH0KIAorLyogSWdub3Jl
IE1TQSB0aW1pbmcgZm9yIEFkYXB0aXZlIFN5bmMgc3VwcG9ydCBvbiBEUCAxLjQgKi8KK3N0YXRp
YyBpbmxpbmUgYm9vbAorZHJtX2RwX3NpbmtfY2FuX2RvX3ZpZGVvX3dpdGhvdXRfdGltaW5nX21z
YShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwlyZXR1cm4gZHBjZFtE
UF9ET1dOX1NUUkVBTV9QT1JUX0NPVU5UXSAmCisJCURQX01TQV9USU1JTkdfUEFSX0lHTk9SRUQ7
Cit9CisKIC8qCiAgKiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbAogICovCi0tIAoyLjI0LjEuMS5n
YjZkNGQ4MmJkNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
