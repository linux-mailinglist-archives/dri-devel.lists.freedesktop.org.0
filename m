Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9176215317
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4D16E312;
	Mon,  6 Jul 2020 07:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1110F6E3F5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f7so32305831wrw.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=mV0As66Am/M4p3bN+Mk7zZSGHK6Mju2VuzevBcWkz9Cou17jszv2pO2QbbzwNeOaJa
 Sj4ucKGda4iIFmVg66SENMIA4Nbfixy5oLosZhwOeitQbZDVoybvi26g58zCQYS5gXw2
 6dh3fItZTnjBK77c3iOLP61WoofeBUGqhcLdc/t7wx0skGuS2mxJIrY8kISVZm+L8o7C
 tGXSW/9ImyPQA+VxUKhnX0qKuyF/34WBMRYTRWe/sL6Xcdmf6fHgqnVCFZGLHk9XT/GU
 j5SfM/3tQsnIZ8PCqFOonlFh9u7dzJE9s+kyx4J0AxD4V15h+WK2V66gSig+S8+NfmIk
 x4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=eUHunzDmjMkA6PCR5upbB+ImeyNCumoWzBYWvLdiOHMBazyvQnfODsTEy2MFCwLMqK
 fqxuhJIVCJr6FERGIwNXhYFh6qg9Bd3RackwrIlSGlFSxZ1abeURseowdfDbSaki1g2B
 a4EOBLBNJnLINF+sg2S6adjbkHaZ0sqYXRU7Fogb5Oi4pEdEMaajqO4aKCPRtqputqSP
 HSr9iYT/YrH4FbgwBRHYna4MRUqNpT+JwSP8wBjnhvWbpe8WnWPyLMZmYRa4hQOyZPAN
 AENSeyFybRkUiv1DJrtw8hl0eRVSFJEa0JFDR5D5G5l1yg4XfOGIgeckSitCi6LiJBD/
 7iGw==
X-Gm-Message-State: AOAM533FIQjyFYFWtyU3cF8nu6ZllpX/UZyzf7UNYCaFNnO2voA7Kn99
 MOnHtg+o9JzYIAgB1IawaNU=
X-Google-Smtp-Source: ABdhPJyBqdyjxO1QJ2Wkyp5nBh0YukoTPRY6UODWodbPokllpS3WEnTqIyCf9+af/s+NraJgatVQIw==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr40233460wrq.91.1593858357628; 
 Sat, 04 Jul 2020 03:25:57 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 14/14] [DO NOT MERGE] arm64: dts: allwinner: force GPU
 regulator to be always
Date: Sat,  4 Jul 2020 12:25:35 +0200
Message-Id: <20200704102535.189647-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
