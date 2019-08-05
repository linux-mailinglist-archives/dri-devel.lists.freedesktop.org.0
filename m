Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DA82840
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 01:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A923F89F2E;
	Mon,  5 Aug 2019 23:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
 [192.185.193.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B16F89F2E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 23:49:31 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id C6EE9400C5AC0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 18:14:01 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id umjKheIkj2PzOumjKhiD4b; Mon, 05 Aug 2019 18:49:30 -0500
X-Authority-Reason: nr=8
Received: from [187.192.11.120] (port=40464 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1humjJ-000yz7-1L; Mon, 05 Aug 2019 18:49:29 -0500
Date: Mon, 5 Aug 2019 18:49:28 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: Use struct_size() helper
Message-ID: <20190805234928.GA2785@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1humjJ-000yz7-1L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:40464
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9li+YhxHo8+AujwqhsMZd9x+rcO10TXeZqodcMKx7qo=; b=wDvshsv1z+1fXiJZtY4PyLHNww
 TX8STZuvfNMy65c16V2YqeJF4e8e/HsisSBSRMNAYeBJY66xYI/a5XrZfQP5O40mD+yeXeHv8mhGF
 /W+BkPEqN7tqKgN4uGAsH1ddru52eG7RKMGdhbMA68N7j/W90G6NeAxsM+j0UroIzheN1fD8VsZFI
 sA/k0BthKK/9Zm04QwPf2oMN8gM7gjlYuj/OllN0eoj7w5ZOZWXvKUz9mCf309++jkyGM+YRn46r6
 5P/kqFvhARxma5FJxkO5SiwELWfYONvsDrQNS5FCEC9Xm8TJyI6CRkGjHeBRV/2krkJOt1cspawIF
 VSuTx2Wg==;
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIG9mIHRoZSBtb3JlIGNvbW1vbiBjYXNlcyBvZiBhbGxvY2F0aW9uIHNpemUgY2FsY3VsYXRp
b25zIGlzIGZpbmRpbmcKdGhlIHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNp
emVkIGFycmF5IGF0IHRoZSBlbmQsIGFsb25nCndpdGggbWVtb3J5IGZvciBzb21lIG51bWJlciBv
ZiBlbGVtZW50cyBmb3IgdGhhdCBhcnJheS4gRm9yIGV4YW1wbGU6CgpzdHJ1Y3QgbXNtX2dlbV9z
dWJtaXQgewoJLi4uCiAgICAgICAgc3RydWN0IHsKCQkuLi4KICAgICAgICB9IGJvc1swXTsKfTsK
Ck1ha2UgdXNlIG9mIHRoZSBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlciBpbnN0ZWFkIG9mIGFuIG9wZW4t
Y29kZWQgdmVyc2lvbgppbiBvcmRlciB0byBhdm9pZCBhbnkgcG90ZW50aWFsIHR5cGUgbWlzdGFr
ZXMuCgpTbywgcmVwbGFjZSB0aGUgZm9sbG93aW5nIGZvcm06CgpzaXplb2YoKnN1Ym1pdCkgKyAo
KHU2NClucl9ib3MgKiBzaXplb2Yoc3VibWl0LT5ib3NbMF0pKQoKd2l0aDoKCnN0cnVjdF9zaXpl
KHN1Ym1pdCwgYm9zLCBucl9ib3MpCgpUaGlzIGNvZGUgd2FzIGRldGVjdGVkIHdpdGggdGhlIGhl
bHAgb2YgQ29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1
c3Rhdm9AZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1
Ym1pdC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYwppbmRleCAzNDhmOGMyYmU4
MDYuLjdjMTdjNjE1NDA1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2Vt
X3N1Ym1pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYwpAQCAt
MjYsOCArMjYsOCBAQCBzdGF0aWMgc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJtaXRfY3JlYXRl
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCXVpbnQzMl90IG5yX2NtZHMpCiB7CiAJc3RydWN0
IG1zbV9nZW1fc3VibWl0ICpzdWJtaXQ7Ci0JdWludDY0X3Qgc3ogPSBzaXplb2YoKnN1Ym1pdCkg
KyAoKHU2NClucl9ib3MgKiBzaXplb2Yoc3VibWl0LT5ib3NbMF0pKSArCi0JCSgodTY0KW5yX2Nt
ZHMgKiBzaXplb2Yoc3VibWl0LT5jbWRbMF0pKTsKKwl1aW50NjRfdCBzeiA9IHN0cnVjdF9zaXpl
KHN1Ym1pdCwgYm9zLCBucl9ib3MpICsKKwkJCQkgICgodTY0KW5yX2NtZHMgKiBzaXplb2Yoc3Vi
bWl0LT5jbWRbMF0pKTsKIAogCWlmIChzeiA+IFNJWkVfTUFYKQogCQlyZXR1cm4gTlVMTDsKLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
