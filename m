Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E36F670
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 00:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238C789AC2;
	Sun, 21 Jul 2019 22:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.145.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748FC89AC2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 22:39:54 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id C2CED199F3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 17:39:53 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id pKUjhkCqj2PzOpKUjhsEJu; Sun, 21 Jul 2019 17:39:53 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-189.pcs.intercable.net
 ([187.160.61.189]:12335 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hpKUi-000rlS-I2; Sun, 21 Jul 2019 17:39:52 -0500
Date: Sun, 21 Jul 2019 17:39:49 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu/gfx10: Fix missing break in switch statement
Message-ID: <20190721223949.GA13591@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.160.61.189
X-Source-L: No
X-Exim-ID: 1hpKUi-000rlS-I2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-189.pcs.intercable.net (embeddedor)
 [187.160.61.189]:12335
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50IGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGNvZGUg
ZnJvbSBmYWxsaW5nCnRocm91Z2ggdG8gY2FzZSBBTURHUFVfSVJRX1NUQVRFX0VOQUJMRS4KClRo
aXMgYnVnIHdhcyBmb3VuZCB0aGFua3MgdG8gdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUK
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KCkZpeGVzOiBhNjQ0ZDg1YTVjZDQgKCJkcm0vYW1kZ3B1
OiBhZGQgZ2Z4IHYxMCBpbXBsZW1lbnRhdGlvbiAodjEwKSIpCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRk
ZWRvci5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKaW5kZXggMTY3NWQ1ODM3YzNjLi4zNWU4ZTI5MTM5YjEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC00NjExLDYgKzQ2MTEsNyBAQCBnZnhf
djEwXzBfc2V0X2dmeF9lb3BfaW50ZXJydXB0X3N0YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQljcF9pbnRfY250bCA9IFJFR19TRVRfRklFTEQoY3BfaW50X2NudGwsIENQX0lOVF9D
TlRMX1JJTkcwLAogCQkJCQkgICAgVElNRV9TVEFNUF9JTlRfRU5BQkxFLCAwKTsKIAkJV1JFRzMy
KGNwX2ludF9jbnRsX3JlZywgY3BfaW50X2NudGwpOworCQlicmVhazsKIAljYXNlIEFNREdQVV9J
UlFfU1RBVEVfRU5BQkxFOgogCQljcF9pbnRfY250bCA9IFJSRUczMihjcF9pbnRfY250bF9yZWcp
OwogCQljcF9pbnRfY250bCA9IFJFR19TRVRfRklFTEQoY3BfaW50X2NudGwsIENQX0lOVF9DTlRM
X1JJTkcwLAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
