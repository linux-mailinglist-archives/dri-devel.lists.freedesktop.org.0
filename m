Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F769B09
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BADB89AC9;
	Mon, 15 Jul 2019 18:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B704689AC2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:53:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 11:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="178303818"
Received: from ldmartin-desk1.jf.intel.com (HELO ldmartin-desk1.intel.com)
 ([10.24.9.35])
 by orsmga002.jf.intel.com with ESMTP; 15 Jul 2019 11:53:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 3/3] intel: Add support for EHL
Date: Mon, 15 Jul 2019 11:53:32 -0700
Message-Id: <20190715185332.10615-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715185332.10615-1-lucas.demarchi@intel.com>
References: <20190715185332.10615-1-lucas.demarchi@intel.com>
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
Cc: James Ausmus <james.ausmus@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgoKQWRkIHRoZSBQQ0kg
SUQgaW1wb3J0IGZvciBFSEwuCgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBBdXNtdXMgPGphbWVzLmF1c211c0BpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
PgotLS0KIGludGVsL2ludGVsX2NoaXBzZXQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW50ZWwvaW50ZWxfY2hpcHNldC5jIGIvaW50ZWwvaW50
ZWxfY2hpcHNldC5jCmluZGV4IDE1N2MyYzdkLi5mNmUzN2VlNyAxMDA2NDQKLS0tIGEvaW50ZWwv
aW50ZWxfY2hpcHNldC5jCisrKyBiL2ludGVsL2ludGVsX2NoaXBzZXQuYwpAQCAtMzYsNiArMzYs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2UgewogfSBwY2lpZHNbXSA9IHsKIAkv
KiBLZWVwIGlkcyBzb3J0ZWQgYnkgZ2VuOyBsYXRlc3QgZ2VuIGZpcnN0ICovCiAJSU5URUxfVEdM
XzEyX0lEUygxMiksCisJSU5URUxfRUhMX0lEUygxMSksCiAJSU5URUxfSUNMXzExX0lEUygxMSks
CiAJSU5URUxfQ05MX0lEUygxMCksCiAJSU5URUxfQ0ZMX0lEUyg5KSwKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
