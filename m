Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176B150953
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118BB6EC1E;
	Mon,  3 Feb 2020 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCFB6EC1E;
 Mon,  3 Feb 2020 15:13:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="223966419"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 03 Feb 2020 07:13:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:13:49 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/26] drm/i915: Limit display Wa_1405510057 to gen11
Date: Mon,  3 Feb 2020 17:13:19 +0200
Message-Id: <20200203151343.14378-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRH
TCsgc3VwcG9zZWRseSBkbyBub3QgbmVlZCBXYV8xNDA1NTEwMDU3IHNvIGxpbWl0IGl0IHRvCmdl
bjExIG9ubHkuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
aGRtaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
aGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMKaW5kZXgg
OWU0MDlhODE5ZmY1Li41OTkxYTk5YzQzYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfaGRtaS5jCkBAIC0yMjc0LDkgKzIyNzQsOSBAQCBzdGF0aWMgYm9vbCBoZG1pX2Rl
ZXBfY29sb3JfcG9zc2libGUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUsCiAJCX0KIAl9CiAKLQkvKiBEaXNwbGF5IFdhXzE0MDU1MTAwNTc6aWNsICovCisJLyogRGlz
cGxheSBXYV8xNDA1NTEwMDU3OmljbCxlaGwgKi8KIAlpZiAoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zv
cm1hdCA9PSBJTlRFTF9PVVRQVVRfRk9STUFUX1lDQkNSNDIwICYmCi0JICAgIGJwYyA9PSAxMCAm
JiBJTlRFTF9HRU4oZGV2X3ByaXYpID49IDExICYmCisJICAgIGJwYyA9PSAxMCAmJiBJU19HRU4o
ZGV2X3ByaXYsIDExKSAmJgogCSAgICAoYWRqdXN0ZWRfbW9kZS0+Y3J0Y19oYmxhbmtfZW5kIC0K
IAkgICAgIGFkanVzdGVkX21vZGUtPmNydGNfaGJsYW5rX3N0YXJ0KSAlIDggPT0gMikKIAkJcmV0
dXJuIGZhbHNlOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
