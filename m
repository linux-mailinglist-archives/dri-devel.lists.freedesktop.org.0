Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85310A7AE4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554A89AAE;
	Wed,  4 Sep 2019 05:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6D89A1F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 052E030842A8;
 Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8A9019C4F;
 Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 060F131EEC; Wed,  4 Sep 2019 07:47:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/vram: fix Kconfig
Date: Wed,  4 Sep 2019 07:47:40 +0200
Message-Id: <20190904054740.20817-8-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 04 Sep 2019 05:47:47 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen Feng <puck.chen@hisilicon.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rongrong Zou <zourongrong@gmail.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c2VsZWN0IGlzbid0IHJlY3Vyc2l2ZSwgc28gd2UgY2FuJ3QgdHVybiBvbiBEUk1fVFRNICsgRFJN
X1RUTV9IRUxQRVIKaW4gY29uZmlnIERSTV9WUkFNX0hFTFBFUiwgd2UgaGF2ZSB0byBzZWxlY3Qg
dGhlbSBvbiB0aGUgdnJhbSB1c2VycwppbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAg
ICAgICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL2FzdC9LY29uZmlnICAgICAgICAg
ICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2JvY2hzL0tjb25maWcgICAgICAgICAgIHwgMiAr
KwogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9LY29uZmlnIHwgMyArKy0KIGRyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25maWcgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS92Ym94dmlkZW8vS2NvbmZpZyAgICAgICB8IDIgKysKIDYgZmlsZXMgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCmluZGV4IDFiZThhZDMwZDhmZS4uY2Qx
MWEzYmRlMTljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZwpAQCAtMTY4LDggKzE2OCw2IEBAIGNvbmZpZyBEUk1fVFRNCiBj
b25maWcgRFJNX1ZSQU1fSEVMUEVSCiAJdHJpc3RhdGUKIAlkZXBlbmRzIG9uIERSTQotCXNlbGVj
dCBEUk1fVFRNCi0Jc2VsZWN0IERSTV9UVE1fSEVMUEVSCiAJaGVscAogCSAgSGVscGVycyBmb3Ig
VlJBTSBtZW1vcnkgbWFuYWdlbWVudAogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L0tjb25maWcKaW5kZXggODI5NjIwZDUzMjZj
Li5mYmNmMmY0NWNlZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L0tjb25maWcKQEAgLTQsNiArNCw4IEBAIGNvbmZpZyBE
Uk1fQVNUCiAJZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIE1NVQogCXNlbGVjdCBEUk1fS01TX0hF
TFBFUgogCXNlbGVjdCBEUk1fVlJBTV9IRUxQRVIKKwlzZWxlY3QgRFJNX1RUTQorCXNlbGVjdCBE
Uk1fVFRNX0hFTFBFUgogCWhlbHAKIAkgU2F5IHllcyBmb3IgZXhwZXJpbWVudGFsIEFTVCBHUFUg
ZHJpdmVyLiBEbyBub3QgZW5hYmxlCiAJIHRoaXMgZHJpdmVyIHdpdGhvdXQgaGF2aW5nIGEgd29y
a2luZyAtbW9kZXNldHRpbmcsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvS2Nv
bmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9LY29uZmlnCmluZGV4IDMyYjA0M2FiYjY2OC4u
N2JjZGYyOTRmZWQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvS2NvbmZpZwpAQCAtNCw2ICs0LDggQEAgY29uZmln
IERSTV9CT0NIUwogCWRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBNTVUKIAlzZWxlY3QgRFJNX0tN
U19IRUxQRVIKIAlzZWxlY3QgRFJNX1ZSQU1fSEVMUEVSCisJc2VsZWN0IERSTV9UVE0KKwlzZWxl
Y3QgRFJNX1RUTV9IRUxQRVIKIAloZWxwCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gZm9yIHFlbXUu
CiAJICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgYm9jaHMtZHJt
LgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9LY29uZmlnIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9LY29uZmlnCmluZGV4IGYyMGVlZGYwMDcz
YS4uOGFkOWE1YjEyZTQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hp
Ym1jL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9LY29uZmln
CkBAIC00LDcgKzQsOCBAQCBjb25maWcgRFJNX0hJU0lfSElCTUMKIAlkZXBlbmRzIG9uIERSTSAm
JiBQQ0kgJiYgTU1VCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0IERSTV9WUkFNX0hF
TFBFUgotCisJc2VsZWN0IERSTV9UVE0KKwlzZWxlY3QgRFJNX1RUTV9IRUxQRVIKIAloZWxwCiAJ
ICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYSBIaXNpbGljb24gSGlibWMgc29jIGNo
aXBzZXQuCiAJICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgaGli
bWMtZHJtLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25maWcKaW5kZXggNzZmZWUwZmJkY2FlLi5hZWQxMWY0
ZjRjNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL0tjb25maWcKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvS2NvbmZpZwpAQCAtNCw2ICs0LDggQEAgY29uZmlnIERS
TV9NR0FHMjAwCiAJZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIE1NVQogCXNlbGVjdCBEUk1fS01T
X0hFTFBFUgogCXNlbGVjdCBEUk1fVlJBTV9IRUxQRVIKKwlzZWxlY3QgRFJNX1RUTQorCXNlbGVj
dCBEUk1fVFRNX0hFTFBFUgogCWhlbHAKIAkgVGhpcyBpcyBhIEtNUyBkcml2ZXIgZm9yIHRoZSBN
R0EgRzIwMCBzZXJ2ZXIgY2hpcHMsIGl0CiAgICAgICAgICBkb2VzIG5vdCBzdXBwb3J0IHRoZSBv
cmlnaW5hbCBNR0EgRzIwMCBvciBhbnkgb2YgdGhlIGRlc2t0b3AKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92Ym94dmlkZW8vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8v
S2NvbmZpZwppbmRleCA1NmJhNTEwZjIxYTIuLjQ1ZmUxMzVkNmU0MyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Zib3h2aWRlby9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94
dmlkZW8vS2NvbmZpZwpAQCAtNCw2ICs0LDggQEAgY29uZmlnIERSTV9WQk9YVklERU8KIAlkZXBl
bmRzIG9uIERSTSAmJiBYODYgJiYgUENJCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0
IERSTV9WUkFNX0hFTFBFUgorCXNlbGVjdCBEUk1fVFRNCisJc2VsZWN0IERSTV9UVE1fSEVMUEVS
CiAJc2VsZWN0IEdFTkVSSUNfQUxMT0NBVE9SCiAJaGVscAogCSAgVGhpcyBpcyBhIEtNUyBkcml2
ZXIgZm9yIHRoZSB2aXJ0dWFsIEdyYXBoaWNzIENhcmQgdXNlZCBpbgotLSAKMi4xOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
