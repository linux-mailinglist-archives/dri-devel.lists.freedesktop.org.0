Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB42661EFE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FA189DAB;
	Mon,  8 Jul 2019 12:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6D189DB9;
 Mon,  8 Jul 2019 12:54:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 05:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="170278522"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 08 Jul 2019 05:54:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 15:54:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/19] drm/i915: Add support for half float framebuffers on
 snb sprites
Date: Mon,  8 Jul 2019 15:53:25 +0300
Message-Id: <20190708125325.16576-20-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCnNu
YiBzdXBwb3J0cyBmcDE2IHBpeGVsIGZvcm1hdHMgb24gdGhlIHNwcml0ZSBwbGFuZXMuIEV4cG9z
ZSB0aGF0CmNhcGFiaWxpdHkuIE5vdGhpbmcgc3BlY2lhbCBuZWVkcyB0byBiZSBkb25lLCBpdCBq
dXN0IHdvcmtzLgoKdjI6IFJlYmFzZSBvbiB0b3Agb2YgaWNsIGZwMTYKICAgIFNwbGl0IHNuYisg
c3ByaXRlIGJpdHMgaW50byBhIHNlcGFyYXRlIHBhdGNoCgpSZXZpZXdlZC1ieTogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jIHwgMTAgKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCmluZGV4IGJkOGNjYzJkZTFk
YS4uZDZjNDk5OTAwYWI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Nwcml0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
c3ByaXRlLmMKQEAgLTE2MjIsNiArMTYyMiwxMiBAQCBzdGF0aWMgdTMyIGc0eF9zcHJpdGVfY3Rs
KGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAogCWNhc2UgRFJNX0ZP
Uk1BVF9YUkdCODg4ODoKIAkJZHZzY250ciB8PSBEVlNfRk9STUFUX1JHQlg4ODg7CiAJCWJyZWFr
OworCWNhc2UgRFJNX0ZPUk1BVF9YQkdSMTYxNjE2MTZGOgorCQlkdnNjbnRyIHw9IERWU19GT1JN
QVRfUkdCWDE2MTYxNiB8IERWU19SR0JfT1JERVJfWEJHUjsKKwkJYnJlYWs7CisJY2FzZSBEUk1f
Rk9STUFUX1hSR0IxNjE2MTYxNkY6CisJCWR2c2NudHIgfD0gRFZTX0ZPUk1BVF9SR0JYMTYxNjE2
OworCQlicmVhazsKIAljYXNlIERSTV9GT1JNQVRfWVVZVjoKIAkJZHZzY250ciB8PSBEVlNfRk9S
TUFUX1lVVjQyMiB8IERWU19ZVVZfT1JERVJfWVVZVjsKIAkJYnJlYWs7CkBAIC0yMzMwLDggKzIz
MzYsMTAgQEAgc3RhdGljIGNvbnN0IHU2NCBpOXh4X3BsYW5lX2Zvcm1hdF9tb2RpZmllcnNbXSA9
IHsKIH07CiAKIHN0YXRpYyBjb25zdCB1MzIgc25iX3BsYW5lX2Zvcm1hdHNbXSA9IHsKLQlEUk1f
Rk9STUFUX1hCR1I4ODg4LAogCURSTV9GT1JNQVRfWFJHQjg4ODgsCisJRFJNX0ZPUk1BVF9YQkdS
ODg4OCwKKwlEUk1fRk9STUFUX1hSR0IxNjE2MTYxNkYsCisJRFJNX0ZPUk1BVF9YQkdSMTYxNjE2
MTZGLAogCURSTV9GT1JNQVRfWVVZViwKIAlEUk1fRk9STUFUX1lWWVUsCiAJRFJNX0ZPUk1BVF9V
WVZZLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
