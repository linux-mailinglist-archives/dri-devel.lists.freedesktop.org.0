Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F62BE01A0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7179F6E54C;
	Tue, 22 Oct 2019 10:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12536E53E;
 Tue, 22 Oct 2019 10:09:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:09:56 -0700
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="191414005"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:09:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/dsi: cleanups and compression helpers
Date: Tue, 22 Oct 2019 13:09:42 +0300
Message-Id: <cover.1571738674.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBjbGVhbnVwIGFuZCBwcmVwIHdvcmsgZm9yIGNvbXByZXNzaW9uLiBVc2VycyBmb3IgdGhl
c2UgYXJlIGluIHRoZQp3b3JrcywgYnV0IGhvcGVmdWxseSB3ZSBjYW4gcHJvY2VlZCB3aXRoIHRo
aXMgYWxyZWFkeS4gU2hvdWxkIGJlIHByZXR0eQpzdHJhaWdodGZvcndhcmQuCgpCUiwKSmFuaS4K
CkphbmkgTmlrdWxhICg1KToKICBkcm0vZHNpOiBjbGVhbiB1cCBEU0kgZGF0YSB0eXBlIGRlZmlu
aXRpb25zCiAgZHJtL2RzaTogYWRkIG1pc3NpbmcgRFNJIGRhdGEgdHlwZXMKICBkcm0vZHNpOiBh
ZGQgbWlzc2luZyBEU0kgRENTIGNvbW1hbmRzCiAgZHJtL2RzaTogcmVuYW1lIE1JUElfRENTX1NF
VF9QQVJUSUFMX0FSRUEgdG8gTUlQSV9EQ1NfU0VUX1BBUlRJQUxfUk9XUwogIGRybS9kc2k6IGFk
ZCBoZWxwZXJzIGZvciBEU0kgY29tcHJlc3Npb24gbW9kZSBhbmQgUFBTIHBhY2tldHMKCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueS9zdDc1ODYuYyAgfCAgMiArLQogaW5jbHVk
ZS9kcm0vZHJtX21pcGlfZHNpLmggICAgIHwgIDQgKysrCiBpbmNsdWRlL3ZpZGVvL21pcGlfZGlz
cGxheS5oICAgfCAyNCArKysrKysrKysrKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
