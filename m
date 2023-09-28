Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC87B2224
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 18:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA9A10E692;
	Thu, 28 Sep 2023 16:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0154A10E68B;
 Thu, 28 Sep 2023 16:20:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5511FB81D31;
 Thu, 28 Sep 2023 16:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771B6C433C7;
 Thu, 28 Sep 2023 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695918038;
 bh=UlmHL2MYIeetXX5KGpkapFIPaVtMKWJwuBP9544pnao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGJH7sGHDCCRByzAB10xIGEEni1DnJfJy2JvFhPdHSIytggfSgwIFMzw9bFHfFTfZ
 2acZhEPPXXiQ+46eCnSpX2cZDBpQDKypnDVegs9fAqYb1uzr2kGSqYPlfaxX921rVR
 UlH6WJ5uYRmYqmn7ztkX11QD8N1OyxTviyZXgwIy/pJmDtnU1Ui8TtQSa0FA3mlRwt
 lRZWVmAHIvUkIfMi4QHMAJpXWAVrYrX1B1UmpCxJjBjrAeur7YijJgNphgVpx6rig1
 8EiDuD2cXyyhJ9FDvD7T/w+WGF3TSzwKeY2K2hpw/hhO3RnMXmnzFOcrI2GVfVdQFp
 MU4L8IRA+bXMw==
Received: (nullmailer pid 756683 invoked by uid 1000);
 Thu, 28 Sep 2023 16:20:33 -0000
Date: Thu, 28 Sep 2023 11:20:33 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: dsi-controller-main: add
 SDM670 compatible
Message-ID: <169591803268.756483.10293315880191956926.robh@kernel.org>
References: <20230925232625.846666-9-mailingradian@gmail.com>
 <20230925232625.846666-10-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232625.846666-10-mailingradian@gmail.com>
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


On Mon, 25 Sep 2023 19:26:28 -0400, Richard Acayan wrote:
> The SDM670 has DSI ports. Add the compatible for the controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

