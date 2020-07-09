Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8021B0B3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78296EBBC;
	Fri, 10 Jul 2020 07:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C7B6EA75
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q5so2508259wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IGSDRqVm1JOZ64MgS3vkOb+1FLTRNpff/hgpbfnfooY=;
 b=QltWwipSdHi08KdX6oNOYrCOU3nuRZ2oqlCna2xNWmwU93UXHzqIe6EhlAVKTSoKYg
 RC12Xg33XJ6+bMKWAoKIhFaPw4BpbWY6BCUiue1z5RTvYl7ilsYPhf1Ceo+Lw0BGFAL9
 uJTV6imSHnZj/Zsj0nCjEaK50qaHZZ7IcyF84LWWEFTQq53BTWRBjA1DcYAZi3xMMPXj
 Txr/SOUOwjuRevz5DC4m7GosDUgWqm4YEaCcw9u+TiMgLxMz8bM1U/W+Ocv/6Vf3fyE9
 J385tuU3tSivLhmwdnC6mFCLKTkdC+kx9kthXrtarIhU/d/5k16B4W1LgC1HekkobzU9
 iaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IGSDRqVm1JOZ64MgS3vkOb+1FLTRNpff/hgpbfnfooY=;
 b=ZmkXTYwjxIk6TeZHNvOUh0qLlSlgHfIE9rmxvSAYtgDC4mi8tu98g4tZYU1hhlWkKq
 1uxuOIpvHpUZGe9MjUsPiozuAphhKX4U5UDNScN1fTX9iAhnAMOtMgoMRzyc02ms2EuD
 si+0O8ibgN04E02VKHZ0rtO2JSMCEm4xhv9nHsL8K3E79c3gOCYPzT1Vq0baIRmPGmSL
 XNK1Vyl4+JsLelPkM00gm8bJImXq/PDrZ6gOXUfj25MAgLGYLHjr9nQ1xvpn9TDKudza
 05mZv67yHAJIzCyCkjLHhw/pWdcAhepAsEImQfIX1fxrC62/WQ8UHhP0A2K4q1Uf6pDc
 9lWw==
X-Gm-Message-State: AOAM532/Zeib1wvymlVeaWCdm04dGoBAApZqyRteNNiLJECC5hmLQ0vA
 ZMkaYjKBL4a+VyFwDSkZWhw=
X-Google-Smtp-Source: ABdhPJyHqIxm58EdIGIO13FCV6nEuBJUZ9dl18TlYFSgwLEHFySc4yWbcI5jJYl+BM0LfhDROjoK8Q==
X-Received: by 2002:adf:f34c:: with SMTP id e12mr60699527wrp.46.1594303421047; 
 Thu, 09 Jul 2020 07:03:41 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 12/14] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Thu,  9 Jul 2020 16:03:20 +0200
Message-Id: <20200709140322.131320-13-peron.clem@gmail.com>
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

QWRkIGEgc2ltcGxlIGNvb2xpbmcgbWFwIGZvciB0aGUgR1BVLgoKUmV2aWV3ZWQtYnk6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpIHwgMjIgKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaQppbmRleCA3OGIxMzYxZGZiYjkuLjhmNTE0
YTIxNjlhYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBp
LWg2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0
c2kKQEAgLTE3NCw2ICsxNzQsNyBAQCBncHU6IGdwdUAxODAwMDAwIHsKIAkJCWNsb2NrcyA9IDwm
Y2N1IENMS19HUFU+LCA8JmNjdSBDTEtfQlVTX0dQVT47CiAJCQljbG9jay1uYW1lcyA9ICJjb3Jl
IiwgImJ1cyI7CiAJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX0dQVT47CisJCQkjY29vbGluZy1j
ZWxscyA9IDwyPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKQEAgLTEwMTIsNiAr
MTAxMywyNyBAQCBncHUtdGhlcm1hbCB7CiAJCQlwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8MD47
CiAJCQlwb2xsaW5nLWRlbGF5ID0gPDA+OwogCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZ0aHMgMT47
CisKKwkJCXRyaXBzIHsKKwkJCQlncHVfYWxlcnQ6IGdwdS1hbGVydCB7CisJCQkJCXRlbXBlcmF0
dXJlID0gPDg1MDAwPjsKKwkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsKKwkJCQkJdHlwZSA9ICJw
YXNzaXZlIjsKKwkJCQl9OworCisJCQkJZ3B1LWNyaXQgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDwx
MDAwMDA+OworCQkJCQloeXN0ZXJlc2lzID0gPDA+OworCQkJCQl0eXBlID0gImNyaXRpY2FsIjsK
KwkJCQl9OworCQkJfTsKKworCQkJY29vbGluZy1tYXBzIHsKKwkJCQltYXAwIHsKKwkJCQkJdHJp
cCA9IDwmZ3B1X2FsZXJ0PjsKKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmdwdSBUSEVSTUFMX05P
X0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+OworCQkJCX07CisJCQl9OwogCQl9OwogCX07CiB9Owot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
