Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE4BB81E8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 21:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D66FADF;
	Thu, 19 Sep 2019 19:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0EA6FADF;
 Thu, 19 Sep 2019 19:53:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 12:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,526,1559545200"; d="scan'208";a="188189732"
Received: from helsinki.fi.intel.com ([10.237.66.129])
 by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2019 12:53:29 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 6/8] drm/i915: Add new GMP register size for GEN11
Date: Thu, 19 Sep 2019 22:53:09 +0300
Message-Id: <20190919195311.13972-7-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919195311.13972-1-gwan-gyeong.mun@intel.com>
References: <20190919195311.13972-1-gwan-gyeong.mun@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, uma.shankar@intel.com,
 jani.saarinen@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIEJzcGVjLCBHRU4xMSBhbmQgcHJpb3IgR0VOMTEgaGF2ZSBkaWZmZXJlbnQg
cmVnaXN0ZXIgc2l6ZSBmb3IKSERSIE1ldGFkYXRhIEluZm9mcmFtZSBTRFAgcGFja2V0LiBJdCBh
ZGRzIG5ldyBWSURFT19ESVBfR01QX0RBVEFfU0laRSBmb3IKR0VOMTEuIEFuZCBpdCBtYWtlcyBo
YW5kbGUgZGlmZmVyZW50IHJlZ2lzdGVyIHNpemUgZm9yCkhETUlfUEFDS0VUX1RZUEVfR0FNVVRf
TUVUQURBVEEgb24gaHN3X2RpcF9kYXRhX3NpemUoKSBmb3IgZWFjaCBHRU4KcGxhdGZvcm1zLiBJ
dCBhZGRyZXNzZXMgVW1hJ3MgcmV2aWV3IGNvbW1lbnRzLgoKdjk6IEFkZCBXQVJOX09OKCkgd2hl
biBidWZmZXIgc2l6ZSBpZiBsYXJnZXIgdGhhbiByZWdpc3RlciBzaXplLiBbVmlsbGVdCgpTaWdu
ZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+ClJl
dmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMTIgKysrKysrKysrKy0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgICB8ICAxICsKIDIgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCmluZGV4IDE0ZTM1MGY1ZWNjOC4uYmE2NTM1YTY1
MDJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwpAQCAtMTg5
LDEzICsxODksMTkgQEAgaHN3X2RpcF9kYXRhX3JlZyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYsCiAJfQogfQogCi1zdGF0aWMgaW50IGhzd19kaXBfZGF0YV9zaXplKHVuc2lnbmVk
IGludCB0eXBlKQorc3RhdGljIGludCBoc3dfZGlwX2RhdGFfc2l6ZShzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYsCisJCQkgICAgIHVuc2lnbmVkIGludCB0eXBlKQogewogCXN3aXRj
aCAodHlwZSkgewogCWNhc2UgRFBfU0RQX1ZTQzoKIAkJcmV0dXJuIFZJREVPX0RJUF9WU0NfREFU
QV9TSVpFOwogCWNhc2UgRFBfU0RQX1BQUzoKIAkJcmV0dXJuIFZJREVPX0RJUF9QUFNfREFUQV9T
SVpFOworCWNhc2UgSERNSV9QQUNLRVRfVFlQRV9HQU1VVF9NRVRBREFUQToKKwkJaWYgKElOVEVM
X0dFTihkZXZfcHJpdikgPj0gMTEpCisJCQlyZXR1cm4gVklERU9fRElQX0dNUF9EQVRBX1NJWkU7
CisJCWVsc2UKKwkJCXJldHVybiBWSURFT19ESVBfREFUQV9TSVpFOwogCWRlZmF1bHQ6CiAJCXJl
dHVybiBWSURFT19ESVBfREFUQV9TSVpFOwogCX0KQEAgLTUxNCw3ICs1MjAsOSBAQCBzdGF0aWMg
dm9pZCBoc3dfd3JpdGVfaW5mb2ZyYW1lKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAog
CWludCBpOwogCXUzMiB2YWwgPSBJOTE1X1JFQUQoY3RsX3JlZyk7CiAKLQlkYXRhX3NpemUgPSBo
c3dfZGlwX2RhdGFfc2l6ZSh0eXBlKTsKKwlkYXRhX3NpemUgPSBoc3dfZGlwX2RhdGFfc2l6ZShk
ZXZfcHJpdiwgdHlwZSk7CisKKwlXQVJOX09OKGxlbiA+IGRhdGFfc2l6ZSk7CiAKIAl2YWwgJj0g
fmhzd19pbmZvZnJhbWVfZW5hYmxlKHR5cGUpOwogCUk5MTVfV1JJVEUoY3RsX3JlZywgdmFsKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlZy5oCmluZGV4IDVlM2E2MTc4YWZmNC4uOTI3NWI2N2ZhZjNmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKQEAgLTQ2NzcsNiArNDY3Nyw3IEBAIGVudW0gewogICog
KEhhc3dlbGwgYW5kIG5ld2VyKSB0byBzZWUgd2hpY2ggVklERU9fRElQX0RBVEEgYnl0ZSBjb3Jy
ZXNwb25kcyB0byBlYWNoIGJ5dGUKICAqIG9mIHRoZSBpbmZvZnJhbWUgc3RydWN0dXJlIHNwZWNp
ZmllZCBieSBDRUEtODYxLiAqLwogI2RlZmluZSAgIFZJREVPX0RJUF9EQVRBX1NJWkUJMzIKKyNk
ZWZpbmUgICBWSURFT19ESVBfR01QX0RBVEFfU0laRQkzNgogI2RlZmluZSAgIFZJREVPX0RJUF9W
U0NfREFUQV9TSVpFCTM2CiAjZGVmaW5lICAgVklERU9fRElQX1BQU19EQVRBX1NJWkUJMTMyCiAj
ZGVmaW5lIFZJREVPX0RJUF9DVEwJCV9NTUlPKDB4NjExNzApCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
