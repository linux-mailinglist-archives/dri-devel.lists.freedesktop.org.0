Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04EF89A873
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 04:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4C91138AD;
	Sat,  6 Apr 2024 02:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nsLJDfAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11AA10EDAC
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 02:22:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so1484708e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 19:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712370151; x=1712974951; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZyKLzJVktAzILDZDjIRmvAZaNHxUI4+ew0iZ8nIBhA=;
 b=nsLJDfAIUUNJD9cvIy9W1knmh1u6xmxq5zJaUGSi3ooUppRiguBmkrRTmsRXiHEBfG
 nGUMOzQCq9aiBITg5enHZrT/evnmQZK6LBMQdR20TM/r73Rm55fXRABr2UoroxtwGDj0
 SxGU+/6NPfJQPr66Vhr3avYAovSllWfrAvtofcQwlQuoPbpqYBj64j6C/0KjWH3rDknz
 pJGQdBMM9YDd9OuH1zXbfWqeS1KeC1NXM+rOZ/WO4cLb/lcOd5csUX6oa0AwdG2t+hgu
 GEc9i0+qtuh2Uyu4Uo6IGd9pdbESjRIayFmNtD0pxv9+AJbLATwmFQwY5o9Df246rvD9
 cemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712370151; x=1712974951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZyKLzJVktAzILDZDjIRmvAZaNHxUI4+ew0iZ8nIBhA=;
 b=WMibq610jehBV/CIpgeATtDyYwf2PXqsSp/cXWeEUfLdIU/QGzXkhfb17IBOp8yfaO
 JZKVus0rns5rGD9JoKjCqKzHgmYcVUddNwPryZD3F00ls+qXTbep0ZZ0ax9wRaVYVVix
 HJCvMrvAjSZ0dW90iQ+nVuzK9hI7WzelZABI/2UYoCSt5Cu33N1hAThTAGt2eIDcA47L
 3nS+/EnrBQHnWfTfKlTuUWK9JnkT3ugKnHCBOigL2S77siwHYVcNCeWVV/KlPUGzBcpc
 xeR76cHcb/jx5gsMlUy/F2H27FdrbBPAUcarihZl4GGqZVOnphmWFzkbjRTHyzIcDj0Y
 8u6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWswZaM3AQQrBfuPymNPLmGF9NJfyhE4TXZ202KDKUE5uiBUqvM5fmGJ5IgZV5cAjeqqjOkgcCdOaRQzeqnLsnKmeh5ij9hHVCLUAgPG7BA
X-Gm-Message-State: AOJu0Yy9LxzoYq+pUEPqMuk8VJFXZY/exKObIwDkxUJt2PjNtxKkSvKn
 neIjmfT9xIAW5IradfB6vQbsnK56kksSC/1LBl+mVPjZxZX5TSTQcQiXff0caTg=
X-Google-Smtp-Source: AGHT+IGvb4XRGR6EdNfCX6p/VaXQdYVMCyH8vn9vZL77k7LU0xmSF1owwRXRLY7RdG5Y7Nb4kOAN8g==
X-Received: by 2002:a2e:9805:0:b0:2d8:68ad:1e8b with SMTP id
 a5-20020a2e9805000000b002d868ad1e8bmr1928276ljj.52.1712370150743; 
 Fri, 05 Apr 2024 19:22:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c02c100b002d86145ecaesm338732ljo.86.2024.04.05.19.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 19:22:30 -0700 (PDT)
Date: Sat, 6 Apr 2024 05:22:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] soc: qcom: Move some socinfo defines to the header,
 expand them
Message-ID: <zua77x2vpfgahghxe33hrhimwh4wl4vu3ttvtao2xnwbvxfesm@rks7ue7cgwhu>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
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

On Fri, Apr 05, 2024 at 10:41:29AM +0200, Konrad Dybcio wrote:
> In preparation for parsing the chip "feature code" (FC) and "product
> code" (PC) (essentially the parameters that let us conclusively
> characterize the sillicon we're running on, including various speed
> bins), move the socinfo version defines to the public header and
> include some more FC/PC defines.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c       |  8 --------
>  include/linux/soc/qcom/socinfo.h | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 277c07a6603d..cf4616a468f2 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -21,14 +21,6 @@
>  
>  #include <dt-bindings/arm/qcom,ids.h>
>  
> -/*
> - * SoC version type with major number in the upper 16 bits and minor
> - * number in the lower 16 bits.
> - */
> -#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
> -#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
> -#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
> -
>  /* Helper macros to create soc_id table */
>  #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
>  #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index e78777bb0f4a..ba7f683bd32c 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -3,6 +3,8 @@
>  #ifndef __QCOM_SOCINFO_H__
>  #define __QCOM_SOCINFO_H__
>  
> +#include <linux/types.h>
> +
>  /*
>   * SMEM item id, used to acquire handles to respective
>   * SMEM region.
> @@ -12,6 +14,14 @@
>  #define SMEM_SOCINFO_BUILD_ID_LENGTH	32
>  #define SMEM_SOCINFO_CHIP_ID_LENGTH	32
>  
> +/*
> + * SoC version type with major number in the upper 16 bits and minor
> + * number in the lower 16 bits.
> + */
> +#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
> +#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
> +#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
> +
>  /* Socinfo SMEM item structure */
>  struct socinfo {
>  	__le32 fmt;
> @@ -74,4 +84,30 @@ struct socinfo {
>  	__le32 boot_core;
>  };
>  
> +/* Internal feature codes */
> +enum feature_code {
> +	/* External feature codes */
> +	SOCINFO_FC_UNKNOWN = 0x0,
> +	SOCINFO_FC_AA,
> +	SOCINFO_FC_AB,
> +	SOCINFO_FC_AC,
> +	SOCINFO_FC_AD,
> +	SOCINFO_FC_AE,
> +	SOCINFO_FC_AF,
> +	SOCINFO_FC_AG,
> +	SOCINFO_FC_AH,
> +	SOCINFO_FC_EXT_RESERVE,
> +};
> +
> +/* Internal feature codes */
> +/* Valid values: 0 <= n <= 0xf */
> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
> +#define SOCINFO_FC_INT_RESERVE		SOCINFO_FC_Yn(0x10)
> +
> +/* Product codes */
> +#define SOCINFO_PC_UNKNOWN		0
> +/* Valid values: 0 <= n <= 8, the rest is reserved */
> +#define SOCINFO_PCn(n)			(n + 1)
> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)

Please move these defines into the next patch.

> +
>  #endif
> 
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry
