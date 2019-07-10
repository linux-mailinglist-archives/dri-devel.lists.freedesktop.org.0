Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F964640
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8A189949;
	Wed, 10 Jul 2019 12:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90C189949;
 Wed, 10 Jul 2019 12:36:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:36:42 -0700
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="170906898"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:36:39 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: [RFC PATCH 0/6] Rename functions to match their entry points
Date: Wed, 10 Jul 2019 14:36:25 +0200
Message-Id: <20190710123631.26575-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVlZCBmb3IgdGhpcyB3YXMgaWRlbnRpZmllZCB3aGlsZSB3b3JraW5nIG9uIHNwbGl0IG9mIGRy
aXZlciB1bmJpbmQKcGF0aCBpbnRvIF9yZW1vdmUoKSBhbmQgX3JlbGVhc2UoKSBwYXJ0cy4gIENv
bnNpc3RlbmN5IGluIGZ1bmN0aW9uCm5hbWluZyBoYXMgYmVlbiByZWNvZ25pemVkIGFzIGhlbHBm
dWwgd2hlbiB0cnlpbmcgdG8gd29yayBvdXQgd2hpY2gKcGhhc2UgdGhlIGNvZGUgaXMgaW4uCgpX
aGF0IEknbSBzdGlsbCBub3Qgc3VyZSBhYm91dCBpcyBkZXNpcmVkIGRlcHRoIG9mIHRoYXQgbW9k
aWZpY2F0aW9uIC0KaG93IGRlZXAgc2hvdWxkIHdlIGdvIGRvd24gd2l0aCByZW5hbWluZyB0byBu
b3Qgb3ZlcnJpZGUgbWVhbmluZ2Z1bGwKZnVuY3Rpb24gbmFtZXMuICBQbGVhc2UgYWR2aXNlIGlm
IHlvdSB0aGluayBzdGlsbCBtb3JlIGRlZXAgcmVuYW1pbmcKbWFrZXMgc2Vuc2UuCgpUaGFua3Ms
CkphbnVzegoKSmFudXN6IEtyenlzenRvZmlrICg2KToKICBkcm0vaTkxNTogUmVuYW1lICJfbG9h
ZCIvIl91bmxvYWQiIHRvIG1hdGNoIFBDSSBlbnRyeSBwb2ludHMKICBkcm0vaTkxNTogUmVwbGFj
ZSAiX2xvYWQiIHdpdGggIl9wcm9iZSIgY29uc2VxdWVudGx5CiAgZHJtL2k5MTU6IFByb3BhZ2F0
ZSAiX3JlbGVhc2UiIGZ1bmN0aW9uIG5hbWUgc3VmZml4IGRvd24KICBkcm0vaTkxNTogUHJvcGFn
YXRlICJfcmVtb3ZlIiBmdW5jdGlvbiBuYW1lIHN1ZmZpeCBkb3duCiAgZHJtL2k5MTU6IFByb3Bh
Z2F0ZSAiX3Byb2JlIiBmdW5jdGlvbiBuYW1lIHN1ZmZpeCBkb3duCiAgZHJtL2k5MTU6IFJlbmFt
ZSAiaW5qZWN0X2xvYWRfZmFpbHVyZSIgbW9kdWxlIHBhcmFtZXRlcgoKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jICAgICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9iaW9zLmggICAgIHwgICAyICstCiAuLi4vZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29ubmVjdG9yLmMgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jICB8ICAgMiArLQogLi4uL2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9wb3dlci5jICAgIHwgICA2ICstCiAuLi4vZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmggICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L2ludGVsX2VuZ2luZV9jcy5jICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9kcnYuYyAgICAgICAgICAgICAgIHwgMTExICsrKysrKysrKy0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgICAgICAgICAgIHwgIDIwICsrLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgICAgICAgICAgICAgICB8ICAxMiArLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuaCAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmMgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9wYXJhbXMuaCAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3BjaS5jICAgICAgICAgICAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2d2dC5jICAgICAgICAgICAgICB8ICAgNyArLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfZ3Z0LmggICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9ydW50aW1lX3BtLmMgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uaCAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfdW5jb3JlLmMgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF93b3BjbS5jICAgICAgICAgICAgfCAgIDIgKy0KIDIxIGZpbGVzIGNoYW5nZWQs
IDEwMCBpbnNlcnRpb25zKCspLCA5OCBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
