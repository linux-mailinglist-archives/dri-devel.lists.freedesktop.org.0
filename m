Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476EA1B75FC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 14:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3957189D44;
	Fri, 24 Apr 2020 12:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3289C0A;
 Fri, 24 Apr 2020 12:54:27 +0000 (UTC)
IronPort-SDR: wkU3+bu1qy0/ZSbVLKPzc/2JcZuuD8LEHGuIo4FLcC0YJY3kxSngJvV59LJEfwJKfRkIZlLRUc
 WYydKDUvb29g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 05:54:26 -0700
IronPort-SDR: Fq4z7d39CnOnztKIEqQ0dweYg0XjLWB5LJRCZ07VLNo14H4LY0s2r+nS1wTLRAd2UjzIpt/xdc
 cdJDq2KsgsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="430756347"
Received: from unknown (HELO jeevan-desktop.iind.intel.com) ([10.223.74.85])
 by orsmga005.jf.intel.com with ESMTP; 24 Apr 2020 05:54:23 -0700
From: Jeevan B <jeevan.b@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: utilize subconnector property for DP
Date: Fri, 24 Apr 2020 18:20:52 +0530
Message-Id: <1587732655-17544-2-git-send-email-jeevan.b@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587732655-17544-1-git-send-email-jeevan.b@intel.com>
References: <1587732655-17544-1-git-send-email-jeevan.b@intel.com>
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
Cc: jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>, uma.shankar@intel.com,
 Oleg Vasilev <oleg.vasilev@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50ZWwuY29tPgoKU2luY2UgRFAtc3Bl
Y2lmaWMgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRyaXZlcidzIHN0cnVjdHVyZXMsIGV2ZXJ5
CmRyaXZlciBuZWVkcyB0byBpbXBsZW1lbnQgc3ViY29ubmVjdG9yIHByb3BlcnR5IGJ5IGl0c2Vs
Zi4KCnYyOiB1cGRhdGVzIHRvIG1hdGNoIHByZXZpb3VzIGNvbW1pdCBjaGFuZ2VzCgp2MzogcmVi
YXNlCgp2NDogcmVuYW1lZCBhIGZ1bmN0aW9uIGNhbGwKCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1i
eTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KVGVzdGVkLWJ5OiBPbGVnIFZh
c2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCA2NmY4
YTlkLi42ZTlkYjkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBA
IC02NDQ4LDYgKzY0NDgsMTEgQEAgaW50ZWxfZHBfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IsCiAJICovCiAJaW50ZWxfZGlzcGxheV9wb3dlcl9mbHVzaF93b3JrKGRldl9w
cml2KTsKIAorCWlmICghaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkKKwkJZHJtX2RwX3NldF9z
dWJjb25uZWN0b3JfcHJvcGVydHkoY29ubmVjdG9yLAorCQkJCQkJIHN0YXR1cywKKwkJCQkJCSBp
bnRlbF9kcC0+ZHBjZCwKKwkJCQkJCSBpbnRlbF9kcC0+ZG93bnN0cmVhbV9wb3J0cyk7CiAJcmV0
dXJuIHN0YXR1czsKIH0KIApAQCAtNzU0Miw2ICs3NTQ3LDkgQEAgaW50ZWxfZHBfYWRkX3Byb3Bl
cnRpZXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3QKIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGNvbm5l
Y3Rvci0+ZGV2KTsKIAllbnVtIHBvcnQgcG9ydCA9IGRwX3RvX2RpZ19wb3J0KGludGVsX2RwKS0+
YmFzZS5wb3J0OwogCisJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQorCQlkcm1fY29u
bmVjdG9yX2F0dGFjaF9kcF9zdWJjb25uZWN0b3JfcHJvcGVydHkoY29ubmVjdG9yKTsKKwogCWlm
ICghSVNfRzRYKGRldl9wcml2KSAmJiBwb3J0ICE9IFBPUlRfQSkKIAkJaW50ZWxfYXR0YWNoX2Zv
cmNlX2F1ZGlvX3Byb3BlcnR5KGNvbm5lY3Rvcik7CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
