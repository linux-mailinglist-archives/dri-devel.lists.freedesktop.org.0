Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E295B81E6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 21:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BB46FABD;
	Thu, 19 Sep 2019 19:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B298E6FAA3;
 Thu, 19 Sep 2019 19:53:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 12:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,526,1559545200"; d="scan'208";a="188189706"
Received: from helsinki.fi.intel.com ([10.237.66.129])
 by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2019 12:53:27 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 5/8] drm/i915/dp: Attach colorspace property
Date: Thu, 19 Sep 2019 22:53:08 +0300
Message-Id: <20190919195311.13972-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919195311.13972-1-gwan-gyeong.mun@intel.com>
References: <20190919195311.13972-1-gwan-gyeong.mun@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, uma.shankar@intel.com,
 jani.saarinen@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgYXR0YWNoZXMgdGhlIGNvbG9yc3BhY2UgY29ubmVjdG9yIHByb3BlcnR5IHRvIGEgRGlzcGxh
eVBvcnQgY29ubmVjdG9yLgpCYXNlZCBvbiBjb2xvcnNwYWNlIGNoYW5nZSwgbW9kZXNldCB3aWxs
IGJlIHRyaWdnZXJlZCB0byBzd2l0Y2ggdG8gYSBuZXcKY29sb3JzcGFjZS4KCkFuZCBpbiBvcmRl
ciB0byBkaXN0aW5ndWlzaCBjb2xvcnNwYWNlIGJ3dHdlZW4gRFAgYW5kIEhETUkgY29ubmVjdG9y
LCBpdAphZGRzIGEgaGFuZGxpbmcgb2YgZHJtX21vZGVfY3JlYXRlX2RwX2NvbG9yc3BhY2VfcHJv
cGVydHkoKSB0bwppbnRlbF9hdHRhY2hfY29sb3JzcGFjZV9wcm9wZXJ0eSgpLgoKQmFzZWQgb24g
Y29sb3JzcGFjZSBwcm9wZXJ0eSB2YWx1ZSBjcmVhdGUgYSBWU0MgU0RQIHBhY2tldCB3aXRoIGFw
cHJvcHJpYXRlCmNvbG9yc3BhY2UuIFRoaXMgd291bGQgaGVscCB0byBlbmFibGUgd2lkZXIgY29s
b3IgZ2FtdXQgbGlrZSBCVDIwMjAgb24gYQpzaW5rIGRldmljZS4KCnY5OiBBZGRyZXNzZWQgcmV2
aWV3IGNvbW1lbnRzIGZyb20gVmlsbGUKICAtIEFkZCBhIGhhbmRsaW5nIG9mIGRybV9tb2RlX2Ny
ZWF0ZV9kcF9jb2xvcnNwYWNlX3Byb3BlcnR5KCkgdG8KICAgIGludGVsX2F0dGFjaF9jb2xvcnNw
YWNlX3Byb3BlcnR5KCkuIFRoaXMgaHVuayBtb3ZlZCBmcm9tIHRoZSBwcmV2aW91cwogICAgY29t
bWl0LgoKU2lnbmVkLW9mZi1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4K
LS0tCiAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29ubmVjdG9yLmMgICAgfCAyMSAr
KysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMgICAgICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Nvbm5l
Y3Rvci5jCmluZGV4IGJhMmVmMTY1YTAxYS4uMTEzM2M0ZTk3YmI0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29ubmVjdG9yLmMKQEAgLTI3Nyw3ICsyNzcsMjIg
QEAgaW50ZWxfYXR0YWNoX2FzcGVjdF9yYXRpb19wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQogdm9pZAogaW50ZWxfYXR0YWNoX2NvbG9yc3BhY2VfcHJvcGVydHkoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKLQlpZiAoIWRybV9tb2RlX2NyZWF0ZV9o
ZG1pX2NvbG9yc3BhY2VfcHJvcGVydHkoY29ubmVjdG9yKSkKLQkJZHJtX29iamVjdF9hdHRhY2hf
cHJvcGVydHkoJmNvbm5lY3Rvci0+YmFzZSwKLQkJCQkJICAgY29ubmVjdG9yLT5jb2xvcnNwYWNl
X3Byb3BlcnR5LCAwKTsKKwlzd2l0Y2ggKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUpIHsKKwlj
YXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQToKKwljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9I
RE1JQjoKKwkJaWYgKGRybV9tb2RlX2NyZWF0ZV9oZG1pX2NvbG9yc3BhY2VfcHJvcGVydHkoY29u
bmVjdG9yKSkKKwkJCXJldHVybjsKKwkJYnJlYWs7CisJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1Jf
RGlzcGxheVBvcnQ6CisJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOgorCQlpZiAoZHJtX21v
ZGVfY3JlYXRlX2RwX2NvbG9yc3BhY2VfcHJvcGVydHkoY29ubmVjdG9yKSkKKwkJCXJldHVybjsK
KwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJRFJNX0RFQlVHX0tNUygiQ29sb3JzcGFjZSBwcm9wZXJ0
eSBub3Qgc3VwcG9ydGVkXG4iKTsKKwkJcmV0dXJuOworCX0KKworCWRybV9vYmplY3RfYXR0YWNo
X3Byb3BlcnR5KCZjb25uZWN0b3ItPmJhc2UsCisJCQkJICAgY29ubmVjdG9yLT5jb2xvcnNwYWNl
X3Byb3BlcnR5LCAwKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwpp
bmRleCBmMTM4OTJkZWFmYmIuLjFmN2Q2OWU3NDg1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYwpAQCAtNjQ0OCw2ICs2NDQ4LDggQEAgaW50ZWxfZHBfYWRkX3Byb3Bl
cnRpZXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3QKIAllbHNlIGlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDUpCiAJCWRybV9jb25uZWN0
b3JfYXR0YWNoX21heF9icGNfcHJvcGVydHkoY29ubmVjdG9yLCA2LCAxMik7CiAKKwlpbnRlbF9h
dHRhY2hfY29sb3JzcGFjZV9wcm9wZXJ0eShjb25uZWN0b3IpOworCiAJaWYgKGludGVsX2RwX2lz
X2VkcChpbnRlbF9kcCkpIHsKIAkJdTMyIGFsbG93ZWRfc2NhbGVyczsKIAotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
