Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95D21E8E3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD466E8F8;
	Tue, 14 Jul 2020 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3A66EBC6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:26:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j4so5186000wrp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=joF8Y/GicfhYL8oSuhK490OvHX+3VzCXNwByiLydKiRvzQ8Pijr8y0OoMbaJTBEp3a
 OeghOfb0fzHI7I25C71ky1GTo0Qq35xHC/zPnFG6Ume0tbrLHYKSK0EnN94LwAE7etGO
 9yZDXbSEvsTKUR1zln21Cor9Hguv1x6U16GdCFHEo4Y9ysCgcUCzjAfgNBYXAVyWsAZh
 VIzC79lrQexvzhm4rX1ZUjP5IJZTib8l+JkG1K7+s5VXTF4XRhpJqtkLmpo0AqRvnkoB
 QRUaSL+eehYEgCPUGf/uy/FA+8CiSabpi8QNvW0lle6Ft1YnAsvbDZ4963UOVg/zky25
 46MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=J/qHluJdblWSKU4pWznDswuQAQWVCRPY/OiTdf5ipswomt/ENMTrID0Kzy9X+YJ/wW
 xEHmaeqzD928AGG/RW3G42RaxRdRznVwoMdUpeKO6WOqc4WQAPmli8nrL402Y0EAkfdi
 gQ2Me0KyVV8owiRuu2rKWnEox3hXN01TMhzkI0Jb0QoE1PmuQTJbW0dpgX+OIEx2hnpx
 K3Nlef2LauTvTxxxeO+tESZpBanaG0Nr/KQL1Ljans9XHXtT2fnBv/Rnv1h7xZsUIVlR
 knX0NALTz2mpA9sfPTIJH+TGHqfK84Sqxw8CjXLeFpFg7SlD91ApMdOWQ/JDVVxcDDsF
 MT+A==
X-Gm-Message-State: AOAM532RAnRD+ltFRpeEiEg+VXLRsoLkCLgrgmWfh1XSSYl2+1tTYfBG
 d0PTggu/tSV7vDdyb3IdAkM=
X-Google-Smtp-Source: ABdhPJyfpqa0BGTWzUtWGqgYjvoSu1DHtTUy+/NrLOOAX+svDx5rdF8+T0WttUQmSLlHXPQJgXOMfQ==
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr72022276wrr.226.1594373169731; 
 Fri, 10 Jul 2020 02:26:09 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:26:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 14/14] [DO NOT MERGE] arm64: dts: allwinner: force GPU
 regulator to be always
Date: Fri, 10 Jul 2020 11:25:48 +0200
Message-Id: <20200710092548.316054-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
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
