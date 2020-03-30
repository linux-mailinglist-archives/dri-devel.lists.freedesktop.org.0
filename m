Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D1197553
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451C6E0C1;
	Mon, 30 Mar 2020 07:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5D089F35
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:59 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q5so12698732lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9E7zI2IZnXV4YyjveISOsemm9R4xu7EUE6WXPbYZj5s=;
 b=SHY9Z0NgudDm+L5mpyLB00o4AL/yhAoKr3QhYv/uGqvjwF4WtUVJvJNV4sfPZp4VYL
 gQ+u862RKGhEHlNflC6XRFa34GlMpKu7biU4hVlvoZHgIlYg9/0jNqr8zWTVgN/fD+G5
 17chke2o76960p5eSNsbEF2fvD5ycrj+Ev4wEpl/k4OCU+JO65D6adaYNKF82XQjdMeV
 EiVy40M+MMGcC82Z4m+p9h1t5h+REMeOl+LLhVgSz8MDVIJD/RaihQmdSsD7ssnUvOwN
 i71Pw9XhUawf2Zz+MNMEz+qWo1g2srkUAlnyP1M/sFKBa8wCE+AB2T33wYureSb1X/K7
 BkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9E7zI2IZnXV4YyjveISOsemm9R4xu7EUE6WXPbYZj5s=;
 b=blVT4qNEhSnqzlBJBIEmk4qi/SZcU362WA/I42PoBts6ZOdeFbH/OLw/vx4KOQ3dww
 DKzzz1nxXOCK5Yw8ez6suI0pZber1UqOa92Z9hLKFL54yNJHU++pc4r2YzFoqMPLHJuF
 najUGub4Wzn2IuCGWzeFFEyIpoqcy9a2pppqBVqljCCgIWORh/s/gOK1yiPWQyw5KsDh
 uaLmqgT60+leBxnmPKXV3xfxhWGNjWeOksFZ34opPmvHyKvlMMEEwfyZrGON5haSmNoS
 K1KKJmJDCzdLrOKWmZ/Kubwy8qR60/57LbplVfOcBY0TwC5SJsAvEpeULbWZcsyzFb6q
 lngA==
X-Gm-Message-State: AGi0PubZqIKaPp5WnMR79rs3HuKCEhKZz77qodjf6cB+N0lJDFLLQOu6
 q3beuwCWX564Xe8r7GC4SqQ=
X-Google-Smtp-Source: APiQypJb/KYN7Ausy9RzxNHKtBOMbGpnF36P6KkLPqb8j8gQzwiIUSVwL00ZzzFM4pP1djvb07ArDg==
X-Received: by 2002:a05:6512:31d3:: with SMTP id
 j19mr6551417lfe.178.1585530597501; 
 Sun, 29 Mar 2020 18:09:57 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 22/22] ARM: multi_v7_defconfig: Enable interconnect API
Date: Mon, 30 Mar 2020 04:09:04 +0300
Message-Id: <20200330010904.27643-23-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NVIDIA Tegra now has interconnect providers that are used for memory
bandwidth allocation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f8e45351c3f9..658b5c1892eb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1085,6 +1085,7 @@ CONFIG_FSI_MASTER_ASPEED=m
 CONFIG_FSI_SCOM=m
 CONFIG_FSI_SBEFIFO=m
 CONFIG_FSI_OCC=m
+CONFIG_INTERCONNECT=y
 CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
