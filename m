Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19A81BFE1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 22:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA8610E6F9;
	Thu, 21 Dec 2023 21:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59E10E6EF;
 Thu, 21 Dec 2023 21:08:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7B544B81FF4;
 Thu, 21 Dec 2023 21:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DADC433C8;
 Thu, 21 Dec 2023 21:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703192897;
 bh=rWCnstf7VPSOkoEfMQP6U3T55hfbyUebaA/zKF3SW6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZZ7HE0KHCIPLUKI1EzXKui4xroGUa8k+MkxZf2om2cKxHYz8+4HQhzqMKEPXMx7gR
 huk2J7CH7sWq+E8lBkVWUcWMi1HhvHSzp9zPAgVX9/Mj8oVnzqKroY74U2Z+r9QAcs
 nPYwkVmMhPmRKICorGd/SsfCi7LZ8jNU4gLkWRtvSQR/qm4V4ZxGvSxFCPjd1Uh7Mt
 kvRwRm8Umq2pLP3JLIDBQeowsClO24mRsJ28B0UMY7H0TZ0UJjKuM11+Uwv1AkFB4r
 sQM6Qv+t07my4qnQlljljnbCZTglWmWLTkXWdGyUG9mWy9fwi8S2q+q8MYCMVDH0aZ
 y15MJFOds2NAA==
Received: (nullmailer pid 96522 invoked by uid 1000);
 Thu, 21 Dec 2023 21:08:15 -0000
Date: Thu, 21 Dec 2023 15:08:15 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 2/2] dt-bindings: display: msm: mass-rename files
Message-ID: <170319289437.96441.9965499072649831420.robh@kernel.org>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
 <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Aiqun Yu <quic_aiquny@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 21 Dec 2023 12:25:06 +0200, Dmitry Baryshkov wrote:
> Rename the Qualcomm MSM Display schemas to follow the main compatible
> string instead of just using the block type. This follows the
> established practice for YAML file names.
> 
> Cc: Aiqun Yu (Maria) <quic_aiquny@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}     | 2 +-
>  .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}         | 2 +-
>  .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}       | 2 +-
>  .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}          | 2 +-
>  .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml}   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
>  rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
>  rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
>  rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
>  rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)
> 

Acked-by: Rob Herring <robh@kernel.org>

