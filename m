Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4337D7CE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 10:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0C66E3E4;
	Thu,  1 Aug 2019 08:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A2B6E3E4;
 Thu,  1 Aug 2019 08:39:44 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1ht6cg-0004e0-3p; Thu, 01 Aug 2019 08:39:42 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amd/powerplay: fix a few spelling mistakes
Date: Thu,  1 Aug 2019 09:39:41 +0100
Message-Id: <20190801083941.4230-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGFy
ZSBhIGZldyBzcGVsbGluZyBtaXN0YWtlcyAidW5rbm93IiAtPiAidW5rbm93biIgYW5kCiJlbmFi
ZWxkIiAtPiAiZW5hYmxlZCIuIEZpeCB0aGVzZS4KClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBL
aW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jCmluZGV4IDEzYjJjOGE2MDIzMi4uZDAyOWE5OWU2MDBlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0zOSw3ICszOSw3IEBAIHN0
YXRpYyBjb25zdCBjaGFyKiBfX3NtdV9tZXNzYWdlX25hbWVzW10gPSB7CiBjb25zdCBjaGFyICpz
bXVfZ2V0X21lc3NhZ2VfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfbWVz
c2FnZV90eXBlIHR5cGUpCiB7CiAJaWYgKHR5cGUgPCAwIHx8IHR5cGUgPiBTTVVfTVNHX01BWF9D
T1VOVCkKLQkJcmV0dXJuICJ1bmtub3cgc211IG1lc3NhZ2UiOworCQlyZXR1cm4gInVua25vd24g
c211IG1lc3NhZ2UiOwogCXJldHVybiBfX3NtdV9tZXNzYWdlX25hbWVzW3R5cGVdOwogfQogCkBA
IC01Miw3ICs1Miw3IEBAIHN0YXRpYyBjb25zdCBjaGFyKiBfX3NtdV9mZWF0dXJlX25hbWVzW10g
PSB7CiBjb25zdCBjaGFyICpzbXVfZ2V0X2ZlYXR1cmVfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bSBzbXVfZmVhdHVyZV9tYXNrIGZlYXR1cmUpCiB7CiAJaWYgKGZlYXR1cmUgPCAw
IHx8IGZlYXR1cmUgPiBTTVVfRkVBVFVSRV9DT1VOVCkKLQkJcmV0dXJuICJ1bmtub3cgc211IGZl
YXR1cmUiOworCQlyZXR1cm4gInVua25vd24gc211IGZlYXR1cmUiOwogCXJldHVybiBfX3NtdV9m
ZWF0dXJlX25hbWVzW2ZlYXR1cmVdOwogfQogCkBAIC03OSw3ICs3OSw3IEBAIHNpemVfdCBzbXVf
c3lzX2dldF9wcF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGNoYXIgKmJ1
ZikKIAkJCSAgICAgICBjb3VudCsrLAogCQkJICAgICAgIHNtdV9nZXRfZmVhdHVyZV9uYW1lKHNt
dSwgaSksCiAJCQkgICAgICAgZmVhdHVyZV9pbmRleCwKLQkJCSAgICAgICAhIXNtdV9mZWF0dXJl
X2lzX2VuYWJsZWQoc211LCBpKSA/ICJlbmFiZWxkIiA6ICJkaXNhYmxlZCIpOworCQkJICAgICAg
ICEhc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIGkpID8gImVuYWJsZWQiIDogImRpc2FibGVk
Iik7CiAJfQogCiBmYWlsZWQ6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
