Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD3D0B71
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7446E94D;
	Wed,  9 Oct 2019 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617B56E94C;
 Wed,  9 Oct 2019 09:39:39 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iI8RT-0006l2-At; Wed, 09 Oct 2019 09:39:35 +0000
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915: remove redundant variable err
Date: Wed,  9 Oct 2019 10:39:35 +0100
Message-Id: <20191009093935.17895-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFuIGVhcmxp
ZXIgY29tbWl0IHJlbW92ZWQgYW55IGVycm9yIGFzc2lnbm1lbnRzIHRvIGVyciBhbmQgd2UKYXJl
IG5vdyBsZWZ0IHdpdGggYSB6ZXJvIGFzc2lnbm1lbnQgdG8gZXJyIGFuZCBhIGNoZWNrIHRoYXQg
aXMKYWx3YXlzIGZhbHNlLiBDbGVhbiB0aGlzIHVwIGJ5IHJlbW92aW5nIHRoZSByZWR1bmRhbnQg
dmFyaWFibGUKZXJyIGFuZCB0aGUgZXJyb3IgY2hlY2suCgpBZGRyZXNzZXMtQ292ZXJpdHk6ICgi
J0NvbnN0YW50JyB2YXJpYWJsZSBndWFyZCIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9hY3RpdmUuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2FjdGl2ZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9hY3RpdmUuYwppbmRleCBhYTM3YzA3MDA0YjkuLjY3MzA1MTY1YzEyYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9hY3RpdmUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2FjdGl2ZS5jCkBAIC00MzgsNyArNDM4LDYgQEAgc3RhdGlj
IHZvaWQgZW5hYmxlX3NpZ25hbGluZyhzdHJ1Y3QgaTkxNV9hY3RpdmVfZmVuY2UgKmFjdGl2ZSkK
IGludCBpOTE1X2FjdGl2ZV93YWl0KHN0cnVjdCBpOTE1X2FjdGl2ZSAqcmVmKQogewogCXN0cnVj
dCBhY3RpdmVfbm9kZSAqaXQsICpuOwotCWludCBlcnIgPSAwOwogCiAJbWlnaHRfc2xlZXAoKTsK
IApAQCAtNDU2LDggKzQ1NSw2IEBAIGludCBpOTE1X2FjdGl2ZV93YWl0KHN0cnVjdCBpOTE1X2Fj
dGl2ZSAqcmVmKQogCS8qIEFueSBmZW5jZSBhZGRlZCBhZnRlciB0aGUgd2FpdCBiZWdpbnMgd2ls
bCBub3QgYmUgYXV0by1zaWduYWxlZCAqLwogCiAJaTkxNV9hY3RpdmVfcmVsZWFzZShyZWYpOwot
CWlmIChlcnIpCi0JCXJldHVybiBlcnI7CiAKIAlpZiAod2FpdF92YXJfZXZlbnRfaW50ZXJydXB0
aWJsZShyZWYsIGk5MTVfYWN0aXZlX2lzX2lkbGUocmVmKSkpCiAJCXJldHVybiAtRUlOVFI7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
