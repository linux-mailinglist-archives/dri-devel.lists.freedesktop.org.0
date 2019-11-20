Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1F103BAB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585BA6E9B0;
	Wed, 20 Nov 2019 13:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0F6E9B0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A041F21939;
 Wed, 20 Nov 2019 13:36:42 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:36:40 +0800
Message-Id: <20191120133640.11659-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574257004;
 bh=3HKCIB7YMRDHJrkZ/3F75UmwARzPFjHhq0piLV9ZpMs=;
 h=From:To:Cc:Subject:Date:From;
 b=1w50fEh8eOSMvUdbaWMAfpUvpGBnzIKA3XQ1mcR42pvTu25jyIo48QZktSflRIiPG
 B4R8EZlWJuG7OwKGnOOI89r01bxKVQnoZFiFPaB/GK/Fb6UdQysZ4fDkAPToIZMId3
 JIgsPHWUjusRhrtl2v7HMZm3BcQwITt4SJeZV9sc=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnIHwgMzAg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwppbmRleCAxMTY4MzUxMjY3ZmQuLmFkMWI2
ZWNkMmUwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL0tjb25maWcKQEAgLTk0LDE4ICs5NCwxOCBAQCBjb25maWcgRFJNX0tNU19GQl9I
RUxQRVIKIAkgIEZCREVWIGhlbHBlcnMgZm9yIEtNUyBkcml2ZXJzLgogCiBjb25maWcgRFJNX0RF
QlVHX0RQX01TVF9UT1BPTE9HWV9SRUZTCi0gICAgICAgIGJvb2wgIkVuYWJsZSByZWZjb3VudCBi
YWNrdHJhY2UgaGlzdG9yeSBpbiB0aGUgRFAgTVNUIGhlbHBlcnMiCi0gICAgICAgIHNlbGVjdCBT
VEFDS0RFUE9UCi0gICAgICAgIGRlcGVuZHMgb24gRFJNX0tNU19IRUxQRVIKLSAgICAgICAgZGVw
ZW5kcyBvbiBERUJVR19LRVJORUwKLSAgICAgICAgZGVwZW5kcyBvbiBFWFBFUlQKLSAgICAgICAg
aGVscAotICAgICAgICAgIEVuYWJsZXMgZGVidWcgdHJhY2luZyBmb3IgdG9wb2xvZ3kgcmVmcyBp
biBEUk0ncyBEUCBNU1QgaGVscGVycy4gQQotICAgICAgICAgIGhpc3Rvcnkgb2YgZWFjaCB0b3Bv
bG9neSByZWZlcmVuY2UvZGVyZWZlcmVuY2Ugd2lsbCBiZSBwcmludGVkIHRvIHRoZQotICAgICAg
ICAgIGtlcm5lbCBsb2cgb25jZSBhIHBvcnQgb3IgYnJhbmNoIGRldmljZSdzIHRvcG9sb2d5IHJl
ZmNvdW50IHJlYWNoZXMgMC4KLQotICAgICAgICAgIFRoaXMgaGFzIHRoZSBwb3RlbnRpYWwgdG8g
dXNlIGEgbG90IG9mIG1lbW9yeSBhbmQgcHJpbnQgc29tZSB2ZXJ5Ci0gICAgICAgICAgbGFyZ2Ug
a2VybmVsIG1lc3NhZ2VzLiBJZiBpbiBkb3VidCwgc2F5ICJOIi4KKwlib29sICJFbmFibGUgcmVm
Y291bnQgYmFja3RyYWNlIGhpc3RvcnkgaW4gdGhlIERQIE1TVCBoZWxwZXJzIgorCXNlbGVjdCBT
VEFDS0RFUE9UCisJZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBFUgorCWRlcGVuZHMgb24gREVCVUdf
S0VSTkVMCisJZGVwZW5kcyBvbiBFWFBFUlQKKwloZWxwCisJICBFbmFibGVzIGRlYnVnIHRyYWNp
bmcgZm9yIHRvcG9sb2d5IHJlZnMgaW4gRFJNJ3MgRFAgTVNUIGhlbHBlcnMuIEEKKwkgIGhpc3Rv
cnkgb2YgZWFjaCB0b3BvbG9neSByZWZlcmVuY2UvZGVyZWZlcmVuY2Ugd2lsbCBiZSBwcmludGVk
IHRvIHRoZQorCSAga2VybmVsIGxvZyBvbmNlIGEgcG9ydCBvciBicmFuY2ggZGV2aWNlJ3MgdG9w
b2xvZ3kgcmVmY291bnQgcmVhY2hlcyAwLgorCisJICBUaGlzIGhhcyB0aGUgcG90ZW50aWFsIHRv
IHVzZSBhIGxvdCBvZiBtZW1vcnkgYW5kIHByaW50IHNvbWUgdmVyeQorCSAgbGFyZ2Uga2VybmVs
IG1lc3NhZ2VzLiBJZiBpbiBkb3VidCwgc2F5ICJOIi4KIAogY29uZmlnIERSTV9GQkRFVl9FTVVM
QVRJT04KIAlib29sICJFbmFibGUgbGVnYWN5IGZiZGV2IHN1cHBvcnQgZm9yIHlvdXIgbW9kZXNl
dHRpbmcgZHJpdmVyIgpAQCAtMjM0LDggKzIzNCw4IEBAIGNvbmZpZyBEUk1fUkFERU9OCiAJdHJp
c3RhdGUgIkFUSSBSYWRlb24iCiAJZGVwZW5kcyBvbiBEUk0gJiYgUENJICYmIE1NVQogCXNlbGVj
dCBGV19MT0FERVIKLSAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCi0gICAgICAgIHNlbGVj
dCBEUk1fVFRNCisJc2VsZWN0IERSTV9LTVNfSEVMUEVSCisJc2VsZWN0IERSTV9UVE0KIAlzZWxl
Y3QgUE9XRVJfU1VQUExZCiAJc2VsZWN0IEhXTU9OCiAJc2VsZWN0IEJBQ0tMSUdIVF9DTEFTU19E
RVZJQ0UKQEAgLTI5NCw3ICsyOTQsNyBAQCBjb25maWcgRFJNX1ZLTVMKIAkgIElmIE0gaXMgc2Vs
ZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCB2a21zLgogCiBjb25maWcgRFJNX0FUSV9Q
Q0lHQVJUCi0gICAgICAgIGJvb2wKKwlib29sCiAKIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9LY29uZmlnIgogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
