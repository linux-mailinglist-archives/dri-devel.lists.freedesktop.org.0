Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73494A17B83
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7865C10E539;
	Tue, 21 Jan 2025 10:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z0RQ6XUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4210E539
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:26:33 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30227c56b11so55019031fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737455192; x=1738059992; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H1nSBa8IUGU1nXN+b49dNchKcptNoPhFRCdZoshvrmc=;
 b=Z0RQ6XUcRNvqMk6fSONtCyC+AK/hALA9QnioH6ypRIj2gkM9uKDBkFf76YevAehmBZ
 ui0xzv16sbpGc1ECSMSxhOWy4fUKLTshg8MGx9TFH/d7Jh5iAy2k9t0nY95Ti7AcIyMM
 e/0MLabKgebXqM/ppeqQo6UJTCSgCfUlPZNlI/rMWrCt5KGVpKJZvY7wSmWrhAktAnMO
 AWKSIgeSVgDmKNhHIl6QWUPHIsRNA/J8ScQfM5iXlg7mzIHzH4CHMR6JbIlBWZMUpQoB
 ol3WdEQP5Jpv07b3JZ+vBKaqF0WJlw435ZBD/yrobLDSbR2C7BQY21BElM3Vpedkq9kR
 Aupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737455192; x=1738059992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1nSBa8IUGU1nXN+b49dNchKcptNoPhFRCdZoshvrmc=;
 b=apRXewtCwgN2TwbWxFpNP16hVZDbJxOh9Es/6Y1LEa09Ojl+ddinJQz6HHo2ZULPmU
 Q2tDLcyAR1djLnf+fud4pbKRk2ZbWq97UXmeEVFcAbEOFb/ggwxRfZe4JJbur+6IdpiC
 CL6wgsUrtrjXQZhZ4/UF3aOU1lrUmNG7LCgPPuYabGlV1vWOmzHF2ljmyc7W98PFRk7+
 25bjCJUnkOTcMCmUZcNaNp+wFmvDQTxXrXlrarkwLIzLWnUA0kpwfRodggpDid3oerji
 U2XV0jJIpsiVWaielll811m+12x3vYzWj6KsIbrmpgfQ1x/9HUFC3+81gyZ37Gv9m6OQ
 4qfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzltrfnylKFfgQsZG4cUNKE6wUFJHiDFv7iDCR/QiXFERYtBSRMtUJh64U4HgE0WCe22DgGvNyO9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/5ITS1EsZPszqPZ7NwKoYu8Jj7a9iUSUe94rKtgjW0AEjp0TB
 1gkq2vv1ZsaOCsNwEooUDM+DBeplZWoeLMxmnjAiTB3Pm294Xz5TS32SIXUsaa0=
X-Gm-Gg: ASbGncsmEp75nCVOg1FVbVNJ5h1Bc6GdTMjjH8awTz967Oz7fyEkd6NUrimrHeSFhWD
 xyTNDc3utgMwt7Ica16xgiZsN0ERXsgLvLnt/j4AehDI3UXJYanhXa7PX+4WBr/u/ky9EugS2DF
 xeGTShJjnDOye03H4aTNbf9xAgam8r+yijbNKFbditIUhGPjjFJzzvZG0KQV9bsoCpgoLYNl1PE
 rQVEA8I767QRRTBn+dMlt3wGfCBeueZLVqNLBXl5gmszRZfzoyXWr/o1gV628ZdxtyzCzsLN9nh
 S8kSrsZywmo2hnD7LOGF/z6JghffmFqBJnC/I5UlXihsXWGi9Q==
X-Google-Smtp-Source: AGHT+IHwpSv6PSJob8zZEfFgoHp8qXCKuhKpxTniHhj/dzNZxxonuD6++xWoOecAu8un1w8M2/tW4Q==
X-Received: by 2002:a05:651c:2c7:b0:2fb:58b1:3731 with SMTP id
 38308e7fff4ca-3072ca60bd0mr44221831fa.6.1737455191768; 
 Tue, 21 Jan 2025 02:26:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a331124sm19977171fa.21.2025.01.21.02.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:26:31 -0800 (PST)
Date: Tue, 21 Jan 2025 12:26:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <7luldid54shuyywuzfidxf45oknh5iuxaibbb77hur6qpury7i@33wsjwdphrxq>
References: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
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

On Tue, Jan 21, 2025 at 12:06:15AM +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the FairPhone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..dcf17b5e8ac8eb76f5ba038fcce48e47f32299d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,10 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>  		if (dpu_enc->phys_encs[i])
>  			intf_count++;
>  
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>  	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			if (dpu_enc->hw_dsc[i])
> +				num_dsc++;

I think you can skip if (dpu_enc->dsc) and always enumerate
dpu_enc->hw_dsc[i].

>  
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
> @@ -664,7 +665,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	/* Datapath topology selection
>  	 *
>  	 * Dual display
> -	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 2 LM, 2 INTF (split display using 2 interfaces)

Irrelevant, please submit separately.

>  	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
> @@ -686,13 +687,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  
>  	if (dsc) {
>  		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> +		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * when Display Stream Compression (DSC) is enabled,
> +		 * and when enough DSC blocks are available.
> +		 * This is power-optimal and can drive up to (including) 4k
> +		 * screens.
>  		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> +		if (dpu_kms->catalog->dsc_count >= 2) {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +		} else {
> +			topology.num_dsc = 1;
> +			topology.num_lm = 1;
> +		}
>  		topology.num_intf = 1;
>  	}
>  
> @@ -2020,32 +2027,32 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>  	int this_frame_slices;
>  	int intf_ip_w, enc_ip_w;
> -	int dsc_common_mode;
> +	int dsc_common_mode = 0;

Please drop =0, it is done later.

>  	int pic_width;
>  	u32 initial_lines;
> +	int num_dsc = 0;
>  	int i;
>  
>  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +		num_dsc++;
>  	}
>  
>  	dsc_common_mode = 0;

Could you please move this line two lines down, just before the rest of
dsc_common_mode statements.

>  	pic_width = dsc->pic_width;
>  
> -	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
> +	if (num_dsc > 1)
> +		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
>  	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>  		dsc_common_mode |= DSC_MODE_MULTIPLEX;
>  	if (enc_master->intf_mode == INTF_MODE_VIDEO)

-- 
With best wishes
Dmitry
