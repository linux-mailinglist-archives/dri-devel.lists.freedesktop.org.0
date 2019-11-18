Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C00101B13
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDD96EBD6;
	Tue, 19 Nov 2019 08:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164276E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:06:01 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n21so20394314ljg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pTMYCgIgvCNm1q2JaoM7zr2eJ5iQIuvTMHSD1CcRgH4=;
 b=k79sqx4vDOIAAcNxrF4ww1uFyHN8mO5/euW5fw+OQEzujmjw80t4us1zZv5Gum0YXd
 tp2OsVIxRjPUV8vxZm2JH+Hplu5+RFBeMpljGJ+Y2oxQmz8PWkhwc6NvnIpQbo8WYw3a
 Vg/3M8tazvhe0IFO2U4OydpkiUPadkUt3pH5AJWt0KEVvD71R458OtTWhR2p4CLDWbxE
 SUUF21DYR9/9k/fxOFAOCVQr5Tih402BjcZ/F/WuiB6MrQxS9+XCd8FxY0dn5cWg8WJQ
 5LR0TN7cfsJ12IciWiJ1OE4A9RxD4o+92ITwHrwOm+HwmAK8jUcBmhk2UynnKzIhYA46
 Nk6Q==
X-Gm-Message-State: APjAAAViXpyGYXxxosiziOJVkqK9buhinVej/reqQz3zknY3Nypg8wqQ
 09xoXzDsx4gq/6CZs7C3WRc=
X-Google-Smtp-Source: APXvYqyHgybcG5MMZcJRPRCQEbkIktBAw9M79vtA0GyQaow6feMEG7kPjNrNfppBRmcsYR1tJhTMlA==
X-Received: by 2002:a2e:9841:: with SMTP id e1mr922343ljj.19.1574107559605;
 Mon, 18 Nov 2019 12:05:59 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:59 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 29/29] MAINTAINERS: Add maintainers for NVIDIA Tegra
 interconnect drivers
Date: Mon, 18 Nov 2019 23:02:47 +0300
Message-Id: <20191118200247.3567-30-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pTMYCgIgvCNm1q2JaoM7zr2eJ5iQIuvTMHSD1CcRgH4=;
 b=Pmcz5aQvG4kdoLoEesuweo15xnoulLsuqWT1ryquWf4xC5WKJlk7sQdtOvmwi/NpWC
 gTAyERPFtJNkUzqd4x4Y9rBPZWSbynQmALOKWutfXwNS4xK3fO7jjK2GDLacc/aQ4LcP
 +q4GSBo7nTObUfUYvEZA+5mjAci1NekYCRzqfnTxFjX2jCG1NoMyuG0ndkiuNDkNIZw6
 YUmu0ciM2Q5HNUftUJWbOm6oRtbezUhpkApFq69Za9Q7EyPkCVilwY6lLCRBUpkcV6Ls
 ScgNRa7PKIQ7q4LUjwPPhiQtna7RDkugFnxfY8NTockXYQp6rNkhVgPmUdt6uv+EVWEa
 hi+Q==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG1pdHJ5IGFuZCBUaGllcnJ5IHdpbGwgbWFpbnRhaW4gTlZJRElBIFRlZ3JhIGludGVyY29ubmVj
dCBkcml2ZXJzLgoKU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgotLS0KIE1BSU5UQUlORVJTIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4
IDUxYmY2OWY1MjBlOC4uZmQ4MjA4OWVkYWQ2IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysg
Yi9NQUlOVEFJTkVSUwpAQCAtODYxNCw2ICs4NjE0LDE1IEBAIEY6CWluY2x1ZGUvZHQtYmluZGlu
Z3MvaW50ZXJjb25uZWN0LwogRjoJaW5jbHVkZS9saW51eC9pbnRlcmNvbm5lY3QtcHJvdmlkZXIu
aAogRjoJaW5jbHVkZS9saW51eC9pbnRlcmNvbm5lY3QuaAogCitJTlRFUkNPTk5FQ1QgRFJJVkVS
UyBGT1IgTlZJRElBIFRFR1JBCitSOglEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+
CitTOglUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgorTDoJbGludXgt
cG1Admdlci5rZXJuZWwub3JnCitMOglsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKK1M6CVN1
cHBvcnRlZAorRjoJZHJpdmVycy9pbnRlcmNvbm5lY3QvdGVncmEvCitGOglpbmNsdWRlL2R0LWJp
bmRpbmdzL2ludGVyY29ubmVjdC90ZWdyYS1pY2MuaAorCiBJTlZFTlNFTlNFIE1QVS0zMDUwIEdZ
Uk9TQ09QRSBEUklWRVIKIE06CUxpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KIEw6CWxpbnV4LWlpb0B2Z2VyLmtlcm5lbC5vcmcKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
