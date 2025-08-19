Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E2CB2BB3B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 09:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7288010E541;
	Tue, 19 Aug 2025 07:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ws5mb4QT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E09F10E011;
 Tue, 19 Aug 2025 07:58:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64E2461426;
 Tue, 19 Aug 2025 07:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EBDC4CEF1;
 Tue, 19 Aug 2025 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755590308;
 bh=G3uxvRv13sqb1tePSwKOSqzaqCwgAvdUkA4VrLkckcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ws5mb4QTOFCKUadhwwChJaKyIXo9z+Nkv/tNoEHUm8TkN9MieGtxMRfqnyNHJqlW7
 6dKx4z/zUyfbf6LGXPXrv0MZHUt9luQrKfYmCmA72pGqehpcmvCvEjZtR4EeD3kPgU
 uL0EY2L/bHr8VvWiNxifut0VFeq1FUV1SpZWdYNlJiDQsUYQwJiTONxakYgc++3dPe
 8omKhHUx0U6kpH0KKjl3984ZuKdz2aAl0Jlw8s8ZeZWAoI8iEAmGXbd/u7cLORf04W
 1TI04JJ/28+6uKofmVecg0OaHDh4/GAbos7LeU22gE6rWLQ6HpmGbyRIWGXTDvJsuo
 IuNm+aPPdlqHA==
Date: Tue, 19 Aug 2025 09:58:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 19, 2025 at 11:33:29AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.

I don't think last sentence is true. Where in current code SM8650 is
used as fallback?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp

...here not.

>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp

Best regards,
Krzysztof

