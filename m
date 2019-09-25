Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DABDE9E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBBC6E045;
	Wed, 25 Sep 2019 13:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0E26E045
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 862DD3F6C6;
 Wed, 25 Sep 2019 15:11:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UC9g7HdOMsny; Wed, 25 Sep 2019 15:11:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id B62243F609;
 Wed, 25 Sep 2019 15:11:49 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 55358360020;
 Wed, 25 Sep 2019 15:11:49 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: Remove explicit typecasts of vm_private_data
Date: Wed, 25 Sep 2019 15:11:22 +0200
Message-Id: <20190925131123.51189-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1569417109; bh=Eke6fYTvphcOJjsDDzUEnTYWydKis8/V1uPwl06cKkw=;
 h=From:To:Cc:Subject:Date:From;
 b=hc3QQEX3GD6iQMOuAjHRSooFYtDdMfsAVZJntAFvJQ4qYNlurZ3LXhmp+LGBd8tXl
 gHqafllXLybRE+Rc5xyfbGCOBcu+qeGICd0mtcg+eJqoucj3nk9ejb1wJrhIxJ2/Gl
 ekKU3m6JhHF8Hr+xTRl/s5BRK/yzlyUO4St4ONIY=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=hc3QQEX3; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGV4cGxp
Y2l0IHR5cGNhc3RzIGFyZSBtZWFuaW5nbGVzcywgc28gcmVtb3ZlIHRoZW0uCgpTdWdnZXN0ZWQt
Ynk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+ClJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggNzZl
ZWRiOTYzNjkzLi44OTYzNTQ2YmYyNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMTA5
LDggKzEwOSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHR0bV9ib19pb19tZW1fcGZuKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiBzdGF0aWMgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1
bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEg
PSB2bWYtPnZtYTsKLQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqKQotCSAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKKwlzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52bV9wcml2YXRlX2RhdGE7CiAJc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKIAl1bnNpZ25lZCBsb25nIHBhZ2Vfb2Zmc2V0Owog
CXVuc2lnbmVkIGxvbmcgcGFnZV9sYXN0OwpAQCAtMzAyLDggKzMwMSw3IEBAIHN0YXRpYyB2bV9m
YXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAogc3RhdGljIHZv
aWQgdHRtX2JvX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7Ci0Jc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9Ci0JICAgIChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
Kil2bWEtPnZtX3ByaXZhdGVfZGF0YTsKKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0g
dm1hLT52bV9wcml2YXRlX2RhdGE7CiAKIAlXQVJOX09OKGJvLT5iZGV2LT5kZXZfbWFwcGluZyAh
PSB2bWEtPnZtX2ZpbGUtPmZfbWFwcGluZyk7CiAKQEAgLTMxMiw3ICszMTAsNyBAQCBzdGF0aWMg
dm9pZCB0dG1fYm9fdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAogc3RhdGlj
IHZvaWQgdHRtX2JvX3ZtX2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogewotCXN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICop
dm1hLT52bV9wcml2YXRlX2RhdGE7CisJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZt
YS0+dm1fcHJpdmF0ZV9kYXRhOwogCiAJdHRtX2JvX3B1dChibyk7CiAJdm1hLT52bV9wcml2YXRl
X2RhdGEgPSBOVUxMOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
