Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCE2778B1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 20:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158A86EB3F;
	Thu, 24 Sep 2020 18:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816DD6E8D2;
 Thu, 24 Sep 2020 18:48:16 +0000 (UTC)
IronPort-SDR: ZME0iy71M0ISj89Y+2vQys3qRgWpo8nRn5UmqXlLipNGlbKKupCSoXhjEwfqQRVovr9Ev9q5JP
 NsroJ/MlZOwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="222905865"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="222905865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 11:48:15 -0700
IronPort-SDR: jyucHA2vG3hJvsOTIK3JgwOuww26o94rTWGIijUqI/F9nIp+cVMJuMpLZ2DXNBo9a6rGiIxfCD
 nWSlKI5NflAQ==
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="455468985"
Received: from ideak-desk.fi.intel.com (HELO localhost) ([10.237.68.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 11:48:14 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/i915: Add support for LTTPR non-transparent link
 training mode
Date: Thu, 24 Sep 2020 21:47:59 +0300
Message-Id: <20200924184805.294493-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
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

VGhpcyBwYXRjaHNldCBpcyB2MiBvZiBbMV0sIGFkZHJlc3NpbmcgdGhlIGNvbW1lbnRzIGZyb20g
VmlsbGUgYW5kIGFuCmlzc3VlIGluIHRoZSBsYXN0IHBhdGNoIHdpdGggdGhlIHBlci1QSFkgY2Fw
YWJpbGl0eSByZWFkb3V0IChuZWVkcyB0byBiZQpkb25lIGFmdGVyIHN3aXRjaGluZyB0byBub24t
dHJhbnNwYXJlbnQgbW9kZSkuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy84MTk2OC8KCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKSW1yZSBEZWFr
ICg2KToKICBkcm0vaTkxNTogRml4IERQIGxpbmsgdHJhaW5pbmcgcGF0dGVybiBtYXNrCiAgZHJt
L2k5MTU6IFNpbXBsaWZ5IHRoZSBsaW5rIHRyYWluaW5nIGZ1bmN0aW9ucwogIGRybS9pOTE1OiBG
YWN0b3Igb3V0IGEgaGVscGVyIHRvIGRpc2FibGUgdGhlIERQQ0QgdHJhaW5pbmcgcGF0dGVybgog
IGRybS9kcDogQWRkIExUVFBSIGhlbHBlcnMKICBkcm0vaTkxNTogU3dpdGNoIHRvIExUVFBSIHRy
YW5zcGFyZW50IG1vZGUgbGluayB0cmFpbmluZwogIGRybS9pOTE1OiBTd2l0Y2ggdG8gTFRUUFIg
bm9uLXRyYW5zcGFyZW50IG1vZGUgbGluayB0cmFpbmluZwoKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMgICAgICAgICAgICAgICB8IDI0NCArKysrKysrKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgICAgICB8ICAgMyArLQogLi4uL2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICB8ICA0NiArLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAzIC0KIC4uLi9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwX2xpbmtfdHJhaW5pbmcuYyB8IDQ4NiArKysrKysrKysrKysrKystLS0KIC4uLi9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xpbmtfdHJhaW5pbmcuaCB8ICAxMyArLQogaW5jbHVk
ZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICAgICAgICAgIHwgIDYyICsrKwogOCBmaWxl
cyBjaGFuZ2VkLCA3NTAgaW5zZXJ0aW9ucygrKSwgMTA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUu
MQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
