Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C9FDDB9A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAC489CAC;
	Sun, 20 Oct 2019 00:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 496 seconds by postgrey-1.36 at gabe;
 Sat, 19 Oct 2019 07:32:55 UTC
Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com
 [198.54.122.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1321F89D6C;
 Sat, 19 Oct 2019 07:32:55 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 7DB0760046;
 Sat, 19 Oct 2019 03:32:54 -0400 (EDT)
Received: from wambui.zuku.co.ke (unknown [10.20.151.218])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 038DC60033;
 Sat, 19 Oct 2019 07:32:50 +0000 (UTC)
From: Wambui Karuga <wambui@karuga.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: remove assignment for return value
Date: Sat, 19 Oct 2019 10:32:42 +0300
Message-Id: <20191019073242.21652-1-wambui@karuga.xyz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHVubmVjZXNzYXJ5IGFzc2lnbm1lbnQgZm9yIHJldHVybiB2YWx1ZSBhbmQgaGF2ZSB0
aGUKZnVuY3Rpb24gcmV0dXJuIHRoZSByZXF1aXJlZCB2YWx1ZSBkaXJlY3RseS4KSXNzdWUgZm91
bmQgYnkgY29jY2luZWxsZToKQEAKbG9jYWwgaWRleHByZXNzaW9uIHJldDsKZXhwcmVzc2lvbiBl
OwpAQAoKLXJldCA9CityZXR1cm4KICAgICBlOwotcmV0dXJuIHJldDsKClNpZ25lZC1vZmYtYnk6
IFdhbWJ1aSBLYXJ1Z2EgPHdhbWJ1aUBrYXJ1Z2EueHl6PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vY2lrLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lr
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCmluZGV4IDYyZWFiODJhNjRmOS4uZGFm
ZjlhMmFmM2JlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKQEAgLTIyMSw5ICsyMjEsNyBAQCBpbnQgY2lf
Z2V0X3RlbXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJZWxzZQogCQlhY3R1YWxfdGVt
cCA9IHRlbXAgJiAweDFmZjsKIAotCWFjdHVhbF90ZW1wID0gYWN0dWFsX3RlbXAgKiAxMDAwOwot
Ci0JcmV0dXJuIGFjdHVhbF90ZW1wOworCXJldHVybiBhY3R1YWxfdGVtcCAqIDEwMDA7CiB9CiAK
IC8qIGdldCB0ZW1wZXJhdHVyZSBpbiBtaWxsaWRlZ3JlZXMgKi8KQEAgLTIzOSw5ICsyMzcsNyBA
QCBpbnQga3ZfZ2V0X3RlbXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJZWxzZQogCQlh
Y3R1YWxfdGVtcCA9IDA7CiAKLQlhY3R1YWxfdGVtcCA9IGFjdHVhbF90ZW1wICogMTAwMDsKLQot
CXJldHVybiBhY3R1YWxfdGVtcDsKKwlyZXR1cm4gYWN0dWFsX3RlbXAgKiAxMDAwOwogfQogCiAv
KgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
