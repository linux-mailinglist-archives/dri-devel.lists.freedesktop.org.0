Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662DA079F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 18:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456589DA7;
	Wed, 28 Aug 2019 16:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534BF89D79;
 Wed, 28 Aug 2019 16:42:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 09:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="197593730"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2019 09:42:49 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v12 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Date: Wed, 28 Aug 2019 22:12:10 +0530
Message-Id: <20190828164216.405-1-ramalingam.c@intel.com>
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
YmxvY2sgbW92ZW1lbnQKZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgoKdjEyOgogIHItYiBhbmQg
YWNrIGFyZSBjb2xsZWN0ZWQuCiAgZmV3IHJldmlldyBjb21tZW50cyBhcmUgYWRkcmVzc2VkLgoK
UmFtYWxpbmdhbSBDICg2KToKICBkcm0vaTkxNTogbWVpX2hkY3A6IEk5MTUgc2VuZHMgZGRpIGlu
ZGV4IGFzIHBlciBNRSBGVwogIGRybTogTW92ZSBwb3J0IGRlZmluaXRpb24gYmFjayB0byBpOTE1
IGhlYWRlcgogIGRybTogRXh0ZW5kIEk5MTUgbWVpIGludGVyZmFjZSBmb3IgdHJhbnNjb2RlciBp
bmZvCiAgbWlzYy9tZWkvaGRjcDogRmlsbCB0cmFuc2NvZGVyIGluZGV4IGluIHBvcnQgaW5mbwog
IGRybS9pOTE1L2hkY3A6IHVwZGF0ZSBjdXJyZW50IHRyYW5zY29kZXIgaW50byBpbnRlbF9oZGNw
CiAgZHJtL2k5MTUvaGRjcDogRW5hYmxlIEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrCgogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmggICAgIHwgICAzICstCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCAgfCAgMjAgKy0KIC4uLi9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgNyArCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgIDMgKwogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jICAgICB8IDIxNCArKysrKysrKysrKysrLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5oICAgICB8ICAgNCAr
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICAgfCAgMTMgKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5oICAgICB8ICAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuaCAgfCAgIDEgKwogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmggICAgIHwgICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgICB8IDEyNCArKysrKysrKyst
CiBkcml2ZXJzL21pc2MvbWVpL2hkY3AvbWVpX2hkY3AuYyAgICAgICAgICAgICAgfCAgNDUgKyst
LQogZHJpdmVycy9taXNjL21laS9oZGNwL21laV9oZGNwLmggICAgICAgICAgICAgIHwgIDE3ICst
CiBpbmNsdWRlL2RybS9pOTE1X2RybS5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTggLS0K
IGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggICAgICAgICB8ICA0MiArKyst
CiAxNiBmaWxlcyBjaGFuZ2VkLCAzODkgaW5zZXJ0aW9ucygrKSwgMTI1IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
