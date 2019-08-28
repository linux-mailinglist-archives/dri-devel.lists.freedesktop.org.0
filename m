Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C009FBB8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 09:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC1589C3B;
	Wed, 28 Aug 2019 07:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B91A89C27;
 Wed, 28 Aug 2019 07:29:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 00:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="192499948"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga002.jf.intel.com with ESMTP; 28 Aug 2019 00:29:07 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v11 3/6] drm: Extend I915 mei interface for transcoder info
Date: Wed, 28 Aug 2019 12:58:20 +0530
Message-Id: <20190828072823.4832-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828072823.4832-1-ramalingam.c@intel.com>
References: <20190828072823.4832-1-ramalingam.c@intel.com>
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
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hk
Y3BfaW50ZXJmYWNlLmggfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vaTkxNV9tZWlf
aGRjcF9pbnRlcmZhY2UuaCBiL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgK
aW5kZXggMDg2NzBhYTY1MGQ0Li40ZDQ4ZGU4ODkwY2EgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKKysrIGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRj
cF9pbnRlcmZhY2UuaApAQCAtNTQsOSArNTQsMzIgQEAgZW51bSBtZWlfZndfZGRpIHsKIAlNRUlf
RERJX1JBTkdFX0VORCA9IE1FSV9ERElfQSwKIH07CiAKKy8qKgorICogZW51bSBtZWlfZndfdGMg
LSBNRSBGaXJtd2FyZSBkZWZpbmVkIGluZGV4IGZvciB0cmFuc2NvZGVycworICogQE1FSV9JTlZB
TElEX1RSQU5TQ09ERVI6IEluZGV4IGZvciBJbnZhbGlkIHRyYW5zY29kZXIKKyAqIEBNRUlfVFJB
TlNDT0RFUl9FRFA6IEluZGV4IGZvciBFRFAgVHJhbnNjb2RlcgorICogQE1FSV9UUkFOU0NPREVS
X0RTSTA6IEluZGV4IGZvciBEU0kwIFRyYW5zY29kZXIKKyAqIEBNRUlfVFJBTlNDT0RFUl9EU0kx
OiBJbmRleCBmb3IgRFNJMSBUcmFuc2NvZGVyCisgKiBATUVJX1RSQU5TQ09ERVJfQTogSW5kZXgg
Zm9yIFRyYW5zY29kZXIgQQorICogQE1FSV9UUkFOU0NPREVSX0I6IEluZGV4IGZvciBUcmFuc2Nv
ZGVyIEIKKyAqIEBNRUlfVFJBTlNDT0RFUl9DOiBJbmRleCBmb3IgVHJhbnNjb2RlciBDCisgKiBA
TUVJX1RSQU5TQ09ERVJfRDogSW5kZXggZm9yIFRyYW5zY29kZXIgRAorICovCitlbnVtIG1laV9m
d190YyB7CisJTUVJX0lOVkFMSURfVFJBTlNDT0RFUiA9IDB4MDAsCisJTUVJX1RSQU5TQ09ERVJf
RURQLAorCU1FSV9UUkFOU0NPREVSX0RTSTAsCisJTUVJX1RSQU5TQ09ERVJfRFNJMSwKKwlNRUlf
VFJBTlNDT0RFUl9BID0gMHgxMCwKKwlNRUlfVFJBTlNDT0RFUl9CLAorCU1FSV9UUkFOU0NPREVS
X0MsCisJTUVJX1RSQU5TQ09ERVJfRAorfTsKKwogLyoqCiAgKiBzdHJ1Y3QgaGRjcF9wb3J0X2Rh
dGEgLSBpbnRlbCBzcGVjaWZpYyBIRENQIHBvcnQgZGF0YQogICogQGZ3X2RkaTogZGRpIGluZGV4
IGFzIHBlciBNRSBGVworICogQGZ3X3RjOiB0cmFuc2NvZGVyIGluZGV4IGFzIHBlciBNRSBGVwog
ICogQHBvcnRfdHlwZTogSERDUCBwb3J0IHR5cGUgYXMgcGVyIE1FIEZXIGNsYXNzaWZpY2F0aW9u
CiAgKiBAcHJvdG9jb2w6IEhEQ1AgYWRhcHRhdGlvbiBhcyBwZXIgTUUgRlcKICAqIEBrOiBObyBv
ZiBzdHJlYW1zIHRyYW5zbWl0dGVkIG9uIGEgcG9ydC4gT25seSBvbiBEUCBNU1QgdGhpcyBpcyAh
PSAxCkBAIC02OSw2ICs5Miw3IEBAIGVudW0gbWVpX2Z3X2RkaSB7CiAgKi8KIHN0cnVjdCBoZGNw
X3BvcnRfZGF0YSB7CiAJZW51bSBtZWlfZndfZGRpIGZ3X2RkaTsKKwllbnVtIG1laV9md190YyBm
d190YzsKIAl1OCBwb3J0X3R5cGU7CiAJdTggcHJvdG9jb2w7CiAJdTE2IGs7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
