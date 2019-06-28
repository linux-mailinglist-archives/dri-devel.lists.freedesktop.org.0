Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4D59E44
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 16:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616C06E937;
	Fri, 28 Jun 2019 14:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC6F6E93C;
 Fri, 28 Jun 2019 14:54:46 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgsGx-0001bA-Dj; Fri, 28 Jun 2019 14:54:43 +0000
From: Colin King <colin.king@canonical.com>
To: Philip Cox <Philip.Cox@amd.com>, Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH][next] drm/amdkfd: fix a missing break in a switch statement
Date: Fri, 28 Jun 2019 15:54:43 +0100
Message-Id: <20190628145443.9754-1-colin.king@canonical.com>
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSBmb3IgdGhlIENISVBfUkFWRU4gY2FzZSB0aGVyZSBpcyBhIG1pc3NpbmcgYnJlYWsKY2F1c2lu
ZyB0aGUgY29kZSB0byBmYWxsIHRocm91Z2ggdG8gdGhlIG5ldyBDSElQX05BVkkxMCBjYXNlLgpG
aXggdGhpcyBieSBhZGRpbmcgaW4gdGhlIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50LgoKRml4ZXM6
IDE0MzI4YWE1OGNlNSAoImRybS9hbWRrZmQ6IEFkZCBuYXZpMTAgc3VwcG9ydCB0byBhbWRrZmQu
ICh2MykiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfY3JhdC5jCmluZGV4IDc5MjM3MTQ0MjE5NS4uNGUzZmMyODRmNmFjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKQEAgLTY2OCw2ICs2NjgsNyBAQCBzdGF0aWMgaW50IGtm
ZF9maWxsX2dwdV9jYWNoZV9pbmZvKHN0cnVjdCBrZmRfZGV2ICprZGV2LAogCWNhc2UgQ0hJUF9S
QVZFTjoKIAkJcGNhY2hlX2luZm8gPSByYXZlbl9jYWNoZV9pbmZvOwogCQludW1fb2ZfY2FjaGVf
dHlwZXMgPSBBUlJBWV9TSVpFKHJhdmVuX2NhY2hlX2luZm8pOworCQlicmVhazsKIAljYXNlIENI
SVBfTkFWSTEwOgogCQlwY2FjaGVfaW5mbyA9IG5hdmkxMF9jYWNoZV9pbmZvOwogCQludW1fb2Zf
Y2FjaGVfdHlwZXMgPSBBUlJBWV9TSVpFKG5hdmkxMF9jYWNoZV9pbmZvKTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
