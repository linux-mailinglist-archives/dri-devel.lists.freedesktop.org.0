Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC651764FE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423CE6E81F;
	Mon,  2 Mar 2020 20:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C866E480
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:35:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 12:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; d="scan'208";a="319195763"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 02 Mar 2020 12:34:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Mar 2020 22:34:58 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/33] drm/panel-arm-versatile: Fix dotclock
Date: Mon,  2 Mar 2020 22:34:21 +0200
Message-Id: <20200302203452.17977-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrcyBkaXNhZ3JlZSB3aXRoIHRoZSBjdXJyZW50bHkK
bGlzdGVkIHZyZWZyZXNoIHJhdGVzLiBDaGFuZ2UgdGhlIGRvdGNsb2NrcyB0byBtYXRjaCB0aGUg
dnJlZnJlc2guCgpTb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhlcikgb2YgdGhlIGRvdGNs
b2NrIG9yIHZyZXJlc2ggaXMKY29ycmVjdD8KCkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1hcm0tdmVyc2F0aWxlLmMgfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYXJtLXZlcnNhdGlsZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWFybS12ZXJzYXRpbGUuYwppbmRleCA0MTQ0NGE3M2M5
ODAuLmVmNDliYTIwNmVlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWFybS12ZXJzYXRpbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYXJtLXZl
cnNhdGlsZS5jCkBAIC0xNTgsNyArMTU4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2ZXJzYXRp
bGVfcGFuZWxfdHlwZSB2ZXJzYXRpbGVfcGFuZWxzW10gPSB7CiAJCS53aWR0aF9tbSA9IDE3MSwK
IAkJLmhlaWdodF9tbSA9IDEzMCwKIAkJLm1vZGUgPSB7Ci0JCQkuY2xvY2sgPSAyNTAwMCwKKwkJ
CS5jbG9jayA9IDI0Njk2LAogCQkJLmhkaXNwbGF5ID0gNjQwLAogCQkJLmhzeW5jX3N0YXJ0ID0g
NjQwICsgMjQsCiAJCQkuaHN5bmNfZW5kID0gNjQwICsgMjQgKyA5NiwKQEAgLTE4MSw3ICsxODEs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZlcnNhdGlsZV9wYW5lbF90eXBlIHZlcnNhdGlsZV9w
YW5lbHNbXSA9IHsKIAkJLndpZHRoX21tID0gMzQsCiAJCS5oZWlnaHRfbW0gPSA0NSwKIAkJLm1v
ZGUgPSB7Ci0JCQkuY2xvY2sgPSA2MjUwMCwKKwkJCS5jbG9jayA9IDE2MDAyLAogCQkJLmhkaXNw
bGF5ID0gMTc2LAogCQkJLmhzeW5jX3N0YXJ0ID0gMTc2ICsgMiwKIAkJCS5oc3luY19lbmQgPSAx
NzYgKyAyICsgMywKQEAgLTIwNSw3ICsyMDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZlcnNh
dGlsZV9wYW5lbF90eXBlIHZlcnNhdGlsZV9wYW5lbHNbXSA9IHsKIAkJLndpZHRoX21tID0gMzcs
CiAJCS5oZWlnaHRfbW0gPSA1MCwKIAkJLm1vZGUgPSB7Ci0JCQkuY2xvY2sgPSA1NDAwLAorCQkJ
LmNsb2NrID0gMTA1ODgsCiAJCQkuaGRpc3BsYXkgPSAyNDAsCiAJCQkuaHN5bmNfc3RhcnQgPSAy
NDAgKyAxMCwKIAkJCS5oc3luY19lbmQgPSAyNDAgKyAxMCArIDEwLAotLSAKMi4yNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
