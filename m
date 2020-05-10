Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3771CD25D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5901F6E20D;
	Mon, 11 May 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BED89FED
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e16so7949994wra.7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrpA01gh5f+4wCQVfiK/c2w8CUJsi/9aedeoRmkPm1A=;
 b=NVaFtRRUuIuJfOZ9VWEnsEcaHQLlxP0KjmHTYVaEol0TnaJzw14uuF0Ej7tBkZ/dXf
 q0cdIPbQ2ReTKQaZIx08FJyyfpQc46H2PP4lMAzaqienz9TjB71dMtXN47KrqWcqxFbO
 o1GK6lICcOVrfd0JUYo7eFmGGoXkfVH4g5DyGe4DFL2x74lhjkHAhAKErSB3hDhAXgYX
 bk95+Er61/m+x/X2LdsArOEZHganSOruTT+9efLroE+3vQu55tRQknbws3XuQKzD6QoT
 IhjlB0qHt90lQUSKTqPGVmIAJ1qjyAp27DajDztvQ0ZQsoWHXMxcgrFUIIdhtqbkj+dD
 UM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrpA01gh5f+4wCQVfiK/c2w8CUJsi/9aedeoRmkPm1A=;
 b=NhSUIk6+tmiM+opXSJ3MYv5iJAJ8PajsYPd5caIz7DfI9zUV7kVxax0hQ6oc3C8fUN
 Pfz9tcVyzjLs8SjmfZe2y0b6HGGkBdf9xpkwZcSpOftZddX9d29CrAYSij9YqgZmIvp2
 181yKYwvY/EYrAbs/EnMIfai95BLZIEqjAhBcPIcIXhJ3Rdaj3ypVVnxxh4axBz/O4YP
 i0j1fK2B2/PWhsfB964yL8zFIrBI1A7T4U+ggfN8Yikk40Fxk/eIdvvKUBvyGfVNDYcf
 UzJVnoQFx2vL93VVfdV82JH2NhUhnKg5cV1jYDjsXENocUjlSnJahrdIHQc17RDBYsN3
 LWpw==
X-Gm-Message-State: AGi0PuZpQoMW29/J3XgOmPXO5HxqqJMD8otg7T/hTqVzqBB6zrUK1esB
 Mw3hp/nv7qX4x6E8Um+EiGE=
X-Google-Smtp-Source: APiQypKucmou8UiKBQJLi/Cx8j6Ix30yatDbTUUMPyd8Dq8FziM9EgDPuGCXjSGiQ84ZMUcD+phxZA==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr14131363wrs.293.1589129757999; 
 Sun, 10 May 2020 09:55:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 15/15] [DO NOT MERGE] arm64: dts: allwinner: force GPU
 regulator to be always
Date: Sun, 10 May 2020 18:55:38 +0200
Message-Id: <20200510165538.19720-16-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0t
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRz
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cwppbmRl
eCAzZjdjZWViMWE3NjcuLjE0MjU3Zjc0NzZiOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxLmR0cworKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzCkBAIC0yNDUsNiAr
MjQ1LDcgQEAKIAkJCX07CiAKIAkJCXJlZ19kY2RjYzogZGNkY2MgeworCQkJCXJlZ3VsYXRvci1h
bHdheXMtb247CiAJCQkJcmVndWxhdG9yLWVuYWJsZS1yYW1wLWRlbGF5ID0gPDMyMDAwPjsKIAkJ
CQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw4MTAwMDA+OwogCQkJCXJlZ3VsYXRvci1tYXgt
bWljcm92b2x0ID0gPDEwODAwMDA+OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
