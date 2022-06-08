Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F85542FC8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6210FB06;
	Wed,  8 Jun 2022 12:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2248E10FAEE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s6so32855406lfo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywZDJVrp0n0IRRgem+yzlly0FGJg2gJ3lpMx4tNxzuM=;
 b=LhfKofCuo1hI/kyqKa7GESz/tFf5nTTEsRGD1drqYnsDSKTKl7mh7bjqOMVtcPzePR
 +d8NnY0Em/bybYJK+GfY61r9DoLU1p1HNrb26LJhZb1l4qzE/vnKh11DliTs98bndMU1
 pTsHLKiI5PEMWM67FRQLRzblAmmyzZ7aoHhFt1Lfd8j5V1ZF/t+2Bemio1dtTaYNeIoX
 p6bOhZqVZzeDQ823vnmjyZ4TjXq/nbxO5SulggVBKOmjpPW74XFxZj0H6smDQWLomNRx
 7y+etJlIb0WDVgJ8Zs0BMSERlp3ak1aDh258XRSZOhb3fsshb3khdppIYx3qEEv6fEQF
 +q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywZDJVrp0n0IRRgem+yzlly0FGJg2gJ3lpMx4tNxzuM=;
 b=aMYUy4lA+9HpxxPL9GVzDzDmY7PYAF44qKd7SrM6NTIijG2jeHObDMhdHUHc3WRgu/
 +39BKDICx4K+Cg7FcMWqjTJTcg/qG/22F2h0h/81sBNiJlOTXGVa44f9ezT3fp/ocI3B
 M3YN9R0HXLYHwkMvZ6i08EASAFoDElTB17s8MNbLs2hSwy9lvnQfGnWIWdkLMLmTmbjM
 GWVkb3iwPytmBgEssV4oi1ibwwa5plx1L7DJVDAQ3LAlbV9Ug/LuCaABNXD4sBS3bYwB
 g6OfN0iiaAtWaCUnL9nKwb7gsImOg2xsQqa0ikiJZAXNz/4XJhU3Rc4j8lNYvTgxbSO4
 dxgQ==
X-Gm-Message-State: AOAM5331o6zuav7SFowpTYaLdFWuRrsN9Q0KyiQqo9GgCP4pW60us0FF
 lu3oHyzVwE2SYtx4xQ+GICaMQw==
X-Google-Smtp-Source: ABdhPJz7tK93EXNnMP55322ciEx1xGXgkiQ6vvmmZXDmFnGwjAV/yE1fK6My8eJe0sLtueQUeBFgxg==
X-Received: by 2002:a19:a411:0:b0:478:f29b:e30e with SMTP id
 q17-20020a19a411000000b00478f29be30emr21631651lfc.334.1654690050658; 
 Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 05/12] drm/msm/hdmi: drop the hdmi-mux support
Date: Wed,  8 Jun 2022 15:07:16 +0300
Message-Id: <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the last (and only) in-kernel user of hdmi-mux regulator, drop it
from the HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..06b44b40ec09 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -358,7 +358,7 @@ static const char *hpd_reg_names_none[] = {};
 
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
-static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
+static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static struct hdmi_platform_config hdmi_tx_8960_config = {
-- 
2.35.1

