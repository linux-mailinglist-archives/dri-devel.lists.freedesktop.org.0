Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52C107B29
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD8F6E0DA;
	Fri, 22 Nov 2019 23:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AA16E0DA;
 Fri, 22 Nov 2019 23:15:07 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iYI8n-0000Bh-7T; Fri, 22 Nov 2019 23:15:05 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: remove redundant assignment to variable ret
Date: Fri, 22 Nov 2019 23:15:04 +0000
Message-Id: <20191122231504.109948-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSByZXQgaXMgYmVpbmcgaW5pdGlhbGl6ZWQgd2l0aCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIK
cmVhZCBhbmQgaXQgaXMgYmVpbmcgdXBkYXRlZCBsYXRlciB3aXRoIGEgbmV3IHZhbHVlLiBUaGUK
aW5pdGlhbGl6YXRpb24gaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFkZHJlc3Nl
cy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2lu
ZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
c2lfZHBtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYwppbmRleCA4MTQ4YTc4ODNkZTQuLjM0NjMxNWIz
ZWViZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jCkBAIC01ODk5LDcgKzU4OTksNyBAQCBzdGF0
aWMgaW50IHNpX3BhdGNoX3NpbmdsZV9kZXBlbmRlbmN5X3RhYmxlX2Jhc2VkX29uX2xlYWthZ2Uo
c3RydWN0IHJhZGVvbl9kZXZpYwogCiBzdGF0aWMgaW50IHNpX3BhdGNoX2RlcGVuZGVuY3lfdGFi
bGVzX2Jhc2VkX29uX2xlYWthZ2Uoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB7Ci0JaW50
IHJldCA9IDA7CisJaW50IHJldDsKIAogCXJldCA9IHNpX3BhdGNoX3NpbmdsZV9kZXBlbmRlbmN5
X3RhYmxlX2Jhc2VkX29uX2xlYWthZ2UocmRldiwKIAkJCQkJCQkJJnJkZXYtPnBtLmRwbS5keW5f
c3RhdGUudmRkY19kZXBlbmRlbmN5X29uX3NjbGspOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
