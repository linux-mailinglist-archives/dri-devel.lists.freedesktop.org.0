Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CD1F0F2A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668636E441;
	Sun,  7 Jun 2020 19:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8725A89D84
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:58:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w15so8829612lfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5WrxJdQGGJp0h0CB+IuS493cV6Sm3/0MyVvkHgYGkIo=;
 b=uaKuXbv4NPCMAB5PWw36K78TOvjq8+B5CEINpv0g86H4gsbK8SiR3wpwyYUwYx2QHO
 cOGczfOcfJ3JZp7X+U6ysfHmLuYRo1bDaM7zaB8PfhJ5BtENQ8Oe2ev6zBlRgnbyQ5XC
 DfOvK1n3gsVo5boBFUMcrl+bs9k6AXpc7Q3bm+dZnJ3/EZDnz+2+ba1/NAuUYVrO/8ta
 W1CA0glXMzKOI+epW+OoKM+y4Ev8D/Sn/NvlgLthGcj6wzaYMI3IeY2Jf4oIiJYutUSN
 ourQOypLAMqeFGoXX6Y641io2ItZJ1EmE8USSQLE29TelRyxoyqNlCOtCbEeG66iSTEm
 gQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WrxJdQGGJp0h0CB+IuS493cV6Sm3/0MyVvkHgYGkIo=;
 b=tcuyOn3ZUY02CYO23SjPzrn8wCSChoyMjMsR6oo1U7mvfyX9IBuDfDnEXRVICQJBbE
 Bd3HPn5fN2r0GqzZrueAK7o3+N2sugrOytaqJLHmGbTIo9neMq1Uoj6qjmtpCCFRnZRe
 tWKuq0k2FOGquqbMNGqCyRJwNvSRTUALWmubzNgq1yOOjGXv7BjaZ1vDSptNIjr2uj4v
 rOXCqKVD1jtzVYWAJZlmROybMgOOl+CVRwig3QgVw8vZ4Vl/DaIZoEN8rL1Xo3uO5tM0
 5gKAfnY/5qWcfV4OuLFsL61WyeSxyBxvUFN3beGEi1VR/d/u0OjQOsd0zbjAfFmqeu//
 rVdg==
X-Gm-Message-State: AOAM5334i/mfyhiH+GKNz+pGWFr0lrpy5PSP4g76pY8jfyoEKA+HyNPq
 VYQ4+SijbmahFOlFoLgB2tedCkEE
X-Google-Smtp-Source: ABdhPJyolUdnd0FXTN33twcK0bltOioVetEv1cEk9SDsT3GY6Y9PN4k3i74XwSmZQuCoGrUPHJYBaQ==
X-Received: by 2002:ac2:5dcb:: with SMTP id x11mr10646127lfq.110.1591556282023; 
 Sun, 07 Jun 2020 11:58:02 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:58:01 -0700 (PDT)
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
Subject: [PATCH v3 39/39] ARM: multi_v7_defconfig: Enable interconnect API
Date: Sun,  7 Jun 2020 21:55:30 +0300
Message-Id: <20200607185530.18113-40-digetx@gmail.com>
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

NVIDIA Tegra now has interconnect providers that are used for memory
bandwidth allocation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 95543914d3c7..d3b554045dbe 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1086,6 +1086,7 @@ CONFIG_FSI_MASTER_ASPEED=m
 CONFIG_FSI_SCOM=m
 CONFIG_FSI_SBEFIFO=m
 CONFIG_FSI_OCC=m
+CONFIG_INTERCONNECT=y
 CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
