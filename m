Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6059CD9D8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 08:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1216910E06D;
	Fri, 15 Nov 2024 07:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tbwwUfvF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9206D10E139
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:24:45 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so1409663e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 23:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731655484; x=1732260284; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7EcWNS9byN0gR6B1OS6Zt5wq4ZVggPDyxl/u1m3HyWw=;
 b=tbwwUfvFq+SDC0iJX2dr+oHnlTFqcoZNksRqUoYOPmK1RQ/qT2EyXaeJOjlVes0r/I
 t3cg3cnku2J7+iKTVaiODcOf56Q6q9LD2WhHTm4gwq2bnF3efaO6iTo9OPzpwXNTrEpj
 mtvBID+b11/qlgFnILBBbrbp44hUkv9YNe3dUtqs2KYtWR9otscC9dbLIXYAzgfzd6bc
 R8jrckJJA8ymTqEIdMbBO6ER+jHFTeckyE1zmUmD9B7b4C6KkG4/mzMSa6TtI9iPT2XB
 F+hzYoQ1nI4VODiSN/xWJrRsp5SnaGq1wa5FKpkpQKftylJkBbZ7x/r4sabgoxm/OZMa
 0X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731655484; x=1732260284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EcWNS9byN0gR6B1OS6Zt5wq4ZVggPDyxl/u1m3HyWw=;
 b=m6dkT56KMYMtKeUZSHin/rIzT3vAYQa47W4+LkGcsa2Q2qB2XYZXfCpTbmRcUKsqYt
 QQGlE1c9Zy3+zOucTtuIcg9Zq+O8RJ0kO88wKEEVwilRf/iCTRoqUiZ6www03U4hWwye
 t7zWihyLMaEyhLi8+yDu1gf7g6tbACGnOaSOJLr/Z/Yah6pFrmBNQ9WNebsBvpA9ULoy
 sykxf5vUygU/a6fNNWVReA1LurHZqVJ0DzAOBM65+PIsuhJEjJDJObde9iCM/KoeHPSy
 XF3aX/ow9SRN+1rj51hQDKM4Lo8HBv8uf24bGgHstLPy9eo6fcD8BQNkisUVjmV+RRwB
 R2lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu+6tsiY4e2V4jrB/HzoWtv+l2D7ZIuqfay2wZApiUBFYYJkOtECEiTn7uVpnsT6q9CU5mDeTCvHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaZgOjokoSewSB7Po3ElSj7RkRw80GEBloo8elVo7AHczs+s/1
 kKRa6bub5zFlsCJR6mJ3CqHaoibpgbd43mxOlsAMkImdXKjdo3zJwNfbXyreuRA=
X-Google-Smtp-Source: AGHT+IE1gwUi6awx9Luumx73oS1Fh8FJL1s1HD8Y9lRpd4u8UuP25XzDlm/MGaevUAG7bpsCoP/9FQ==
X-Received: by 2002:a05:6512:ad6:b0:53d:a722:dfe7 with SMTP id
 2adb3069b0e04-53dab3b98e3mr572679e87.55.1731655483568; 
 Thu, 14 Nov 2024 23:24:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da650169bsm464232e87.105.2024.11.14.23.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 23:24:42 -0800 (PST)
Date: Fri, 15 Nov 2024 09:24:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 4/8] drm/msm: adreno: dynamically generate GMU bw table
Message-ID: <rvfrkb4v7cilzu3prv5dr2dni7m3jv3crhmto3uume5v5wxr5m@apvyb4lc2rre>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-4-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-4-3b8d39737a9b@linaro.org>
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

On Wed, Nov 13, 2024 at 04:48:30PM +0100, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.

Nice to see this being worked upon. I hope the code can is generic
enough so that we can use it from other adreno_foo_build_bw_table()
functions.

> 
> Those entried will then be used by the GMU when passing the
> appropriate bandwidth level when voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 +++++++++++++++++++++++++++--------
>  1 file changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..9a89ba95843e7805d78f0e5ddbe328677b6431dd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -596,22 +596,48 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] = 0x60000001;
>  }
>  
> -static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static void a740_generate_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
> +				   struct a6xx_hfi_msg_bw_table *msg)
>  {
> -	msg->bw_level_num = 1;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
> +	unsigned int i, j;
>  
> -	msg->ddr_cmds_num = 3;
>  	msg->ddr_wait_bitmask = 0x7;
>  
> -	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
> -	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
> -	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
> +	for (i = 0; i < 3; i++) {
> +		if (!info->bcm[i].name)
> +			break;
> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcm[i].name);
> +	}
> +	msg->ddr_cmds_num = i;
>  
> -	msg->ddr_cmds_data[0][0] = 0x40000000;
> -	msg->ddr_cmds_data[0][1] = 0x40000000;
> -	msg->ddr_cmds_data[0][2] = 0x40000000;
> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
> +		for (j = 0; j < msg->ddr_cmds_num; j++)
> +			msg->ddr_cmds_data[i][j] = gmu->gpu_bw_votes[i][j];
> +	msg->bw_level_num = gmu->nr_gpu_bws;
> +}
> +
> +static void a740_build_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
> +				struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	if ((adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
> +		a740_generate_bw_table(adreno_gpu, gmu, msg);
> +	} else {

Why do we need a fallback code here?

> +		msg->bw_level_num = 1;
>  
> -	/* TODO: add a proper dvfs table */
> +		msg->ddr_cmds_num = 3;
> +		msg->ddr_wait_bitmask = 0x7;
> +
> +		msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
> +		msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
> +		msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
> +
> +		msg->ddr_cmds_data[0][0] = 0x40000000;
> +		msg->ddr_cmds_data[0][1] = 0x40000000;
> +		msg->ddr_cmds_data[0][2] = 0x40000000;
> +
> +		/* TODO: add a proper dvfs table */

I think TODO is unapplicable anymore.

> +	}
>  
>  	msg->cnoc_cmds_num = 1;
>  	msg->cnoc_wait_bitmask = 0x1;
> @@ -691,7 +717,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  	else if (adreno_is_a730(adreno_gpu))
>  		a730_build_bw_table(msg);
>  	else if (adreno_is_a740_family(adreno_gpu))
> -		a740_build_bw_table(msg);
> +		a740_build_bw_table(adreno_gpu, gmu, msg);
>  	else
>  		a6xx_build_bw_table(msg);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
