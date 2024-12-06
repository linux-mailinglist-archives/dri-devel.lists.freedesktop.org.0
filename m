Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815369E6928
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5A710F036;
	Fri,  6 Dec 2024 08:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnkVhsjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5265010F036
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 08:41:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso2321872e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 00:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474478; x=1734079278; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=li5k7w3RncPwKsG06G6cusXPPrs5ee6rU92nmMBGwZA=;
 b=bnkVhsjZs826RO9H+2q6TQJoyk8uDvTYviFStd9aPGvyWUSPinxhzRyjlIQD+b8N3Y
 2sAycBvheYlvrlhQFNnGZPAMfR5JBbLUxepNAemRVumNd/XKECfqQLHKNt6K8+QcKrAj
 sY7DAZA9TfFH1jP2lN3zHJy8c1gbicFejnQklNGdRNBBUw40KvDOjC5/XUvHGe2la18h
 gRJ5QBicUhMNG0O9IwZY2bRh78vYJT+4fcl18mfxk7gE93wycaTN4Bekdo81P9mvmhYM
 QDD6YmbKHWYajbFqvx5/LH8h1OvgivUV0YgHv5yKBFLsHjazOS+TIo1+xpcYR04gRs1S
 z2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474478; x=1734079278;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=li5k7w3RncPwKsG06G6cusXPPrs5ee6rU92nmMBGwZA=;
 b=wcQMz0Q9UIKN5AaIfdNHgPCpFCVW1DMc9+MrVr6GemMJ0PAzqsWEtpyZphUNjGvroe
 BXl4Na+sBVsTjaRD3bmCT1rPv6HcpJS9d2TAnRzbIGFlUUrySMSTGw2z0lV2DqM+To0p
 0ynMXOsHM+xamifEBR3Sjrt+58Empce+kWlK0vUv7gSeJ5uAZE3i8Ok/PkH+dC2c05Rt
 1otYSVzvGdZor2wHPpZDxBq5hzF4IZ6UtczfwQc0RJqIBHE3Uu0oDjn5Bng/9YSeoQOF
 IQNzQT5+hn4i81LRv5A0IWYNdTHZ79PkIjJxxPhr0KMGJRFtB9Kb+gjqETJ8RvK7JZgE
 1cXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeWyRY9kV2JaCkZ9sLfpd4P0x7WN96PupRfz1FBapzSdOMxxP+2XxmkkjmF5UePjg3lS80S5Jber0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiuNsyAC7kmR7R9VoWYaL+eJqIDkwq7QDFUwfAwZBugrgNp5CC
 mfo8BFK7UISX7HWcz13E3pagDj0doT8TIyFfmDuPuqlVzJ1kAcICWJtsp6psp/o=
X-Gm-Gg: ASbGnct0bNaKOgefOHzfZgyEpKLP+dZMoirl0be9R7MWlINQ6ybqeTnMLA/dVu27z4c
 hXoUoe/ja+60ijn0o1aJH4Xbeznqyrdq64djfgvEHxLAbu8e13YnNGzFg8A2e3/yF7rPZo8kFhZ
 UgfmiUp07ncjJt4JzCrOoJhJxTDZxtjtjnAYc5l7itH16fAL4r55G8L5Z0quCzPaXGsyu3RRqdP
 QV/YgVr2pysq+aQI34ANAaOC9FAtf5MnRefsCRdO9gKIIbYUk7EfpPd6N+aem9fmRcGfFSTQ2c3
 VP7zLbL4AKCzm9VlCPp6cvNE3N8Ipg==
X-Google-Smtp-Source: AGHT+IFPNVHu/d8sk7Z9glpuRmqa30hf9B+0XHZ+yeGqInSbHjdmC0Dj+A9i/LiHl6Y+WoYcHtnQtA==
X-Received: by 2002:ac2:5e84:0:b0:53e:350a:72a5 with SMTP id
 2adb3069b0e04-53e350a7482mr349029e87.36.1733474478446; 
 Fri, 06 Dec 2024 00:41:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e372c9228sm26344e87.2.2024.12.06.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 00:41:17 -0800 (PST)
Date: Fri, 6 Dec 2024 10:41:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 03/45] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <4ttrd5nrl3flexsmlmlp2jdbht23lxsrkfuuma72nf5uknkehz@xpl3d3w4kjr3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:34PM -0800, Abhinav Kumar wrote:
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.

Neither subject nor commit message tell that this is limited to sa8775p
only. Please consider toggling all catalog files which are supposed to
handle MST.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..2509e28e3d6b582cd837c6aea167b3f4ad877383 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -375,7 +375,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_3", .id = INTF_3,
>  		.base = 0x37000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> @@ -393,7 +393,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_6", .id = INTF_6,
>  		.base = 0x3A000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> @@ -402,7 +402,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_7", .id = INTF_7,
>  		.base = 0x3b000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> @@ -411,7 +411,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  		.name = "intf_8", .id = INTF_8,
>  		.base = 0x3c000, .len = 0x280,
>  		.features = INTF_SC7280_MASK,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
>  		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
