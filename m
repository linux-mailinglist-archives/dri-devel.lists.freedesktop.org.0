Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B56C107
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 20:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE76E29C;
	Wed, 17 Jul 2019 18:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE04F6E29B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 18:34:00 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id e20so17002132iob.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 11:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lxi8VrEXHAw02lMNDyDN1wweYxqL0VSfL7Rn2+gyP24=;
 b=Q82iXNqVGEUv4mnZ9wmHicm1iieUA4LpAHm1sH2J0bsSYy7tOMRVPyEHiIPwofv98u
 uY/rG2FHNshFvjixlHp1ATrssEkpgbo+af7AY2FJVMDL61vkbMdCiZC+rXGEdtV+Bk45
 17EqFU8mdplZ/6CY0GElDA3YHPyAKD/wsdVUCeC7DNMb877X7rXCeCFRsGevr1Q5p3tm
 EPXdSXafHPh3GxJQN0thhlEOD0kgZLUeEBRocrBDEpQovftbuuCKbHpXj/UaFrPl6Aab
 eydPryeFAvyjoxPKHaRn4XntJDmTSaMV/ZqQf6901GKwLmd+TxyrGihtG/hCzZmn9xEd
 Eo+g==
X-Gm-Message-State: APjAAAWqjpHn04IkTIsuMFKRkbK9P1V78mBRcV8D2opECfJCzYGSgqwV
 n8LgPQ+slIIalHiXLTp9spjo87E=
X-Google-Smtp-Source: APXvYqyF8eEse9ZExA/YKh443Cs6SubOoMwXpk/YCvSVBU8C2zm2NxTtQgvLCvIcfStiGsacSSEmzQ==
X-Received: by 2002:a02:77d4:: with SMTP id
 g203mr28298238jac.144.1563388439830; 
 Wed, 17 Jul 2019 11:33:59 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.255])
 by smtp.googlemail.com with ESMTPSA id v10sm22109472iob.43.2019.07.17.11.33.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 11:33:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/panfrost: Bump driver version to 1.1
Date: Wed, 17 Jul 2019 12:33:52 -0600
Message-Id: <20190717183352.22519-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717183352.22519-1-robh@kernel.org>
References: <20190717183352.22519-1-robh@kernel.org>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jcmVtZW50IHRoZSBkcml2ZXIgdmVyc2lvbiB0byBleHBvc2UgdGhlIG5ldyBCTyBhbGxvY2F0
aW9uIGZsYWdzLgoKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpDYzog
Um9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2Vuendl
aWcuaW8+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgNyArKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IDllODdkMDA2MDIwMi4uNjE1YmQxNWZjMTA2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBAIC0zNDgsNiArMzQ4
LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgcGFuZnJvc3RfZHJtX2Ry
aXZlcl9pb2N0bHNbXSA9IHsKIAogREVGSU5FX0RSTV9HRU1fU0hNRU1fRk9QUyhwYW5mcm9zdF9k
cm1fZHJpdmVyX2ZvcHMpOwogCisvKgorICogUGFuZnJvc3QgZHJpdmVyIHZlcnNpb246CisgKiAt
IDEuMCAtIGluaXRpYWwgaW50ZXJmYWNlCisgKiAtIDEuMSAtIGFkZHMgSEVBUCBhbmQgTk9FWEVD
IGZsYWdzIGZvciBDUkVBVEVfQk8KKyAqLwogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHBhbmZy
b3N0X2RybV9kcml2ZXIgPSB7CiAJLmRyaXZlcl9mZWF0dXJlcwk9IERSSVZFUl9SRU5ERVIgfCBE
UklWRVJfR0VNIHwgRFJJVkVSX1NZTkNPQkosCiAJLm9wZW4JCQk9IHBhbmZyb3N0X29wZW4sCkBA
IC0zNTksNyArMzY0LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHBhbmZyb3N0X2RybV9k
cml2ZXIgPSB7CiAJLmRlc2MJCQk9ICJwYW5mcm9zdCBEUk0iLAogCS5kYXRlCQkJPSAiMjAxODA5
MDgiLAogCS5tYWpvcgkJCT0gMSwKLQkubWlub3IJCQk9IDAsCisJLm1pbm9yCQkJPSAxLAogCiAJ
LmdlbV9jcmVhdGVfb2JqZWN0CT0gcGFuZnJvc3RfZ2VtX2NyZWF0ZV9vYmplY3QsCiAJLnByaW1l
X2hhbmRsZV90b19mZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
