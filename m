Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26733004
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130D389269;
	Mon,  3 Jun 2019 12:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841EE89269;
 Mon,  3 Jun 2019 12:44:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 05:44:20 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.143])
 by orsmga004.jf.intel.com with ESMTP; 03 Jun 2019 05:44:16 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v2 0/3] Document fixes for DRM UAPI and HDR
Date: Mon,  3 Jun 2019 18:38:47 +0530
Message-Id: <1559567330-25182-1-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
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
Cc: jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBEUk0gVUFQSSBoZWFkZXIgc3RydWN0dXJlIGRvY3VtZW50YXRpb24g
dG8ga2VybmVsCmRvY3MuIEZpeGVzIGlzc3VlcyB3aXRoIGV4aXN0aW5nIHN0cnVjdHVyZSBkb2N1
bWVudGF0aW9uIGluIGRybQp1YXBpIGhlYWRlci4KClRoaXMgYWxzbyBmaXhlcyB3YXJuaW5ncyBp
biBIRFIgZG9jIGFuZCBhZGRyZXNzZXMgc3VnZ2VzdGlvbnMgZnJvbQpEYW5pZWwgVmV0dGVyLgoK
djI6IDIgcGF0Y2hlcyBmcm9tIHYxIGFyZSBtZXJnZWQuIFRoaXMgc2VyaWVzIHZlcnNpb24gYWRk
cyByZW1haW5pbmcKb24gdG9wIG9mIHRoYXQuIEFkZHJlc3NlZCByZXZpZXcgY29tbWVudHMgZnJv
bSBEYW5pZWwgVmV0dGVyLgoKVW1hIFNoYW5rYXIgKDMpOgogIGRybTogQUREIFVBUEkgc3RydWN0
dXJlIGRlZmluaXRpb24gc2VjdGlvbiBpbiBrZXJuZWwgZG9jCiAgZHJtOiBGaXggZG9jYm9vayB3
YXJuaW5ncyBpbiBoZHIgbWV0YWRhdGEgaGVscGVyIHN0cnVjdHVyZXMKICB2aWRlby9oZG1pOiBE
cm9wcGVkIHN0YXRpYyBmdW5jdGlvbnMgZnJvbSBrZXJuZWwgZG9jCgogRG9jdW1lbnRhdGlvbi9n
cHUvZHJtLXVhcGkucnN0ICB8ICA5ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3ZpZGVvL2hkbWkuYyAgICAg
ICAgICAgIHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aCAgICAgfCAgMSArCiBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCAgIHwgIDQgKy0tCiBp
bmNsdWRlL2xpbnV4L2hkbWkuaCAgICAgICAgICAgIHwgMTIgKysrKysrKwogaW5jbHVkZS91YXBp
L2RybS9kcm1fbW9kZS5oICAgICB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystCiA3IGZpbGVzIGNoYW5nZWQsIDEzNCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlv
bnMoLSkKCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
