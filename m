Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828ABEBF1E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 00:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D46C10E1C7;
	Fri, 17 Oct 2025 22:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJlv+3RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1BD10E15A;
 Fri, 17 Oct 2025 22:50:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E43445614;
 Fri, 17 Oct 2025 22:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354FFC4CEE7;
 Fri, 17 Oct 2025 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760741406;
 bh=LR9ow0WDk7nKg118rjVF5Bu2uA14Kqebz9VEjk6ZGFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pJlv+3RB4tOSA0/JVh8mq4dTGKdCNbnhiGr2lCi3sJ6z4JMsckJAscoDIaMTE5o9W
 sudrro1mgc/w7yKxfnyfJBvZVZIBKfmT69SChu0l/rvZRg4gX9mlM0NSdiafVL0sU2
 gCIdzPbRpgpXCo4U8BJD0rexVgQgpxoqItbP7s72hdbEwqx4C9y9/9K8ByeurWMo07
 CgJpExXBfUBhDoGreFSZ67gahULszKOZg6xl8WKV6+egnJFRYmqpw04LXkbN5fSVhC
 fqLsZjTJZGIWhZMbRmyaotuK77ffyox8K1O6h6O0eoj75lmNbbtGQoB1kGsOkvbPW3
 zVhPpZpUOh8tQ==
Date: Fri, 17 Oct 2025 15:51:58 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org, 
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 konradybcio@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, 
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch, alex.vinarskis@gmail.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_riteshk@quicnic.com,
 quic_amitsi@quicnic.com
Subject: Re: [PATCH 0/4] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Message-ID: <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
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

On Fri, Sep 26, 2025 at 02:29:52PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 
> ---
> The Devicetree patches are dependent on following patch:
> https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/

Include that patch in your series instead of relying on the community to
resolve your dependencies, please.

Regards,
Bjorn

> 
> Mani Chandana Ballary Kuntumalla (4):
>   drm/msm/dp: Update msm_dp_controller IDs for sa8775p
>   arm64: dts: qcom: lemans: add mdss1 displayPort device nodes
>   arm64: dts: qcom: lemans-ride: Enable dispcc1
>   arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
> 
>  .../boot/dts/qcom/lemans-ride-common.dtsi     |  84 ++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 245 ++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           |   4 +-
>  3 files changed, 331 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 
