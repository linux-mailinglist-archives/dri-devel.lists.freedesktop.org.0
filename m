Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4974F39BC6
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F7E892B5;
	Sat,  8 Jun 2019 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690F892B2
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 08:19:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y17so3298079lfe.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2019 01:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+BpSn4NddfnKD/2wHMICua86TbhaHJGAZGJeNGGiB0g=;
 b=OhubOHhIKkNCXiZd1kF5xRvkYgiZtkpeBEWq8DFAQ5Gd5kcCEQQ8mffGkzKUrav3HZ
 ctUQz6Fh2i28HKwcs5C0KqyGHqA0+ykzEOc4WBVXT1bzpmnNlxGN/AgY5q54+IbsBbE6
 xv2J0DnmUauvOReOXkYEpGG6jucR0t3sgZxLg1dj/oQLEVPQYLWU4a3hY+OXmMQ9/nDh
 n616UIPVoa5EDLpamhpWzmw3YRI1gKY7KGhVrkgFurBDKTn3BGNqf6nhm3nrl+swv8iv
 11wGXjZ8GIR7p75t1X4gzt7szJFKP0nt3VyXB87s4ViL0Vax/WK8ETtWe5NFMWLQzXvD
 F0SA==
X-Gm-Message-State: APjAAAXAfnZiGVKC8jfsQN38KavKPUQRxscApYc8VgnBE1BsDnd95SgF
 KUkaVkh8YDn4NnnDjyN94zqz6g5AN7g=
X-Google-Smtp-Source: APXvYqyoQ8pZwv/IbfG3hnEy4cMmAEGRx6QmwxpH9tJQ/bQDh8hRSj68E/z9AghlAio+zURpexxBFw==
X-Received: by 2002:ac2:598d:: with SMTP id w13mr27862148lfn.165.1559981972225; 
 Sat, 08 Jun 2019 01:19:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 k82sm747311lje.30.2019.06.08.01.19.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:19:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/4] drm/mga: make header file self contained
Date: Sat,  8 Jun 2019 10:19:21 +0200
Message-Id: <20190608081923.6274-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608081923.6274-1-sam@ravnborg.org>
References: <20190608081923.6274-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BpSn4NddfnKD/2wHMICua86TbhaHJGAZGJeNGGiB0g=;
 b=cdd9g75hjw4YsylhE4Q+5ilrdczF06ILeqk6pCrilUAGYO+vZh7DauVP3uwfa8gT7f
 ZaFuWwZaBA8CXxqzNRqFbvQ4154rg8kKloY1+q1kLSX/lPIg7jv7xLUG+oKE/1MoSuMF
 8Rkusoj5oumkRItTUVD3yzfVt6uSTfV0rgQe4Yrqsw3XHlvjSnJ4XjJDeL386a1sDzeL
 FGPDvjSwZNEfOFIlhh9uB7m4eXKCyjCOVx369I565+t/WIC6d8ukbRIKGeLk6GKF6WtM
 ZoXej0XFaRKwO++igtQ6C3i+9pN12N0XeFE8NKwRD2Vkhr4QIXybp8ECqVRG0rRTGA5P
 t8Jw==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBtaWdyYXRpb24gYXdheSBmcm9tIGRybVAuaCBzaW1wbGUKYXMgd2UgZG8gbm90
IG5lZWQgdG8gZHVwbGljYXRlIGRlcGVuZGVuY2llcyByZXF1aXJlZCBieSBtZ2FfZHJ2LmgKClNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5oIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21n
YV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZ2EvbWdhX2Rydi5oCmluZGV4IDc4NDRhOWU0NjNm
Ni4uMTAxNjlmZjQ2NjlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhL21nYV9kcnYuaApAQCAtMzEsNyArMzEsMjAgQEAK
ICNpZm5kZWYgX19NR0FfRFJWX0hfXwogI2RlZmluZSBfX01HQV9EUlZfSF9fCiAKKyNpbmNsdWRl
IDxsaW51eC9pcnFyZXR1cm4uaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CisKKyNpbmNsdWRl
IDxkcm0vZHJtX2FncHN1cHBvcnQuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fZmlsZS5oPgorI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX2lycS5oPgogI2luY2x1ZGUgPGRybS9kcm1fbGVnYWN5Lmg+CisjaW5jbHVk
ZSA8ZHJtL2RybV9wY2kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisjaW5jbHVkZSA8
ZHJtL2RybV9zYXJlYS5oPgorI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CisjaW5jbHVkZSA8
ZHJtL21nYV9kcm0uaD4KIAogLyogR2VuZXJhbCBjdXN0b21pemF0aW9uOgogICovCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
