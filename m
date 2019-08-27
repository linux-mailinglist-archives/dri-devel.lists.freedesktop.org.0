Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BA9E616
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 12:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E53898BF;
	Tue, 27 Aug 2019 10:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2044E898BF;
 Tue, 27 Aug 2019 10:50:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 03:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; d="scan'208";a="182743888"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga003.jf.intel.com with ESMTP; 27 Aug 2019 03:50:48 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Date: Tue, 27 Aug 2019 16:20:08 +0530
Message-Id: <20190827105014.14181-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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

RW5hYmxpbmcgdGhlIEhEQ1AxLjQgYW5kIDIuMiBvbiBUR0wgYnkgc3VwcG9ydGluZyB0aGUgSFcg
YmxvY2sgbW92ZW1lbnQKZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgoKdjEwOgogIFJldmlldyBj
b21tZW50cyBmcm9tIHNoYXNoYW5rIGFkZHJlc3NlZAoKUmFtYWxpbmdhbSBDICg2KToKICBkcm0v
aTkxNTogbWVpX2hkY3A6IEk5MTUgc2VuZHMgZGRpIGluZGV4IGFzIHBlciBNRSBGVwogIGRybTog
TW92ZSBwb3J0IGRlZmluaXRpb24gYmFjayB0byBpOTE1IGhlYWRlcgogIGRybTogRXh0ZW5kIEk5
MTUgbWVpIGludGVyZmFjZSBmb3IgdHJhbnNjb2RlciBpbmZvCiAgbWlzYy9tZWkvaGRjcDogRmls
bCB0cmFuc2NvZGVyIGluZGV4IGluIHBvcnQgaW5mbwogIGRybS9pOTE1L2hkY3A6IHVwZGF0ZSBj
dXJyZW50IHRyYW5zY29kZXIgaW50byBpbnRlbF9oZGNwCiAgZHJtL2k5MTUvaGRjcDogRW5hYmxl
IEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9iaW9zLmggICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5oICB8ICAxOCArKwogLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV90eXBlcy5oICAgIHwgICA3ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYyAgICAgICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwLmggICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9o
ZGNwLmMgICAgIHwgMjEyICsrKysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZGNwLmggICAgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGRtaS5jICAgICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9oZG1pLmggICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfaG90cGx1Zy5oICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Nkdm8uaCAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcu
aCAgICAgICAgICAgICAgIHwgMTI0ICsrKysrKysrKy0KIGRyaXZlcnMvbWlzYy9tZWkvaGRjcC9t
ZWlfaGRjcC5jICAgICAgICAgICAgICB8ICA0NSArKy0tCiBkcml2ZXJzL21pc2MvbWVpL2hkY3Av
bWVpX2hkY3AuaCAgICAgICAgICAgICAgfCAgMTYgKy0KIGluY2x1ZGUvZHJtL2k5MTVfZHJtLmgg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxOCAtLQogaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRj
cF9pbnRlcmZhY2UuaCAgICAgICAgIHwgIDI5ICsrLQogMTYgZmlsZXMgY2hhbmdlZCwgMzcyIGlu
c2VydGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
