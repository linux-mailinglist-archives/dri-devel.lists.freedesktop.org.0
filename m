Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD76D197538
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07E86E079;
	Mon, 30 Mar 2020 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1389989F41
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p14so16283459lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PzPcH2Zw8s/lvusSJ+NeMT9K6QE3NO3BQ3OrhGxd84A=;
 b=dAAbaMon+3/bSqoIuYfuwHx2KG8hghvSLrRSU22QfeV59mfGE+K6Fbxqmy75QxyRCz
 vzG5MdQuMDqHNheti6KOwuAC/+GF7vBVf/jEwWYS0JpHBODi64d+2WUXzJ80dVgPaNbe
 E2DmsKwTAP1jGTMw1ptNsZIEqJS4WhOcV9lNCgeUkDl9yc9Qhfifpe56l1OBc8mmkQVV
 /NvfFxStOa1MuTM+BiVP1h8E8A+35d/0zkbSj9rlEX3Q2stjrqJdoJTxDE5PJap/Nf7q
 zK7VvXq/44tRZFis67kdqpwYT1THGvNz40nr1jawM5e5NgNtwBdl8KhlaQDO66t+wvDQ
 tlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PzPcH2Zw8s/lvusSJ+NeMT9K6QE3NO3BQ3OrhGxd84A=;
 b=gDgwlUWwCjyiRVdn0YGR4xaDlxhU2U8KT8XywO1GIP+qKyZ+y36fQsCPPBZnQkSTrb
 odJJFi6GJ4yNtV6XrtBE9hkQ5mgrAuIdWatWsZhER0FUhqGZ5JcRGK+AO8dgo+YR3A+R
 CJF5ZfXzbgGTacEGdTVXFzFqx2p6vWngAeLH7hAiAqKUxvCD6/bcYedWLtXRayYCTU/r
 hYylT4rOMV8DJ3b8nXtfvH+x9rnAvFL5SduYwaGEh7G58NTXL1CxPBZcpG45tU+0V1Rk
 yzS490m7js3tmJ4fPWcaimI5wO2HRoS399AUPnb+VeNwsD2F8EOq/LSNArgGKAnk9Vfr
 pghA==
X-Gm-Message-State: AGi0PuZ2ThN9TPEgmZ7CM/G4So9oUS8gDcHM9WleDIaJ81WufI3YbLDK
 s7Z3DlC5tUgKh3zO1XmyoAU=
X-Google-Smtp-Source: APiQypIYV+VJ2BotiGVJkdVXlprPFDGmyLuF/8w8UIlmHETYi4iZ9H/wP0ZGxE/ac47Mtz3QpiVAvg==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr5726081ljj.145.1585530596562; 
 Sun, 29 Mar 2020 18:09:56 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:55 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 21/22] ARM: tegra: Enable interconnect API in
 tegra_defconfig
Date: Mon, 30 Mar 2020 04:09:03 +0300
Message-Id: <20200330010904.27643-22-digetx@gmail.com>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
