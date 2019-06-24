Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64651E6B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618689E69;
	Mon, 24 Jun 2019 22:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4989E69
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:37:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hfXaY-0001El-FV; Mon, 24 Jun 2019 22:37:26 +0000
From: Colin King <colin.king@canonical.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH] fbmem: remove redundant assignment to err
Date: Mon, 24 Jun 2019 23:37:24 +0100
Message-Id: <20190624223724.13629-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IGVyciBpcyBpbml0aWFsaXplZCB0byBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIgcmVhZCBhbmQgaXQK
aXMgcmUtYXNzaWduZWQgbGF0ZXIuICBUaGUgaW5pdGlhbGl6YXRpb24gaXMgcmVkdW5kYW50IGFu
ZCBjYW4KYmUgcmVtb3ZlZC4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgot
LS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
YwppbmRleCBkZDFhNzA4ZGYxYTcuLmFlMDQ0YTEzMjVjYSAxMDA2NDQKLS0tIGEvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zi
bWVtLmMKQEAgLTE5ODcsNyArMTk4Nyw3IEBAIGludCBmYl9uZXdfbW9kZWxpc3Qoc3RydWN0IGZi
X2luZm8gKmluZm8pCiAJc3RydWN0IGxpc3RfaGVhZCAqcG9zLCAqbjsKIAlzdHJ1Y3QgZmJfbW9k
ZWxpc3QgKm1vZGVsaXN0OwogCXN0cnVjdCBmYl92aWRlb21vZGUgKm0sIG1vZGU7Ci0JaW50IGVy
ciA9IDE7CisJaW50IGVycjsKIAogCWxpc3RfZm9yX2VhY2hfc2FmZShwb3MsIG4sICZpbmZvLT5t
b2RlbGlzdCkgewogCQltb2RlbGlzdCA9IGxpc3RfZW50cnkocG9zLCBzdHJ1Y3QgZmJfbW9kZWxp
c3QsIGxpc3QpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
