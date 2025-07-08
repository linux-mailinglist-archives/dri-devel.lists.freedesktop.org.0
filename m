Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657F9AFD511
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517210E6B5;
	Tue,  8 Jul 2025 17:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vHK9ixeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAE210E6B5;
 Tue,  8 Jul 2025 17:17:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0E682A5419E;
 Tue,  8 Jul 2025 17:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C9CC4CEED;
 Tue,  8 Jul 2025 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751995042;
 bh=dSu5wIS6tm9QkrChGU5NIlGU7yzj01Kywd286nRJenE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vHK9ixeBKJBgnlRJB3/c8/1g049h9diOfGHLh/knNOQHY/jzGTT9v5eXHYdVa1wBw
 Y+Ymw35IdCF+bZ+9TX2yUf3yOmBNzvQ4tp8zXbMD2OFRocpQJ84sNvzEyjlYmvMfIz
 nfEbJLzqHyoW5DCaX9kXQSQUOLZGLVElFh5jGnlPcd+LzfKotIRtxOv8k2WmUl4mNG
 rfMECk1PhXLw6D9tpj3ogWcKLzdLiKDEvOg63MbGdf4oRh9YlduHwcuPJ+JASYjSQ+
 FJVDOHH6ZBp0WdiG9QVLDj/tusMaVbmSLUMKTXhh3irxJ+IIbRg635wTYXOdFH8YIi
 ZHw1ZqSJu2T8g==
Date: Tue, 8 Jul 2025 12:17:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: describe DPU on SC8180X
Message-ID: <175199504085.650526.5518508910045730007.robh@kernel.org>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-2-e978e4e73e14@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-mdss-schema-v1-2-e978e4e73e14@oss.qualcomm.com>
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


On Fri, 04 Jul 2025 19:31:54 +0300, Dmitry Baryshkov wrote:
> Describe the Display Processing Unit (DPU) as present on the SC8180X
> platform.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

