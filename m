Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B961EE9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07D989D63;
	Mon,  8 Jul 2019 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEE189D61;
 Mon,  8 Jul 2019 12:53:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 05:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="170278454"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 08 Jul 2019 05:53:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 15:53:52 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/19] drm/i915: Add debugs to distingiush a cd2x update from
 a full cdclk pll update
Date: Mon,  8 Jul 2019 15:53:15 +0300
Message-Id: <20190708125325.16576-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRv
IG1ha2UgdGhlIGxvZ3MgYSBiaXQgbGVzcyBjb25mdXNpbmcgbGV0J3MgdG9zcyBpbiBzb21lCmRl
YnVnIHByaW50cyB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBjZGNsayByZXByb2dyYW1taW5nCmlz
IGdvaW5nIHRvIGhhcHBlbiB3aXRoIGEgc2luZ2xlIHBpcGUgYWN0aXZlIG9yIHdoZXRoZXIgd2UK
bmVlZCB0byB0dXJuIGFsbCBwaXBlcyBvZmYgZm9yIHRoZSBkdXJhdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jIHwgNSArKysrKwogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfY2RjbGsuYwppbmRleCBjN2M0NmIzODI3MzguLmYyOTEwYzBjM2UzZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYwpAQCAtMjY5Niw2ICsyNjk2
LDkgQEAgaW50IGludGVsX21vZGVzZXRfY2FsY19jZGNsayhzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSkKIAkJCXJldHVybiByZXQ7CiAKIAkJc3RhdGUtPmNkY2xrLnBpcGUgPSBwaXBl
OworCisJCURSTV9ERUJVR19LTVMoIkNhbiBjaGFuZ2UgY2RjbGsgd2l0aCBwaXBlICVjIGFjdGl2
ZVxuIiwKKwkJCSAgICAgIHBpcGVfbmFtZShwaXBlKSk7CiAJfSBlbHNlIGlmIChpbnRlbF9jZGNs
a19uZWVkc19tb2Rlc2V0KCZkZXZfcHJpdi0+Y2RjbGsuYWN0dWFsLAogCQkJCQkgICAgICZzdGF0
ZS0+Y2RjbGsuYWN0dWFsKSkgewogCQlyZXQgPSBpbnRlbF9tb2Rlc2V0X2FsbF9waXBlcyhzdGF0
ZSk7CkBAIC0yNzAzLDYgKzI3MDYsOCBAQCBpbnQgaW50ZWxfbW9kZXNldF9jYWxjX2NkY2xrKHN0
cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlKQogCQkJcmV0dXJuIHJldDsKIAogCQlzdGF0
ZS0+Y2RjbGsucGlwZSA9IElOVkFMSURfUElQRTsKKworCQlEUk1fREVCVUdfS01TKCJNb2Rlc2V0
IHJlcXVpcmVkIGZvciBjZGNsayBjaGFuZ2VcbiIpOwogCX0KIAogCURSTV9ERUJVR19LTVMoIk5l
dyBjZGNsayBjYWxjdWxhdGVkIHRvIGJlIGxvZ2ljYWwgJXUga0h6LCBhY3R1YWwgJXUga0h6XG4i
LAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
