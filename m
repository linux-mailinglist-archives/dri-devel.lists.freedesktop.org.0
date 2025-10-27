Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00583C0F914
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6371E10E14F;
	Mon, 27 Oct 2025 17:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCiqRJDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7C310E160;
 Mon, 27 Oct 2025 17:14:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5A21440DA;
 Mon, 27 Oct 2025 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB6DC4CEF1;
 Mon, 27 Oct 2025 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761585260;
 bh=riL/1ZLw+rZSAzmG3LWiquvYVubXh4lPo2gMuGTnZhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCiqRJDA+4na9AVF0xFYjv6wnEWRHoQPE+dft2faZhJ63T6bpbH3T7/P7P2CP1ptH
 ibAvGV3SZKL2+jereFKam6Uhk+MeqCT54fH5vgyTDRnHVPH8sOAhMI8VrotdngPsQ8
 MmasD/CkXAAIEh0BPlq8efTYyN398eGNq/1gxjQ6koLjidYgy5GwE8PkVyFXdPLvC6
 UnJjQUOnVJurn1sRi3mWnnyI+4x42aiWa5+no/2eStIhgZNbgVaO2t3xPFh5iVPkkc
 aFpMszJ1c+sf/S0kFumGn4PI3EFNRKgx2+QtplTloxwFflMZF6LPCIfzSSMwCwvsil
 d6hOlrNPl3CHQ==
Date: Mon, 27 Oct 2025 12:17:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <ump2gq7hta5dzul7bwjmb45dtrxezkbticdwis7opl2drmnuyz@wwlanncd6xlb>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
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

On Mon, Oct 27, 2025 at 02:29:01PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > Describe the Universal Bandwidth Compression (UBWC) configuration
> > for the new Glymur platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> 
> Bjorn, do you indent to pick up this patch on your own or would you ack
> merging it through the drm/msm tree?
> 

As there's no dependencies between the trees, I can pick these through
the qcom tree now.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry
