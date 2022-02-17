Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839044BA991
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AB510E699;
	Thu, 17 Feb 2022 19:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C7510E699
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:20:03 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id k25so9593746ejp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBkEDduZe/ZtTx/BeXpyaFmCWzs5FU1gOArRkAKedR8=;
 b=F2l/oGi+nQlxVdFRVgd9XL/3yx9TBNcz/lvUkLI4NiGgnAC72OqzO+L4UoiGdRvgHu
 cnMMnRT7/s5jWe3fBZn0Za89tMRMrSjDICDSyHklppEePGJSC8hdEu/Xl3xH+8ufhjr/
 arc0fdg88bpU4MitbShf5l/q9GykPuvxc2TXoK6inXetdGtBBRosNnWaZCfmWxhLXGEy
 WsXjs5Eu31WEMXKrdyP8GW2LY52PYrcl6MDgs5qsoIsa5MiB342KKzSV30pT7JDrSGDr
 ZMiXESDpIQCMUr7jMJzHTDf8U7+eOB+vDA9JBYK09EOon0JNCRYaQUVjzrHFb0Z/AuVf
 JDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBkEDduZe/ZtTx/BeXpyaFmCWzs5FU1gOArRkAKedR8=;
 b=wT7/Y37/Cg2VWNI3hkf0LxQvWSL3QasiraGcDzr9jw+fwEy45lei3Z30oSpSAkIG7Z
 oMm+Ict0DhDbtCH3sdglfOINQBkLh6ef69yIdjXdlwZiMWYjt7tVsH1Y1rTrBhYcyc0M
 PMtXOP3lp8ePX0KY1SfRuQfyOhRvTqDZay7XnSYjrjlDbBYBJGk+J2dB+NDFzg7Amewg
 ViGytQShjQ3qUIlKnzDiogzluEXRBULSGEdEkNJW15nf4TD6WAj/0grNANByz6xay6GM
 lKqzZmxfPSwQdyXnk6Fig2WuAQBqB74YMinh4FcbnIEiW8esICoE1ovxfOcHkZQeNyVC
 3Ikg==
X-Gm-Message-State: AOAM530EQgoNr5w+W+pPJsHSiAoLpv0ru2YDUms5RjmyGxSEqnnHk01D
 wLJzBePiN6jx/h3XTOByOxQ=
X-Google-Smtp-Source: ABdhPJx2td4mgRhyrDK8SRXceTyvdHGUqU/xbOa3XaIh8uRA8i9MMIFMwijj//esg2sDsDHQLvGabA==
X-Received: by 2002:a17:906:2846:b0:6ce:21cd:5398 with SMTP id
 s6-20020a170906284600b006ce21cd5398mr3675591ejc.49.1645125601608; 
 Thu, 17 Feb 2022 11:20:01 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id bn15sm1481040ejb.93.2022.02.17.11.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:20:00 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 10/25] tegra: Include private.h in list of source
 files
Date: Thu, 17 Feb 2022 20:19:16 +0100
Message-Id: <20220217191931.2534836-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This makes sure that the proper dependencies are created and that the
file is distributed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tegra/meson.build b/tegra/meson.build
index 7585c8b5bf9d..53724d2107f5 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -20,7 +20,12 @@
 
 libdrm_tegra = library(
   'drm_tegra',
-  [files('tegra.c'), config_file],
+  [
+    files(
+      'private.h', 'tegra.c'
+    ),
+    config_file
+  ],
   include_directories : [inc_root, inc_drm],
   link_with : libdrm,
   dependencies : [dep_pthread_stubs, dep_atomic_ops],
-- 
2.35.1

