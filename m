Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94CAB405
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 10:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E326E1E9;
	Fri,  6 Sep 2019 08:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC85F6E1B9;
 Fri,  6 Sep 2019 08:28:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 01:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="195378378"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com ([10.237.72.89])
 by orsmga002.jf.intel.com with ESMTP; 06 Sep 2019 01:28:45 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/3] Send a hotplug when edid changes
Date: Fri,  6 Sep 2019 11:26:33 +0300
Message-Id: <20190906082636.3103-1-stanislav.lisovskiy@intel.com>
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
Cc: simon.ser@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, martin.peres@intel.com,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
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
ZCBoZWxwZXIgdG8gY29tcGFyZSBlZGlkcy4KICBkcm06IEludHJvZHVjZSBlcG9jaCBjb3VudGVy
IHRvIGRybV9jb25uZWN0b3IKICBkcm0vaTkxNTogU2VuZCBob3RwbHVnIGV2ZW50IGlmIGVkaWQg
aGFkIGNoYW5nZWQKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAg
ICB8IDE2ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAgICAgICAg
ICAgICAgfCAzNiArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2Jl
X2hlbHBlci5jICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYyB8IDE4ICsrKysrKystLS0KIGluY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAgICAgIHwgIDMgKysKIGluY2x1ZGUv
ZHJtL2RybV9lZGlkLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysKIDYgZmlsZXMg
Y2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
