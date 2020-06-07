Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7614D1F0EED
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA676E395;
	Sun,  7 Jun 2020 19:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217478920E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:58:02 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s1so17786109ljo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DU8gMkYFBfK9hw25Nj54hMRcSzVpbsQ+pPiJfYX2eco=;
 b=afosJJ+iztw7ZgiF5QU6AGJvvn+gSSgWHwQZfPP7ZeRzwMQscRGGPybu19wh+Do9O8
 OgDW9Rbwjavz1ZXXrXw1ZMO26kxYS+arn0Jzm3H2Kll7MzLRX714DwbT92h6uJkqH//Q
 SPvoElbSNjttu7uHYp6jvoGRdeni12WU31bVQhXwgJdfcygvWYjJQMAjnLVgKsB6RTXP
 VqOn6zPXj431CceX5Zv5LZN6MggTKAoz5CyvOiNXmNeeJn/meiLKG1Y2XFnvfnyHvNN/
 fmWCdUdlJ20HxwiU4psTgDDBinXHLD69nnoa41CGGqrG67td+btFZeConFC9aGxy1t2W
 rdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DU8gMkYFBfK9hw25Nj54hMRcSzVpbsQ+pPiJfYX2eco=;
 b=GnUNXqsn+lCSVGTJJQ2BhPsWphVAovmMjq+6X2F4Xg+yIYvOGoNYz2RrhcfAtKq0Z/
 wjYUOMDKiRSSLEIqnfsUaGqqSx0gC8pIDlaC04K2YPKvFCejbKPEsxyD4YvT0ovrE9Df
 QA07ONYIL4IAQ14Qcv33rCVXycaLXDJigPPJIoQKww0Ojt2+hGjNW3p8nxVpJyN4g0Ax
 E+stcZP5qkHGb/qrAnHFmu3ZIGxH6gATjaD0lbozA6faGVwtLaVSVaL6JGrNUHIK8zxD
 4J0C1LJDSlIYGFL4mGFyShhkP3a0IepmKhjb2yUgxVcUQ11L+wwqkmojplfygb4YJ8m5
 nYnQ==
X-Gm-Message-State: AOAM5339lnxu2hF6ImbcE38L9rnPqBn5ZjlmRh/d5k218+gtIVqMEsWH
 tk6e8sGdZjeQG7PRRfq10Ak=
X-Google-Smtp-Source: ABdhPJzVs2qIvHg3P4vb8mwyErgjBalaGQTGNXA8jyoxrDPJV03MrWqalkX3wx/tfMmcqfcWnQ0WPQ==
X-Received: by 2002:a2e:9cd1:: with SMTP id g17mr9785491ljj.149.1591556280653; 
 Sun, 07 Jun 2020 11:58:00 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:58:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 38/39] ARM: tegra: Enable interconnect API in
 tegra_defconfig
Date: Sun,  7 Jun 2020 21:55:29 +0300
Message-Id: <20200607185530.18113-39-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra now has interconnect providers that are used for memory bandwidth
allocation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index aa94369bdd0f..0029259a6bf5 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -268,6 +268,7 @@ CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_TEGRA=y
 CONFIG_PHY_TEGRA_XUSB=y
+CONFIG_INTERCONNECT=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
