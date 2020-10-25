Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03CA2987C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60CC6E844;
	Mon, 26 Oct 2020 08:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF406E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:11 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c141so9409578lfg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QJDI1YKx5QSO79cqeQ+l8imAvRTGc6dD75cCnK2GBU=;
 b=dyNZGIaN3X+RyJfWixvkhtBQPlv1jsOfRbqwYLHlTjd5eg4Vj+EApXjrzs8gRJsB5m
 s+ISVEVe2EdkGRqlA9XskBxkLihXIbgW/Y4zpK93ncBJL1TWvar/zN0uo73J4FmuiFrP
 VUO8sI/sovGKkHbLD28E03ZcNS0dRJyf5SPsXRhL8Sc2gqmOSVpQf9jS3O6Jf6k1lKZt
 jk/rIjGDd/EpmgR8TrYT06v+oTCDwBSKqUp1yP1agkVakdVZLrfN99EcKnb7o6W+ucb5
 WaBU1xBYEUbH4mhZvZ2iDWZikF3xrt6L0iifrUnxvqmO6ibbNROzjFbfRJahfD9EfPY/
 HQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QJDI1YKx5QSO79cqeQ+l8imAvRTGc6dD75cCnK2GBU=;
 b=kjhZ8DsBp2msrcRGcL1sB0nkOWybyUHVQBohsl/xM8K/Nlwch2Iu6dDnbNO+u+XBhu
 y/RL6hRSdLWtWQ02Q3cVu4z6iksv5XOCQUnRjWsvKqII1LYYIKyVLansBT5mj4sldBpk
 TdOR3V7zaMDY29+uLh2LRa1pOOtXTPt0prekS+vzc41KQ9fBXGd8kIT6u7SonTQ5pUoj
 aeHpEqEcCXwzy9fSaI6Irw3c7XCtb2gGHqC++/kbvcDqfOHI9Dxcf5uM9Rc0bhCxIGhq
 5dyvH460RAy39e4+dVCOmKf0Z1li4qgWbnogX8jxMgiyVsJx9thgTV4D6KixfiDqeSQA
 bfoA==
X-Gm-Message-State: AOAM530n4xQL+0PT6n9tL0eKQ92f/h2WcE5l+a0NagAyHq+F/VEwCg9Z
 H1IK+bokgp68KHxSfsglNxk=
X-Google-Smtp-Source: ABdhPJwj94f1hVwQbK03q7sPSybJ+AvCpZfXogTl2CGTVrgS2G/eeUdR980oPkgS75puKPBsDYn65w==
X-Received: by 2002:ac2:558b:: with SMTP id v11mr3792425lfg.416.1603664290263; 
 Sun, 25 Oct 2020 15:18:10 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:09 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 19/52] dt-bindings: memory: tegra124: Add memory client IDs
Date: Mon, 26 Oct 2020 01:17:02 +0300
Message-Id: <20201025221735.3062-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
 include/dt-bindings/memory/tegra124-mc.h | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/dt-bindings/memory/tegra124-mc.h b/include/dt-bindings/memory/tegra124-mc.h
index 186e6b7e9b35..7e73bb400eca 100644
--- a/include/dt-bindings/memory/tegra124-mc.h
+++ b/include/dt-bindings/memory/tegra124-mc.h
@@ -54,4 +54,72 @@
 #define TEGRA124_MC_RESET_ISP2B		22
 #define TEGRA124_MC_RESET_GPU		23
 
+#define TEGRA124_MC_PTCR		0
+#define TEGRA124_MC_DISPLAY0A		1
+#define TEGRA124_MC_DISPLAY0AB		2
+#define TEGRA124_MC_DISPLAY0B		3
+#define TEGRA124_MC_DISPLAY0BB		4
+#define TEGRA124_MC_DISPLAY0C		5
+#define TEGRA124_MC_DISPLAY0CB		6
+#define TEGRA124_MC_AFIR		14
+#define TEGRA124_MC_AVPCARM7R		15
+#define TEGRA124_MC_DISPLAYHC		16
+#define TEGRA124_MC_DISPLAYHCB		17
+#define TEGRA124_MC_HDAR		21
+#define TEGRA124_MC_HOST1XDMAR		22
+#define TEGRA124_MC_HOST1XR		23
+#define TEGRA124_MC_MSENCSRD		28
+#define TEGRA124_MC_PPCSAHBDMAR		29
+#define TEGRA124_MC_PPCSAHBSLVR		30
+#define TEGRA124_MC_SATAR		31
+#define TEGRA124_MC_VDEBSEVR		34
+#define TEGRA124_MC_VDEMBER		35
+#define TEGRA124_MC_VDEMCER		36
+#define TEGRA124_MC_VDETPER		37
+#define TEGRA124_MC_MPCORELPR		38
+#define TEGRA124_MC_MPCORER		39
+#define TEGRA124_MC_MSENCSWR		43
+#define TEGRA124_MC_AFIW		49
+#define TEGRA124_MC_AVPCARM7W		50
+#define TEGRA124_MC_HDAW		53
+#define TEGRA124_MC_HOST1XW		54
+#define TEGRA124_MC_MPCORELPW		56
+#define TEGRA124_MC_MPCOREW		57
+#define TEGRA124_MC_PPCSAHBDMAW		59
+#define TEGRA124_MC_PPCSAHBSLVW		60
+#define TEGRA124_MC_SATAW		61
+#define TEGRA124_MC_VDEBSEVW		62
+#define TEGRA124_MC_VDEDBGW		63
+#define TEGRA124_MC_VDEMBEW		64
+#define TEGRA124_MC_VDETPMW		65
+#define TEGRA124_MC_ISPRA		68
+#define TEGRA124_MC_ISPWA		70
+#define TEGRA124_MC_ISPWB		71
+#define TEGRA124_MC_XUSB_HOSTR		74
+#define TEGRA124_MC_XUSB_HOSTW		75
+#define TEGRA124_MC_XUSB_DEVR		76
+#define TEGRA124_MC_XUSB_DEVW		77
+#define TEGRA124_MC_ISPRAB		78
+#define TEGRA124_MC_ISPWAB		80
+#define TEGRA124_MC_ISPWBB		81
+#define TEGRA124_MC_TSECSRD		84
+#define TEGRA124_MC_TSECSWR		85
+#define TEGRA124_MC_A9AVPSCR		86
+#define TEGRA124_MC_A9AVPSCW		87
+#define TEGRA124_MC_GPUSRD		88
+#define TEGRA124_MC_GPUSWR		89
+#define TEGRA124_MC_DISPLAYT		90
+#define TEGRA124_MC_SDMMCRA		96
+#define TEGRA124_MC_SDMMCRAA		97
+#define TEGRA124_MC_SDMMCR		98
+#define TEGRA124_MC_SDMMCRAB		99
+#define TEGRA124_MC_SDMMCWA		100
+#define TEGRA124_MC_SDMMCWAA		101
+#define TEGRA124_MC_SDMMCW		102
+#define TEGRA124_MC_SDMMCWAB		103
+#define TEGRA124_MC_VICSRD		108
+#define TEGRA124_MC_VICSWR		109
+#define TEGRA124_MC_VIW			114
+#define TEGRA124_MC_DISPLAYD		115
+
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
