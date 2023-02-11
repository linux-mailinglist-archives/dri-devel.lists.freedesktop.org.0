Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845296934D7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443510E3D0;
	Sat, 11 Feb 2023 23:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5946010E3C6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dr8so23872994ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjQ2luO3DB+9WwMHeQDFbGx17AOSdwZYD4Wa7F57gZg=;
 b=C41KQCwzE9jkUvf/2FyTtIegB9vbMEEW7WPPlEUuhcsqfWpkvf6FsHfJYcnWJU7pDY
 QOA8222EHNSWSPFvrGcQBGNze3AVSDc3IQVglx6eXQ1G7urnq2EbgGGdOvk7pt38t4PG
 zCBZeQbV0PNdjj2whY5NlhJ4Z7coDyDXU4F9rW5VxUsBP9KckR2OEEQDEuaHzOrpmh2d
 7pgYoZbCsg7gsg+HWZREAlwaTO5Vid9PDDs31H/a/N68Ba5qU04NFX/pLUDJQSIV1xeH
 QB3i3JNwKwNI/F+Q+2qiEnmt2ez2Kb+b3qFPdV03qZmsAS+BMXjhNVcrUnTSl+42EWNy
 CxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjQ2luO3DB+9WwMHeQDFbGx17AOSdwZYD4Wa7F57gZg=;
 b=KDRM6UXsAwRQOsWsG+TKGdKxRaZYDpTOcwKyPBiv56XrP42KZtXE0S6SIjk9fLUgkh
 TGNAk7YxBQ9+zemSp93mqsbLZFxEGne3EpzjAzoqSlqj0lzJJJr8tXLb8yVJ37RTvocU
 nTJoGZnjlgVee7V/AcATz/YFj/Ll6u/omzpf9yeyWvQgqmvo2JsRZGieZa8tq9FVS7Eo
 0U4139sjjVOUw9w77nYNCKX9ABZpSSeQkWU/s7RCdHfybhBjWh8oNLrvwHwY4Y6AgyVY
 7OXyXDullPnbH8ITRpUGonD/NCSVozu6fMZNKawsDX/n9p0WH7UZMzynbfELh4EHEdxL
 hpUQ==
X-Gm-Message-State: AO0yUKUczD4d3jZYp6dSMjpkPQzJNl7UM3wbi2yGP3LiX63XCvAD5y2w
 A/4sxxeW5oTdZcaMZiaa+3qyQg==
X-Google-Smtp-Source: AK7set8V9CAzt5pfWmHVkPguemQENHK7B7i1ZlxK3RjiOM6ZttJ1M7g+8eERNLxlxzuGYIGYpclz2A==
X-Received: by 2002:a17:906:dd9:b0:884:3707:bd83 with SMTP id
 p25-20020a1709060dd900b008843707bd83mr17475021eji.69.1676157194934; 
 Sat, 11 Feb 2023 15:13:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 11/50] drm/msm/dpu: drop DPU_DIM_LAYER from
 MIXER_MSM8998_MASK
Date: Sun, 12 Feb 2023 01:12:20 +0200
Message-Id: <20230211231259.1308718-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm8998 doesn't seem to support DIM_LAYER, so drop it from
the supported features mask.

Fixes: 2d8a4edb672d ("drm/msm/dpu: use feature bit for LM combined alpha check")
Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a26ef7bb024..02bd8334d67c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -52,7 +52,7 @@
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
 #define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-- 
2.39.1

