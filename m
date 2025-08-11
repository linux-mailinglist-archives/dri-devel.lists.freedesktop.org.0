Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DAEB21460
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 20:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8B910E132;
	Mon, 11 Aug 2025 18:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AY6KtuB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421E10E044;
 Mon, 11 Aug 2025 18:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B982760051;
 Mon, 11 Aug 2025 18:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AD5C4CEED;
 Mon, 11 Aug 2025 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754937027;
 bh=ToeU378XNa7mcFjM8LmFCjP4twLYSzkkMioVIdczQs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AY6KtuB04J369OsmZY5WPLLMHlWxEKtMRYDNHKEnd69l2I5cg7SmoWrcxrGAViOEq
 YqI0agLeXYlF3Vmd7NeIr8m7C64aA2w/pNGvA+XRIEeTDGbVZjediEj9D/Ia3tujcf
 kMg5sGrj+B2PYD4KDGOVFPWa9PoP283rRMlIf8fu1111PhpuyGPenM2Vaaw/H8F/LD
 yX9Vfq2ZY9OPHCmHInwtoJC67o2teJIMv6QBO5ut5FI2i5DTKwNIru8AUKMRki/COv
 Y2ZE+WIMCX5yvK0Nq3Sl7ZV7pbEP8fjyWO0Ts2IwtEi2uC+TnVR7GwaVM3gMwLF/1W
 jxS6lDg0lU9sg==
Date: Mon, 11 Aug 2025 13:30:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, 
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
Subject: Re: [PATCH v6 5/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Message-ID: <aw6epwnox2shu6tb2btsgnewnhs7ifmur2o7fyuz7ucegtzl4u@57r7q35fxh3n>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-5-dbc17a8b86af@quicinc.com>
 <xfhxrzrzct6n25jtoaacptf2grd44gazfm7fkiyqlhq5bjqujz@bjvacutguagv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xfhxrzrzct6n25jtoaacptf2grd44gazfm7fkiyqlhq5bjqujz@bjvacutguagv>
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

On Wed, Aug 06, 2025 at 06:32:20AM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 06, 2025 at 11:16:49AM +0800, Yongxing Mou wrote:
> > The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
> > the SC8280XP as fallback for QCS8300 according to the specification.
> > 
> > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Bjorn, is there a chance that you'd ack merging this through the msm
> tree?

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> 
> -- 
> With best wishes
> Dmitry
