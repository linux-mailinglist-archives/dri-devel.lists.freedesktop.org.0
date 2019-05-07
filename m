Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4835167D5
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 18:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81CE6E80F;
	Tue,  7 May 2019 16:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0160F6E80F;
 Tue,  7 May 2019 16:26:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 09:26:03 -0700
X-ExtLoop1: 1
Received: from nuc.iind.intel.com ([10.99.66.149])
 by orsmga001.jf.intel.com with ESMTP; 07 May 2019 09:26:01 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Subject: [PATCH v7 11/11] drm/i915: update the hdcp state with uevent
Date: Tue,  7 May 2019 21:57:45 +0530
Message-Id: <20190507162745.25600-12-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190507162745.25600-1-ramalingam.c@intel.com>
References: <20190507162745.25600-1-ramalingam.c@intel.com>
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
Cc: gwan-gyeong.mun@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtIGZ1bmN0aW9uIHRvIHVwZGF0ZSB0aGUgY29udGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IHN0
YXRlIGFuZCB0bwpnZW5lcmF0ZSBhIHVldmVudCBpcyBpbnZva2VkIGZyb20gdGhlIGludGVsIGhk
Y3AgcHJvcGVydHkgd29yay4KCkhlbmNlIHdoZW5ldmVyIGtlcm5lbCBjaGFuZ2VzIHRoZSBwcm9w
ZXJ0eSBzdGF0ZSwgdXNlcnNwYWNlIHdpbGwgYmUKdXBkYXRlZCB3aXRoIGEgdWV2ZW50LgoKTmVl
ZCBhIEFDSyBmb3IgdWV2ZW50IGdlbmVyYXRpbmcgdUFQSSBmcm9tIHVzZXJzcGFjZS4KCnYyOgog
IHN0YXRlIHVwZGF0ZSBpcyBtb3ZlZCBpbnRvIGRybSBmdW5jdGlvbiBbZGFuaWVsXQoKU2lnbmVk
LW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgpSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9oZGNwLmMgfCA4ICsrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX2hkY3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkY3AuYwpp
bmRleCA2OTUyMjY4N2IyY2IuLjhhYmQ2OTU1MWVhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfaGRjcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hk
Y3AuYwpAQCAtODY1LDcgKzg2NSw2IEBAIHN0YXRpYyB2b2lkIGludGVsX2hkY3BfcHJvcF93b3Jr
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJCQkJICAgICAgIHByb3Bfd29yayk7CiAJc3Ry
dWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gaW50ZWxfaGRjcF90b19jb25uZWN0b3Io
aGRjcCk7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rvci0+YmFzZS5kZXY7Ci0J
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlOwogCiAJZHJtX21vZGVzZXRfbG9jaygm
ZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4LCBOVUxMKTsKIAltdXRleF9sb2NrKCZo
ZGNwLT5tdXRleCk7CkBAIC04NzUsMTAgKzg3NCw5IEBAIHN0YXRpYyB2b2lkIGludGVsX2hkY3Bf
cHJvcF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkgKiB0aG9zZSB0byBVTkRFU0lS
RUQgaXMgaGFuZGxlZCBieSBjb3JlLiBJZiB2YWx1ZSA9PSBVTkRFU0lSRUQsCiAJICogd2UncmUg
cnVubmluZyBqdXN0IGFmdGVyIGhkY3AgaGFzIGJlZW4gZGlzYWJsZWQsIHNvIGp1c3QgZXhpdAog
CSAqLwotCWlmIChoZGNwLT52YWx1ZSAhPSBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fVU5E
RVNJUkVEKSB7Ci0JCXN0YXRlID0gY29ubmVjdG9yLT5iYXNlLnN0YXRlOwotCQlzdGF0ZS0+Y29u
dGVudF9wcm90ZWN0aW9uID0gaGRjcC0+dmFsdWU7Ci0JfQorCWlmIChoZGNwLT52YWx1ZSAhPSBE
Uk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fVU5ERVNJUkVEKQorCQlkcm1faGRjcF91cGRhdGVf
Y29udGVudF9wcm90ZWN0aW9uKCZjb25uZWN0b3ItPmJhc2UsCisJCQkJCQkgICBoZGNwLT52YWx1
ZSk7CiAKIAltdXRleF91bmxvY2soJmhkY3AtPm11dGV4KTsKIAlkcm1fbW9kZXNldF91bmxvY2so
JmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7Ci0tIAoyLjE5LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
