Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420FF6CCD79
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1564A10EA0D;
	Tue, 28 Mar 2023 22:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7EA10E9EB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:09 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id by8so14148856ljb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=almqnIe5p6SPPcYPWjwjdUaws42iWdaybkLQMuaM2c4=;
 b=VNvj+Qt3Niw8C2Q2DzWedzPgUMVj4XaaPMHGKRYb33rIsm8yYIcESVqAoxf2QIFK09
 9w1BUy+nCK6RGxWxbN9c9zG+TShXJzNdQYj1Xjhy7KWnlqBBc9t7S1e8MeUx+H8p46zr
 8cGHes9OWTMlsNrVlTfwQyKCKLEn1k4C7nzWpWahTIJWrzZ4IyZzzD4LC0rixel4zZis
 A6hA1aFYygBaYGIKMc3oZ9iA+3QcFkolsE/G5KYZtTsRBFakZi8kq4EXNvZNXm6G1Iqd
 Cg0x34S43hqvGr7xhvI/gsnDXnBSYO4XsQ0uRJzitIxN8BJOGrmAHLiTh5twmCiJ9Zws
 mxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=almqnIe5p6SPPcYPWjwjdUaws42iWdaybkLQMuaM2c4=;
 b=Gp2HuuqdFYtzFLogFnw23Z1L5tHduCK5z2Y9A/UPp8/RZSU6mrdHmzTvLVtl2k/+Uh
 AUd2r8KcQBCRxs2xwTBK37XCDmyctEdXv3/ssJTgrWfPiLSYSljIntpQz0ToXkC73loY
 5MWex2euZz01Z1zkHajhjxRH7b76dUyl4lDmxmhOMg1o6Tj5Odp8wpDl+en2oxUcSVfo
 JXFSuQZDvZFzIj5cqniRzTk2cG+yO5I1QXLDP6r3BrkE0JEVZN7y1dV2Y6qdkpec2fPl
 ISZWHGnYkVCTyhY4XRH35jhaQH6WVlkII1Ih94UM9mmWQhy37Tiq7aZEKBP3EZo4xfoJ
 X1sg==
X-Gm-Message-State: AAQBX9cF7nsQequJceqHKomFaDTYOfhbKXz5Ux9mTPqpMosBnYCqdJMj
 VHChakA7Gd/DNDc2LzIpC62gPg==
X-Google-Smtp-Source: AKy350bJ5wG2PH5jR8pdssprervPgKgRwh9MztjWz+AdpebFRNw2/UCcujsqqC7VgiMDtHSxtqWQqA==
X-Received: by 2002:a2e:b0f3:0:b0:2a0:8d5b:95c with SMTP id
 h19-20020a2eb0f3000000b002a08d5b095cmr5700934ljl.34.1680043087967; 
 Tue, 28 Mar 2023 15:38:07 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 0/9] Fix DSI host idx detection on HW revision clash
Date: Wed, 29 Mar 2023 01:37:52 +0300
Message-Id: <168004255466.1060915.2598614689172044596.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 18 Mar 2023 14:42:46 +0100, Konrad Dybcio wrote:
> v5 -> v6:
> - Squash both fixes that concerned the deprecated QCM2290 compatible to
>   avoid warnings
> 
> v5: https://lore.kernel.org/r/20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org
> 
> v4 -> v5:
> - Drop superfluous items: level in [8/10]
> - Remove the header define for the qcm2290 config in [6/10] instead of
>   [7/10]
> - Pick up tags
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/236502012d47
[2/9] drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
      https://gitlab.freedesktop.org/lumag/msm/-/commit/607ce0e9d462
[3/9] drm/msm/dsi: Fix DSI index detection when version clash occurs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2e6105fe7570
[4/9] drm/msm/dsi: dsi_cfg: Deduplicate identical structs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/41301c6d5e5d
[5/9] drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/38ba402f807d
[6/9] drm/msm/dsi: Switch the QCM2290-specific compatible to index autodetection
      https://gitlab.freedesktop.org/lumag/msm/-/commit/34f84fcf81c8
[7/9] drm/msm/dsi: Remove custom DSI config handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ff280b6cc5ef
[8/9] dt-bindings: display/msm: dsi-controller-main: Add SM6115
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c7baf742a07b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
