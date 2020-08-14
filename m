Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67E245D16
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4BA6E49F;
	Mon, 17 Aug 2020 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D056EAC9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s9so3954433lfs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4lLacyvLIrYeiWmHP096187UyAJzTy3dGk3a3KhpUo=;
 b=hGDR6vm2K7Ni7PB/wQvgEm+hWlCQ7V1VblChEk2FsRHY33HSgz0GOr/37DuqkjHQ3m
 QcGsuw3aDAYr125LkoPZOVo7SGgujRYjGh6qdOzXFlq9I79pXKSq5rzWhKRnZRYwB/z/
 LyFyEhQCYfxJ0EqblpXmabXs8wQMN/aP6dBlTG/qDRNCxK+yOaJSHfJ5kpZUM4lT272w
 eAbvq7R+52o6PTQmUXUVZWGU0q0RlBpIxTerejceGr6Xeq4FJOstfaMFI1iVn6I91ECA
 ABgwMfsdC0GIKhT/CJbB0sbACQ5EqQ8aEjwKbTnBMwEcGQys6f0UZkyjeanaKHUqHIYg
 cQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4lLacyvLIrYeiWmHP096187UyAJzTy3dGk3a3KhpUo=;
 b=mUgHc0p/zrmcDMoZu9gGdzcatFtqVxLTDraGWb0Q3W00FPmb0DzW9o3mkFwd3MjTVz
 Oyjzi+op4jwROn7lNez5jcVOFU6zLHoOarcTXLRfPKoIAUZG3SX03mL6jJ35QZPBNc3h
 tVYOGWJSOMuLF2UMe7g4Q1Q+8BPw1+yt9Too9tazJqBr68FqOSuqlRgEfCqHsvRMupUG
 DGnlirpGFo4Ha5iIgbR8BCCmhEcT/N+VQGyBrYlXfJhPXUJ8cUZHH2JtJO0eKzQZ5kRv
 6SpUWmlr7qsB9XW8ds433/suHWoWsZYExQPtsMuj2TqHZ/k2bdrnCvK/HAKuPC1E7hYH
 7azw==
X-Gm-Message-State: AOAM530l2M75tr38lAuCwWbGkSheU9yZEuFTuLh6xnND4HI1UEc69BJJ
 TIf05Oztir/lUPvGOC3tLtc=
X-Google-Smtp-Source: ABdhPJwQ/H+7kNWVYOJxS2dTtm7hib9wkxtGTrvmCQhuP+jenbz3a5BR38399JHmIfCotGH0VsEhog==
X-Received: by 2002:a05:6512:1182:: with SMTP id
 g2mr3355986lfr.126.1597363646810; 
 Thu, 13 Aug 2020 17:07:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:26 -0700 (PDT)
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
Subject: [PATCH v5 23/36] dt-bindings: memory: tegra20: Add memory client IDs
Date: Fri, 14 Aug 2020 03:06:08 +0300
Message-Id: <20200814000621.8415-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

Acked-by: Rob Herring <robh@kernel.org>
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
