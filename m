Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A258102
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 12:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548776E0C4;
	Thu, 27 Jun 2019 10:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052896E0C4;
 Thu, 27 Jun 2019 10:58:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 03:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="183422531"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2019 03:58:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: make drm_panel.h self-contained
Date: Thu, 27 Jun 2019 14:01:03 +0300
Message-Id: <20190627110103.7539-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Boris Brezillon <boris.brezillon@bootlin.com>,
 intel-gfx@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGJ1aWxkIHdhcm5pbmcgaWYgZHJtX3BhbmVsLmggaXMgYnVpbHQgd2l0aCBDT05GSUdfT0Y9
biBvcgpDT05GSUdfRFJNX1BBTkVMPW4gYW5kIGluY2x1ZGVkIHdpdGhvdXQgdGhlIHByZXJlcXVp
c2l0ZSBlcnIuaDoKCi4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6IEluIGZ1bmN0aW9uIOKAmG9m
X2RybV9maW5kX3BhbmVs4oCZOgouL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOjIwMzo5OiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYRVJSX1BUUuKAmSBbLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICByZXR1cm4gRVJSX1BUUigtRU5PREVW
KTsKICAgICAgICAgXn5+fn5+fgouL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOjIwMzo5OiBlcnJv
cjogcmV0dXJuaW5nIOKAmGludOKAmSBmcm9tIGEgZnVuY3Rpb24gd2l0aCByZXR1cm4gdHlwZSDi
gJhzdHJ1Y3QgZHJtX3BhbmVsICrigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91
dCBhIGNhc3QgWy1XZXJyb3I9aW50LWNvbnZlcnNpb25dCiAgcmV0dXJuIEVSUl9QVFIoLUVOT0RF
Vik7CiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KCkZpeGVzOiA1ZmE4ZTRhMjIxODIgKCJkcm0v
cGFuZWw6IE1ha2Ugb2ZfZHJtX2ZpbmRfcGFuZWwoKSByZXR1cm4gYW4gRVJSX1BUUigpIGluc3Rl
YWQgb2YgTlVMTCIpCkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290bGlu
LmNvbT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgotLS0KCkkgZG9uJ3Qga25v
dyBpZiB0aGVyZSdzIGEgY29tYm8gd2hlcmUgdGhpcyBhY3R1YWxseSBmYWlscywgc28gSSdtIG5v
dAphZGRpbmcgY2M6IHN0YWJsZS4gSXQncyBqdXN0IHNvbWV0aGluZyBJIGhpdCB3aGVuIHBsYXlp
bmcgd2l0aCBvdGhlcgpjb2RlLgotLS0KIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fcGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCmluZGV4IDhjNzM4YzBlNmU5Zi4u
MjYzNzc4MzYxNDFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMjQsNiArMjQsNyBAQAogI2lmbmRlZiBfX0RSTV9Q
QU5FTF9IX18KICNkZWZpbmUgX19EUk1fUEFORUxfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC9lcnIu
aD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
