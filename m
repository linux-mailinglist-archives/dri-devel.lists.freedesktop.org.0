Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B385199
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 19:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BCB6E73D;
	Wed,  7 Aug 2019 17:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1500 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2019 17:01:41 UTC
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.50.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0FB6E73D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 17:01:41 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id A70C2400DCC19
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 10:09:20 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id vOYuh94jt2PzOvOYuhCX6v; Wed, 07 Aug 2019 11:13:16 -0500
X-Authority-Reason: nr=8
Received: from 187-162-252-62.static.axtel.net ([187.162.252.62]:45386
 helo=embeddedor) by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hvOYt-000bPc-21; Wed, 07 Aug 2019 11:13:15 -0500
Date: Wed, 7 Aug 2019 11:13:12 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev/mmp/core: Use struct_size() in kzalloc()
Message-ID: <20190807161312.GA26835@embeddedor>
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
X-Source-IP: 187.162.252.62
X-Source-L: No
X-Exim-ID: 1hvOYt-000bPc-21
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-252-62.static.axtel.net (embeddedor)
 [187.162.252.62]:45386
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDLih2xLWqp+jClGe6quPxx2j3NmBQT7gXxnFLBcjPI=; b=IhyWC51nLhTrjc3Vu16cl6sJ2G
 s9ltt4Pt+NqZlV9CIrKWPURUTLN8cPdvJ0HvpO5m1CsjLff9dgV/lP9thSiNTZJbBUslbCrJHHYhc
 p4nMhqr/IOSY5a/guns9P49UhBLpexJrh3kDoShOrDRw4LczwgjN3lOp+tj340g3v+o9TZ8iw5k+f
 NusgwMbGUySHojHyu+VDpevlDA4y77iu9KgCcmkINyyprQrScRVY7n/PsaapB74U/dQbW1TFc26nm
 QBzuWEHaA+dNdwxXH6Jt2y1zIsXvZ5txKv7D34NGHHrkWYiLiq29TdiywNlRiSqQlwAENCxm3E+Xz
 /OMfnK4Q==;
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
ZiBlbGVtZW50cyBmb3IgdGhhdCBhcnJheS4gRm9yIGV4YW1wbGU6CgpzdHJ1Y3QgbW1wX3BhdGgg
ewoJLi4uCiAgICAgICAgc3RydWN0IG1tcF9vdmVybGF5IG92ZXJsYXlzWzBdOwp9OwoKc2l6ZSA9
IHNpemVvZihzdHJ1Y3QgbW1wX3BhdGgpICsgY291bnQgKiBzaXplb2Yoc3RydWN0IG1tcF9vdmVy
bGF5KTsKaW5zdGFuY2UgPSBremFsbG9jKHNpemUsIEdGUF9LRVJORUwpCgpJbnN0ZWFkIG9mIGxl
YXZpbmcgdGhlc2Ugb3Blbi1jb2RlZCBhbmQgcHJvbmUgdG8gdHlwZSBtaXN0YWtlcywgd2UgY2Fu
Cm5vdyB1c2UgdGhlIG5ldyBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlcjoKCmluc3RhbmNlID0ga3phbGxv
YyhzdHJ1Y3Rfc2l6ZShpbnN0YW5jZSwgb3ZlcmxheXMsIGNvdW50KSwgR0ZQX0tFUk5FTCkKCk5v
dGljZSB0aGF0LCBpbiB0aGlzIGNhc2UsIHZhcmlhYmxlIHNpemUgaXMgbm90IG5lY2Vzc2FyeSwg
aGVuY2UgaXQKaXMgcmVtb3ZlZC4KClRoaXMgY29kZSB3YXMgZGV0ZWN0ZWQgd2l0aCB0aGUgaGVs
cCBvZiBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3Vz
dGF2b0BlbWJlZGRlZG9yLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9jb3JlLmMg
fCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9jb3JlLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L21tcC9jb3JlLmMKaW5kZXggMGZmYzFiN2I3MDUyLi4xNTQxMjcyNTZhMmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2NvcmUuYworKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L21tcC9jb3JlLmMKQEAgLTE1MywxMyArMTUzLDExIEBAIEVYUE9SVF9TWU1C
T0xfR1BMKG1tcF9nZXRfcGF0aCk7CiBzdHJ1Y3QgbW1wX3BhdGggKm1tcF9yZWdpc3Rlcl9wYXRo
KHN0cnVjdCBtbXBfcGF0aF9pbmZvICppbmZvKQogewogCWludCBpOwotCXNpemVfdCBzaXplOwog
CXN0cnVjdCBtbXBfcGF0aCAqcGF0aCA9IE5VTEw7CiAJc3RydWN0IG1tcF9wYW5lbCAqcGFuZWw7
CiAKLQlzaXplID0gc2l6ZW9mKHN0cnVjdCBtbXBfcGF0aCkKLQkJKyBzaXplb2Yoc3RydWN0IG1t
cF9vdmVybGF5KSAqIGluZm8tPm92ZXJsYXlfbnVtOwotCXBhdGggPSBremFsbG9jKHNpemUsIEdG
UF9LRVJORUwpOworCXBhdGggPSBremFsbG9jKHN0cnVjdF9zaXplKHBhdGgsIG92ZXJsYXlzLCBp
bmZvLT5vdmVybGF5X251bSksCisJCSAgICAgICBHRlBfS0VSTkVMKTsKIAlpZiAoIXBhdGgpCiAJ
CXJldHVybiBOVUxMOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
