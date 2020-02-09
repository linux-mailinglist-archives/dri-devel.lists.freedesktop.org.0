Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E81568C3
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 04:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12DC6EB45;
	Sun,  9 Feb 2020 03:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019266E9E1;
 Sun,  9 Feb 2020 03:54:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Feb 2020 19:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,419,1574150400"; d="scan'208";a="221210569"
Received: from rrcarnag-mobl.amr.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.14.133])
 by orsmga007.jf.intel.com with ESMTP; 08 Feb 2020 19:54:07 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 14/18] drm/i915: Disable DIPs when LSPCON is used
Date: Sun,  9 Feb 2020 05:53:41 +0200
Message-Id: <20200209035345.357436-15-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
References: <20200209035345.357436-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBMU1BDT04gaXMgdXNlZCwgRElQcyhEYXRhIElzbGFuZCBQYWNrZXRzIG9mIERQIG9yIEhE
TUkpIHdpbGwgbm90IGJlCnVzZWQuIFRoZXJlZm9yZSBpdCBleHBsaWNpdGx5IGRpc2FibGVzIERJ
UHMgb24gZW5jb2Rlci0+cHJlX2VuYWJsZQpjYWxsYmFjay4KCkl0IHJlc29sdmVzIGJlbG93IGlz
c3VlCiAtIHJlcHJvZHVjZSBzdGVwIG9mIGlzc3VlCiAxKSBCb290IG9yIFBhdXNlICYgUmVzdW1l
IHN5c3RlbQogMikgRG8gbm90IGVuYWJsZSBTUEQgKFNvdXJjZSBQcm9kdWN0IERlc2NyaXB0aW9u
KSBESVAKIDMpIFdoZW4gZHJpdmVyIHRyaWVzIHRvIHJlYWQgYSBESVAgQ3RsIHJlZ2lzdGVyLAog
ICAgaXQgaXMgd3JpdHRlbiB0aGF0IFNEUCBESVAgaXMgZW5hYmxlZC4KCkNjOiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBHd2Fu
LWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RkaS5jCmluZGV4IDdmMjliMDhlYTIwMi4uMTk1ZTY2NzQ0YzFlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMKQEAgLTM2MjcsNiArMzYyNywy
MiBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kZGlfcHJlX2VuYWJsZV9oZG1pKHN0cnVjdCBpbnRlbF9l
bmNvZGVyICplbmNvZGVyLAogCQkJCSAgICAgICBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsKIH0K
IAorc3RhdGljIHZvaWQgaW50ZWxfZGRpX2Rpc2FibGVfZGlwcyhzdHJ1Y3QgaW50ZWxfZW5jb2Rl
ciAqZW5jb2RlciwKKwkJCQkgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSkKK3sKKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGVu
Y29kZXItPmJhc2UuZGV2KTsKKwlpOTE1X3JlZ190IHJlZyA9IEhTV19UVklERU9fRElQX0NUTChj
cnRjX3N0YXRlLT5jcHVfdHJhbnNjb2Rlcik7CisJdTMyIGRpcF9lbmFibGUgPSBWSURFT19ESVBf
RU5BQkxFX1ZTQ19IU1cgfCBWSURFT19ESVBfRU5BQkxFX0FWSV9IU1cgfAorCQkJIFZJREVPX0RJ
UF9FTkFCTEVfR0NQX0hTVyB8IFZJREVPX0RJUF9FTkFCTEVfVlNfSFNXIHwKKwkJCSBWSURFT19E
SVBfRU5BQkxFX0dNUF9IU1cgfCBWSURFT19ESVBfRU5BQkxFX1NQRF9IU1cgfAorCQkJIFZJREVP
X0RJUF9FTkFCTEVfRFJNX0dMSzsKKwl1MzIgdmFsID0gaW50ZWxfZGVfcmVhZChkZXZfcHJpdiwg
cmVnKTsKKworCXZhbCAmPSB+ZGlwX2VuYWJsZTsKKwlpbnRlbF9kZV93cml0ZShkZXZfcHJpdiwg
cmVnLCB2YWwpOworCWludGVsX2RlX3Bvc3RpbmdfcmVhZChkZXZfcHJpdiwgcmVnKTsKK30KKwog
c3RhdGljIHZvaWQgaW50ZWxfZGRpX3ByZV9lbmFibGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVu
Y29kZXIsCiAJCQkJIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAog
CQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkKQEAgLTM2
NjYsNiArMzY4MiwxMyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kZGlfcHJlX2VuYWJsZShzdHJ1Y3Qg
aW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAkJCXN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmRp
Z19wb3J0ID0KIAkJCQkJZW5jX3RvX2RpZ19wb3J0KGVuY29kZXIpOwogCisJCQkvKgorCQkJICog
V2hlbiBMU1BDT04gaXMgdXNlZCwgRElQcyAoRGF0YSBJc2xhbmQgUGFja2V0cyBvZiBEUAorCQkJ
ICogb3IgSERNSSkgd2lsbCBub3QgYmUgdXNlZC4KKwkJCSAqIFRoZXJlZm9yZSB3ZSBleHBsaWNp
dGx5IGRpc2FibGUgRElQcyBoZXJlLgorCQkJICovCisJCQlpbnRlbF9kZGlfZGlzYWJsZV9kaXBz
KGVuY29kZXIsIGNydGNfc3RhdGUpOworCiAJCQlkaWdfcG9ydC0+c2V0X2luZm9mcmFtZXMoZW5j
b2RlciwKIAkJCQkJCSBjcnRjX3N0YXRlLT5oYXNfaW5mb2ZyYW1lLAogCQkJCQkJIGNydGNfc3Rh
dGUsIGNvbm5fc3RhdGUpOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
