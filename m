Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557A905A18
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 19:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C310E06D;
	Wed, 12 Jun 2024 17:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rsEIbaL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24DC10E06D;
 Wed, 12 Jun 2024 17:44:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B210A614FD;
 Wed, 12 Jun 2024 17:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9837C116B1;
 Wed, 12 Jun 2024 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718214262;
 bh=X/W4+RBIDg73ZY+dLTQoYPcN2GOZNe5RdPBV8OPN5i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsEIbaL3TaGu65Vzwpc66Y55Cq6oFPsp5UqG5dLb/0hshXQYvgusTLkQ7B6NSvpIg
 nYSv7fo28HcBka3HtEql7X9qdOPUeFx0zCaNSBux12UwWGJ2JFIMA82+y/c92vxHwt
 /v6gnBr3KgFXofosdzL7jADZP7qsOfjTUKiOx/J0sg8PgrkrMzn0kLuYz0qV5sOFOw
 QJxkIPIwYg5HWFc9l8kghshlwxcspdZIaG17nWh6fuYjSjP3wiaGV36AaZLCseFylY
 Jv0oQfJUxUVfFipFXezBeuBnrHKSe7wUkK4XYqvcEHAHaHigFoIKymKxuSsMXIvsF3
 yq7YDwZg+vs5A==
Date: Wed, 12 Jun 2024 23:14:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-phy-8998
Message-ID: <ZmnecsZrtNoggI3X@matsya>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-1-9d7feb6d3647@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-1-9d7feb6d3647@freebox.fr>
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

On 06-06-24, 18:07, Marc Gonzalez wrote:
> HDMI PHY block embedded in the APQ8098.

Why is the patch titled display/msm, this is phy patch and it should be
tagged as such..

Pls update

> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index 83fe4b39b56f4..78607ee3e2e84 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,hdmi-phy-8996
> +      - qcom,hdmi-phy-8998
>  
>    reg:
>      maxItems: 6
> 
> -- 
> 2.34.1

-- 
~Vinod
