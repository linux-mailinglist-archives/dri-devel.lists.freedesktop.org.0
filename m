Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D39991D2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 13:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CF26E4AE;
	Thu, 22 Aug 2019 11:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7D46E4AE;
 Thu, 22 Aug 2019 11:15:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 04:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="186537449"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2019 04:15:23 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Date: Thu, 22 Aug 2019 16:44:39 +0530
Message-Id: <20190822111445.29350-1-ramalingam.c@intel.com>
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
YmxvY2sgbW92ZW1lbnQKZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgoKdjc6CiAgcG9ydCwgdHJh
bnNjb2RlciBkZWZpbml0aW9ucyBhcmUga2VwdCB3aXRoaW4gSTkxNS4KICBjb3JyZXNwb25kaW5n
IGNoYW5nZXMgaW4gaTkxNS1tZWkgaW50ZXJmYWNlLgoKUmFtYWxpbmdhbSBDICg2KToKICBkcm0v
aTkxNTogbWVpX2hkY3A6IEk5MTUgc2VuZHMgZGRpIGluZGV4IGFzIHBlciBNRSBGVwogIGRybTog
cG9ydCBkZWZpbml0aW9uIGlzIG1vdmVkIGJhY2sgaW50byBpOTE1IGhlYWRlcgogIGRybTogSTkx
NSBtZWkgaW50ZXJmYWNlIGlzIGV4dGVuZGVkIGZvciB0cmFuc2NvZGVyIGluZm8KICBtaXNjL21l
aS9oZGNwOiB0cmFuc2NvZGVyIGluZGV4IGluIHBvcnQgaW5mbwogIGRybS9pOTE1L2hkY3A6IHVw
ZGF0aW5nIHRoZSB0cmFuc2NvZGVyIG9mIHRoZSBoZGNwIHBvcnQKICBkcm0vaTkxNS9oZGNwOiBF
bmFibGUgSERDUCAxLjQgYW5kIDIuMiBvbiBHZW4xMisKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Jpb3MuaCAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmggIHwgIDE4ICsrCiAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X3R5cGVzLmggICAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAuaCAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2hkY3AuYyAgICAgfCAxOTEgKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2hkY3AuaCAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgICAgIHwgIDEyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3JlZy5oICAgICAgICAgICAgICAgfCAxMjQgKysrKysrKysrKystCiBkcml2ZXJzL21p
c2MvbWVpL2hkY3AvbWVpX2hkY3AuYyAgICAgICAgICAgICAgfCAgNDUgKystLS0KIGRyaXZlcnMv
bWlzYy9tZWkvaGRjcC9tZWlfaGRjcC5oICAgICAgICAgICAgICB8ICAxNiArLQogaW5jbHVkZS9k
cm0vaTkxNV9kcm0uaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE4IC0tCiBpbmNsdWRlL2Ry
bS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oICAgICAgICAgfCAgMjkgKystCiAxMyBmaWxlcyBj
aGFuZ2VkLCAzNDggaW5zZXJ0aW9ucygrKSwgMTIwIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
