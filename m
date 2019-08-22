Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0A991D7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 13:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B146E4F4;
	Thu, 22 Aug 2019 11:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C706EAD9;
 Thu, 22 Aug 2019 11:15:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 04:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="186537479"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2019 04:15:30 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 3/6] drm: I915 mei interface is extended for transcoder info
Date: Thu, 22 Aug 2019 16:44:42 +0530
Message-Id: <20190822111445.29350-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822111445.29350-1-ramalingam.c@intel.com>
References: <20190822111445.29350-1-ramalingam.c@intel.com>
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
RlcuClRvIHN1cHBvcnQgdGhpcywgZW51bSBtZWlfZndfZGRpIGlzIGRlZmluZWQgYW5kIGFkZGVk
IGFzIGEgbWVtYmVyIGludG8KdGhlIHN0cnVjdCBoZGNwX3BvcnRfZGF0YS4KClNpZ25lZC1vZmYt
Ynk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2Ry
bS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pOTE1X21l
aV9oZGNwX2ludGVyZmFjZS5oIGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2Uu
aAppbmRleCBhOTdhY2YxYzk3MTAuLjBkZTYyOWJmMmY2MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAorKysgYi9pbmNsdWRlL2RybS9pOTE1X21laV9o
ZGNwX2ludGVyZmFjZS5oCkBAIC01NCw5ICs1NCwyMSBAQCBlbnVtIG1laV9md19kZGkgewogCU1F
SV9ERElfUkFOR0VfRU5EID0gTUVJX0RESV9BLAogfTsKIAorZW51bSBtZWlfZndfdGMgeworCU1F
SV9JTlZBTElEX1RSQU5TQ09ERVIgPSAweDAwLAkvKiBJbnZhbGlkIHRyYW5zY29kZXIgdHlwZSAq
LworCU1FSV9UQ19FRFAsCQkJLyogVHJhbnNjb2RlciBmb3IgZURQICovCisJTUVJX1RDX0RTSTAs
CQkJLyogVHJhbnNjb2RlciBmb3IgRFNJMCAqLworCU1FSV9UQ19EU0kxLAkJCS8qIFRyYW5zY29k
ZXIgZm9yIERTSTEgKi8KKwlNRUlfVENfQSA9IDB4MTAsCQkvKiBUcmFuc2NvZGVyIFRDQSAqLwor
CU1FSV9UQ19CLAkJCS8qIFRyYW5zY29kZXIgVENCICovCisJTUVJX1RDX0MsCQkJLyogVHJhbnNj
b2RlciBUQ0MgKi8KKwlNRUlfVENfRAkJCS8qIFRyYW5zY29kZXIgVENEICovCit9OworCiAvKioK
ICAqIHN0cnVjdCBoZGNwX3BvcnRfZGF0YSAtIGludGVsIHNwZWNpZmljIEhEQ1AgcG9ydCBkYXRh
CiAgKiBAZndfZGRpOiBkZGkgaW5kZXggYXMgcGVyIE1FIEZXCisgKiBAZndfdGM6IHRyYW5zY29k
ZXIgaW5kZXggYXMgcGVyIE1FIEZXCiAgKiBAcG9ydF90eXBlOiBIRENQIHBvcnQgdHlwZSBhcyBw
ZXIgTUUgRlcgY2xhc3NpZmljYXRpb24KICAqIEBwcm90b2NvbDogSERDUCBhZGFwdGF0aW9uIGFz
IHBlciBNRSBGVwogICogQGs6IE5vIG9mIHN0cmVhbXMgdHJhbnNtaXR0ZWQgb24gYSBwb3J0LiBP
bmx5IG9uIERQIE1TVCB0aGlzIGlzICE9IDEKQEAgLTY5LDYgKzgxLDcgQEAgZW51bSBtZWlfZndf
ZGRpIHsKICAqLwogc3RydWN0IGhkY3BfcG9ydF9kYXRhIHsKIAllbnVtIG1laV9md19kZGkgZndf
ZGRpOworCWVudW0gbWVpX2Z3X3RjIGZ3X3RjOwogCXU4IHBvcnRfdHlwZTsKIAl1OCBwcm90b2Nv
bDsKIAl1MTYgazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
