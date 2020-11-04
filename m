Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB72A78F9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9A06E9DD;
	Thu,  5 Nov 2020 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7559D89DB9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t13so23632917ljk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBTRolvU8VaL1YCS6g8sUoNhiFnnAzkyMcEZUpaHxEY=;
 b=Z3dfOO9Ea67OkV3Tijv2exUT2/K+vtzBmZ+Qq6hq+aUqPd2GsIld85fQT4TYOsJHdK
 2oHvop136sQLhZQmE3qBcPPDnS7rO2aUjQ9VEICgfr/nAoP5Xgno0Tf5ngbXHWiVC4IC
 PaLvpuCLguhxRDdZChNb/rfXoSPK3pvSgcIcF7rTzqp8WPv3nJtZ6Y7sXmV6y7iJpIRM
 YqEQ3gtyJJRkMJpy3rX+YTuSU5F+V2ci/heIYH0Kr99ihQPiicNqiAzHRccWwQGbD1eX
 fm+BH8Jr/YkmlVriAd9EUHq/aNgE9KUL4zXMOACUfJ5Lk7yWtXGQTCP/niLv1H6HZQn0
 W0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBTRolvU8VaL1YCS6g8sUoNhiFnnAzkyMcEZUpaHxEY=;
 b=HeOL4p7cA2fp9tjuPdRKVxeflJeoI3YjeXu9voyRg+mOasNCbA76BqbWuzraLCivbA
 5unlH/TUt9Bc5+1L7k8dq0fKQmu3Tx3EgfhGiGj7umaeWs155ijHO9BtX1FzIV/I+rWy
 x5gGWLA5TY/2GXFvXbZZL+kPyRbTLE7BT37+FeRdAko+Ur3sArsteWrGspPACswMH0Xl
 jrBhYy5i69AJh6quCZepTtdbyhCpmIrGBrptA80ykGSFVqOQqQbznpXV8FJCGppljkoJ
 zz/odYZ7WnIVILS3W8bmouIir40jrinsXyTfoSR9FCdwMf7EodOoLkzCengSHwG0IY43
 n+Ew==
X-Gm-Message-State: AOAM531iVaWn+zS75AGHtQICV3xFHQ4tEH73nQRTqVjIyPVGYuts3YOn
 P71wTDERIazZJ14q+zQrywA=
X-Google-Smtp-Source: ABdhPJzPhfeNNf/JRh3qD+lncCpacw7ow+jldI3XtQ0mIJlcrmMGEaMXoZJl/n41aHF5th0Rj3O0Mg==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr7699503ljj.297.1604508573970; 
 Wed, 04 Nov 2020 08:49:33 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:33 -0800 (PST)
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
Subject: [PATCH v7 03/47] soc/tegra: fuse: Add stub for tegra_sku_info
Date: Wed,  4 Nov 2020 19:48:39 +0300
Message-Id: <20201104164923.21238-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

Drivers that use tegra_sku_info and have COMPILE_TEST are failing to be
build due to the missing stub for tegra_sku_info, thus add the missing
stub.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/fuse.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index c702bd2911bc..78cbc787a4dc 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -56,7 +56,11 @@ u32 tegra_read_straps(void);
 u32 tegra_read_ram_code(void);
 int tegra_fuse_readl(unsigned long offset, u32 *value);
 
+#ifdef CONFIG_ARCH_TEGRA
 extern struct tegra_sku_info tegra_sku_info;
+#else
+static struct tegra_sku_info tegra_sku_info __maybe_unused;
+#endif
 
 struct device *tegra_soc_device_register(void);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
