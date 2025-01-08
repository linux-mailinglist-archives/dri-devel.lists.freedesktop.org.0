Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A268AA052B9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2410E252;
	Wed,  8 Jan 2025 05:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nsowURL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B9310E252
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 05:43:10 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso234600485ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 21:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736314930; x=1736919730; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VRf3KLf8/gL60sYLc56uaXjwgEUxVqDlLqbN/+vh4pU=;
 b=nsowURL3G977AB87Slq2aahVrc+gmDJdD9J7WzVQa5+Jl6ylhOA4IPcZI/KBpWcguH
 lgCR2H1nYaoOcNRCsDTWRmwfNG7MVDI9+GtI1Mevbl0lUEV3DjKwrda8t2cMwVRO8PGV
 I6SKNBR3Ziw775Ur82OJKheD87hgoY05Di59EfZ1C2KOQHRD+5oUNg26uaX9eNhKwhNP
 F8onysfDbM/jo403bZEpoterMkkCz2QQaUtY6MWvbm9q1UgAzzfgMVp+QNPOVxS+xj2G
 3/oI7myqbTurIx3WLDakG+5xgelzgqsXCbYH5Ltm27/zzn3LgHzy30OR+l2M5Ir2M+yE
 qAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736314930; x=1736919730;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRf3KLf8/gL60sYLc56uaXjwgEUxVqDlLqbN/+vh4pU=;
 b=oX9RIRNqxaidAilmbrtLYoIurtyGKt1/3j13hL/O7GRUQQGqUksslJGaDl4sT2C7qW
 c8ZOxup5leuyaPmpXYFK41B+kAtzgwJiKrRjh26o8fLXh3hiInJOlZF1MDMNUgwY9msa
 SMq2wW/mbX9MFOrww8bSj5So6Zx2FP4uaCSnBJYpYbbzP3ALEyFapokN7so2eJD9m/gx
 xK6mRL3Pm7mwGhR4J3OlIvlHaq2UgVJUd40JhyJbJPKfHN/TnT2j/BtRC2wASvkv/wEj
 3VQcdT+QdZQpqmWfDkFLu2tRiJA0IPPTNem+k7qobKjfBzXz1w89QzMdD08+enXHWhL5
 pB3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbZPIGrDiEzo918kFBAipIAPYWpQmqoyWFDsl9H4pF8yk4dDxBXZTAtG7q1xLNCK0D6mn3E1lsZYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG48Awh0IP1V+a5+8WAVMiKUEQ8Aw2ZeDrANxkA1Px5YWLpb3v
 J5gwjPZMY/JuDQbAS92qiWsNBi1upkbMUTEy8WxILSd8GbXHP+PiMkqNWrnxxg==
X-Gm-Gg: ASbGncunS0kHT9P+wY1XgUpbna3ibwpMAJeP8bGeCQcuCgHb+kPBYNJIDgkWZmQZIyU
 3ofGlJwVTtmxpPF9+4NyOsSrvmCGeZEEPpWCOkcQk7QCcVw3+ITLREKJwQdKAjNpN/Yoe2PPbWJ
 j8HJnMsE/MbmPU0wo19jjtEMxnAyj7DeC+K4fjSpHRAK6q4eoBI8IxvkTCbijaXill53K7+6hWk
 OlgAOZxaVaXVvxyz83AAAyAtkIExJuGaE9Dg359Lmfz50pqHvYlyMbQMAXNXqSxoLBG
X-Google-Smtp-Source: AGHT+IHfb7DiJvfS8v29jxsUziZRhFKDaY9dPzRiz3np6wV51MwuSsfBjIEy6SOqBmGKPG5YDPPdEQ==
X-Received: by 2002:a17:902:d491:b0:215:54a1:8584 with SMTP id
 d9443c01a7336-21a83f4c070mr21127315ad.17.1736314930490; 
 Tue, 07 Jan 2025 21:42:10 -0800 (PST)
Received: from thinkpad ([117.213.100.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f4429sm318970325ad.173.2025.01.07.21.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 21:42:09 -0800 (PST)
Date: Wed, 8 Jan 2025 11:12:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <20250108054202.r4bqxduuhpcvpqm4@thinkpad>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-3-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213213340.2551697-3-quic_jhugo@quicinc.com>
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

On Fri, Dec 13, 2024 at 02:33:35PM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, mhi host only performs firmware transfer via BHI in PBL and

s/mhi/MHI here and below.

> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> mhi controller has bhie regs, sets seg_len, and does not set

s/bhie/BHIe

> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  8 ++++
>  3 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e3f3c07166ad..c9ecb6427209 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;

You can directly return the enum without a local variable.

> +
> +	if (mhi_cntrl->fbc_download) {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)

I don't think this condition can fail. If 'mhi_cntrl->bhie' is NULL,
mhi_prepare_for_power_up() will fail. So I think MHI_FW_LOAD_UNKNOWN is not
needed.

Also, all the validation should be performed early, not while loading fw.

> +			ret = MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_BHIE;
> +		else
> +			ret = MHI_FW_LOAD_BHI;
> +	}
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)

mhi_load_image_bhi?

> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)

mhi_load_image_bhie?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
