Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662787DC80B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 09:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A800810E423;
	Tue, 31 Oct 2023 08:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E4810E420
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:19:44 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5a7b91faf40so51491467b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 01:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698740383; x=1699345183; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=78zyyhOvPbqFiviMdoByxBcrmsePwBi34jIz0gyHXvM=;
 b=Fj2M/IwnroGdUBhpRcya3AvobClaT7wvNty+AXhiffMlcHdy/JSSQhBvfJoKVKKnQa
 LVaRYL75XgEcATlCM8wUXDxFPNi/F2idZgkExEIri8+xyKIH2zOtxGdumJaTaVZXXnei
 0349GPVDeYIEzV9UUuXMfrDs8cMFdmjpuSu0OEwjzoBFJFbV3DxYjR4HE+bZ8ZGSggVA
 IiVvlLJnIlhklDiex0DCTTD6TD62qr0pU0p1Wi9ypFldqJaGJRp94PkA6zECdOnTbs4d
 yjJBZReFKyfqkiDk2BY6C9l98OVa2GWWQk5tEr5koVW03p3LgGgimUOpgpph0UiOMj2Q
 q+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698740383; x=1699345183;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78zyyhOvPbqFiviMdoByxBcrmsePwBi34jIz0gyHXvM=;
 b=nuBemepSvQMTYe6Lj7q3BFQ6dRH70C9RUyky/NFHHB38GV/m/0XGZDN6Wc8oBuLtsY
 JdKXDStcKOAgY0mKKF2X93lof5s3lg50kfbE1A4p/po5idHYpK266c9wloGIRE/DZfHx
 LhNWO6QK3jLry3HuvWPscy0pX65RlUQnBKdRfLAidopUh4uExjJcojsUowapC5VTlaBJ
 myxDaJCGWQLphyvxRaeDpSowXxb41LeumEzt3/Sqri4vZbfk/SMUfXe8N/emUewllItE
 7WhfQtKvbkwZUc/lcaYu8BSWLZmcYu+kZaVUTydcIflUsK5tRM2uAxZUoSFpsGpZfU4N
 GXfQ==
X-Gm-Message-State: AOJu0YzcD7bx4r0Ol18Q3sXvNqfwjPDn5vGCGg1xezaXEfuU43gJH3O3
 Og0746CgN2LAzcJbi+cfZitm
X-Google-Smtp-Source: AGHT+IHfHrgScUqqG+ilU65NVBGwpReFaZrWGtTlMbg3rSDabDCKMvqmWMYSRcTOVsok1aO8JSa1PA==
X-Received: by 2002:a81:e703:0:b0:5a4:db86:4ea8 with SMTP id
 x3-20020a81e703000000b005a4db864ea8mr10248096ywl.31.1698740383266; 
 Tue, 31 Oct 2023 01:19:43 -0700 (PDT)
Received: from thinkpad ([117.193.215.92]) by smtp.gmail.com with ESMTPSA id
 cs3-20020ad44c43000000b0066d15724feesm330713qvb.68.2023.10.31.01.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 01:19:42 -0700 (PDT)
Date: Tue, 31 Oct 2023 13:49:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
Message-ID: <20231031081931.GC11778@thinkpad>
References: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 04:23:20PM -0700, Bjorn Andersson wrote:
> During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
> typically take 1-2ms to complete. As expected this results in poor
> performance, something that has been mitigated by proposing running the
> iommu in non-strict mode (boot with iommu.strict=0).
> 
> This turns out to be related to the SAFE logic, and programming the QOS
> SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
> TLB sync time to below 10us, which means significant less time spent
> with interrupts disabled and a significant boost in throughput.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Cc: stable@vger.kernel.org
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 1ccd1edd693c..4c0528794e7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -406,6 +406,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
>  	.min_llcc_ib = 0,
>  	.min_dram_ib = 800000,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},

What does these values represent? And how SAFE is to override the default QoS
values?

I'm not too familiar with the MSM DRM driver, so please excuse my ignorance.

- Mani

>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc8180x_qos_linear),
>  		.entries = sc8180x_qos_linear
> 
> ---
> base-commit: c503e3eec382ac708ee7adf874add37b77c5d312
> change-id: 20231030-sc8280xp-dpu-safe-lut-9769027b8452
> 
> Best regards,
> -- 
> Bjorn Andersson <quic_bjorande@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
