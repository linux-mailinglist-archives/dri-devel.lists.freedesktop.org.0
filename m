Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA979197548
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9AD6E1CF;
	Mon, 30 Mar 2020 07:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622A489F24
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:43 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g27so16238957ljn.10
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZPNrypYAJ0DVxGo/z3wAqcvtTxmsayiljwdnKM3VrQ=;
 b=c+DhtUuuMUJ0rR4YA7n4mv3Ohj94+u2O55W9TrqbxwN2tEnvjmKzSGsG/NECIL4tPT
 Czjqjem+O/r0pKA3h3XFnDh+qXsY7dd0dVR6hcMRYNEu/6UEJ5Ho879y6I3VQq9BnAzq
 h/fxU34j2ZrNnLsNL2Fgfb2Qk5xhklR4eIACoYc2W++TIZ+ldJrqFc2uQY8WnZEqANsb
 0/xULCchZQwJQpcPjntoWfznK6ijQhVLtg7t5hn4PwYDzl3nELgExhTHRIMQ8QhUUyqY
 YnlRhCRfpu8qtdvX3irMlx6PCQK9KQD4BkbndFtqIDLnjmu7EYGnIhNA3NFgpvdM8tjf
 8NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZPNrypYAJ0DVxGo/z3wAqcvtTxmsayiljwdnKM3VrQ=;
 b=Vm/Utqqwv7r6tQvQgIbPY2h7pb2gZRm4IYyBYzwutfSJxZlIuaDab1VVTtMvyagdXL
 KmfWTUM4kt9WpEoq3Jo5j+dsc27elK9qgf4h9j+RVGBdIglVd/HXNkGFQQ8N7F0aHS2+
 3MsJJVN2jJTGbic+kDICvBWjrmb9CBiouE6NvsQFc0npdWBYAkESAFvkDb2GmcS+vE0S
 0NGsHjYDPm4guMR0UBHVoMEZhItCav6fO/2mP6fERPaCN1yE5l4HYtQLZUqPF1o1XPau
 mL3kg1jZGE6Tw2AYag8IfJO9FSMZ7CaFznCbd7T5TxIEA+YxcqbIdMts2MdB08l138B2
 q88A==
X-Gm-Message-State: AGi0PuZcIlBjnSlQOO60sMPU6hl4C0P2c6LqWw+SuB1P11bY13VBCjSy
 ZhzGa+dFFe+F4U5B5XoERubWwXs6
X-Google-Smtp-Source: APiQypL5WrohbBW5CsxmlK1Tm0Cj8PudLUhgCzjYqMhQc6gTXz5YtkrXjBmZxeb+upQypsi3mdjjRQ==
X-Received: by 2002:a2e:8911:: with SMTP id d17mr5816369lji.16.1585530581827; 
 Sun, 29 Mar 2020 18:09:41 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:40 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 07/22] dt-bindings: memory: tegra30: Add memory client IDs
Date: Mon, 30 Mar 2020 04:08:49 +0300
Message-Id: <20200330010904.27643-8-digetx@gmail.com>
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

Each memory client have a unique hardware ID, this patch adds these IDs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/dt-bindings/memory/tegra30-mc.h | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/dt-bindings/memory/tegra30-mc.h b/include/dt-bindings/memory/tegra30-mc.h
index 169f005fbc78..930f708aca17 100644
--- a/include/dt-bindings/memory/tegra30-mc.h
+++ b/include/dt-bindings/memory/tegra30-mc.h
@@ -41,4 +41,71 @@
 #define TEGRA30_MC_RESET_VDE		16
 #define TEGRA30_MC_RESET_VI		17
 
+#define TEGRA30_MC_PTCR			0
+#define TEGRA30_MC_DISPLAY0A		1
+#define TEGRA30_MC_DISPLAY0AB		2
+#define TEGRA30_MC_DISPLAY0B		3
+#define TEGRA30_MC_DISPLAY0BB		4
+#define TEGRA30_MC_DISPLAY0C		5
+#define TEGRA30_MC_DISPLAY0CB		6
+#define TEGRA30_MC_DISPLAY1B		7
+#define TEGRA30_MC_DISPLAY1BB		8
+#define TEGRA30_MC_EPPUP		9
+#define TEGRA30_MC_G2PR			10
+#define TEGRA30_MC_G2SR			11
+#define TEGRA30_MC_MPEUNIFBR		12
+#define TEGRA30_MC_VIRUV		13
+#define TEGRA30_MC_AFIR			14
+#define TEGRA30_MC_AVPCARM7R		15
+#define TEGRA30_MC_DISPLAYHC		16
+#define TEGRA30_MC_DISPLAYHCB		17
+#define TEGRA30_MC_FDCDRD		18
+#define TEGRA30_MC_FDCDRD2		19
+#define TEGRA30_MC_G2DR			20
+#define TEGRA30_MC_HDAR			21
+#define TEGRA30_MC_HOST1XDMAR		22
+#define TEGRA30_MC_HOST1XR		23
+#define TEGRA30_MC_IDXSRD		24
+#define TEGRA30_MC_IDXSRD2		25
+#define TEGRA30_MC_MPE_IPRED		26
+#define TEGRA30_MC_MPEAMEMRD		27
+#define TEGRA30_MC_MPECSRD		28
+#define TEGRA30_MC_PPCSAHBDMAR		29
+#define TEGRA30_MC_PPCSAHBSLVR		30
+#define TEGRA30_MC_SATAR		31
+#define TEGRA30_MC_TEXSRD		32
+#define TEGRA30_MC_TEXSRD2		33
+#define TEGRA30_MC_VDEBSEVR		34
+#define TEGRA30_MC_VDEMBER		35
+#define TEGRA30_MC_VDEMCER		36
+#define TEGRA30_MC_VDETPER		37
+#define TEGRA30_MC_MPCORELPR		38
+#define TEGRA30_MC_MPCORER		39
+#define TEGRA30_MC_EPPU			40
+#define TEGRA30_MC_EPPV			41
+#define TEGRA30_MC_EPPY			42
+#define TEGRA30_MC_MPEUNIFBW		43
+#define TEGRA30_MC_VIWSB		44
+#define TEGRA30_MC_VIWU			45
+#define TEGRA30_MC_VIWV			46
+#define TEGRA30_MC_VIWY			47
+#define TEGRA30_MC_G2DW			48
+#define TEGRA30_MC_AFIW			49
+#define TEGRA30_MC_AVPCARM7W		50
+#define TEGRA30_MC_FDCDWR		51
+#define TEGRA30_MC_FDCDWR2		52
+#define TEGRA30_MC_HDAW			53
+#define TEGRA30_MC_HOST1XW		54
+#define TEGRA30_MC_ISPW			55
+#define TEGRA30_MC_MPCORELPW		56
+#define TEGRA30_MC_MPCOREW		57
+#define TEGRA30_MC_MPECSWR		58
+#define TEGRA30_MC_PPCSAHBDMAW		59
+#define TEGRA30_MC_PPCSAHBSLVW		60
+#define TEGRA30_MC_SATAW		61
+#define TEGRA30_MC_VDEBSEVW		62
+#define TEGRA30_MC_VDEDBGW		63
+#define TEGRA30_MC_VDEMBEW		64
+#define TEGRA30_MC_VDETPMW		65
+
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
