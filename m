Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FF4D056
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CFD6E5B6;
	Thu, 20 Jun 2019 14:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AF26E5B7;
 Thu, 20 Jun 2019 14:26:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 07:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="150943490"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 20 Jun 2019 07:26:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 17:26:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm: WARN on illegal aspect ratio when converting a mode
 to umode
Date: Thu, 20 Jun 2019 17:26:37 +0300
Message-Id: <20190620142639.17518-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldB
Uk4gaWYgdGhlIGluY29taW5nIGRybV9kaXNwbGF5X21vZGUgaGFzIGFuIGlsbGVnYWwgYXNwZWN0
IHJhdGlvCndoZW4gY29udmVydGluZyBpdCB0byBhIHVzZXIgbW9kZS4gVGhpcyBzaG91bGQgbmV2
ZXIgaGFwcGVuIHVubGVzcwp0aGUgZHJpdmVyIG1hZGUgYSBtaXN0YWtlIGFuZCBwdXQgYW4gaW52
YWxpZCB2YWx1ZSBpbnRvIHRoZSBhc3BlY3QKcmF0aW8uCgpDYzogSWxpYSBNaXJraW4gPGltaXJr
aW5AYWx1bS5taXQuZWR1PgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVzLmMKaW5kZXggODQ3MDQ4ZGVlMDQ4Li5iZTJjY2Q4ZWNjZmQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKQEAgLTE5MDYsOCArMTkwNiwxMSBAQCB2b2lkIGRybV9tb2RlX2NvbnZlcnRfdG9f
dW1vZGUoc3RydWN0IGRybV9tb2RlX21vZGVpbmZvICpvdXQsCiAJY2FzZSBIRE1JX1BJQ1RVUkVf
QVNQRUNUXzI1Nl8xMzU6CiAJCW91dC0+ZmxhZ3MgfD0gRFJNX01PREVfRkxBR19QSUNfQVJfMjU2
XzEzNTsKIAkJYnJlYWs7Ci0JY2FzZSBIRE1JX1BJQ1RVUkVfQVNQRUNUX1JFU0VSVkVEOgogCWRl
ZmF1bHQ6CisJCVdBUk4oMSwgIkludmFsaWQgYXNwZWN0IHJhdGlvICgwJXgpIG9uIG1vZGVcbiIs
CisJCSAgICAgaW4tPnBpY3R1cmVfYXNwZWN0X3JhdGlvKTsKKwkJLyogZmFsbCB0aHJvdWdoICov
CisJY2FzZSBIRE1JX1BJQ1RVUkVfQVNQRUNUX05PTkU6CiAJCW91dC0+ZmxhZ3MgfD0gRFJNX01P
REVfRkxBR19QSUNfQVJfTk9ORTsKIAkJYnJlYWs7CiAJfQotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
