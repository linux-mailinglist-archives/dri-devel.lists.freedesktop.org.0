Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A3366F3A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428C489A72;
	Wed, 21 Apr 2021 15:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DB389A72;
 Wed, 21 Apr 2021 15:34:05 +0000 (UTC)
IronPort-SDR: QTcjCF9tdORWhTsN1p3CDDb+iHfgjpIobeT9V4jtL4uptiVKuTVgwXEP8uU8CdeYFy9/hmFlHe
 fkRe4oK93M9A==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="259671624"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="259671624"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 08:34:04 -0700
IronPort-SDR: dCCfnlxXCyFzqFwNwg0NZdAHRvhaBX+7rj72B21XPh4r+6hXtSLLvvjeASOipGDTedzLwASvq7
 4TDXK5uY6DZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; d="scan'208";a="455385225"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 21 Apr 2021 08:34:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 21 Apr 2021 18:34:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915: Fix older platforms
Date: Wed, 21 Apr 2021 18:33:57 +0300
Message-Id: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkZp
eCBhIGRpdi1ieS16ZXJvIG9uIGdlbjIsIGFuZCBtYWtlIHRoZSBMLXNoYXBlZCBtZW1vcnkgZGV0
ZWN0aW9uCmFjdHVhbGx5IHdvcmsgb24gY2wvY3RnLiBBdG0gdGhlIFNXSVpaTEVfVU5LTk9XTiBz
dHVmZiBqdXN0IHRyaXBzCnNvbWUgR0VNX0JVR19PTnMuIFRoaXMgZG9lc24ndCBmaXggdGhvc2Ug
YnV0IHNpbmNlIEkgcG9wdWxhdGUgYWxsCm15IG1lbW9yeSBjaGFubmVscyBzeW1tZXRyaWNhbGx5
IEkgZ2V0IHRvIGF2b2lkIHRoZSBHRU1fQlVHX09OcwpieSBjb3JyZWN0bHkgZGV0ZWN0aW5nIHRo
YXQgSSBkb24ndCBoYXZlIGFuIEwtc2hhcGVkIG1lbW9yeQpjb25maWd1cmF0aW9uLgoKVmlsbGUg
U3lyasOkbMOkICg0KToKICBkcm0vaTkxNTogQXZvaWQgZGl2LWJ5LXplcm8gb24gZ2VuMgogIGRy
bS9pOTE1OiBSZWFkIEMwRFJCMy9DMURSQjMgYXMgMTYgYml0cyBhZ2FpbgogIGRybS9pOTE1OiBH
aXZlIEMwRFJCMy9DMURSQjMgYSBfQlcgc3VmZml4CiAgZHJtL2k5MTU6IFJld3JpdGUgQ0wvQ1RH
IEwtc2hhcGVkIG1lbW9yeSBkZXRlY3Rpb24KCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fbW1hbi5jICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9n
Z3R0X2ZlbmNpbmcuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZGVidWdmcy5jICAgICAgICAgIHwgMTYgKysrKysrKysrKysrLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgfCAgOCArKysrKystLQogNCBm
aWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIAoyLjI2
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
