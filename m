Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843037EEB8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0302C6ECF5;
	Fri,  2 Aug 2019 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE60B6E858
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 01:24:40 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 09B61C6E263045241A3D;
 Fri,  2 Aug 2019 09:24:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 2 Aug 2019 09:24:25 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Rob
 Clark" <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Eric Biggers" <ebiggers@google.com>, Sam Ravnborg <sam@ravnborg.org>, Sean
 Paul <seanpaul@chromium.org>
Subject: [PATCH -next] drm/vgem: Fix wrong pointer passed to PTR_ERR()
Date: Fri, 2 Aug 2019 01:29:20 +0000
Message-ID: <20190802012920.60344-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UFRSX0VSUiBzaG91bGQgYWNjZXNzIHRoZSB2YWx1ZSBqdXN0IHRlc3RlZCBieSBJU19FUlIsIG90
aGVyd2lzZQp0aGUgd3JvbmcgZXJyb3IgY29kZSB3aWxsIGJlIHJldHVybmVkLgoKRml4ZXM6IDdl
OWU1ZWFkNTViZSAoImRybS92Z2VtOiBmaXggY2FjaGUgc3luY2hyb25pemF0aW9uIG9uIGFybS9h
cm02NCIpClNpZ25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1f
ZHJ2LmMKaW5kZXggYjk4Njg5ZmIwZDVkLi5lZjUyNTQ2ZjQ4YzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdl
bV9kcnYuYwpAQCAtMzA0LDEwICszMDQsMTAgQEAgc3RhdGljIHN0cnVjdCBwYWdlICoqcGluX2Fu
ZF9zeW5jKHN0cnVjdCBkcm1fdmdlbV9nZW1fb2JqZWN0ICpibykKIAlpZiAoSVNfRVJSKHNndCkp
IHsKIAkJZGV2X2VycihkZXYtPmRldiwKIAkJCSJmYWlsZWQgdG8gYWxsb2NhdGUgc2d0OiAlbGRc
biIsCi0JCQlQVFJfRVJSKGJvLT50YWJsZSkpOworCQkJUFRSX0VSUihzZ3QpKTsKIAkJZHJtX2dl
bV9wdXRfcGFnZXMoJmJvLT5iYXNlLCBwYWdlcywgZmFsc2UsIGZhbHNlKTsKIAkJbXV0ZXhfdW5s
b2NrKCZiby0+cGFnZXNfbG9jayk7Ci0JCXJldHVybiBFUlJfQ0FTVChiby0+dGFibGUpOworCQly
ZXR1cm4gRVJSX0NBU1Qoc2d0KTsKIAl9CiAKIAkvKgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
