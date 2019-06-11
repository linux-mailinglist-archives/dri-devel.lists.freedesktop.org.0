Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877703D38A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A5289202;
	Tue, 11 Jun 2019 17:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE58B89202
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:09:19 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hakGn-0002YS-I1; Tue, 11 Jun 2019 17:09:13 +0000
From: Colin King <colin.king@canonical.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] video: fbdev: atmel_lcdfb: remove redundant
 initialization to variable ret
Date: Tue, 11 Jun 2019 18:09:13 +0100
Message-Id: <20190611170913.20913-1-colin.king@canonical.com>
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
eSB2YXJpYWJsZSByZXQgaXMgYmVpbmcgaW5pdGlhbGl6ZWQgd2l0aCAtRU5PRU5UIGhvd2V2ZXIg
dGhhdAp2YWx1ZSBpcyBuZXZlciByZWFkIGFuZCByZXQgaXMgYmVpbmcgcmUtYXNzaWduZWQgbGF0
ZXIgb24uIEhlbmNlIHRoaXMKYXNzaWdubWVudCBpcyByZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1v
dmVkLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpClNpZ25lZC1vZmYtYnk6
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy92
aWRlby9mYmRldi9hdG1lbF9sY2RmYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9h
dG1lbF9sY2RmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdG1lbF9sY2RmYi5jCmluZGV4IGZi
MTE3Y2NiZWFiMy4uOTMwY2MzZjkyZTAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2F0bWVsX2xjZGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdG1lbF9sY2RmYi5jCkBA
IC05NTAsNyArOTUwLDcgQEAgc3RhdGljIGludCBhdG1lbF9sY2RmYl9vZl9pbml0KHN0cnVjdCBh
dG1lbF9sY2RmYl9pbmZvICpzaW5mbykKIAlzdHJ1Y3QgZmJfdmlkZW9tb2RlIGZiX3ZtOwogCXN0
cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwogCXN0cnVjdCB2aWRlb21vZGUgdm07Ci0JaW50IHJldCA9
IC1FTk9FTlQ7CisJaW50IHJldDsKIAlpbnQgaTsKIAogCXNpbmZvLT5jb25maWcgPSAoc3RydWN0
IGF0bWVsX2xjZGZiX2NvbmZpZyopCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
