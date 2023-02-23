Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93386A00CD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 02:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84C910E47F;
	Thu, 23 Feb 2023 01:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A98010EAC4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 01:47:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id w27so12515878lfu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 17:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mCGO18fFeWFx1/oqatAOPTvgztN8ex2StTWWkNQew7c=;
 b=UqcUrP62HrsiAt9Q6uCcF6e86j+YbcDvjBn5qnC2A5wInQidrtGebmp12w1PhJijsf
 eyyLLK+0Rm3o/ycFDsAVvXQrUhPkj2xMqrFkW7yEsYmVAlXyab1/4iezenzh/33xuY4f
 qO08D8OrbEZsTLr2Hi+HxZ++iooZdvz9tTCCMeCktzMRjEpCNl2lgAUFHcpQezwWShrh
 bFyLHOsPYMlgsJwEkMRMJKFpeZJSH9PBiPY4/O/dfUl66wOLOhAi0oLCpH6RUurVYfz0
 LBcVg7pdRIZT6JXurlxjAukXhHn9BDVoNUhMytj/JFr2dKZn5z9f7LzE4iEBt8ElWAJ4
 zC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCGO18fFeWFx1/oqatAOPTvgztN8ex2StTWWkNQew7c=;
 b=yU931Fykui/1tWoVu3awhNBtW5+eplLDSqAe2bvoiIg2KVi1PGx0q9fMwqfVSW4cVr
 xEwb7tmwaQYzpyfZ86VsYHAM7Xe59SVVI9prE/pm/Fugo1Ew8RrGRmnD+uuSzlwYoDrC
 8yKm4SHQD19ED1UF62yjpWrFqF8eF136M7ibSmXeV92WsxeiBgykdeBMYxGs9P6LZmdM
 V/+6RI3LSaRX2bSiT3JX2KCTIwQKFH8rF50dNyvMHI93ulIDgU0CnwfedAWzjiXLRgQ3
 E53GNDNPDcBx1FUOQ8rcQOEF0mcAKZdJM3rx6tp4p1Tp48ITvMDpuYdCwAJm5FlbIrfV
 nIxg==
X-Gm-Message-State: AO0yUKWbW527SF2zyZd3rE7z+fwwzDSPEp/VTCFN9ViW3l3L0h7y8UFB
 /YpBIaWanShXOuendJNfA4FzZrh4lgswG1Ud
X-Google-Smtp-Source: AK7set8xB6MQPyyJqTPpJqKVNCu8vdvqHdvsXstaNqRHFGhNsyhWgBlzm2zLSO/JTK2EEOF8sAaHlA==
X-Received: by 2002:a05:6512:3988:b0:4a4:68b7:deb7 with SMTP id
 j8-20020a056512398800b004a468b7deb7mr4160498lfu.19.1677116860797; 
 Wed, 22 Feb 2023 17:47:40 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 17:47:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 02:47:37 +0100
Subject: [PATCH v2 1/6] drm/msm/a2xx: Include perf counter reg values in
 XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v2-1-24ed24cd7358@linaro.org>
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=830;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mzjSUO+qHIiKaLiyXFVom/GoyNVpw37b+tvLzQHI5RY=;
 b=sOt90zAVghwEBEdFaBDhwOmr+WDEq6xWWtPbhadU8HLedLihLtGPgw3G+utNjj5nKzLKe9UXi7Sp
 /8dBYiuOABV7JJpxXdNZpynZqYX62ZFL3PLs9g7th7h4bt1MOJga
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a partial merge of [1], subject to be dropped if a header
update is executed.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21480/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx.xml.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx.xml.h b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
index afa6023346c4..b85fdc082bc1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
@@ -1060,6 +1060,12 @@ enum a2xx_mh_perfcnt_select {
 	AXI_TOTAL_READ_REQUEST_DATA_BEATS = 181,
 };
 
+enum perf_mode_cnt {
+	PERF_STATE_RESET = 0,
+	PERF_STATE_ENABLE = 1,
+	PERF_STATE_FREEZE = 2,
+};
+
 enum adreno_mmu_clnt_beh {
 	BEH_NEVR = 0,
 	BEH_TRAN_RNG = 1,

-- 
2.39.2

