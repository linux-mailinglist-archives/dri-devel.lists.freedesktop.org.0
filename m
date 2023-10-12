Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780497C7136
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 17:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA79E10E4FF;
	Thu, 12 Oct 2023 15:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAB810E4FF;
 Thu, 12 Oct 2023 15:16:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4BE561E25;
 Thu, 12 Oct 2023 15:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5718FC433BB;
 Thu, 12 Oct 2023 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697123760;
 bh=CS9VF07gkeV9AwiwyzlAL6GHT7P51hY0vpXVw5KAhCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWh4zJpklxplOSn9C02a/hjA8K3FDeTWEEw+casdd7ipQTCi0UVGYh85MS5IP0tam
 S/UXs3WpP/Vq6Aj98gLmi9nQaQi00C3lP5rcfF3NAu60D8MwVKJFmSLP35cHYLwHQG
 43420c66qhUI3q9fWAPBk56uyBBzPO3TWpPTPPwHhVQhdQfQmeQ77NXunlKEk4RhFc
 Wt2+Sk7vZYdW2FEGUTZc3Pr1HUAg2+Q03i6VjjcK/wu7N3TvNgqvBa+V78OOHYRAVc
 aN1fcHO1ZI8KSg8srd1f7mMK8X8YN3E9boMUT0DMVQ/v/MUhTfl01Ehq3ZguMP58Om
 4Zhfg+3Nk6gAA==
Received: (nullmailer pid 689622 invoked by uid 1000);
 Thu, 12 Oct 2023 15:15:57 -0000
Date: Thu, 12 Oct 2023 10:15:57 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: display: msm: Add SDM670 MDSS
Message-ID: <169712375677.689486.15371215600805365343.robh@kernel.org>
References: <20231009233337.485054-8-mailingradian@gmail.com>
 <20231009233337.485054-11-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009233337.485054-11-mailingradian@gmail.com>
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
Cc: Ryan McCann <quic_rmccann@quicinc.com>, dri-devel@lists.freedesktop.org,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Oct 2023 19:33:41 -0400, Richard Acayan wrote:
> Add documentation for the SDM670 display subsystem, adapted from the
> SDM845 and SM6125 documentation.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../display/msm/qcom,sdm670-mdss.yaml         | 292 ++++++++++++++++++
>  1 file changed, 292 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

