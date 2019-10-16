Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E58D9996
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 20:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0786E9CB;
	Wed, 16 Oct 2019 18:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B076E6E9CB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 18:53:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GIqfgo083570;
 Wed, 16 Oct 2019 13:52:41 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GIqffr082253
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Oct 2019 13:52:41 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 13:52:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 13:52:41 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
 [128.247.22.53])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GIqfNF081989;
 Wed, 16 Oct 2019 13:52:41 -0500
Received: from localhost ([10.250.79.55])
 by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x9GIqdZ11777; 
 Wed, 16 Oct 2019 13:52:39 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: Move radeon and amdgpu Kconfig options into their
 directories
Date: Wed, 16 Oct 2019 14:52:30 -0400
Message-ID: <20191016185230.27824-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571251961;
 bh=vUHHm6TQrzUaqF3WoeACMdoEVSPvSP0FUJ+Io/gdxSQ=;
 h=From:To:CC:Subject:Date;
 b=VW4V+/aZg20RkpZf9MraYhWlL5qZKFA7AkTCmXqpdrkBW9KjrD4toiuNnGTspLQ79
 UYG7axKc2ttmfLszbY1LuCOPKm3uISbwZdy3ay49JBzkkFeKuIKZSHzdadMYFzJWWN
 WqjjS2pAofIqHhrRTEKcK3+mQEzTRLZKEA9L4EqQ=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Andrew
 F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9zdCBLY29uZmlnIG9wdGlvbnMgdG8gZW5hYmxlIGEgZHJpdmVyIGFyZSBpbiB0aGUgS2NvbmZp
