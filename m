Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E22E555
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 21:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6DB6E0A0;
	Wed, 29 May 2019 19:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C559A6E095;
 Wed, 29 May 2019 19:31:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 12:31:27 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2019 12:31:23 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] Document fixes for DRM UAPI and HDR
Date: Thu, 30 May 2019 01:29:00 +0530
Message-Id: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
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
QWxzbyBkcm9wcGVkIHN0YXRpYyBmdW5jdGlvbiBkb2N1bWVudGF0aW9uIGluIGhkbWkgY29yZS4K
ClVtYSBTaGFua2FyICg0KToKICBkcm06IERyb3AgYSByZWR1bmRhbnQgdW51c2VkIHZhcmlhYmxl
CiAgZHJtOiBGaXggZG9jYm9vayB3YXJuaW5ncyBpbiBoZHIgbWV0YWRhdGEgaGVscGVyIHN0cnVj
dHVyZXMKICBkcm06IEZpeGVkIGRvYyB3YXJuaW5ncyBpbiBkcm0gdWFwaSBoZWFkZXIKICB2aWRl
by9oZG1pOiBEcm9wcGVkIHN0YXRpYyBmdW5jdGlvbnMgZnJvbSBrZXJuZWwgZG9jCgogRG9jdW1l
bnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0ICB8ICA5ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3ZpZGVv
L2hkbWkuYyAgICAgICAgICAgIHwgMzIgKysrKysrKysrKystLS0tLS0tLS0tLQogaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8ICAzICstLQogaW5jbHVkZS9kcm0vZHJtX21vZGVfY29u
ZmlnLmggICB8ICA0ICstLQogaW5jbHVkZS9saW51eC9oZG1pLmggICAgICAgICAgICB8ICAxICsK
IGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCAgICAgfCA1OSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQogNyBmaWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pCgotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
