Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F774667EE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF116FB1A;
	Thu,  2 Dec 2021 16:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055D6FB11
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:20 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id p8so752816ljo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=BQwLoD5GsKuHwGcm9CCRNNoWfhuNnvmOM/2ZfVxwRSvlj+i9mrX6Mzj+ppnnqAI2rq
 E4tEwLGLm2ZnzLcmo7YCVVDjFY/vifIM4jmBBPiT9ZNPUUc6jzq+1MFNWnx+tx+iOPx1
 iCqsC/b3kAPfUNlk7ZZvnIGQb82xDqikIR2SFjicK1Bq8gRWRMpOORG1GxFsWkYuCL+4
 HshbFPgGDw1cizhpzuODlQc4P6wY2GQ3HLYY8tmbpgbAXrmgv4ynsB2RGnML4RhD0PEA
 hOOHxPmFfl9yyVqq1ELu6U0RJDWBjL6/FD8csHQz7n6CUkw0CaSpULEtIoeWnNSCiXy+
 A+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqYniy4pFRsXD92ySrc+ZxB/2v4IriL3y3/YUqS2PUE=;
 b=U6sf9K2M6pp2YXZ362hqo8xbDCeAbySJNbjnl3+MGhmrv0YwP5wwOwzul6wJg9N9hU
 3VZxRhv1rd0qUlXUrKZwXrSkI3ivICoRfx5W+3Ijb2nAnXGQhKR1YYMSQQIStZOrdPR6
 ZbCXCla44K8+lN9wHmOnpmx2nglMdc8muCoSjAkZkBxxBEDS8qvLXTz48hPsCLddzMXS
 1skDotZy1edQtfdcnI4A/Ry6PUXqkDLJyYzw9ifVcPHHVpVssqUW+EUxP5HYxvokN517
 sRqkB9kxlhKp1IpVyWKpQicAkpRA5Fh/ih+VBt/Yz4YLfkIlZzrkNkZDVtpULpGaB2SF
 BdIw==
X-Gm-Message-State: AOAM53204KV6kerH/AYPZkSBZqt+zA73JYE5fukulmmftUOm2zBbA+GN
 NK7tn7vYlXB3BXvSEtN8K3s=
X-Google-Smtp-Source: ABdhPJySugSp1rA4YrKTD7/t4BqlpGfdBZL4TlGHm+Feas4m0Bqsz3MGvtiX9EqaRmuZilIyrhztTA==
X-Received: by 2002:a2e:948:: with SMTP id 69mr12422486ljj.82.1638462318795;
 Thu, 02 Dec 2021 08:25:18 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Thu,  2 Dec 2021 19:23:24 +0300
Message-Id: <20211202162341.1791-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new nvidia,fixed-parent-rate property which instructs that this
board wants parent clock to stay at a fixed rate. It allows to prevent
conflicts between audio components that share same parent PLL. For
instance, this property allows to have HDMI audio, speaker and headphones
in the system playing audio simultaneously, which is a common pattern for
consumer devices.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index ad43b237d9af..68ae124eaf80 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -42,6 +42,13 @@ properties:
       - const: rx
       - const: tx
 
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.33.1

