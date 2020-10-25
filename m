Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847A298256
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000A96E9D9;
	Sun, 25 Oct 2020 15:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F7F6E9CE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:14 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l24so6856420edj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=26D5D+FFOrYB//GrgVmEl61qoZwdktvE11ze0tEWgvs=;
 b=K9YeJFLgkHDObrrkw7DoQ6lHtzk/6qQlXY0EmY+pr//pn+qvkDmR0U+zscjg7rGqVv
 X5HuIuVEe9bHQA6pgR9wapiSjQJwfZRuaYaovPil6ubeMyd1aBmLJmU06j9OipLJm/UW
 NN3EQXiMlqDFmdAMGeSAW7wOMF/o97t57CXwTZ6dDyq2oP7C8peLXUgXcWDv5uCDW0R9
 UVcVDHXuw4irKrwhjBBiW+RsUhpbRkEaQ+WByILURsXciLg5/0CERk13/uVPJDer5u6K
 gxNET/TARHySp1v26ppeXYPpoqeycoYzjLM+JLZzZ7fMkWok/9dBXeOKeVrLRsf+i2S4
 9aIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=26D5D+FFOrYB//GrgVmEl61qoZwdktvE11ze0tEWgvs=;
 b=eqmUoPaDxWGP4mL1pKEZrIvkLRuVn40cYIOr8FK9rAXg+fwr9QtJ2/72goUuMLbWYJ
 Hdwz9UOFNwoiRWIlBHICDePaXbsKlbqAXqc7MhuFL28Kx6xlOikuzQkm2aPCcCarPbCz
 RimqGz9+nfR6ir4XP+Jsvu/mOvarGLrOOp/5ztGaqoZJDsfmyzsqGfLibo1mOHqS7pWK
 DBqv8J9xPmjV5IND+Nn177rjJPIID5b6lkiS8oLaU38FuNMn/iPhPPrAUZNeU5lSpSr+
 hVWKa91wQQA8tULR7puzPyBoCNJuKgssZMLRDFxPrEIGj3tkYY8u3V1WTVPZiHFHAgi6
 9lFg==
X-Gm-Message-State: AOAM5318VelGBjLv3lwKCAeNRP+ioaGrsKpyMxRPnD53rkwYWytv8k8K
 qb8k7WpkMIuJ1q7fxNFCB3Mv3bdfL6k=
X-Google-Smtp-Source: ABdhPJw0OV9GitbSdoisvZgYYdIhekYFOlQwvQZ1W3Nak/AY9Rpl8LeR2rV43iBuN+zs6i1s7tnAjw==
X-Received: by 2002:a05:6402:2292:: with SMTP id
 cw18mr12218690edb.112.1603640473199; 
 Sun, 25 Oct 2020 08:41:13 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/13] drm/vram_helpers: drop ttm_page_alloc.h include
Date: Sun, 25 Oct 2020 16:40:59 +0100
Message-Id: <20201025154100.16400-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201025154100.16400-1-christian.koenig@amd.com>
References: <20201025154100.16400-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ray.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhcyBmYXIgYXMgSSBjYW4gc2VlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggNDQ0MmM5YzIzZmYyLi5i
ZDRhNTc0MGEwMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAtMTUs
NyArMTUsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fcGxhbmUuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3ByaW1lLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgotI2luY2x1
ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxsb2MuaD4KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Z2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
