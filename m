Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263F99FBB1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 09:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C235889A56;
	Wed, 28 Aug 2019 07:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032989A56;
 Wed, 28 Aug 2019 07:29:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 00:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="192499908"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga002.jf.intel.com with ESMTP; 28 Aug 2019 00:28:57 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v11 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Date: Wed, 28 Aug 2019 12:58:17 +0530
Message-Id: <20190828072823.4832-1-ramalingam.c@intel.com>
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
YmxvY2sgbW92ZW1lbnQKZnJvbSBEREkgaW50byB0cmFuc2NvZGVyLgoKdjExOgogIFJldmlldyBj
b21tZW50cyBmcm9tIFRvbWFzIGlzIGFkZHJlc3NlZC4KClJhbWFsaW5nYW0gQyAoNik6CiAgZHJt
L2k5MTU6IG1laV9oZGNwOiBJOTE1IHNlbmRzIGRkaSBpbmRleCBhcyBwZXIgTUUgRlcKICBkcm06
IE1vdmUgcG9ydCBkZWZpbml0aW9uIGJhY2sgdG8gaTkxNSBoZWFkZXIKICBkcm06IEV4dGVuZCBJ
OTE1IG1laSBpbnRlcmZhY2UgZm9yIHRyYW5zY29kZXIgaW5mbwogIG1pc2MvbWVpL2hkY3A6IEZp
bGwgdHJhbnNjb2RlciBpbmRleCBpbiBwb3J0IGluZm8KICBkcm0vaTkxNS9oZGNwOiB1cGRhdGUg
Y3VycmVudCB0cmFuc2NvZGVyIGludG8gaW50ZWxfaGRjcAogIGRybS9pOTE1L2hkY3A6IEVuYWJs
ZSBIRENQIDEuNCBhbmQgMi4yIG9uIEdlbjEyKwoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYmlvcy5oICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmggIHwgIDIwICstCiAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmggICAgfCAgIDcgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuaCAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hkY3AuYyAgICAgfCAyMTUgKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hkY3AuaCAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZG1pLmMgICAgIHwgIDEzICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2hkbWkuaCAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9ob3RwbHVnLmggIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfc2R2by5oICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Jl
Zy5oICAgICAgICAgICAgICAgfCAxMjQgKysrKysrKysrLQogZHJpdmVycy9taXNjL21laS9oZGNw
L21laV9oZGNwLmMgICAgICAgICAgICAgIHwgIDQ1ICsrLS0KIGRyaXZlcnMvbWlzYy9tZWkvaGRj
cC9tZWlfaGRjcC5oICAgICAgICAgICAgICB8ICAxNyArLQogaW5jbHVkZS9kcm0vaTkxNV9kcm0u
aCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE4IC0tCiBpbmNsdWRlL2RybS9pOTE1X21laV9o
ZGNwX2ludGVyZmFjZS5oICAgICAgICAgfCAgNDIgKysrLQogMTYgZmlsZXMgY2hhbmdlZCwgMzkw
IGluc2VydGlvbnMoKyksIDEyNSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
