Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E880169
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730C26EE97;
	Fri,  2 Aug 2019 19:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65906EDD3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:52:03 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s7so154531306iob.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=53jqDknmz3cAFGkT4uctiKFipCfEAS9AmkKGScMrxFc=;
 b=WJB6onx6f+6LKXJl467Gq7qIF7z2c6OYLjQfAGCZ3EqshSj1IKeby4ZgAbMCxWxthG
 ojEUu/ZB29ipo4Wh2RH7RO9uqnYWmPxnxpZC28QhReusEP77tAfZo71SYr0sKYkf6aYt
 87Xveq9ULbtwINFD81XTtZva+vcc6uS65KXdfwAAfjbUT4ZGoSFkTMmJ73fIF4ec19CA
 m/CwVBA5xRclQZTA385JF8NKr1dwg7HbQUy5Ol6+0ze3mDiXuuosWvoJhB9Li3YtgjEz
 FQmx6h0ePlC/ke4kBFVG9fFNXpriq9rCPvW6YejfdaHnbi1dVpaHHULQVV2qXjgeFj3Z
 B7tA==
X-Gm-Message-State: APjAAAWvO/rJyDKUTKtFrpLlD/7JvTDFzx+TRCtI+x+kp8YCz/FcfSOd
 w1ut9wxREMJbZdW/pFzPhsowJ6A=
X-Google-Smtp-Source: APXvYqzeZIRNyZxfog/kIG0dAoIzssWNqz3zWfnocIPET3l0X1mugFYEWKHEFrwe1KDEQPLfKZf+cQ==
X-Received: by 2002:a02:3f0a:: with SMTP id d10mr67375634jaa.23.1564775522554; 
 Fri, 02 Aug 2019 12:52:02 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id s4sm98419934iop.25.2019.08.02.12.52.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:52:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/8] drm/panfrost: Bump driver version to 1.1
Date: Fri,  2 Aug 2019 13:51:50 -0600
Message-Id: <20190802195150.23207-9-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802195150.23207-1-robh@kernel.org>
References: <20190802195150.23207-1-robh@kernel.org>
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
dmVuLnByaWNlQGFybS5jb20+CkFja2VkLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJv
c2VuendlaWdAY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMg
fCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5kZXggYTcxMjZiNWY4
ZTVkLi5lY2RiZTJjOWZkNjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMKQEAgLTM1Nyw2ICszNTcsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVz
YyBwYW5mcm9zdF9kcm1fZHJpdmVyX2lvY3Rsc1tdID0gewogCiBERUZJTkVfRFJNX0dFTV9TSE1F
TV9GT1BTKHBhbmZyb3N0X2RybV9kcml2ZXJfZm9wcyk7CiAKKy8qCisgKiBQYW5mcm9zdCBkcml2
ZXIgdmVyc2lvbjoKKyAqIC0gMS4wIC0gaW5pdGlhbCBpbnRlcmZhY2UKKyAqIC0gMS4xIC0gYWRk
cyBIRUFQIGFuZCBOT0VYRUMgZmxhZ3MgZm9yIENSRUFURV9CTworICovCiBzdGF0aWMgc3RydWN0
IGRybV9kcml2ZXIgcGFuZnJvc3RfZHJtX2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzCT0g
RFJJVkVSX1JFTkRFUiB8IERSSVZFUl9HRU0gfCBEUklWRVJfU1lOQ09CSiwKIAkub3BlbgkJCT0g
cGFuZnJvc3Rfb3BlbiwKQEAgLTM2OCw3ICszNzMsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2
ZXIgcGFuZnJvc3RfZHJtX2RyaXZlciA9IHsKIAkuZGVzYwkJCT0gInBhbmZyb3N0IERSTSIsCiAJ
LmRhdGUJCQk9ICIyMDE4MDkwOCIsCiAJLm1ham9yCQkJPSAxLAotCS5taW5vcgkJCT0gMCwKKwku
bWlub3IJCQk9IDEsCiAKIAkuZ2VtX2NyZWF0ZV9vYmplY3QJPSBwYW5mcm9zdF9nZW1fY3JlYXRl
X29iamVjdCwKIAkucHJpbWVfaGFuZGxlX3RvX2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9f
ZmQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
