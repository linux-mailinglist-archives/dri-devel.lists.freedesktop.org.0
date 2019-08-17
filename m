Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914D91066
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 14:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E16E113;
	Sat, 17 Aug 2019 12:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901C36E113
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 12:21:28 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hyxi1-00056o-6K; Sat, 17 Aug 2019 12:21:25 +0000
From: Colin King <colin.king@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH][drm-next] drm/panel: remove redundant assignment to val
Date: Sat, 17 Aug 2019 13:21:24 +0100
Message-Id: <20190817122124.29650-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IHZhbCBpcyBpbml0aWFsaXplZCB0byBhIHZhbHVlIGluIGEgZm9yLWxvb3AgdGhhdCBpcwpuZXZl
ciByZWFkIGFuZCBoZW5jZSBpdCBpcyByZWR1bmRhbnQuIFJlbW92ZSBpdC4KCkFkZHJlc3Nlcy1D
b3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8
Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC10cG8tdGQwNDNtdGVhMS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXRwby10ZDA0M210ZWExLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDQz
bXRlYTEuYwppbmRleCAzYjRmMzBjMGZkYWUuLjg0MzcwNTYyOTEwZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDA0M210ZWExLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXRwby10ZDA0M210ZWExLmMKQEAgLTExNiw3ICsxMTYsNyBAQCBz
dGF0aWMgdm9pZCB0ZDA0M210ZWExX3dyaXRlX2dhbW1hKHN0cnVjdCB0ZDA0M210ZWExX3BhbmVs
ICpsY2QpCiAJdGQwNDNtdGVhMV93cml0ZShsY2QsIDB4MTMsIHZhbCk7CiAKIAkvKiBnYW1tYSBi
aXRzIFs3OjBdICovCi0JZm9yICh2YWwgPSBpID0gMDsgaSA8IDEyOyBpKyspCisJZm9yIChpID0g
MDsgaSA8IDEyOyBpKyspCiAJCXRkMDQzbXRlYTFfd3JpdGUobGNkLCAweDE0ICsgaSwgZ2FtbWFb
aV0gJiAweGZmKTsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
