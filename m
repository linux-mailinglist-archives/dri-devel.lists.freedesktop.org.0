Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C66283E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 20:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979C06E02F;
	Mon,  8 Jul 2019 18:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458D66E02F;
 Mon,  8 Jul 2019 18:20:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 11:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="176240716"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga002.jf.intel.com with ESMTP; 08 Jul 2019 11:20:05 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v9 0/6] HDCP2.2 Phase II
Date: Mon,  8 Jul 2019 16:51:10 +0530
Message-Id: <20190708112116.1780-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.19.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkaW5nIHRoZSB1QVBJIHN1cHBvcnQgZm9yIHRoZSBIRENQIGNvbnRlbnQgdHlwZSBpcyB0aGUg
bWFpbiBmb2N1cwpoZXJlLiBBbG9uZyB3aXRoIHRoYXQgdWV2ZW50IGlzIGltcGxlbWVudGVkIGZv
ciB0aGUKIkNvbnRlbnQgUHJvdGVjdGlvbiIgc3RhdGUgY2hhbmdlIHRoYXQgZ290IHRyaWdnZXJl
ZCBieSBrZXJuZWwuCgp2OToKICBLRG9jIGltcHJvdmVtZW50cyBbcGVra2FdCgpSYW1hbGluZ2Ft
IEMgKDYpOgogIGRybTogQWRkIENvbnRlbnQgcHJvdGVjdGlvbiB0eXBlIHByb3BlcnR5CiAgZHJt
L2k5MTU6IEF0dGFjaCBjb250ZW50IHR5cGUgcHJvcGVydHkKICBkcm06IHVldmVudCBmb3IgY29u
bmVjdG9yIHN0YXR1cyBjaGFuZ2UKICBkcm0vaGRjcDogdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlv
biBwcm9wZXJ0eSB3aXRoIHVldmVudAogIGRybS9pOTE1OiB1cGRhdGUgdGhlIGhkY3Agc3RhdGUg
d2l0aCB1ZXZlbnQKICBkcm0vaGRjcDogcmVmZXJlbmNlIGZvciBzcm0gZmlsZSBmb3JtYXQKCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgICAgICAgICB8ICA0ICsrCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKy0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYyAgICAgICAgICAgICAgICB8IDc3ICsrKysrKysr
KysrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgICAgICAgICAgICAg
ICB8IDM1ICsrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rk
aS5jICB8IDM5ICsrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oZGNwLmMgfCA1MyArKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hkY3AuaCB8ICAyICstCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAg
ICAgICAgICAgICB8ICA3ICsrKwogaW5jbHVkZS9kcm0vZHJtX2hkY3AuaCAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLQogaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgICAgICAgICAg
fCAgNiArKwogaW5jbHVkZS9kcm0vZHJtX3N5c2ZzLmggICAgICAgICAgICAgICAgICAgfCAgNSAr
LQogaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICAgICAgICAgICAgfCAgNCArKwogMTIg
ZmlsZXMgY2hhbmdlZCwgMjU4IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoKLS0gCjIu
MTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
