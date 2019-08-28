Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29162A07A4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 18:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1974189DB8;
	Wed, 28 Aug 2019 16:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943089DB4;
 Wed, 28 Aug 2019 16:43:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 09:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="197593794"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2019 09:42:58 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v12 3/6] drm: Extend I915 mei interface for transcoder info
Date: Wed, 28 Aug 2019 22:12:13 +0530
Message-Id: <20190828164216.405-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828164216.405-1-ramalingam.c@intel.com>
References: <20190828164216.405-1-ramalingam.c@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, tomas.winkler@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

STkxNSBuZWVkcyB0byBzZW5kIHRoZSBpbmRleCBvZiB0aGUgdHJhbnNjb2RlciBhcyBwZXIgTUUg
RlcuCgpUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md190YyBhbmQgYWRkIGFzIGEg
bWVtYmVyIGludG8KdGhlIHN0cnVjdCBoZGNwX3BvcnRfZGF0YS4KCnYyOgogIFR5cG8gaW4gY29t
bWl0IG1zZyBpcyBmaXhlZCBbU2hhc2hhbmtdCnYzOgogIGtkb2MgaXMgYWRkZWQgZm9yIG1laV9m
d190YyBbVG9tYXNdCiAgcy9NRUlfVENfeC9NRUlfVFJBTlNDT0RFUl94CgpTaWduZWQtb2ZmLWJ5
OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+CkFja2VkLWJ5OiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpBY2tlZC1ieTogVG9tYXMgV2lua2xlciA8dG9t
YXMud2lua2xlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTaGFzaGFuayBTaGFybWEgPHNoYXNo
YW5rLnNoYXJtYUBpbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRl
cmZhY2UuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2lu
dGVyZmFjZS5oIGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAppbmRleCAw
ODY3MGFhNjUwZDQuLjRkNDhkZTg4OTBjYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vaTkxNV9t
ZWlfaGRjcF9pbnRlcmZhY2UuaAorKysgYi9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVy
ZmFjZS5oCkBAIC01NCw5ICs1NCwzMiBAQCBlbnVtIG1laV9md19kZGkgewogCU1FSV9ERElfUkFO
R0VfRU5EID0gTUVJX0RESV9BLAogfTsKIAorLyoqCisgKiBlbnVtIG1laV9md190YyAtIE1FIEZp
cm13YXJlIGRlZmluZWQgaW5kZXggZm9yIHRyYW5zY29kZXJzCisgKiBATUVJX0lOVkFMSURfVFJB
TlNDT0RFUjogSW5kZXggZm9yIEludmFsaWQgdHJhbnNjb2RlcgorICogQE1FSV9UUkFOU0NPREVS
X0VEUDogSW5kZXggZm9yIEVEUCBUcmFuc2NvZGVyCisgKiBATUVJX1RSQU5TQ09ERVJfRFNJMDog
SW5kZXggZm9yIERTSTAgVHJhbnNjb2RlcgorICogQE1FSV9UUkFOU0NPREVSX0RTSTE6IEluZGV4
IGZvciBEU0kxIFRyYW5zY29kZXIKKyAqIEBNRUlfVFJBTlNDT0RFUl9BOiBJbmRleCBmb3IgVHJh
bnNjb2RlciBBCisgKiBATUVJX1RSQU5TQ09ERVJfQjogSW5kZXggZm9yIFRyYW5zY29kZXIgQgor
ICogQE1FSV9UUkFOU0NPREVSX0M6IEluZGV4IGZvciBUcmFuc2NvZGVyIEMKKyAqIEBNRUlfVFJB
TlNDT0RFUl9EOiBJbmRleCBmb3IgVHJhbnNjb2RlciBECisgKi8KK2VudW0gbWVpX2Z3X3RjIHsK
KwlNRUlfSU5WQUxJRF9UUkFOU0NPREVSID0gMHgwMCwKKwlNRUlfVFJBTlNDT0RFUl9FRFAsCisJ
TUVJX1RSQU5TQ09ERVJfRFNJMCwKKwlNRUlfVFJBTlNDT0RFUl9EU0kxLAorCU1FSV9UUkFOU0NP
REVSX0EgPSAweDEwLAorCU1FSV9UUkFOU0NPREVSX0IsCisJTUVJX1RSQU5TQ09ERVJfQywKKwlN
RUlfVFJBTlNDT0RFUl9ECit9OworCiAvKioKICAqIHN0cnVjdCBoZGNwX3BvcnRfZGF0YSAtIGlu
dGVsIHNwZWNpZmljIEhEQ1AgcG9ydCBkYXRhCiAgKiBAZndfZGRpOiBkZGkgaW5kZXggYXMgcGVy
IE1FIEZXCisgKiBAZndfdGM6IHRyYW5zY29kZXIgaW5kZXggYXMgcGVyIE1FIEZXCiAgKiBAcG9y
dF90eXBlOiBIRENQIHBvcnQgdHlwZSBhcyBwZXIgTUUgRlcgY2xhc3NpZmljYXRpb24KICAqIEBw
cm90b2NvbDogSERDUCBhZGFwdGF0aW9uIGFzIHBlciBNRSBGVwogICogQGs6IE5vIG9mIHN0cmVh
bXMgdHJhbnNtaXR0ZWQgb24gYSBwb3J0LiBPbmx5IG9uIERQIE1TVCB0aGlzIGlzICE9IDEKQEAg
LTY5LDYgKzkyLDcgQEAgZW51bSBtZWlfZndfZGRpIHsKICAqLwogc3RydWN0IGhkY3BfcG9ydF9k
YXRhIHsKIAllbnVtIG1laV9md19kZGkgZndfZGRpOworCWVudW0gbWVpX2Z3X3RjIGZ3X3RjOwog
CXU4IHBvcnRfdHlwZTsKIAl1OCBwcm90b2NvbDsKIAl1MTYgazsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
