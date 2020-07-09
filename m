Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD5C21B0AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3C46EB9E;
	Fri, 10 Jul 2020 07:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54A36E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q5so2508427wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=G6q0CF1kORRNof0tQD5r5NoQptbBhuWv1c/fs/r9CwDbcexcB/5B+EpnFZAyC0xynB
 TLPEFz27dI9N6mnQizXEdM5Fx85hbntmmpaI+2qoJOrcf8faPX3GUOfc8IjsUwiW1+3b
 e7HPabKQZTToNaRmwvKoYF+kLUf8NXXQINYMJsMY3+UQspFvPotKsRqu+FG8QM3B0rVy
 k4BsagiLGMLuB2NrQwbIOJWhU0B3mQW+5c0kHq9934E0h1meOOVPiGsRPo2IoyKOke+y
 RtfRN6JZF6a/JdlP/S1xtQkycBz+oVpsx5KYQX5HNSW3NOXCjBlpLyejw1FpK2Wlq1Lg
 qAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFfhRB3CIFp7+b9HYaYFBTlz+H/vZeZ2FswijDgFipc=;
 b=pttZ6+A6DK+BH/H7qU6PXpaxhr8p+FJ/jhVrdH2Zb7S+BDizlpP0Bdj9N70MWRSGsc
 h0DnkHr293CjzsI9eT2/EsBxmBrFWkmZl3opRbjo/SjxGixtSwZPChAxyDnrgqyQx0HB
 SXYbGQtenwL4bO1hKq8r/u6okAArQGaER2tMVsWmjzQDPu5YPnqGUXvnjsQLRNZq8UzK
 YawTccG8rUXWyD4ml6vWYBt9TCU/pv4H0wz4vkZ3YqCd/jKMg9uJNDJKoX1d/uuybAZl
 d15XkwRdENlzHcyKnLuukYsD7w5l9ZZAKsc47ZFOLbXqS+aqTcvtcFAJGSQdGzVs6ce/
 ApTg==
X-Gm-Message-State: AOAM531V5DjvU2KPZwkFI4WMyeXEgUYginXFlSr3J2Oc7vt0700XYUfs
 j0uKWBbq0OOzZPYYPi9yFXM=
X-Google-Smtp-Source: ABdhPJxKsJGmE1cXYIqvgGVcbqQhYNjKkdXWYq3nTtCEanj2piNLMs6tz3AQM8Wn4LqysoxPncAyVA==
X-Received: by 2002:adf:e884:: with SMTP id d4mr61159232wrm.176.1594303423483; 
 Thu, 09 Jul 2020 07:03:43 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 14/14] [DO NOT MERGE] arm64: dts: allwinner: force GPU
 regulator to be always
Date: Thu,  9 Jul 2020 16:03:22 +0200
Message-Id: <20200709140322.131320-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
