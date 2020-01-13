Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66F3138962
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 02:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0E889DC5;
	Mon, 13 Jan 2020 01:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2215E89DC5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 01:58:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jan 2020 17:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,427,1571727600"; d="scan'208";a="247571923"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.9])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2020 17:58:38 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Add 10 bpc quirk for HP z27x monitor
Date: Mon, 13 Jan 2020 17:56:49 +0800
Message-Id: <20200113095649.19491-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Cooper Chiou <cooper.chiou@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm91bmQgRURJRCBieXRlIDE0IHZhbHVlIHdhcyAweDgwIHRoYXQgcmVwb3J0IHVua25vd24gY29s
b3IgZGVwdGguCkJhc2VkIG9uIG1vbml0b3IncyBzcGVjIHRvIGFkZCBpdCBpbnRvIHF1aXJrIGxp
c3QuCgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBDb29wZXIgQ2hpb3Ug
PGNvb3Blci5jaGlvdUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IExlZSBTaGF3biBDIDxzaGF3
bi5jLmxlZUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggNDc0
YWMwNGQ1NjAwLi41OGRmYzYzMzJmZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0xNDAsNiArMTQwLDkg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBlZGlkX3F1aXJrIHsKIAkvKiBMR0QgcGFuZWwgb2YgSFAg
ekJvb2sgMTcgRzIsIGVEUCAxMCBicGMsIGJ1dCByZXBvcnRzIHVua25vd24gYnBjICovCiAJeyAi
TEdEIiwgNzY0LCBFRElEX1FVSVJLX0ZPUkNFXzEwQlBDIH0sCiAKKwkvKiBIUCB6Mjd4IG1vbml0
b3Igc3VwcG9ydCBtYXggMTAgYnBjLCBidXQgcmVwb3J0cyB1bmtub3duIGJwYyAqLworCXsgIkhX
UCIsIDB4MzEwNSwgRURJRF9RVUlSS19GT1JDRV8xMEJQQyB9LAorCiAJLyogTEcgUGhpbGlwcyBM
Q0QgTFAxNTRXMDEtQTUgKi8KIAl7ICJMUEwiLCAwLCBFRElEX1FVSVJLX0RFVEFJTEVEX1VTRV9N
QVhJTVVNX1NJWkUgfSwKIAl7ICJMUEwiLCAweDJhMDAsIEVESURfUVVJUktfREVUQUlMRURfVVNF
X01BWElNVU1fU0laRSB9LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
