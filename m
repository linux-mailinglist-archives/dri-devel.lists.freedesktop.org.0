Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF552987F7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390B6E974;
	Mon, 26 Oct 2020 08:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA26E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:53 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a7so9392749lfk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/a3gv2AYUyxirfwrA7rzcTGHo2Zy7KgU1OVTj3xJww=;
 b=ObYcZgUx+SaP7LqHDAeEz2WRgz82BIoMe3e6Wy0p5n0geMQ8hPcVndGrFEpIFBaDl8
 DcS4JDNyy0GkN/f8wuZOa4COaTBYdmLeGomolgAPoUpN9Rr+Rpc4ERtZts5ZAdJKXg+v
 RpJtEtB9KAJMANMZYEpEUh5tbALJE3iQc4Y6l0CBpinPo+kqynxajGLn+H4VGEGDO2NC
 e2wAsYFKDhjgtAUCkF7eLtPZarSFb/fLj4eyLP+i0+d9VdRvHFFoGLL7jIhnF0KO/unY
 Nl91rWDlLeup58a5iD8/RDkPq7Z+Zrbt6NDF0WBdt5VcTgDEYkaThRKYh6v/QhfX5el6
 x1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/a3gv2AYUyxirfwrA7rzcTGHo2Zy7KgU1OVTj3xJww=;
 b=gLcX5pckefD4EN16tzbsu9mnfuidIjyuKMRKtYSteApjMAPJ7wC2/NCHLTM2zhaIlZ
 k2pQzThenCaL37NDNY4kwVndN8B+zPZltZoJep4Ywi/dk/uy2ZwXlQ88FgaMq6rd3FgY
 9vHUlkviII7fLlvWWKTa/wsbrmiAlZj/XnADfVPLgFnZ1VJNL5xTNacu860dzLQaBisC
 q61AYDYB8NXP0sBmgfLNvsqrGEkadBQtqS9my3vf/lwSb8Dp0dOBniofQGKwctVJW16r
 MsPWDD0FKR6JCLk+myBzzO+zToDelaqueWPURApcC0khZ3B0czLj4vBu22++5Br1Wv/d
 Bn8g==
X-Gm-Message-State: AOAM530HdiOhLGhh/irTAHdhjAGioXyMWTuahfmnYxT4KAWvnUC96n9X
 Il7Sh4m6riqw/pzU+0ANqM4=
X-Google-Smtp-Source: ABdhPJzkAQEflxUEUyIu+FDg08TzL0+YPQxbPHKvkiy04QyTo2AhWvcREt2iDMcDPG+nPZJAgQ96xA==
X-Received: by 2002:a19:8c07:: with SMTP id o7mr3834013lfd.525.1603664272272; 
 Sun, 25 Oct 2020 15:17:52 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:51 -0700 (PDT)
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
Subject: [PATCH v6 03/52] dt-bindings: memory: tegra20: emc: Correct registers
 range in example
Date: Mon, 26 Oct 2020 01:16:46 +0300
Message-Id: <20201025221735.3062-4-digetx@gmail.com>
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

There is superfluous zero in the registers base address and registers
size should be twice bigger.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index add95367640b..567cffd37f3f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -21,7 +21,7 @@ Example:
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
-		reg = <0x7000f4000 0x200>;
+		reg = <0x7000f400 0x400>;
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
