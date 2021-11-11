Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784844DE00
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651D16E23B;
	Thu, 11 Nov 2021 22:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48A889F73;
 Thu, 11 Nov 2021 22:56:46 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id n8so6944517plf.4;
 Thu, 11 Nov 2021 14:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Us4tGKVuy84GQN/3zBQwXhskHA7JZIC6EUBgOL1w6LM=;
 b=efuXP0kyqAYesmA+FSLFpubdX/c6qq23Hf/aM+tpQqgSbfL2LWu3oA3620a6/Rg3ki
 WS54KTtFwQNDIkkghAWVKXrI5t3WxV6Op1bamA57H3Qs8toELsakj+F6yFh6ofKgNrTR
 mRp5dQOF8h6b2+Zt72msBfW/43H+6WR1ZaVew4Elq6DTuvtuG/KWTvgz3u8kjG4HgjOE
 UGx51XrMP5mV/yzkQcxWGQJA+HqFguzlYauCcl5fi2Yy37uppUGSfkfFtVmtC9K0ap2n
 P8geBzbGT/teHyVtFYpfyv6ZdsycGViqVkcxc74VI9oPbyZ968Wf92ch6HiuIW11EVMS
 gfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Us4tGKVuy84GQN/3zBQwXhskHA7JZIC6EUBgOL1w6LM=;
 b=UOzb73aA8trjBuEFT/8XyBXe4gv/XGS6da8btJzKPtYKkzWWOuljD0GW8d5khtWlhO
 UbGwuJKtk2SjqxkhMD36ZY7nkJ9x8vyPetrsJ5d3cOko6JLuynoKWRCAIHQrd9AtGPyq
 5gDfnWuClwFDNnV41POEhiXD8kMmsDXBbTsZwQSML37qhKmFtuEqlCimitZR5T507eLo
 RJTLT/OFm61ROh6YB6EcKGz7PMGsnMbo75a3SjbCGnHYzGpCJ2Xq2xexVvlGdkikx+iy
 wFxJoAyhq9sEVM6JBvRPOdM2R3Fh+YCktRaR8PjDn8696hM/si20bCwZRRGPjTZa8zk8
 bJ9A==
X-Gm-Message-State: AOAM531oeZD5GI4gEnmy7KFbu0cbHuK9e6wN2zI08ToSirNuibKi5IeO
 2/NuFeujjIDpt3xwnW5SpXZTby56PZY=
X-Google-Smtp-Source: ABdhPJxzLoUDpGbeEKgMeFQIidYBUmjLSz1CcxOTtPlDb8kswpEAqycoskD1Agwh8sdTasjwF0AJDg==
X-Received: by 2002:a17:902:9888:b0:142:8731:4b55 with SMTP id
 s8-20020a170902988800b0014287314b55mr2988189plp.51.1636671405481; 
 Thu, 11 Nov 2021 14:56:45 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 4sm3047418pgj.63.2021.11.11.14.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:56:44 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Make a6xx_gpu_set_freq() static
Date: Thu, 11 Nov 2021 15:01:49 -0800
Message-Id: <20211111230151.765228-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, kernel test robot <lkp@intel.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8a2af3a27e33..dcde5eff931d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1641,7 +1641,7 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
-void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
+static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-- 
2.31.1

