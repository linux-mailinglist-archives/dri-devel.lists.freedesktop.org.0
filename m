Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982BEB3955C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 09:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BB410E6BA;
	Thu, 28 Aug 2025 07:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pFmOV0HX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F9610E6C8;
 Thu, 28 Aug 2025 07:37:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E78F601FC;
 Thu, 28 Aug 2025 07:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7312EC4CEEB;
 Thu, 28 Aug 2025 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756366672;
 bh=ypUAy8NWcIBt+dmd+5qONQkZWcuP0uYcJ+1JecEEurg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFmOV0HXtE9bk1DeT5Zjf6xKCscjuFmRqQR9wY0w7KGhL2czwCMdSN4ckwx2Yo/wD
 dou9jJcMq8/ky5FZv0HRuO1M/5a4n45j/sccokcHmlbCD4y85Vq7fBFuTr8VQAQBlI
 VRavAe20vsQ6TtOdz3sr/B+P+/U74obzJZbOLfpTNesz4q+eVOVoJlYPDjI8qwEUrN
 ZxkTaR2PVNKd3eVCsRvP3dApr6wRJRJ1kB16Pyg+pHNxr1pnsY5HgK12mj4a3//oF5
 2sm0kqk1gaEwZ9STjOdoUCu9mBleeyEaTgOrtnd+aG4xKC2nIYTD1a+YaWwqgwWa1Y
 hdPvNeBMACj7Q==
Date: Thu, 28 Aug 2025 09:37:50 +0200
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
Subject: Re: [PATCH v9 3/6] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <20250828-glossy-pheasant-of-energy-bae4dd@kuoka>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
 <20250825-qcs8300_mdss-v9-3-ebda1de80ca0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825-qcs8300_mdss-v9-3-ebda1de80ca0@oss.qualcomm.com>
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

On Mon, Aug 25, 2025 at 11:34:22AM +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 282 +++++++++++++++++++++
>  1 file changed, 282 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

