Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B5663B01
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F89010E553;
	Tue, 10 Jan 2023 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2321A10E096;
 Mon,  9 Jan 2023 23:16:30 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v25so15492336lfe.12;
 Mon, 09 Jan 2023 15:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ORCokxU5jx6cKMaaTper0S84yDtXOhtofp7KVmnXiA=;
 b=QdlzW40tyv/wOyAd0t/0Pkv5enmi1SZeXXuLb3sKU0MVWmGJHk9UuQG1SLoL7xhkdB
 AqABtKiqP1rzK18A6dnd0Pr1S8ChdG55n6ixEjrataQ3NhjrihGrh2S+hW4sPeWF5fPC
 lj0huOAVW51wYVP+tsGCov9pOr9HPNSfy5Tp5AMqejjkLs7w1M8/thZ0WdpFGHUfJtN1
 MvdhWu2jfRV/n0iEyLy/4spC1FRkhODF3U0FQD179eZVquhwRqDGbkefeStLYyEF3XNW
 d6DrohC+tHzhtOL0WV/JcPj1/H+7FMVUIoJRu7L0UU1T169OFV+uFO2wt0cNTjnrIBsF
 20KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ORCokxU5jx6cKMaaTper0S84yDtXOhtofp7KVmnXiA=;
 b=aCHrNe0PlU5MGYFLeo9/teh0wsxxKa13QdnwM4fj6bTdJXuG8/P9DsGHLNTv/XMu8X
 iQ782m6rQK0qJoceg/Eu/euasbPNtezmsdDy7BQuy1lc0JQS4nnLSZZhnNBPqET9Rivc
 eysa0Lrkosxj46rvLcovoUmjSBtx51akqsxIeKazxnrmLR52l/aZi2FJ7RshwuC970WU
 i8nkhFoP0bfXQJRuMB0NKOj2jwxRPELx/U+oXpPAd+H9/1afLyRKgA1oWh9//X8ncnA9
 2pLH3jCVFO4sp6esEtwbtwM3zMCpxoBJXYopP+q5FY0Zo3g0GMprw5PRGYzWjbnuoOnu
 KbzQ==
X-Gm-Message-State: AFqh2kp6+ORnHPst861rTT0DoyYV5lFtwaO+/NSTvnx/4RUWXNZ2D0+k
 knxrxXTx/ZhNh/SQPRzaqWpX4o5EN53rTg==
X-Google-Smtp-Source: AMrXdXsCbcTdDaTRpnUjGR5hQtLiFtCrpoRSWtrpxkgLsUUlzEWRhBdXsDzyLfrRwhHb4avnFJjojQ==
X-Received: by 2002:a05:6512:260a:b0:4cb:427:745c with SMTP id
 bt10-20020a056512260a00b004cb0427745cmr21625530lfb.33.1673306188877; 
 Mon, 09 Jan 2023 15:16:28 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s6-20020ac25fe6000000b004b6efcb7bb5sm1840277lfg.169.2023.01.09.15.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:16:28 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
References: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [PATCH v16 0/5] Add data-lanes and link-frequencies to dp_out
 endpoint
Message-Id: <167330408780.609993.2871958303249366717.b4-ty@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 27 Dec 2022 09:44:58 -0800, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (5):
>   arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>     endpoint
>   dt-bindings: msm/dp: add data-lanes and link-frequencies property
>   drm/msm/dp: parse data-lanes as property of dp_out endpoint
>   Add capability to parser and retrieve max DP link supported rate from
>        link-frequencies property of dp_out endpoint.
>   drm/msm/dp: add support of max dp link rate
> 
> [...]

Applied, thanks!

[2/5] dt-bindings: msm/dp: add data-lanes and link-frequencies property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/123f12555074
[3/5] drm/msm/dp: parse data-lanes as property of dp_out endpoint
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d25cfeeec064
[4/5] Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint.
      https://gitlab.freedesktop.org/lumag/msm/-/commit/381518a1677c
[5/5] drm/msm/dp: add support of max dp link rate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e7f270591a4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
