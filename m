Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8721E8E7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E3E6E901;
	Tue, 14 Jul 2020 07:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14A6EBCE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a6so5298240wrm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=LkAG+JzIcrjWk6wsbbvoJiQ+Dhzfbf1ff68EZ4/MAk9dKnXdHGf5arbiMI5gEIKidJ
 jVLBKwoToirkaWTw8Gymu76RGj5XKW7rDwOKBs9QNf06BqMfOEjBw1kvsOElM+nBV4o2
 9tnPETwBjUFaMKuv4fkTS28qs3Z2qNp4EwUdt/k5gb+/o7aCikBb88sDGxc5aVaGQdvQ
 qSP07OBrupatkzVU+UukYqu2O1THtQAZEg2KKpuXBBLaDjKLWFoZEw/ugKH4jxf3mZ8h
 7XN+0HflMjzoV0c87Bg35XLqlJeC8Hjngypjmw5TzjavELK5bDrnoEPZJQD4RiATXL5l
 BniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=t/E8jqPx+eQfTbY8w3qqe5Ps9CjKBnu9EGI5nXpcPZPtiZzHPl5FwDUJIUILywGYOA
 OTXqzdhulAUlcfjX7GykyH1dgVmKLbPAZlx7JJaK/sJGRkABJT/CjArYQKuQD+gqzvyh
 w9Uj+JmX6NOEtJ+2e1tpP/RCKQFGqb++hqsnQBTHlQtea1/SVZHi6/nqU0lsMyg0cKBw
 vU9q95J/awLuPm5AhycyCr4T/iJ9V40a517u1UJrVC7acttTuHO77u2mumLJFtPCW9KS
 JxpdWL0wWyB9u3yfWX2yjDSlk34+t2exRHZK/4wmxHostInT1PQu/o5CZRZiJgHzkGwC
 xNmQ==
X-Gm-Message-State: AOAM530N6BaZXDHJON/zamsPda0EETah4Qbw6GRKD+z9vVrseN5HRuBg
 Cd/eyJ7Z8G/amFkx6SN5w4w=
X-Google-Smtp-Source: ABdhPJweU8vHChcfF7n6zCNGPvYpioyH/JYFNiQfISKnR8gO0ao1GlphavbGVRCAyGh9bV0XTNYxKg==
X-Received: by 2002:a05:6000:1006:: with SMTP id
 a6mr64201904wrx.332.1594374869330; 
 Fri, 10 Jul 2020 02:54:29 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:28 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 14/14] [DO NOT MERGE] arm64: dts: allwinner: force GPU
 regulator to be always
Date: Fri, 10 Jul 2020 11:54:09 +0200
Message-Id: <20200710095409.407087-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
MjQ1LDcgQEAgcmVnX2RjZGNhOiBkY2RjYSB7CiAJCQl9OwogCiAJCQlyZWdfZGNkY2M6IGRjZGNj
IHsKKwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwogCQkJCXJlZ3VsYXRvci1lbmFibGUtcmFtcC1k
ZWxheSA9IDwzMjAwMD47CiAJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8ODEwMDAwPjsK
IAkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxMDgwMDAwPjsKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
