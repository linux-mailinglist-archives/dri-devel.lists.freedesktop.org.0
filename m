Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF4997EB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 17:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411456E509;
	Thu, 22 Aug 2019 15:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00B46E509;
 Thu, 22 Aug 2019 15:19:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="181415384"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 08:19:42 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Date: Thu, 22 Aug 2019 20:48:58 +0530
Message-Id: <20190822151904.17919-1-ramalingam.c@intel.com>
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
YmxvY2sgbW92ZW1lbnQKZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgoKdjk6CiAgcy90cmFucy9j
cHVfdHJhbnNjb2RlcgogIGVudW0gcG9ydCBhbmQgdHJhbnNjb2RlcnMgYXJlIGRlY2xhcmVkIGF0
IGZldyBoZWFkZXJzLgoKUmFtYWxpbmdhbSBDICg2KToKICBkcm0vaTkxNTogbWVpX2hkY3A6IEk5
MTUgc2VuZHMgZGRpIGluZGV4IGFzIHBlciBNRSBGVwogIGRybTogTW92ZSBwb3J0IGRlZmluaXRp
b24gYmFjayB0byBpOTE1IGhlYWRlcgogIGRybTogRXh0ZW5kIEk5MTUgbWVpIGludGVyZmFjZSBm
b3IgdHJhbnNjb2RlciBpbmZvCiAgbWlzYy9tZWkvaGRjcDogRmlsbCB0cmFuc2NvZGVyIGluZGV4
IGluIHBvcnQgaW5mbwogIGRybS9pOTE1L2hkY3A6IHVwZGF0ZSBjdXJyZW50IHRyYW5zY29kZXIg
aW50byAgaW50ZWxfaGRjcAogIGRybS9pOTE1L2hkY3A6IEVuYWJsZSBIRENQIDEuNCBhbmQgMi4y
IG9uIEdlbjEyKwoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5oICAg
ICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCAg
fCAgMTggKysKIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8
ICAgNyArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAg
IDMgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jICAgICB8IDIxMCAr
KysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRj
cC5oICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWku
YyAgICAgfCAgMTMgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5o
ICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcu
aCAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmggICAg
IHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgICB8
IDEyNCArKysrKysrKysrLQogZHJpdmVycy9taXNjL21laS9oZGNwL21laV9oZGNwLmMgICAgICAg
ICAgICAgIHwgIDQ1ICsrLS0KIGRyaXZlcnMvbWlzYy9tZWkvaGRjcC9tZWlfaGRjcC5oICAgICAg
ICAgICAgICB8ICAxNiArLQogaW5jbHVkZS9kcm0vaTkxNV9kcm0uaCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDE4IC0tCiBpbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oICAg
ICAgICAgfCAgMjkgKystCiAxNiBmaWxlcyBjaGFuZ2VkLCAzNzIgaW5zZXJ0aW9ucygrKSwgMTIw
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
