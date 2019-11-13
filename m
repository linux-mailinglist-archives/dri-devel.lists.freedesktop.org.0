Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7CFADA1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 10:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663816ECB9;
	Wed, 13 Nov 2019 09:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACA26ECB4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 405BF40C64;
 Wed, 13 Nov 2019 10:52:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WC0FSwlShCCb; Wed, 13 Nov 2019 10:52:12 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id EEA5140C5B;
 Wed, 13 Nov 2019 10:52:11 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5A7BC36018A;
 Wed, 13 Nov 2019 10:52:11 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: remove set but not used variable 'srf'
Date: Wed, 13 Nov 2019 10:51:44 +0100
Message-Id: <20191113095144.2981-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191113095144.2981-1-thomas_os@shipmail.org>
References: <20191113095144.2981-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573638731; bh=q74VSfVDvK14kASPKlgAUTNZ/srTu09HppQD/4xsj08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lztBjmcXbwinSfatIHAxAUWGJvyUZM12HZd6ZoLs9hOFcUXP9LKE2jfyk8P4UqHjF
 PNbKSOXrEukzEP3mXBAehc9AUQwtaAzB75v6QQU0TpFc5tuQPCyec/7kyVYWt1gGnK
 7PYADcfUb9k9Zldt1EbcgqQLIhmjkLt/ZD5BdHhw=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="lztBjmcX";
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jOjMzOToyMjoKIHdhcm5pbmc6IHZhcmlhYmxlIHNyZiBz
ZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKJ3NyZicgaXMgbmV2
ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5
dWVoYWliaW5nQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVs
bHN0cm9tQHZtd2FyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3Vy
ZmFjZS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCmluZGV4IDI5ZDg3OTRmMDQyMS4uZGUwNTMwYjRk
YzFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCkBAIC0zMzYsNyAr
MzM2LDYgQEAgc3RhdGljIHZvaWQgdm13X2h3X3N1cmZhY2VfZGVzdHJveShzdHJ1Y3Qgdm13X3Jl
c291cmNlICpyZXMpCiB7CiAKIAlzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2ID0gcmVzLT5k
ZXZfcHJpdjsKLQlzdHJ1Y3Qgdm13X3N1cmZhY2UgKnNyZjsKIAl2b2lkICpjbWQ7CiAKIAlpZiAo
cmVzLT5mdW5jLT5kZXN0cm95ID09IHZtd19nYl9zdXJmYWNlX2Rlc3Ryb3kpIHsKQEAgLTM2MCw3
ICszNTksNiBAQCBzdGF0aWMgdm9pZCB2bXdfaHdfc3VyZmFjZV9kZXN0cm95KHN0cnVjdCB2bXdf
cmVzb3VyY2UgKnJlcykKIAkJICovCiAKIAkJbXV0ZXhfbG9jaygmZGV2X3ByaXYtPmNtZGJ1Zl9t
dXRleCk7Ci0JCXNyZiA9IHZtd19yZXNfdG9fc3JmKHJlcyk7CiAJCWRldl9wcml2LT51c2VkX21l
bW9yeV9zaXplIC09IHJlcy0+YmFja3VwX3NpemU7CiAJCW11dGV4X3VubG9jaygmZGV2X3ByaXYt
PmNtZGJ1Zl9tdXRleCk7CiAJfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
