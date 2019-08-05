Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054A8170E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DD289CDD;
	Mon,  5 Aug 2019 10:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B441B89CDB;
 Mon,  5 Aug 2019 10:29:43 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1huaFI-0006WD-Vn; Mon, 05 Aug 2019 10:29:41 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amd/powerplay: remove redundant duplicated
 return check
Date: Mon,  5 Aug 2019 11:29:40 +0100
Message-Id: <20190805102940.26024-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBjaGVj
ayBvbiByZXQgaXMgZHVwbGljYXRlZCBpbiB0d28gcGxhY2VzLCBpdCBpcyByZWR1bmRhbnQgY29k
ZS4KUmVtb3ZlIGl0LgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkxvZ2ljYWxseSBkZWFkIGNvZGUi
KQpGaXhlczogYjk0YWZiNjFjZGFlICgiZHJtL2FtZC9wb3dlcnBsYXk6IGhvbm9yIGh3IGxpbWl0
IG9uIGZldGNoaW5nIG1ldHJpY3MgZGF0YSBmb3IgbmF2aTEwIikKU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YwppbmRleCBkNjJjMjc4NGIxMDIuLmIyNzJjOGRjOGY3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtOTQxLDggKzk0MSw2IEBAIHN0YXRpYyBpbnQg
bmF2aTEwX2dldF9ncHVfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICp2
YWx1ZSkKIAlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7CiAJ
aWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwogCiAJKnZh
bHVlID0gbWV0cmljcy5BdmVyYWdlU29ja2V0UG93ZXIgPDwgODsKIApAQCAtMTAwMSw4ICs5OTks
NiBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfZmFuX3NwZWVkX3JwbShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwogCiAJ
KnNwZWVkID0gbWV0cmljcy5DdXJyRmFuU3BlZWQ7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
