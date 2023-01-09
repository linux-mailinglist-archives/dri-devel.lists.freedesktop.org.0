Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403C663B05
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47EC10E55D;
	Tue, 10 Jan 2023 08:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0DD10E0CF;
 Mon,  9 Jan 2023 23:16:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bq39so15579868lfb.0;
 Mon, 09 Jan 2023 15:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
 b=Tuo/Gox1iTyeafNpXOZg0Z42lZIj8MiuNPQMOl7xakbXH1hJTRTDdDYfkhL1jo9rd1
 /tIr30oMAT+jy6zH8LvzdLHhtArGDY1k1MWGfDQXnNgzlfloUGnEdVe/AuLF5hMWoWQS
 Gq+6i/mwXjfFDZb8WRY7FUnq54Zr/S0t8aOdibGNFEXb4f0Rl7UhuvZ1tkPPkOk/wmkg
 Hu7psyHnHOFDXVHsFE00hIZDogkZoYqF0xEvxTJ26iFXmoTF5lzV7IJjgKITD4GGszRP
 HFQPhvHuWHS/dSZPAh2uEbMWMQ7JmoOGYaK2OWhpeOMt7fKzDeNQu9HpWqfvl5AdEJXl
 z85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TcrRX6H8xp5Sk/eiYa/8jSn58hXIIDs/40rFnvHatxM=;
 b=matYMxYYu7ioWjbllvQS9UnZHrbdZ0hw82qskpNm5AU8LV+beRu3+lD8+i5YKL87fU
 9e83ohjp+3Txow1mFXMHdI5w9hz8BUJoOY5LbkKSzXeIBkafNbfsQzH+WLKDlLRM9vNK
 F7mILC68m6r1q3MjJ/St/x5txfdClL6Q2yPDgecFa7RL8KezNG+W3N0Ypd03+avCkEaw
 sCjTjebc0MxTzwlpSEtrPM2Rc5NnwZC3FQhB7xHaZXhsx4+/1S/Rhf6Om6SWdCslhtGj
 hc0wYMxGTwBwzBLMlpJq86ULyHo2lw+HNB+sslUwYx+H2I/SWbgxqfyG0X3ccG2hUPMn
 PTJg==
X-Gm-Message-State: AFqh2kp2S/umaI9aDTKlAyx3HVenjEFwfKDY4vaeBcPpgmMgTTTPJDEO
 h8U2ba9DxqIHB38Gwov5U48=
X-Google-Smtp-Source: AMrXdXtQXEAnbQr/1v8NIUErWlyHAG56vSs4OyGVxT4mCFzLf8rCPDNeB+4HMUQoZzZxDe1tVJmqew==
X-Received: by 2002:ac2:53ab:0:b0:4cb:145d:c407 with SMTP id
 j11-20020ac253ab000000b004cb145dc407mr12469600lfh.7.1673306170521; 
 Mon, 09 Jan 2023 15:16:10 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c14-20020a05651221ae00b004cb003c3b2dsm1834230lft.175.2023.01.09.15.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:09 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 00/11] drm/msm: add support for SM8450
Message-Id: <167330408780.609993.1433336946810204585.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Jan 2023 08:28:50 +0000
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
