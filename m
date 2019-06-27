Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C257C9F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F756E5B5;
	Thu, 27 Jun 2019 07:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C126E5B3;
 Thu, 27 Jun 2019 07:01:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="167332985"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com
 ([10.237.66.154])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2019 00:01:07 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/3] Send a hotplug when edid changes
Date: Thu, 27 Jun 2019 10:00:14 +0300
Message-Id: <20190627070016.7047-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 martin.peres@intel.com, Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlIHRvIGRybSBhIHdheSB0byBkZXRlcm1pbmUgaWYgc29tZXRo
aW5nIGVsc2UKZXhjZXB0IGNvbm5lY3Rpb25fc3RhdHVzIGhhZCBjaGFuZ2VkIGR1cmluZyBwcm9i
aW5nLCB3aGljaApjYW4gYmUgdXNlZCBieSBvdGhlciBkcml2ZXJzIGFzIHdlbGwuIEFub3RoZXIg
aTkxNSBzcGVjaWZpYyBwYXJ0CnVzZXMgdGhpcyBhcHByb2FjaCB0byBkZXRlcm1pbmUgaWYgZWRp
ZCBoYWQgY2hhbmdlZCB3aXRob3V0CmNoYW5naW5nIHRoZSBjb25uZWN0aW9uIHN0YXR1cyBhbmQg
c2VuZCBhIGhvdHBsdWcgZXZlbnQuCgpTdGFuaXNsYXYgTGlzb3Zza2l5ICgzKToKICBkcm06IEFk
ZCBoZWxwZXIgdG8gY29tcGFyZSBlZGlkcy4KICBkcm06IEludHJvZHVjZSBjaGFuZ2UgY291bnRl
ciB0byBkcm1fY29ubmVjdG9yCiAgZHJtL2k5MTU6IFNlbmQgaG90cGx1ZyBldmVudCBpZiBlZGlk
IGhhZCBjaGFuZ2VkLgoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgICAgICAgICAg
ICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAgICAgICAgICAgICAg
fCAyNiArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVy
LmMgICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgIHwgMTYgKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgIHwgMTYgKysrKysrKysrLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5jIHwgMjAgKysrKysrKysrKy0t
LS0KIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAgICAgIHwgIDIgKysK
IGluY2x1ZGUvZHJtL2RybV9lZGlkLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIDgg
ZmlsZXMgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
