Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC8A742C9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 03:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30FB6E4CF;
	Thu, 25 Jul 2019 01:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67A16E386
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:10:15 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e20so63261766iob.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2CdEvm+oRnTE1ZhDZPZZ4V4OiU5E9Xkf4wlrzQfNBQM=;
 b=GhchDEItgGnWWguDhNMs7VwWSNStQi91veWoX8tq3S6062kuLa6DSTu7xCzc1tZoLi
 /XX61dGgnM4x8HmL+Mx6EW2Dx8lTC02tl1NxQlPpQt5rZKIhukAz0b/HC6LyDblCY/S7
 c18ieuh1l9y9uMxHbLHTS5NDUGBJ1VhcrPRTY5RT1woVPpxwluRFr5lkNPWkZcoPkA3W
 U3KdrfxHJ8e95z0aoB9WzTwoIlr3lSuiGMEpEjawADjhab2EQHOzqjms7KB7tzhQgLew
 qoXazuGUWODVp3fr31f4cSc8hSwgyCqyUOqiYMR9jq48OdrI8OxXaCwMZ4JjMt/W6Y4c
 +6tg==
X-Gm-Message-State: APjAAAWCvtmcHsqS3DU1Id+CHIGjZLxJyBtBz7e6S7BlmstmJDAAAWr+
 d8A6ZHIrjg/8NVRlgu2xUu6p5/k=
X-Google-Smtp-Source: APXvYqxM11K1/pnn7Xhxa2Gl97m6fuk/HXqLySnFm3SA2BIFQKhXpZ8V9yQIjUaf44rJpnmTjsQf/Q==
X-Received: by 2002:a5d:8416:: with SMTP id i22mr54434529ion.248.1564017014746; 
 Wed, 24 Jul 2019 18:10:14 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id o7sm40675924ioo.81.2019.07.24.18.10.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 18:10:14 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/panfrost: Bump driver version to 1.1
Date: Wed, 24 Jul 2019 19:10:03 -0600
Message-Id: <20190725011003.30837-8-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725011003.30837-1-robh@kernel.org>
References: <20190725011003.30837-1-robh@kernel.org>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jcmVtZW50IHRoZSBkcml2ZXIgdmVyc2lvbiB0byBleHBvc2UgdGhlIG5ldyBCTyBhbGxvY2F0
aW9uIGZsYWdzLgoKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpDYzog
Um9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3Rl
dmVuLnByaWNlQGFybS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2Vuendl
aWdAY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCA3ICsr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5kZXggNDZhNmJlYzdhMGYyLi5h
NmJlZjNiNmRhNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKQEAg
LTM1Myw2ICszNTMsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBwYW5m
cm9zdF9kcm1fZHJpdmVyX2lvY3Rsc1tdID0gewogCiBERUZJTkVfRFJNX0dFTV9TSE1FTV9GT1BT
KHBhbmZyb3N0X2RybV9kcml2ZXJfZm9wcyk7CiAKKy8qCisgKiBQYW5mcm9zdCBkcml2ZXIgdmVy
c2lvbjoKKyAqIC0gMS4wIC0gaW5pdGlhbCBpbnRlcmZhY2UKKyAqIC0gMS4xIC0gYWRkcyBIRUFQ
IGFuZCBOT0VYRUMgZmxhZ3MgZm9yIENSRUFURV9CTworICovCiBzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgcGFuZnJvc3RfZHJtX2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzCT0gRFJJVkVS
X1JFTkRFUiB8IERSSVZFUl9HRU0gfCBEUklWRVJfU1lOQ09CSiwKIAkub3BlbgkJCT0gcGFuZnJv
c3Rfb3BlbiwKQEAgLTM2NCw3ICszNjksNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgcGFu
ZnJvc3RfZHJtX2RyaXZlciA9IHsKIAkuZGVzYwkJCT0gInBhbmZyb3N0IERSTSIsCiAJLmRhdGUJ
CQk9ICIyMDE4MDkwOCIsCiAJLm1ham9yCQkJPSAxLAotCS5taW5vcgkJCT0gMCwKKwkubWlub3IJ
CQk9IDEsCiAKIAkuZ2VtX2NyZWF0ZV9vYmplY3QJPSBwYW5mcm9zdF9nZW1fY3JlYXRlX29iamVj
dCwKIAkucHJpbWVfaGFuZGxlX3RvX2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
