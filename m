Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B086D19
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6036ECD3;
	Thu,  8 Aug 2019 22:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C9F6ECD3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:22:14 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id z17so6636926otk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xrPog449LK1tekUd7IZ+epi5xcJogpnkPqslbREhU2k=;
 b=bn6/734U6zxzNFGw+Oqrs5XGQXV1t7e7b3gT8GFsnLRRpH2IqhHKKl9NaV51AtGqKF
 r98MmQuDOMg4rSWQpI1q1FyLYo9N4ITbn7rWTMih0PyChFm7nLfCWVi6xoz9RqMRZge5
 8vfCAYp7ucSvWiMhpL0XtE/fHFQddtzgNM/pemJZNS4Drep7yE6PXN9Y3kWUjyTUx/bH
 znbPp+77xg0vG7T+5c3K7aBfLgPKfvI2G5RdnAlSNppGmetpXjqdcQ5j4nvJV9LxP6PR
 eufB8lfqryt7gKUqaBraQnHbUg4uBmplDZZbinDHP6Fy4a2iI3y8AmLnudLkOOjOF7pA
 Foxw==
X-Gm-Message-State: APjAAAXrAkYTuk0uiU4kKyjzSD4obSDqYaDF/b7GLJDGWHWfkZItNUbj
 BUcZhpUuSIbWfzjWXoPAAT94QXw=
X-Google-Smtp-Source: APXvYqysWzUDlQ2XxVQa0VtklqVKcLYNS78Ci1ACUbzNEViFQU4Mih/GMMXjC0n3pBNdHRl79DZVBQ==
X-Received: by 2002:a6b:cdcc:: with SMTP id d195mr4794360iog.78.1565302933164; 
 Thu, 08 Aug 2019 15:22:13 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id i4sm118528553iog.31.2019.08.08.15.22.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 15:22:12 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 9/9] drm/panfrost: Bump driver version to 1.1
Date: Thu,  8 Aug 2019 16:22:00 -0600
Message-Id: <20190808222200.13176-10-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808222200.13176-1-robh@kernel.org>
References: <20190808222200.13176-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jcmVtZW50IHRoZSBkcml2ZXIgdmVyc2lvbiB0byBleHBvc2UgdGhlIG5ldyBCTyBhbGxvY2F0
aW9uIGZsYWdzLgoKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpDYzog
Um9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+CkFja2VkLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJv
c2VuendlaWdAY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMg
fCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5kZXggOTk0ZGJjMzdl
NGQwLi5hMTM1Mjc1MDk4NGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMKQEAgLTQ0OCw2ICs0NDgsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVz
YyBwYW5mcm9zdF9kcm1fZHJpdmVyX2lvY3Rsc1tdID0gewogCiBERUZJTkVfRFJNX0dFTV9TSE1F
TV9GT1BTKHBhbmZyb3N0X2RybV9kcml2ZXJfZm9wcyk7CiAKKy8qCisgKiBQYW5mcm9zdCBkcml2
ZXIgdmVyc2lvbjoKKyAqIC0gMS4wIC0gaW5pdGlhbCBpbnRlcmZhY2UKKyAqIC0gMS4xIC0gYWRk
cyBIRUFQIGFuZCBOT0VYRUMgZmxhZ3MgZm9yIENSRUFURV9CTworICovCiBzdGF0aWMgc3RydWN0
IGRybV9kcml2ZXIgcGFuZnJvc3RfZHJtX2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzCT0g
RFJJVkVSX1JFTkRFUiB8IERSSVZFUl9HRU0gfCBEUklWRVJfU1lOQ09CSiwKIAkub3BlbgkJCT0g
cGFuZnJvc3Rfb3BlbiwKQEAgLTQ1OSw3ICs0NjQsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2
ZXIgcGFuZnJvc3RfZHJtX2RyaXZlciA9IHsKIAkuZGVzYwkJCT0gInBhbmZyb3N0IERSTSIsCiAJ
LmRhdGUJCQk9ICIyMDE4MDkwOCIsCiAJLm1ham9yCQkJPSAxLAotCS5taW5vcgkJCT0gMCwKKwku
bWlub3IJCQk9IDEsCiAKIAkuZ2VtX2NyZWF0ZV9vYmplY3QJPSBwYW5mcm9zdF9nZW1fY3JlYXRl
X29iamVjdCwKIAkucHJpbWVfaGFuZGxlX3RvX2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9f
ZmQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
