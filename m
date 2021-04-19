Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6523363C8D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B376E1DE;
	Mon, 19 Apr 2021 07:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FF96E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:33:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y204so16184509wmg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zU2109fDte5QzQTU6OiyUjXeLbUbmc0eLsamxuYgBY4=;
 b=cTal5zic1kcTdzov7ZwC91ZPKRclHTTOlDdHpITvaOaiXUTZfpJ+3usRyKlz6/agC5
 AsrsAN6JFILMF4jU8jK3D9UvjGqaDBxku6qGjZ5sM3hDAeEDN0MfRNp589yZWNrGddou
 FS/3UfSei41sfbcsKB3XSKApmzZSukPylSssmL4dYnIXYQbvppcL5sdbKqDCZ3mBwdHr
 +jNawe+GBs8uecyYHqLh99/F8gGZ3Aj2m0I9fvUklslVj4WxHMQc4eqZgVFkdSNlcY71
 twjMw+3UlmWlHXN/4Fye2Zkv2f43Nnrr9FvIgoko4jtZCKyEhxSD9l1fl9jZQguo3lxD
 cQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zU2109fDte5QzQTU6OiyUjXeLbUbmc0eLsamxuYgBY4=;
 b=JjwN5oJnE/CdilojfvX7zsg0PMsB/wx1G0HdW1Z4O/nK7OiSKiQ4GVV4ebblH9N78Z
 Y8SeXGwOnWJRc0WhCv4lds9YjVK7IXgV2QYYpqzIcJ54GjQyT6mTjgmfYYNM70H939rG
 AjPsh3ZeDsOJ8jxO4nMzKfSuL2dX+gm/ZBlYou2KnWavzooR5uUxGp37Xr5Kwi94TiAT
 YqHuAW3qHdb5Amvk3JBkiIuOpmeZRvyWdIACZFVL1fEL2DPmEDtA1WrsFhKtezj2hRVI
 KdMev6OxZHNEmpbuT3AQflzkw+TIsSWrm4cLWvNmwG5TZhotNrealN/bX6N+bwGbAk4C
 6ocg==
X-Gm-Message-State: AOAM530ZIYOasdshv+7iL0mr5XVTeS586QV5fPPND5e5kH6ZYxM/HD7s
 dEh6x1pAx9L00ydLc8B/BW5j9g==
X-Google-Smtp-Source: ABdhPJw3An0kM4uAq/WF0hpG90M8E13eTj8qTaoZc2EbHJ0InBjA6SPO6b4yv0Sqpk1BhQQ9B9DIdA==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr19954322wml.92.1618817578964; 
 Mon, 19 Apr 2021 00:32:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:32:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v3 0/5] mediatek: hdmi: add MT8167 configuration
Date: Mon, 19 Apr 2021 09:32:39 +0200
Message-Id: <20210419073244.2678688-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes.

To achieve this:
- switch the mediatek HDMI bindings to YAML
- add the MT8167 compatible
- add a boolean to discard the non-CEA modes
- add a value to specify mac TMDS supported clock
- add a conf entry for the MT8167 compatible

Changes since v4:
- fixed bindings

Neil Armstrong (5):
  dt-bindings: display: mediatek,hdmi: Convert to use graph schema
  dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
  gpu/drm: mediatek: hdmi: add check for CEA modes only
  gpu/drm: mediatek: hdmi: add optional limit on maximal HDMI mode clock
  gpu/drm: mediatek: hdmi: add MT8167 configuration

 .../display/mediatek/mediatek,cec.yaml        |  52 +++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml   |  58 ++++++++
 .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
 .../display/mediatek/mediatek,hdmi.yaml       | 133 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  17 +++
 5 files changed, 260 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
