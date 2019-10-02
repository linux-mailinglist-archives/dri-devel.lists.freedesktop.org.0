Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC73C87C1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46218981D;
	Wed,  2 Oct 2019 12:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A28981D;
 Wed,  2 Oct 2019 12:03:07 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N17gw-1i9YkR0zSk-012aQY; Wed, 02 Oct 2019 14:03:01 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
Date: Wed,  2 Oct 2019 14:01:25 +0200
Message-Id: <20191002120136.1777161-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191002120136.1777161-1-arnd@arndb.de>
References: <20191002120136.1777161-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iyh+vgBexJi73bPkiI60pHY80NTDCFDTYEIUMn80jY7xmFLFyN1
 lOYL3f+3oMpNTxy5GNVwJ3KsEs68xZViW7fENNgg3Jn5U+V1egRUjVEO1ktCKff0Pvq9jvM
 4GUnHYGOIUtOw3K3Thgb50nUN7iI5JiiL8myJPlaQsN9Bhcd/4wqCRRjdXAaL1TbjWAsBvu
 6OdkBy9ayup/rm6WjvHtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:osAlctbyQR8=:PMoF551m2feK1yVfj5p1si
 0NsF0Vw7jCbM3UjyL2s9+FckHGlfjS2CR5RQ8ZjWJhwRIW19TTs3Fw3o/8QRBcxnadhwrtTJs
 u/bBXHhGLUf9GfY2GQ5YbtfE6Y7lDCTClYdkNAJ8Om7NUJ15ngHT+BeANDCC82sO5P1P7Kqrh
 7Apo4JVc9XpchQly/4+AJ0Aoslcr3xTdDH5crjBlFoaDwiir6YfXa8q/A2NB+y9jW5M7x50XF
 srjEuZqSdlsFcY53m4r47Ckm04Oc6X6P0hzM6HlKXipty1ePvojObDCjOD4A6rOwtGpDymgeZ
 pBJZtnC0J9T4DuvTuqqKWrZu3V2YoQQAnt7Wau0Ilkrn1k599PEbivZl3lDzXMh3rvlY96RiC
 AOKVbfVyiCZp7JCioSHddRzgaQEB9GB7kbhKpSoJm7aHxNQtm3IYJ0uZQney+UIZaeQF2euu9
 YXFAjzM4HyyOrmVMv1aD981VTUfnCH7kdTE68ncoLBAb0fhu3TQrBSZZEuDifhvCNwA1J0twW
 2P/Qby4iOItQ+N35i0xNBN0GglcxPdx7QfPYUbI2ihJK7uCKf3vhi2svF336F5xsnoQF6B2zL
 1g43JHYgF2hPy4ufjpnwOIW1vm7jMUnQnwY6RuCw/yEPlIqH+quLN6685+4nZoZIEOgk7Jc65
 UxSLEC7Z69DRdRNoyAErimL5mBLoTsyLuSIbdAMu9Aigcmnu8+xozb1hJsZWGs+rsqXPILL7e
 w3wNvnPx6deHku0JWxLzCTmFfzWVVjPFMoSWC+xdE1vSuqn0s5+nbd6GGDRxaVRT7IBOycOCh
 BYn334EnghabAFgHkq9Hz/KzKXLfVdhlTgwqF36uo2mh1mUfOsaoYot2aaMLxAFooFvsTN5TR
 ov53b8Y7fCwiurBPSYww==
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBsaWtlIGFsbCB0aGUgb3RoZXIgdmFyaWFudHMsIHRoaXMgb25lIHBhc3NlcyBpbnZhbGlk
CmNvbXBpbGUtdGltZSBvcHRpb25zIHdpdGggY2xhbmcgYWZ0ZXIgdGhlIG5ldyBjb2RlIGdvdApt
ZXJnZWQ6CgpjbGFuZzogZXJyb3I6IHVua25vd24gYXJndW1lbnQ6ICctbXByZWZlcnJlZC1zdGFj
ay1ib3VuZGFyeT00JwpzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI2NTogcmVjaXBlIGZvciB0YXJn
ZXQgJ2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
cmVzb3VyY2UubycgZmFpbGVkCgpVc2UgdGhlIHNhbWUgdmFyaWFudCB0aGF0IHdlIGhhdmUgZm9y
IGRjbjIwIHRvIGZpeCBjb21waWxhdGlvbi4KCkZpeGVzOiBlY2VkNTFmOWJhYmIgKCJkcm0vYW1k
L2Rpc3BsYXk6IEFkZCBodWJwIGJsb2NrIGZvciBSZW5vaXIgKHYyKSIpClNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZQppbmRleCA4Y2Q5ZGU4YjFhN2EuLmVmNjczYmZm
YzI0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01h
a2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmls
ZQpAQCAtMyw3ICszLDE3IEBACiAKIERDTjIxID0gZGNuMjFfaHVicC5vIGRjbjIxX2h1YmJ1Yi5v
IGRjbjIxX3Jlc291cmNlLm8KIAotQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNuMjEvZGNuMjFf
cmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRh
cnk9NAoraWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5
PTQpLCkKKwljY19zdGFja19hbGlnbiA6PSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Citl
bHNlIGlmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXN0YWNrLWFsaWdubWVudD0xNiksKQorCWNj
X3N0YWNrX2FsaWduIDo9IC1tc3RhY2stYWxpZ25tZW50PTE2CitlbmRpZgorCitDRkxBR1NfJChB
TUREQUxQQVRIKS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNz
ZSAkKGNjX3N0YWNrX2FsaWduKQorCitpZmRlZiBDT05GSUdfQ0NfSVNfQ0xBTkcKK0NGTEFHU18k
KEFNRERBTFBBVEgpL2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLm8gKz0gLW1zc2UyCitlbmRpZgog
CiBBTURfREFMX0RDTjIxID0gJChhZGRwcmVmaXggJChBTUREQUxQQVRIKS9kYy9kY24yMS8sJChE
Q04yMSkpCiAKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
