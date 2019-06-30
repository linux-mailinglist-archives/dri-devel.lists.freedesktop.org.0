Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5F5AEA1
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 07:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE056E9BE;
	Sun, 30 Jun 2019 05:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC76E9BE
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 05:21:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h10so9764251ljg.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 22:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Z3yJIdo1VsInj/3I7Q500QrpEVTBjmvn8W4BY2GlFy4=;
 b=kJWhYi+uwYb4lTO9tazx0WjJTzELXdrksrwVI+vj3mfjocOQ7Ird6U88XxFrqM+i2g
 N9pih+BUY7wokdSC/PsdbAXr0G/ushGGC/z03eSD4Ogk/T7LkXYFX2GUGc71FvZZn4pq
 nthaHLQgn8wgubOZXowPSPZgnF6P80VlvsebwL48YfkqeYW37RdXSafFDeLhTViqy1Hy
 29dA7faxi+RUgBcFPruylIbZy2LivA4wTS5dytopG02uSJ4TlUKgqgcCk1e/pMJC1IHb
 pqLHt5yXiXDEyQE0uImNfDP3GLLXY1yQ9V4gYyWnP+nNYncGmMR4t5cLlJ3weoMmPCdR
 DVzg==
X-Gm-Message-State: APjAAAXoTCYHmuxEE2i3zXxfV+Hdrp8qI3MpcYXiqje4+3bdZJhFfsQ4
 Toke3KeMEcu8tqi3vjlImn8mPDd0uKk=
X-Google-Smtp-Source: APXvYqywXoyzf7jDA2CElIMA7OYXCaCy61mJ3odffSbXyGOpLeQwUGM5+oznU0QjEvuI5tG1v3Dg1A==
X-Received: by 2002:a2e:12dc:: with SMTP id 89mr10658107ljs.40.1561872083720; 
 Sat, 29 Jun 2019 22:21:23 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v4sm2316585lji.103.2019.06.29.22.21.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 22:21:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/i2c/tda998x: drop use of drmP.h
Date: Sun, 30 Jun 2019 07:21:13 +0200
Message-Id: <20190630052113.5966-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z3yJIdo1VsInj/3I7Q500QrpEVTBjmvn8W4BY2GlFy4=;
 b=CGNGrfhhfY6+DcZk8SNNqP4+Vh8BMTgmavhrz0kJXVi4NyCNbrnT9bnfMiKReBelMj
 v/ysE1inGZwTU+sTRz6gfMCQy+EBRCkDcGmeKk12+KrFseTptHjs7PHYMDwS5JdtxTJB
 FgTQgyhjj8sEJza1ls9Xro6O3F1aFNYR9UFl/lEetkBCi+QjguMkx5qqtrvhKSVrDOx+
 O0gZ98pqob0M7H2KbUUOJbeYBQpWn55nyAQz5lRZ4K6+qAMH7b5mKVegeFDFtLHRiE/u
 6Cu+edAkjGF1RrhDqgAcmzomX/vOp6l7uTCWO/O6j7nQuEPRR3d6RFXVcs+iw8p9mp6B
 a6RQ==
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
 Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgpGaXggZmFsbG91
dC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFJ1
c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KVGhl
IHBhdGNoIGlzIGJ1aWxkIHRlc3RlZCB1c2luZyBzZXZlcmFsIGNvbmZpZ3MgYW5kCnNldmVyYWwg
YXJjaGl0ZWN0dXJlcyAoaW5jbHVkaW5nIGFybSwgYXJtNjQsIHg4NikuCgpUaGUgcGF0Y2ggaXMg
YmFzZWQgb24gZHJtLW1pc2MuCgpJZiBwYXRjaCBpcyBPSywgcGxlYXNlIGFwcGx5IHRvIHlvdXIg
dHJlZQphcyB0aGlzIGRyaXZlciBpcyBtYWludGFpbmVkIG91dHNpZGUgZHJtLW1pc2MuCgpJIGFt
IGhhcHB5IHRvIHJlYmFzZSBvbiBhbm90aGVyIHRyZWUsIGp1c3QgbGV0IG1lIGtub3cuCgogICAg
ICAgIFNhbQoKIGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRh
OTk4eF9kcnYuYwppbmRleCA3ZjM0NjAxYmI1MTUuLjVlZDY1MGJhNjBlYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
MmMvdGRhOTk4eF9kcnYuYwpAQCAtMjQsMTAgKzI0LDEwIEBACiAjaW5jbHVkZSA8c291bmQvYXNv
dW5kZWYuaD4KICNpbmNsdWRlIDxzb3VuZC9oZG1pLWNvZGVjLmg+CiAKLSNpbmNsdWRlIDxkcm0v
ZHJtUC5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fZWRpZC5oPgogI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4KKyNpbmNsdWRlIDxkcm0vZHJt
X3ByaW50Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxk
cm0vaTJjL3RkYTk5OHguaD4KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
