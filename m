Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131DF1F0F06
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296D26E416;
	Sun,  7 Jun 2020 19:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8076E38A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a9so14202745ljn.6
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jzk01JZt0hk/WZz0ErESEIFFh3afX5T+P2xZ19G0ZC8=;
 b=H6EFvpfB2xKzGQVM7GlvYYIoxYwtjkbhoJkwKvJMfPrZKNgaVPmkI9RUcju0JJivlU
 kDqcGdHOFLTe82ZBs32El29xLgityeQwaxPqGc51TCweYPncdvtwwDsWX5/e3auwm1LI
 dNoSxTlwPsGRUE6qHXPbrWLimGEg/knuHNeiNMOWS5jvk0s9HQw9euzM7hLqBpCuXckV
 lfMpcQz+aFKpV0+0WqAALMyPoqAz8AxCoWZev89BRxYDQE1PQOPSqFrhQuWQjv74gIdp
 qUn6hXzTqGdLpnRT0d2H5aCiPPBW4Ym19jIdjJYEL7DTyxtY/n7kG1DjTrsKPcR/ws6B
 mUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzk01JZt0hk/WZz0ErESEIFFh3afX5T+P2xZ19G0ZC8=;
 b=XlLOyEQde30RtZ26dnN8J4bhzhaTkUQ5oICj5Dj26A3J718+zvkygxbsPykUxjd/kT
 IkZT+ui8wMb+0K56yCiZg5y2Vv0qWFXdQOFD/1jTRRrt3e15hBIe6Fnpnk/45GckzcgA
 GcWyw4er1HpCh1PUSlatMQQmVIyCUuDV26X0SB+DRM+RgA2rCJ2F6crKYRV3NBb46XWx
 BalmPfNrtlK40h9M78E1+kGn5IFWZFTknq6E1whmLENzqgToB1/R4U+fOLGVrTgcUGyt
 ohQlQ8YhXrWbaFiYRjFIVVpriHxs7Rf48r7fyHMe54flwS6AbXCZMDJCewelW3VY3myk
 staw==
X-Gm-Message-State: AOAM533/pZ4KcpnDCi1zy5vAQGu9IFSK4RzmHKF9AwsLb8sG3L44LhiW
 5fkwkn/FWXe79IlrzdrQbGc=
X-Google-Smtp-Source: ABdhPJxzuE/lVkygD4rMhlrInafSJ4dmC6EWK116wb+R0vUiCEfDrZPnondr7VEVByoH7PawNhUD3A==
X-Received: by 2002:a05:651c:512:: with SMTP id
 o18mr10077245ljp.226.1591556260742; 
 Sun, 07 Jun 2020 11:57:40 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:39 -0700 (PDT)
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
Subject: [PATCH v3 23/39] dt-bindings: memory: tegra20: Add memory client IDs
Date: Sun,  7 Jun 2020 21:55:14 +0300
Message-Id: <20200607185530.18113-24-digetx@gmail.com>
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

Each memory client have a unique hardware ID, this patch adds these IDs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/include/dt-bindings/memory/tegra20-mc.h b/include/dt-bindings/memory/tegra20-mc.h
index 35e131eee198..6f8829508ad0 100644
--- a/include/dt-bindings/memory/tegra20-mc.h
+++ b/include/dt-bindings/memory/tegra20-mc.h
@@ -18,4 +18,57 @@
 #define TEGRA20_MC_RESET_VDE		13
 #define TEGRA20_MC_RESET_VI		14
 
+#define TEGRA20_MC_DISPLAY0A		0
+#define TEGRA20_MC_DISPLAY0AB		1
+#define TEGRA20_MC_DISPLAY0B		2
+#define TEGRA20_MC_DISPLAY0BB		3
+#define TEGRA20_MC_DISPLAY0C		4
+#define TEGRA20_MC_DISPLAY0CB		5
+#define TEGRA20_MC_DISPLAY1B		6
+#define TEGRA20_MC_DISPLAY1BB		7
+#define TEGRA20_MC_EPPUP		8
+#define TEGRA20_MC_G2PR			9
+#define TEGRA20_MC_G2SR			10
+#define TEGRA20_MC_MPEUNIFBR		11
+#define TEGRA20_MC_VIRUV		12
+#define TEGRA20_MC_AVPCARM7R		13
+#define TEGRA20_MC_DISPLAYHC		14
+#define TEGRA20_MC_DISPLAYHCB		15
+#define TEGRA20_MC_FDCDRD		16
+#define TEGRA20_MC_G2DR			17
+#define TEGRA20_MC_HOST1XDMAR		18
+#define TEGRA20_MC_HOST1XR		19
+#define TEGRA20_MC_IDXSRD		20
+#define TEGRA20_MC_MPCORER		21
+#define TEGRA20_MC_MPE_IPRED		22
+#define TEGRA20_MC_MPEAMEMRD		23
+#define TEGRA20_MC_MPECSRD		24
+#define TEGRA20_MC_PPCSAHBDMAR		25
+#define TEGRA20_MC_PPCSAHBSLVR		26
+#define TEGRA20_MC_TEXSRD		27
+#define TEGRA20_MC_VDEBSEVR		28
+#define TEGRA20_MC_VDEMBER		29
+#define TEGRA20_MC_VDEMCER		30
+#define TEGRA20_MC_VDETPER		31
+#define TEGRA20_MC_EPPU			32
+#define TEGRA20_MC_EPPV			33
+#define TEGRA20_MC_EPPY			34
+#define TEGRA20_MC_MPEUNIFBW		35
+#define TEGRA20_MC_VIWSB		36
+#define TEGRA20_MC_VIWU			37
+#define TEGRA20_MC_VIWV			38
+#define TEGRA20_MC_VIWY			39
+#define TEGRA20_MC_G2DW			40
+#define TEGRA20_MC_AVPCARM7W		41
+#define TEGRA20_MC_FDCDWR		42
+#define TEGRA20_MC_HOST1XW		43
+#define TEGRA20_MC_ISPW			44
+#define TEGRA20_MC_MPCOREW		45
+#define TEGRA20_MC_MPECSWR		46
+#define TEGRA20_MC_PPCSAHBDMAW		47
+#define TEGRA20_MC_PPCSAHBSLVW		48
+#define TEGRA20_MC_VDEBSEVW		49
+#define TEGRA20_MC_VDEMBEW		50
+#define TEGRA20_MC_VDETPMW		51
+
 #endif
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
