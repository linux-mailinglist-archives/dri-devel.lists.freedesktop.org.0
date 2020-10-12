Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E360B28C919
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FE26E89F;
	Tue, 13 Oct 2020 07:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA336E437
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 11:57:34 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 33E64482BF1;
 Mon, 12 Oct 2020 19:57:30 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm/armada: fix unused parameter warning
Date: Mon, 12 Oct 2020 04:57:24 -0700
Message-Id: <20201012115724.8980-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGkNIT00dHRkYHh1KVkpNS0lOS0hDTktIQ0hVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6CRw*Ej8ZLzkaFRZRFQw#
 TgMaCUNVSlVKTUtJTktIQ05LTExIVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSUhJTTcG
X-HM-Tid: 0a751cac395993bakuws33e64482bf1
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnVuY3Rpb25zIGFybWFkYV9kcm1fY3J0Y19hdG9taWNfZmx1c2ggJgphcm1hZGFfZHJtX2NydGNf
YXRvbWljX2VuYWJsZSBkb25gdCB1c2UgdGhlIHNlY29uZCBwYXJhbWV0ZXIuClNvIHdlIG1heSBn
ZXQgd2FybmluZyBsaWtlIDoKd2FybmluZzogdW51c2VkIHBhcmFtZXRlciDigJgqKirigJkgWy1X
dW51c2VkLXBhcmFtZXRlcl0uClRoaXMgY2hhbmdlIGlzIHRvIGZpeCB0aGUgY29tcGlsZSB3YXJu
aW5nIHdpdGggLVd1bnVzZWQtcGFyYW1ldGVyLgoKU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFv
IDxiZXJuYXJkQHZpdm8uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Ny
dGMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMKaW5kZXggMzhkZmFhNDZkMzA2
Li5mYzhiOTIyYzNlNDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRh
X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9jcnRjLmMKQEAgLTQy
Nyw3ICs0MjcsNyBAQCBzdGF0aWMgaW50IGFybWFkYV9kcm1fY3J0Y19hdG9taWNfY2hlY2soc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAogfQogCiBzdGF0aWMgdm9pZCBhcm1hZGFfZHJtX2NydGNfYXRv
bWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKLQkJCQkJIHN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqb2xkX2NydGNfc3RhdGUpCisJCQkJc3RydWN0IGRybV9jcnRjX3N0YXRlIF9fYXR0cmli
dXRlX18oKHVudXNlZCkpICpvbGRfY3J0Y19zdGF0ZSkKIHsKIAlzdHJ1Y3QgYXJtYWRhX2NydGMg
KmRjcnRjID0gZHJtX3RvX2FybWFkYV9jcnRjKGNydGMpOwogCkBAIC00NDEsNyArNDQxLDcgQEAg
c3RhdGljIHZvaWQgYXJtYWRhX2RybV9jcnRjX2F0b21pY19iZWdpbihzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiB9CiAKIHN0YXRpYyB2b2lkIGFybWFkYV9kcm1fY3J0Y19hdG9taWNfZmx1c2goc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAotCQkJCQkgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0
Y19zdGF0ZSkKKwkJCQlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgX19hdHRyaWJ1dGVfXygodW51c2Vk
KSkgKm9sZF9jcnRjX3N0YXRlKQogewogCXN0cnVjdCBhcm1hZGFfY3J0YyAqZGNydGMgPSBkcm1f
dG9fYXJtYWRhX2NydGMoY3J0Yyk7CiAKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
