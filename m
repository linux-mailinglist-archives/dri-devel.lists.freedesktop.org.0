Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8933D7B2247
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 18:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1410E693;
	Thu, 28 Sep 2023 16:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618D510E693;
 Thu, 28 Sep 2023 16:26:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 10CD3B81D77;
 Thu, 28 Sep 2023 16:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5FEC433C7;
 Thu, 28 Sep 2023 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695918381;
 bh=3YeoBmK77jwkAjttNPSPgV+qKPQsMz8vnZFqGk3ImLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZ56fdBgcURX00o1ZZmaGGdUnHUY6dKGvUSkcSKbUVjHScyxvqbPHU2YIHK1srHCL
 Eut7bPwZQGzF4GN6DFKZb0ufLBgDi8xQW+vTP8+J2O5Z0wM5htOA8W1BtZ7bMLSvsy
 k6hC3nfM2PgmSowlc2z1Z475cKLQL1l6tiBD2EnmcxNtf6fJQ9WA+mTaFLsovNTPIF
 uYhcVlU10SQZh9zcqO4xRYoYq1rXSxAPRvKVMJmfSAGJ9Y14UIZSC2ePtMKT5B7qWj
 /cDsqoV/d+3jeISLzu3lKvLNn7QLfsD5BPXL1X1OR1f5Fb2ltrwVq4+E/lp6dj+2q8
 IsX370NPzEvpQ==
Received: (nullmailer pid 811759 invoked by uid 1000);
 Thu, 28 Sep 2023 16:26:17 -0000
Date: Thu, 28 Sep 2023 11:26:17 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Message-ID: <169591837694.811719.16275751393760332189.robh@kernel.org>
References: <20230925232625.846666-9-mailingradian@gmail.com>
 <20230925232625.846666-11-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232625.846666-11-mailingradian@gmail.com>
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


On Mon, 25 Sep 2023 19:26:29 -0400, Richard Acayan wrote:
> The SDM670 display controller has the same requirements as the SDM845
> display controller, despite having distinct properties as described in
> the catalog. Add the compatible for SDM670 to the SDM845 controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

