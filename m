Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB66F64F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 00:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AEC89A75;
	Sun, 21 Jul 2019 22:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1370 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jul 2019 22:12:28 UTC
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.145.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C749589A75
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 22:12:28 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id C6C42357E6
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 16:49:37 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id pJi5hLIs4dnCepJi5hq9ch; Sun, 21 Jul 2019 16:49:37 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-189.pcs.intercable.net
 ([187.160.61.189]:45045 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hpJi4-000Ypz-Ab; Sun, 21 Jul 2019 16:49:36 -0500
Date: Sun, 21 Jul 2019 16:49:35 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Philip Cox <Philip.Cox@amd.com>, Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdkfd: Fix missing break in switch statement
Message-ID: <20190721214935.GA910@embeddedor>
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
X-Exim-ID: 1hpJi4-000Ypz-Ab
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-189.pcs.intercable.net (embeddedor)
 [187.160.61.189]:45045
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 13
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
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50IGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGNvZGUg
ZnJvbSBmYWxsaW5nCnRocm91Z2ggdG8gY2FzZSBDSElQX05BVkkxMC4KClRoaXMgYnVnIHdhcyBm
b3VuZCB0aGFua3MgdG8gdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaC4KCkZpeGVzOiAxNDMyOGFhNThjZTUgKCJkcm0vYW1ka2ZkOiBBZGQgbmF2aTEw
IHN1cHBvcnQgdG8gYW1ka2ZkLiAodjMpIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2ln
bmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfY3JhdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQu
YwppbmRleCA3OTIzNzE0NDIxOTUuLjRlM2ZjMjg0ZjZhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfY3JhdC5jCkBAIC02NjgsNiArNjY4LDcgQEAgc3RhdGljIGludCBrZmRfZmlsbF9n
cHVfY2FjaGVfaW5mbyhzdHJ1Y3Qga2ZkX2RldiAqa2RldiwKIAljYXNlIENISVBfUkFWRU46CiAJ
CXBjYWNoZV9pbmZvID0gcmF2ZW5fY2FjaGVfaW5mbzsKIAkJbnVtX29mX2NhY2hlX3R5cGVzID0g
QVJSQVlfU0laRShyYXZlbl9jYWNoZV9pbmZvKTsKKwkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkx
MDoKIAkJcGNhY2hlX2luZm8gPSBuYXZpMTBfY2FjaGVfaW5mbzsKIAkJbnVtX29mX2NhY2hlX3R5
cGVzID0gQVJSQVlfU0laRShuYXZpMTBfY2FjaGVfaW5mbyk7Ci0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
