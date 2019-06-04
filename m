Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CD35489
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 01:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B917189C2A;
	Tue,  4 Jun 2019 23:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1274 seconds by postgrey-1.36 at gabe;
 Tue, 04 Jun 2019 23:53:22 UTC
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.50.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F293B89C2A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 23:53:22 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id D09ABA4C3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 18:32:07 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id YIuVhWLvq4FKpYIuVhqOW1; Tue, 04 Jun 2019 18:32:07 -0500
X-Authority-Reason: nr=8
Received: from [189.250.127.120] (port=46282 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hYIuU-000mO4-N5; Tue, 04 Jun 2019 18:32:06 -0500
Date: Tue, 4 Jun 2019 18:32:05 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev-MMP: Use struct_size() in devm_kzalloc()
Message-ID: <20190604233205.GA5377@embeddedor>
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
X-Source-IP: 189.250.127.120
X-Source-L: No
X-Exim-ID: 1hYIuU-000mO4-N5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.127.120]:46282
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIG9mIHRoZSBtb3JlIGNvbW1vbiBjYXNlcyBvZiBhbGxvY2F0aW9uIHNpemUgY2FsY3VsYXRp
b25zIGlzIGZpbmRpbmcKdGhlIHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNp
emVkIGFycmF5IGF0IHRoZSBlbmQsIGFsb25nCndpdGggbWVtb3J5IGZvciBzb21lIG51bWJlciBv
ZiBlbGVtZW50cyBmb3IgdGhhdCBhcnJheS4gRm9yIGV4YW1wbGU6CgpzdHJ1Y3QgZm9vIHsKICAg
IGludCBzdHVmZjsKICAgIHN0cnVjdCBib28gZW50cnlbXTsKfTsKCnNpemUgPSBzaXplb2Yoc3Ry
dWN0IGZvbykgKyBjb3VudCAqIHNpemVvZihzdHJ1Y3QgYm9vKTsKaW5zdGFuY2UgPSBkZXZtX2t6
YWxsb2MoZGV2LCBzaXplLCBHRlBfS0VSTkVMKTsKCkluc3RlYWQgb2YgbGVhdmluZyB0aGVzZSBv
cGVuLWNvZGVkIGFuZCBwcm9uZSB0byB0eXBlIG1pc3Rha2VzLCB3ZSBjYW4Kbm93IHVzZSB0aGUg
bmV3IHN0cnVjdF9zaXplKCkgaGVscGVyOgoKaW5zdGFuY2UgPSBkZXZtX2t6YWxsb2MoZGV2LCBz
dHJ1Y3Rfc2l6ZShpbnN0YW5jZSwgZW50cnksIGNvdW50KSwgR0ZQX0tFUk5FTCk7CgpOb3RpY2Ug
dGhhdCwgaW4gdGhpcyBjYXNlLCB2YXJpYWJsZSBzaXplIGlzIG5vdCBuZWNlc3NhcnksIGhlbmNl
IGl0CmlzIHJlbW92ZWQuCgpUaGlzIGNvZGUgd2FzIGRldGVjdGVkIHdpdGggdGhlIGhlbHAgb2Yg
Q29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9A
ZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvbW1wX2N0cmwu
YyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvbW1wX2N0cmwu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L21tcF9jdHJsLmMKaW5kZXggODdkOTQzZjE1
YTEyLi4xNzE3NGNkN2E1YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3
L21tcF9jdHJsLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvbW1wX2N0cmwuYwpA
QCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyBpbnQgbW1waHdfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbW1wX21hY2hfcGxhdF9pbmZvICptaTsKIAlzdHJ1
Y3QgcmVzb3VyY2UgKnJlczsKLQlpbnQgcmV0LCBpLCBzaXplLCBpcnE7CisJaW50IHJldCwgaSwg
aXJxOwogCXN0cnVjdCBtbXBod19wYXRoX3BsYXQgKnBhdGhfcGxhdDsKIAlzdHJ1Y3QgbW1waHdf
Y3RybCAqY3RybCA9IE5VTEw7CiAKQEAgLTQ2MSw5ICs0NjEsOSBAQCBzdGF0aWMgaW50IG1tcGh3
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCiAJLyogYWxsb2NhdGUg
Ki8KLQlzaXplID0gc2l6ZW9mKHN0cnVjdCBtbXBod19jdHJsKSArIHNpemVvZihzdHJ1Y3QgbW1w
aHdfcGF0aF9wbGF0KSAqCi0JICAgICAgIG1pLT5wYXRoX251bTsKLQljdHJsID0gZGV2bV9remFs
bG9jKCZwZGV2LT5kZXYsIHNpemUsIEdGUF9LRVJORUwpOworCWN0cmwgPSBkZXZtX2t6YWxsb2Mo
JnBkZXYtPmRldiwKKwkJCSAgICBzdHJ1Y3Rfc2l6ZShjdHJsLCBwYXRoX3BsYXRzLCBtaS0+cGF0
aF9udW0pLAorCQkJICAgIEdGUF9LRVJORUwpOwogCWlmICghY3RybCkgewogCQlyZXQgPSAtRU5P
TUVNOwogCQlnb3RvIGZhaWxlZDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
