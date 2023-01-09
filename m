Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86D66358D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EBF10E514;
	Mon,  9 Jan 2023 23:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5867D10E0CF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bp15so15588904lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
 b=aE29FKyw5VCyplJZ49sN/3CBFWPpzJj1UQcRh3OdBbnwYcRX1MVJzAezhrX9uPburb
 NrT8IItYs5o+i8FXVRtBKRZ3iaX+cMMmSnz7IEG2eLdnuT58a6ZgXUnCrH/u5Hb1xwIE
 uZpNLvWO6BvirybeAc9jHxQEd+koXpbfsnn+b5cn2MyZausk34LTCgj+FKuBP/MW0ozR
 PJewvdRuhXZrQsmbKu/SlKlTaIoKTuXnQpuif8GVrojSZ0G9pdcEtPG9/FENp944sgVP
 Aqy2jWC9svZ8R4yW+CWyDqbmTt9IOSWFRuSTmdHV3YRN/hdpoRZ0WOUf6wXcKtRb7k62
 U/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
 b=73C32zdDgc1URDJs7xS3gA2BsT7kmUUonxjbJ6lZnHgXc3IftRmRz86CwM6dYPk68X
 MoMAkF11MGSd5dA0/YIDdVyTxtkJ+ACiXcazDRN0QCYdgDJDFRaXoiN3elnN+VQ/fq1q
 PQMAqsRwnyldWIPeOzgXhwPJYxAmhqwPRazcFZ5RUSUp7sLSpolaubGiwtX2SmjkiVD0
 YzW3skNcIXT1CMhOenF96Z03bg9hwK3NKqjvIJiwahE6S2nnJihIwnTPud9tpeIPswQP
 91y21Kc9gIg7CgD8+xWgylLgQUbIAlRwjKZ8sNxjD+tsN3BobvrFYGxgkqp/AEoPeW8Q
 PSZw==
X-Gm-Message-State: AFqh2kpgveDMamWKBK4kE6S10wfMoxTNTettgcC2mUI8CpgnURkip08x
 Ky+V8YFyLTyreJQMdZtPDyTdUg==
X-Google-Smtp-Source: AMrXdXvRa4ih3Ean3iUpIuLKGXimMy+4FurohIrwM63ewZc0Y5M+Xq9gtZvCqUBtV9qLWZ4cKirbYA==
X-Received: by 2002:a05:6512:2624:b0:4b4:a224:96e with SMTP id
 bt36-20020a056512262400b004b4a224096emr19681654lfb.50.1673307842662; 
 Mon, 09 Jan 2023 15:44:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 00/11] drm/msm: add support for SM8450
Date: Tue, 10 Jan 2023 01:43:46 +0200
Message-Id: <167330408780.609993.1433336946810204585.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Dec 2022 03:22:20 +0200, Dmitry Baryshkov wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.
> 
> Change since v5:
> - Added defines to be used for the MDP_PERIPH_TOP0 blackhole
> 
> Change since v4:
> - Fixed commit messages for the first two patches (Krzysztof)
> - Dropped clock-names requirement patch
> - Removed clock-names from qcom,sm8450-mdss.yaml schema
> - Fixed the schema changes lost between v3 and v4 (thanks Krzysztof)
> - Added kernel doc for DPU_MDP_PERIPH_0_REMOVED (Abhinav)
> - Fixed build issue in dpu_kms_mdp_snapshot() (Niel)
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: display/msm: *dpu.yaml: split required properties clauses
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0f87fc933e0c
[02/11] dt-bindings: display/msm: *mdss.yaml: split required properties clauses
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e96150a6dc14
[03/11] dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
        https://gitlab.freedesktop.org/lumag/msm/-/commit/44a9f577a087
[04/11] dt-bindings: display/msm: add support for the display on SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f7463946c281
[05/11] drm/msm/dsi/phy: rework register setting for 7nm PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1a1bd3f45000
[06/11] drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e50c901f93e0
[07/11] drm/msm/dsi: add support for DSI 2.6.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1b55304af89c
[08/11] drm/msm/dpu: merge all MDP TOP registers to dpu_hwio.h
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3bb86d2c6cba
[09/11] drm/msm/dpu: add support for MDP_TOP blackhole
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ae7459d07d8a
[10/11] drm/msm/dpu: add support for SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8cbbc3396065
[11/11] drm/msm: mdss add support for SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4d285825f1b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