ZyBmaWxlCmluc2lkZSB0aGUgcmVsZXZhbnQgZGlyZWN0b3J5LCBtb3ZlIHRoZXNlIHR3byB0byB0
aGUgc2FtZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgIHwgMzQgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnIHwgMTgg
KysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9LY29uZmlnICAgICB8IDE4
ICsrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMzQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZwppbmRleCBlNjdjMTk0YzJhY2EuLmJjNTMyOWI2OTdhZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcKQEAgLTIwMyw0MiArMjAzLDggQEAgc291cmNlICJkcml2ZXJzL2dwdS9kcm0vaTJjL0tj
b25maWciCiAKIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL2FybS9LY29uZmlnIgogCi1jb25maWcg
RFJNX1JBREVPTgotCXRyaXN0YXRlICJBVEkgUmFkZW9uIgotCWRlcGVuZHMgb24gRFJNICYmIFBD
SSAmJiBNTVUKLQlzZWxlY3QgRldfTE9BREVSCi0gICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBF
UgotICAgICAgICBzZWxlY3QgRFJNX1RUTQotCXNlbGVjdCBQT1dFUl9TVVBQTFkKLQlzZWxlY3Qg
SFdNT04KLQlzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQotCXNlbGVjdCBJTlRFUlZBTF9U
UkVFCi0JaGVscAotCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGFuIEFUSSBSYWRl
b24gZ3JhcGhpY3MgY2FyZC4gIFRoZXJlCi0JICBhcmUgYm90aCBQQ0kgYW5kIEFHUCB2ZXJzaW9u
cy4gIFlvdSBkb24ndCBuZWVkIHRvIGNob29zZSB0aGlzIHRvCi0JICBydW4gdGhlIFJhZGVvbiBp
biBwbGFpbiBWR0EgbW9kZS4KLQotCSAgSWYgTSBpcyBzZWxlY3RlZCwgdGhlIG1vZHVsZSB3aWxs
IGJlIGNhbGxlZCByYWRlb24uCi0KIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9LY29u
ZmlnIgogCi1jb25maWcgRFJNX0FNREdQVQotCXRyaXN0YXRlICJBTUQgR1BVIgotCWRlcGVuZHMg
b24gRFJNICYmIFBDSSAmJiBNTVUKLQlzZWxlY3QgRldfTE9BREVSCi0gICAgICAgIHNlbGVjdCBE
Uk1fS01TX0hFTFBFUgotCXNlbGVjdCBEUk1fU0NIRUQKLSAgICAgICAgc2VsZWN0IERSTV9UVE0K
LQlzZWxlY3QgUE9XRVJfU1VQUExZCi0Jc2VsZWN0IEhXTU9OCi0Jc2VsZWN0IEJBQ0tMSUdIVF9D
TEFTU19ERVZJQ0UKLQlzZWxlY3QgSU5URVJWQUxfVFJFRQotCXNlbGVjdCBDSEFTSAotCWhlbHAK
LQkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhIHJlY2VudCBBTUQgUmFkZW9uIGdy
YXBoaWNzIGNhcmQuCi0KLQkgIElmIE0gaXMgc2VsZWN0ZWQsIHRoZSBtb2R1bGUgd2lsbCBiZSBj
YWxsZWQgYW1kZ3B1LgotCiBzb3VyY2UgImRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L0tjb25m
aWciCiAKIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyIKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9LY29uZmlnCmluZGV4IDJlOThjMDE2Y2I0Ny4uYTUzNTU0NTU3Y2M2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L0tjb25maWcKQEAgLTEsNCArMSwyMiBAQAogIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisKK2NvbmZpZyBEUk1fQU1ER1BVCisJdHJpc3Rh
dGUgIkFNRCBHUFUiCisJZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIE1NVQorCXNlbGVjdCBGV19M
T0FERVIKKwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKKwlzZWxlY3QgRFJNX1NDSEVECisJc2VsZWN0
IERSTV9UVE0KKwlzZWxlY3QgUE9XRVJfU1VQUExZCisJc2VsZWN0IEhXTU9OCisJc2VsZWN0IEJB
Q0tMSUdIVF9DTEFTU19ERVZJQ0UKKwlzZWxlY3QgSU5URVJWQUxfVFJFRQorCXNlbGVjdCBDSEFT
SAorCWhlbHAKKwkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhIHJlY2VudCBBTUQg
UmFkZW9uIGdyYXBoaWNzIGNhcmQuCisKKwkgIElmIE0gaXMgc2VsZWN0ZWQsIHRoZSBtb2R1bGUg
d2lsbCBiZSBjYWxsZWQgYW1kZ3B1LgorCiBjb25maWcgRFJNX0FNREdQVV9TSQogCWJvb2wgIkVu
YWJsZSBhbWRncHUgc3VwcG9ydCBmb3IgU0kgcGFydHMiCiAJZGVwZW5kcyBvbiBEUk1fQU1ER1BV
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL0tjb25maWcKaW5kZXggNmY2MGY0ODQwY2M1Li5iYTY3Yjg3OWQzMWQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vS2NvbmZpZworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL0tjb25maWcKQEAgLTEsNCArMSwyMiBAQAogIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5CisKK2NvbmZpZyBEUk1fUkFERU9OCisJdHJpc3RhdGUgIkFU
SSBSYWRlb24iCisJZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIE1NVQorCXNlbGVjdCBGV19MT0FE
RVIKKwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKKwlzZWxlY3QgRFJNX1RUTQorCXNlbGVjdCBQT1dF
Ul9TVVBQTFkKKwlzZWxlY3QgSFdNT04KKwlzZWxlY3QgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQor
CXNlbGVjdCBJTlRFUlZBTF9UUkVFCisJaGVscAorCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlv
dSBoYXZlIGFuIEFUSSBSYWRlb24gZ3JhcGhpY3MgY2FyZC4gIFRoZXJlCisJICBhcmUgYm90aCBQ
Q0kgYW5kIEFHUCB2ZXJzaW9ucy4gIFlvdSBkb24ndCBuZWVkIHRvIGNob29zZSB0aGlzIHRvCisJ
ICBydW4gdGhlIFJhZGVvbiBpbiBwbGFpbiBWR0EgbW9kZS4KKworCSAgSWYgTSBpcyBzZWxlY3Rl
ZCwgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCByYWRlb24uCisKIGNvbmZpZyBEUk1fUkFERU9O
X1VTRVJQVFIKIAlib29sICJBbHdheXMgZW5hYmxlIHVzZXJwdHIgc3VwcG9ydCIKIAlkZXBlbmRz
IG9uIERSTV9SQURFT04KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
