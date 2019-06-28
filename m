Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0B595FF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12466E87D;
	Fri, 28 Jun 2019 08:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408706E851;
 Fri, 28 Jun 2019 08:25:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 01:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="170688043"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com
 ([10.237.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2019 01:25:43 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] Send a hotplug when edid changes
Date: Fri, 28 Jun 2019 11:24:51 +0300
Message-Id: <20190628082454.16345-1-stanislav.lisovskiy@intel.com>
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
Cc: paul.kocialkowski@bootlin.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, martin.peres@intel.com,
 Stanislav.Lisovskiy@intel.com, simon.ser@intel.com, jani.saarinen@intel.com
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
fCAzMyArKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxw
ZXIuYyAgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAxNiArKysrKysrKystCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICB8IDE2ICsrKysrKysrLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5jIHwgMjAgKysrKysrKysrLS0tCiBp
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAgICAgICB8ICAzICsrCiBpbmNs
dWRlL2RybS9kcm1fZWRpZC5oICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrKwogOCBm
aWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
