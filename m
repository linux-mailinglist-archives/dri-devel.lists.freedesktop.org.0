Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233505545D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 18:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997E46E17D;
	Tue, 25 Jun 2019 16:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1333 seconds by postgrey-1.36 at gabe;
 Tue, 25 Jun 2019 16:23:20 UTC
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.143.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041FC6E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:23:20 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 5FA1D23AA9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 11:01:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id fnsXh6boJ2qH7fnsXhFQEn; Tue, 25 Jun 2019 11:01:05 -0500
X-Authority-Reason: nr=8
Received: from cablelink-187-160-61-213.pcs.intercable.net
 ([187.160.61.213]:30726 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hfnsW-001MjO-AX; Tue, 25 Jun 2019 11:01:04 -0500
Date: Tue, 25 Jun 2019 11:01:03 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
Message-ID: <20190625160103.GA13133@embeddedor>
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
X-Source-IP: 187.160.61.213
X-Source-L: No
X-Exim-ID: 1hfnsW-001MjO-AX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-187-160-61-213.pcs.intercable.net (embeddedor)
 [187.160.61.213]:30726
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
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
Cc: Kees Cook <keescook@chromium.org>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cgpkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3MzYy1mYi5jOiBJbiBmdW5jdGlvbiDigJhzM2NfZmJfYmxhbmvigJk6CmRyaXZlcnMvdmlkZW8v
ZmJkZXYvczNjLWZiLmM6ODExOjE2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0
aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgc2ZiLT5lbmFibGVkICY9IH4oMSA8
PCBpbmRleCk7CiAgIH5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvdmlkZW8v
ZmJkZXYvczNjLWZiLmM6ODE0OjI6IG5vdGU6IGhlcmUKICBjYXNlIEZCX0JMQU5LX05PUk1BTDoK
ICBefn5+CiAgTEQgW01dICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYi1saWdodC5vCiAgQ0Mg
W01dICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9zZWNib290L2dwMTBiLm8K
ZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYzogSW4gZnVuY3Rpb24g4oCYczNjX2ZiX2NoZWNr
X3ZhcuKAmToKZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYzoyODY6MjI6IHdhcm5pbmc6IHRo
aXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQog
ICB2YXItPnRyYW5zcC5sZW5ndGggPSAxOwogICB+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+CmRyaXZl
cnMvdmlkZW8vZmJkZXYvczNjLWZiLmM6Mjg4OjI6IG5vdGU6IGhlcmUKICBjYXNlIDE4OgogIF5+
fn4KZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYzozMTQ6MjI6IHdhcm5pbmc6IHRoaXMgc3Rh
dGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQogICB2YXIt
PnRyYW5zcC5vZmZzZXQgPSAyNDsKICAgfn5+fn5+fn5+fn5+fn5+fn5+fl5+fn4KZHJpdmVycy92
aWRlby9mYmRldi9zM2MtZmIuYzozMTY6Mjogbm90ZTogaGVyZQogIGNhc2UgMjQ6CiAgXn5+fgoK
V2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKCk5vdGlj
ZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGNvZGUgY29tbWVudHMgYXJlIG1v
ZGlmaWVkCmluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBleHBlY3RpbmcgdG8gZmluZC4K
ClRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQotV2lt
cGxpY2l0LWZhbGx0aHJvdWdoLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8
Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5j
IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvczNjLWZiLmMKaW5kZXggMjg4MzAwMDM1MTY0Li5mMGIwNjQzYWIxOTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMKKysrIGIvZHJpdmVycy92aWRl
by9mYmRldi9zM2MtZmIuYwpAQCAtMjg0LDcgKzI4NCw3IEBAIHN0YXRpYyBpbnQgczNjX2ZiX2No
ZWNrX3ZhcihzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwKIAkJLyogNjY2IHdpdGggb25l
IGJpdCBhbHBoYS90cmFuc3BhcmVuY3kgKi8KIAkJdmFyLT50cmFuc3Aub2Zmc2V0CT0gMTg7CiAJ
CXZhci0+dHJhbnNwLmxlbmd0aAk9IDE7Ci0JCS8qIGRyb3AgdGhyb3VnaCAqLworCQkvKiBmYWxs
IHRocm91Z2ggKi8KIAljYXNlIDE4OgogCQl2YXItPmJpdHNfcGVyX3BpeGVsCT0gMzI7CiAKQEAg
LTMxMiw3ICszMTIsNyBAQCBzdGF0aWMgaW50IHMzY19mYl9jaGVja192YXIoc3RydWN0IGZiX3Zh
cl9zY3JlZW5pbmZvICp2YXIsCiAJY2FzZSAyNToKIAkJdmFyLT50cmFuc3AubGVuZ3RoCT0gdmFy
LT5iaXRzX3Blcl9waXhlbCAtIDI0OwogCQl2YXItPnRyYW5zcC5vZmZzZXQJPSAyNDsKLQkJLyog
ZHJvcCB0aHJvdWdoICovCisJCS8qIGZhbGwgdGhyb3VnaCAqLwogCWNhc2UgMjQ6CiAJCS8qIG91
ciAyNGJwcCBpcyB1bnBhY2tlZCwgc28gMzJicHAgKi8KIAkJdmFyLT5iaXRzX3Blcl9waXhlbAk9
IDMyOwpAQCAtODA5LDcgKzgwOSw3IEBAIHN0YXRpYyBpbnQgczNjX2ZiX2JsYW5rKGludCBibGFu
a19tb2RlLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAljYXNlIEZCX0JMQU5LX1BPV0VSRE9XTjoK
IAkJd2luY29uICY9IH5XSU5DT054X0VOV0lOOwogCQlzZmItPmVuYWJsZWQgJj0gfigxIDw8IGlu
ZGV4KTsKLQkJLyogZmFsbCB0aHJvdWdoIHRvIEZCX0JMQU5LX05PUk1BTCAqLworCQkvKiBmYWxs
IHRocm91Z2ggLSB0byBGQl9CTEFOS19OT1JNQUwgKi8KIAogCWNhc2UgRkJfQkxBTktfTk9STUFM
OgogCQkvKiBkaXNhYmxlIHRoZSBETUEgYW5kIGRpc3BsYXkgMHgwIChibGFjaykgKi8KLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
