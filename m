Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E5E45F1A4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6710B6F919;
	Fri, 26 Nov 2021 16:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8C36F900
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id l22so25476690lfg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=po9scD5dBEjtGuaNhMEfvHFzFtb9Ravcd9iJs0UTlhE=;
 b=LNs+LBfmYL28Sq2zZuiCUBRiBODtL+mQpFsAHjq8Zns4ntquqRmiplXDwyVYKjduMI
 FbBQ996hudy2zR49koSrDFj5aYM3xtC0Kaxo2GgTTTeV4X8BH7GgRhIO5Apf8tgxGpz5
 XRw/giTB4gdN0aG+rI4CRwgaLfu98u4su4XqHszD+O3lUkEvkdo569+5zMcgIaKLb0r8
 TljFdnnVI1/a484vxfGIIbtn/uWJJQUAu+Ia18aV2wmvt9mtp8dQICwELCUZ/8Zi2DoA
 x4yqLx6ME4DKZWXHShFuwEmDl8iY+XJ0LJkhqFrjdD6Hpqd3JGLbLBx54DyeuGa2R1Bq
 T9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=po9scD5dBEjtGuaNhMEfvHFzFtb9Ravcd9iJs0UTlhE=;
 b=6s/efpC7VexMQegU5CbAOzwMCsGUWqZLWUuRE0+tKDLgiS+kspFrHE6nBl9F4h9v8X
 xnMxF0xnKV4qf2VlX5/+SDAllxuNjfKqdPS/thwzcMy3+TlKSWCbjelpkVNoRdH1ifXt
 XJ539H2yXM6jcHrUf7E/fHpBSQ1n9cPDGM/BA2vH/m90hxGyFm9SXIv9WZ9Nxa9YRN/e
 Ajx9O1fiT8IRxkXKW3I+XO5FhvzhqbR1Ax9drKYAJeXzkDeSUaNQJIW1LXt0nULK3NUU
 lUJKemHwySeIFxrF11mVxJqb9ILbcOvunG8uthGjHXTypftugdGOJr8CuAkiraNFAT2A
 F/NA==
X-Gm-Message-State: AOAM532d77AVzHz4OKN8qRZFtq0ISKEDrWQGcD61gP7L+LU5+gMuHVNf
 E+K6LOZROy7LeN531TzHiw0=
X-Google-Smtp-Source: ABdhPJxYVWZExVjYtIGn+qzQ1ofRZlsbTingOF1DzMsidrhuUxsrKi22yVGR0OWGg5FMU/aNw7eVXQ==
X-Received: by 2002:ac2:5cd7:: with SMTP id f23mr30678322lfq.153.1637943581509; 
 Fri, 26 Nov 2021 08:19:41 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 03/20] ASoC: dt-bindings: tegra20-i2s: Document new nvidia,
 fixed-parent-rate property
Date: Fri, 26 Nov 2021 19:17:50 +0300
Message-Id: <20211126161807.15776-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

