Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03521E8D2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999106E8EE;
	Tue, 14 Jul 2020 07:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4811C6EBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o2so5273859wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VG9wQ36+6wND2b+1ll55zwCVUgbhF9bJxt2xblFID8=;
 b=arCHEQlSPWMax2PHYcz1oSUlwEmdK/gJoipdUagX+JC4fIdh2+uF0ipKITX1uERJ7a
 McyCu8VSAkzZ2X1uIPcoPYrt57DcBTgqlbaDnNPj1+EzZGCWMo6kPGoxlvm6ekXMCbdK
 ZgycShxzBoHe4pSmN2YkIrKtYK8tgCZaaOlmVmjsBjG6dlStcaYLaOqVqrh36TACYRj7
 47pOHc8JeQNlLbRjrFIJL7ukWLVyoqlDy542+r+MRB9cTeXb4XCdZzr6xb/GSkPsvY62
 DZCA6xa1A+MqBlVYeB5j1lR+2q9QVXpaJnFxpa52glDuRuTPkWF4gIBGRGhNrXRCZ6hc
 RJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VG9wQ36+6wND2b+1ll55zwCVUgbhF9bJxt2xblFID8=;
 b=aa9ZT/YMQksf7hQ9YTIoN98Vc84D+uRvDlnxOw8S79EE7g6zg7bMOxmts5DAlCOUsy
 1I90avjaa0Tcxxnbwrunio1/0x7csPWiNc8ThrZtnSwkK7f44eTlwqgNjj37gcE8C/SD
 nperF/LNzc8B9sUb9HmXbJ9S+SCd7UP01A3FOLuW8e70MrQ9YM70AblqzNsSn5qrTIUt
 4cALQFxqBzXt3RrYROWzGK2LxyQ96FPcA/J4NAec8ckjzXdt7/Uuf2G/wUkGwBN/5na5
 vc9d0eiTbJphTkyQF5WGKelzi3no7JMMsFUFYdKWKs15xGgJKqOuCqMcyjEDvntMY4bx
 XQOQ==
X-Gm-Message-State: AOAM532Z9ugv3fVaOsk8VVIsCPKcO7fxQoVDc24oufyEb2b8OMKODfBl
 jKfjLr9k5cCH5ag99dQ1WPc=
X-Google-Smtp-Source: ABdhPJyCS0Byis+30zzDr4BEH6T3l1hR4Yd0kDf359JHDMzQ2V1yzUqlbi3l5elMmoSteGmC6tQ0gA==
X-Received: by 2002:a1c:5646:: with SMTP id k67mr4515905wmb.61.1594374866911; 
 Fri, 10 Jul 2020 02:54:26 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 12/14] arm64: dts: allwinner: h6: Add cooling map for GPU
Date: Fri, 10 Jul 2020 11:54:07 +0200
Message-Id: <20200710095409.407087-13-peron.clem@gmail.com>
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

QWRkIGEgc2ltcGxlIGNvb2xpbmcgbWFwIGZvciB0aGUgR1BVLgoKUmV2aWV3ZWQtYnk6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpIHwgMjIgKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaQppbmRleCA5Y2U3OGE3YjExN2QuLjFjOTM5
YzU1YWFlYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBp
LWg2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0
c2kKQEAgLTE3NSw2ICsxNzUsNyBAQCBncHU6IGdwdUAxODAwMDAwIHsKIAkJCWNsb2NrcyA9IDwm
Y2N1IENMS19HUFU+LCA8JmNjdSBDTEtfQlVTX0dQVT47CiAJCQljbG9jay1uYW1lcyA9ICJjb3Jl
IiwgImJ1cyI7CiAJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX0dQVT47CisJCQkjY29vbGluZy1j
ZWxscyA9IDwyPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKQEAgLTEwMTMsNiAr
MTAxNCwyNyBAQCBncHUtdGhlcm1hbCB7CiAJCQlwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8MD47
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
