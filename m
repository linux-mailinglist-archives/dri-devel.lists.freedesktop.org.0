Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44C61A4C1D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 00:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F353B6ED64;
	Fri, 10 Apr 2020 22:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA166ED64;
 Fri, 10 Apr 2020 22:33:11 +0000 (UTC)
IronPort-SDR: KezODp9asxgnkDFmvvWwgn/6XAGBdk93XDCXIHKK+QLRi1Bt5630IhIvja9Ybtqo3M60I1KKKY
 zJtKufxzkq0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2020 15:33:10 -0700
IronPort-SDR: fX6FTprqQjzErsduJkmvkiIAaT5PiIXYPtys0bmKAT1PYZ7zJJETjMiv1jCj+HyBClyJ6FHocq
 YH5HRVr9eaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,368,1580803200"; d="scan'208";a="287317067"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2020 15:33:10 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/dp: DRM DP helper for reading Ignore MSA from DPCD
Date: Fri, 10 Apr 2020 15:34:00 -0700
Message-Id: <20200410223402.6663-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgc2luayBkZXZpY2Ugc2V0cyB0aGUgSWdub3JlIE1TQSBiaXQgaW4gaXRzCkRQX0RPV05TVFJF
QU1fUE9SVF9DT1VOVCByZWdpc3RlciB0byBpbmRpY2F0ZSBpdHMgYWJpbGl0eSB0bwppZ25vcmUg
dGhlIE1TQSB2aWRlbyB0aW1pbmcgcGFyYW1ldGVycyBhbmQgaXRzIGFiaWxpdHkgdG8gc3VwcG9y
dApzZWFtbGVzcyB2aWRlbyB0aW1pbmcgY2hhbmdlIG92ZXIgYSByYW5nZSBvZiB0aW1pbmcgZXhw
b3NlZCBieQpEaXNwbGF5SUQgYW5kIEVESUQuClRoaXMgaXMgcmVxdWlyZWQgZm9yIHRoZSBzaW5r
IHRvIGluZGljYXRlIHRoYXQgaXQgaXMgQWRhcHRpdmUgc3luYwpjYXBhYmxlLgoKdjM6CiogRmkg
dGhlIHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UgKE1hbmFzaSkKdjI6CiogUmVuYW1lIHRvIGRlc2Ny
aWJlIHdoYXQgdGhlIGZ1bmN0aW9uIGRvZXMgKEphbmkgTmlrdWxhKQoKQ2M6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRs
YW5kQGFtZC5jb20+CkNjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2Fz
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBp
bnRlbC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggfCA4ICsrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IDMwNTUzM2Rh
MTNhZC4uMmI0MWU4OTkwNTMxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC0xNDQ1LDYgKzE0NDUsMTQg
QEAgZHJtX2RwX2FsdGVybmF0ZV9zY3JhbWJsZXJfcmVzZXRfY2FwKGNvbnN0IHU4IGRwY2RbRFBf
UkVDRUlWRVJfQ0FQX1NJWkVdKQogCQkJRFBfQUxURVJOQVRFX1NDUkFNQkxFUl9SRVNFVF9DQVA7
CiB9CiAKKy8qIElnbm9yZSBNU0EgdGltaW5nIGZvciBBZGFwdGl2ZSBTeW5jIHN1cHBvcnQgb24g
RFAgMS40ICovCitzdGF0aWMgaW5saW5lIGJvb2wKK2RybV9kcF9zaW5rX2Nhbl9kb192aWRlb193
aXRob3V0X3RpbWluZ19tc2EoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCit7
CisJcmV0dXJuIGRwY2RbRFBfRE9XTl9TVFJFQU1fUE9SVF9DT1VOVF0gJgorCQlEUF9NU0FfVElN
SU5HX1BBUl9JR05PUkVEOworfQorCiAvKgogICogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKICAq
LwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
