Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A0C87C3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BB589B7B;
	Wed,  2 Oct 2019 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0B289B7B;
 Wed,  2 Oct 2019 12:03:20 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N1Ofr-1i9piT0TlL-012rXj; Wed, 02 Oct 2019 14:03:14 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/6] [RESEND] drm/amd/display: hide an unused variable
Date: Wed,  2 Oct 2019 14:01:26 +0200
Message-Id: <20191002120136.1777161-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191002120136.1777161-1-arnd@arndb.de>
References: <20191002120136.1777161-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1n5M6zZR4G8yBL9D3/PPSqfSjJLO9/wJ7CFXKkY1GhO9dfbJMYH
 BiSgOyk4TECZnA3BSyAneDEqnYgbFD97WeiIo4lGIG8gXruAgbG+OFz8JrMXpu4H9o9caks
 Np/4Fh8LpTmpmV6Xp3jiphnuOB/fVWxp/AAMAajPUx40WWakIcnYsfRjRKmzW5r6zab6tVy
 JE6I3T9syZxzU4/jUrblQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:naTv7zcdLbg=:K0DiYgcUAFUIvZNSJLnPhF
 TR8ONd0H5vlFNo9s+S173Y0i1yWRmEuEcfuiUtbDNfeQhxSN4qbsGQHKYowzOslPG4Xwm7iHh
 gLASVPq3d4YTmFVY590C6iuhoOJzAB5eYIIgr05Gqlx7CR668I669LA90dj/iyUKfUnzDrJar
 LZnab4p+nt4C4PfV897q0HFaPFLgvb4CmfyFymF3TvMXJiRpUBZ/RyI74KSi8LbvKSGujvfCO
 1XxJ7oH1mtw+Uf/jeyTxbL3aLzXfCQ+Q+eywDgTgJeZe3/r0Lz/5jR1N81AhAsov/jhUCgVo6
 G0CACRv6k5HfVXr+LnzU0RVPue/t4oSmm85X4QRjO0ycxRun1YW6GPKbjEwl6yUGrTUgmes5M
 CgZ0b57xUI4cr2Wlaqz5XI8wYnCPRsRr0gepZx+7vQWrBsqUQTgE5ON7U//qfRVQq1V1NIXk7
 WjCYrftUGzz3p28lAANIFZ4BngPJZ4u+GXqo4gKtFnoZvSgr21XuTwMH/A485jWmMFBJ4DaRh
 ukxFYBiYyuPHV2Tl6J1cZGw5HUNurtA9UsNc8Q74rboxhdw2enud8CsC9XRY7kGZA2msxsqPv
 H0gce7q61WH6+lviiLyAo1pFAzVRqZtO6m/awVb2gVLoqKkPV+MmqwTdK9A9eDVNGRzbb7/MH
 lK67JYsSZffsn0qHPiBDie2qQ8aZn+wGUas5aQQTxxx2XT67KtbTtz63FbJ13tyJMgyRViIR8
 YwFfXd6rCOs4ZuKJxz0nSW1QHEgR65YGVuNpb2rKl85o8Drf2xLESyWNx0lD6BXPq3KRSGCgQ
 O9STRSdwbZkJFO0E3wLP734Wopq5REw03eGLVciu1Uh0Xt3UtA0Fx7J17HWcsDzq/AWzmSv7N
 fu42zs35kwyPfqf/bz9A==
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
Cc: Dingchen Zhang <dingchen.zhang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aG91dCBDT05GSUdfREVCVUdfRlMsIHdlIGdldCBhIHdhcm5pbmcgZm9yIGFuIHVudXNlZAp2
YXJpYWJsZToKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jOjYwMjA6MzM6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUgJ3NvdXJjZScgWy1X
ZXJyb3IsLVd1bnVzZWQtdmFyaWFibGVdCgpIaWRlIHRoZSB2YXJpYWJsZSBpbiBhbiAjaWZkZWYg
bGlrZSBpdHMgb25seSB1c2Vycy4KCkZpeGVzOiAxNGIyNTg0NjM2YzYgKCJkcm0vYW1kL2Rpc3Bs
YXk6IGFkZCBmdW5jdGlvbmFsaXR5IHRvIGdyYWIgRFBSWCBDUkMgZW50cmllcy4iKQpSZXZpZXdl
ZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQpUaGlzIHdhcyBhIGJ1Z2ZpeCBm
b3IgYSBjb21taXQgdGhhdCBsYW5kZWQgaW4gdjUuNC1yYzEuIFRoZQpmaXggd2FzIGFwcGxpZWQg
YnkgQWxleCBEZXVjaGVyIG9uIFNlcCAxOSwgYnV0IGlzIHN0aWxsIG5vdApzZWVuIGluIGxpbnV4
LW5leHQuClJlc2VuZGluZyB0byBtYWtlIHN1cmUgdGhpcyBtYWtlcyBpdCBpbnRvIHY1LjQtZmlu
YWwsIGJ1dApwbGVhc2UgaWdub3JlIGlmIHRoaXMgaXMgYWxyZWFkeSBjb21pbmcuCi0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIgKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA4Y2FiNmRhNTEyYTAuLjc1MTZh
NjQzNjgyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCkBAIC02MDE5LDcgKzYwMTksOSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1f
ZW5hYmxlX2NydGNfaW50ZXJydXB0cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVjdCBk
cm1fY3J0YyAqY3J0YzsKIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlLCAq
bmV3X2NydGNfc3RhdGU7CiAJaW50IGk7CisjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCiAJZW51bSBh
bWRncHVfZG1fcGlwZV9jcmNfc291cmNlIHNvdXJjZTsKKyNlbmRpZgogCiAJZm9yX2VhY2hfb2xk
bmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMsIG9sZF9jcnRjX3N0YXRlLAogCQkJCSAgICAg
IG5ld19jcnRjX3N0YXRlLCBpKSB7Ci0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
