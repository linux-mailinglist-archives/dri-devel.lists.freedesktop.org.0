Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCBAF650
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F051C6EA29;
	Wed, 11 Sep 2019 07:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B376E864
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 08:09:56 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 894D6200494;
 Tue, 10 Sep 2019 10:09:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F316B200490;
 Tue, 10 Sep 2019 10:09:49 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2151B402D2;
 Tue, 10 Sep 2019 16:09:43 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-devel@linux.nxdi.nxp.com, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com
Subject: [v5 2/2] drm/arm/mali-dp: Add display QoS interface configuration for
 Mali DP500
Date: Tue, 10 Sep 2019 15:59:13 +0800
Message-Id: <20190910075913.17650-2-wen.he_1@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190910075913.17650-1-wen.he_1@nxp.com>
References: <20190910075913.17650-1-wen.he_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
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
Cc: Wen He <wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29uZmlndXJlIHRoZSBkaXNwbGF5IFF1YWxpdHkgb2Ygc2VydmljZSAoUW9TKSBsZXZlbHMgcHJp
b3JpdHkgaWYgdGhlCm9wdGlvbmFsIHByb3BlcnR5IG5vZGUgImFybSxtYWxpZHAtYXFyb3MtdmFs
dWUiIGlzIGRlZmluZWQgaW4gRFRTIGZpbGUuCgpRb1Mgc2lnbmFsaW5nIHVzaW5nIEFRUk9TIGFu
ZCBBV1FPUyBBWEkgaW50ZXJmYWNlIHNpZ25hbHMsIHRoZSBBUVJPUyBpcwpkcml2ZW4gZnJvbSB0
aGUgIlJRT1MiIHJlZ2lzdGVyLCBzbyBuZWVkZWQgdG8gcHJvZ3JhbSB0aGUgUlFPUyByZWdpc3Rl
cgp0byBhdm9pZCB0aGUgaGlnaCByZXNvbHV0aW9ucyBmbGlja2VyIGlzc3VlIG9uIHRoZSBMUzEw
MjhBIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jICB8ICA2ICsrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYyAgIHwgIDkgKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vYXJtL21hbGlkcF9ody5oICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRw
X3JlZ3MuaCB8IDEwICsrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKaW5kZXggMzMzYjg4YTVlZmIwLi44YTc2MzE1YWFh
MGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCkBAIC04MTcsNiArODE3LDEyIEBAIHN0YXRp
YyBpbnQgbWFsaWRwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQogCiAJbWFsaWRwLT5jb3JlX2lk
ID0gdmVyc2lvbjsKIAorCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGRldi0+b2Zfbm9kZSwK
KwkJCQkJImFybSxtYWxpZHAtYXJxb3MtdmFsdWUiLAorCQkJCQkmaHdkZXYtPmFycW9zX3ZhbHVl
KTsKKwlpZiAocmV0KQorCQlod2Rldi0+YXJxb3NfdmFsdWUgPSAweDA7CisKIAkvKiBzZXQgdGhl
IG51bWJlciBvZiBsaW5lcyB1c2VkIGZvciBvdXRwdXQgb2YgUkdCIGRhdGEgKi8KIAlyZXQgPSBv
Zl9wcm9wZXJ0eV9yZWFkX3U4X2FycmF5KGRldi0+b2Zfbm9kZSwKIAkJCQkJImFybSxtYWxpZHAt
b3V0cHV0LXBvcnQtbGluZXMiLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxp
ZHBfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMKaW5kZXggYmQ4MjY1ZjAy
ZTBiLi5jYTU3MGIxMzU0NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRw
X2h3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYwpAQCAtMzc5LDYgKzM3
OSwxNSBAQCBzdGF0aWMgdm9pZCBtYWxpZHA1MDBfbW9kZXNldChzdHJ1Y3QgbWFsaWRwX2h3X2Rl
dmljZSAqaHdkZXYsIHN0cnVjdCB2aWRlb21vZGUgKgogCQltYWxpZHBfaHdfc2V0Yml0cyhod2Rl
diwgTUFMSURQX0RJU1BfRlVOQ19JTEFDRUQsIE1BTElEUF9ERV9ESVNQTEFZX0ZVTkMpOwogCWVs
c2UKIAkJbWFsaWRwX2h3X2NsZWFyYml0cyhod2RldiwgTUFMSURQX0RJU1BfRlVOQ19JTEFDRUQs
IE1BTElEUF9ERV9ESVNQTEFZX0ZVTkMpOworCisJLyoKKwkgKiBQcm9ncmFtIHRoZSBSUW9TIHJl
Z2lzdGVyIHRvIGF2b2lkIGhpZ2ggcmVzb2x1dGlvbnMgZmxpY2tlcgorCSAqIGlzc3VlIG9uIHRo
ZSBMUzEwMjhBLgorCSAqLworCWlmIChod2Rldi0+YXJxb3NfdmFsdWUpIHsKKwkJdmFsID0gaHdk
ZXYtPmFycW9zX3ZhbHVlOworCQltYWxpZHBfaHdfc2V0Yml0cyhod2RldiwgdmFsLCBNQUxJRFA1
MDBfUlFPU19RVUFMSVRZKTsKKwl9CiB9CiAKIGludCBtYWxpZHBfZm9ybWF0X2dldF9icHAodTMy
IGZtdCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5oCmluZGV4IDk2OGE2NWVlZDM3MS4uZTRjMzZiYzkw
YmRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmgKQEAgLTI1MSw2ICsyNTEsOSBAQCBzdHJ1Y3Qg
bWFsaWRwX2h3X2RldmljZSB7CiAKIAkvKiBzaXplIG9mIG1lbW9yeSB1c2VkIGZvciByb3RhdGlu
ZyBsYXllcnMsIHVwIHRvIHR3byBiYW5rcyBhdmFpbGFibGUgKi8KIAl1MzIgcm90YXRpb25fbWVt
b3J5WzJdOworCisJLyogcHJpb3JpdHkgbGV2ZWwgb2YgUlFPUyByZWdpc3RlciB1c2VkIGZvciBk
cml2ZW4gdGhlIEFSUU9TIHNpZ25hbCAqLworCXUzMiBhcnFvc192YWx1ZTsKIH07CiAKIHN0YXRp
YyBpbmxpbmUgdTMyIG1hbGlkcF9od19yZWFkKHN0cnVjdCBtYWxpZHBfaHdfZGV2aWNlICpod2Rl
diwgdTMyIHJlZykKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3JlZ3Mu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3JlZ3MuaAppbmRleCA5OTMwMzE1NDJmYTEu
LjUxNGM1MGRjYjc0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcmVn
cy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3JlZ3MuaApAQCAtMjEwLDYgKzIx
MCwxNiBAQAogI2RlZmluZSBNQUxJRFA1MDBfQ09ORklHX1ZBTElECQkweDAwZjAwCiAjZGVmaW5l
IE1BTElEUDUwMF9DT05GSUdfSUQJCTB4MDBmZDQKIAorLyoKKyAqIFRoZSBxdWFsaXR5IG9mIHNl
cnZpY2UgKFFvUykgcmVnaXN0ZXIgb24gdGhlIERQNTAwLiBSUU9TIHJlZ2lzdGVyIHZhbHVlcwor
ICogYXJlIGRyaXZlbiBieSB0aGUgQVJRT1Mgc2lnbmFsLCB1c2luZyBBWEkgdHJhbnNhY2F0aW9u
cywgZGVwZW5kZW50IG9uIHRoZQorICogRklGTyBpbnB1dCBsZXZlbC4KKyAqIFRoZSBSUU9TIHJl
Z2lzdGVyIGNhbiBhbHNvIHNldCBRb1MgbGV2ZWxzIGZvcjoKKyAqICAgIC0gUkVEX0FSUU9TICAg
QCBBIDQtYml0IHNpZ25hbCB2YWx1ZSBmb3IgY2xvc2UgdG8gdW5kZXJmbG93IGNvbmRpdGlvbnMK
KyAqICAgIC0gR1JFRU5fQVJRT1MgQCBBIDQtYml0IHNpZ25hbCB2YWx1ZSBmb3Igbm9ybWFsIGNv
bmRpdGlvbnMKKyAqLworI2RlZmluZSBNQUxJRFA1MDBfUlFPU19RVUFMSVRZICAgICAgICAgIDB4
MDA1MDAKKwogLyogcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgYml0cyBzcGVjaWZpYyB0byBEUDU1MC9E
UDY1MCAqLwogI2RlZmluZSBNQUxJRFA1NTBfQUREUl9TUEFDRV9TSVpFCTB4MTAwMDAKICNkZWZp
bmUgTUFMSURQNTUwX0RFX0NPTlRST0wJCTB4MDAwMTAKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
