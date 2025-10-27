Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815ABC0F836
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD7A10E518;
	Mon, 27 Oct 2025 17:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sROLKMoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31A610E520;
 Mon, 27 Oct 2025 17:02:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9124640C58;
 Mon, 27 Oct 2025 17:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F54EC4CEF1;
 Mon, 27 Oct 2025 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761584530;
 bh=aH66x+qi6wkGS5vlWmcbx+X2SNlXqg5IctaXAlPdLV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sROLKMoC+Cbth9uUgf8fowYWiC9iEhAnTvvWbcCBA35ZofYUNrFH/umMZ+XEsL74i
 yz2dSHQ7rHFb7P8HwAvMpdwmq0AuJHLdmddOyC2cQy3TRJ8BNgtYHs+vMXFFUnPiul
 UMJkDjOjmuMtTKIvNKAR82PKp2z6mzKeL/p5brB61B3+qI5Z+punIJQIoKIRm1QHms
 6K21l7qbO2zwDmwKhLHh3DKCwRqzauqUH6sfOWTDxMiaZ7D+U/tuu8uUFv73i9I7LB
 JFmK2fvPdGrA7Azj5MMKTqRhU4vOEIbCMd52eRd+BX687XqITCvDPxuMpNNjChv8pp
 f9tbifVHBK9lw==
Date: Mon, 27 Oct 2025 12:05:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_mahap@quicinc.com, 
 konradybcio@kernel.org, mani@kernel.org, James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org, 
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <wai7uqe6bn6kcfp3gmgqvc7sfrs37vmpqh6cucc7mopwf5x76j@vkxbwvqiqlyz>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>
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

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.

Perhaps the eDP ref clock was missed in the initial contribution,
perhaps it wasn't supposed to be described at the time, perhaps the
hardware changed...we can only speculate on the purpose of this patch...

You could change this however, by following
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
and start your commit message with an explanation of the problem you're
trying to solve...

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>

Please start using your oss.qualcomm.com 

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy
>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 
