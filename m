Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEC8A8F89
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 01:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F12B10F954;
	Wed, 17 Apr 2024 23:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x3Va0v4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4831A10F334
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 23:39:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5196fe87775so79868e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 16:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397190; x=1714001990; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sixR/gBOEBj5qXOGxidlJSRG/Di+AE5aPpjezwvz9zc=;
 b=x3Va0v4Dd3sMEqUgdAb6Aj04c2MFJtyG0f26QPE+B8VtVAt1NTRto/Uv417DvQcm8O
 p5ePjpVZUBEWB6nEcH/jaPVWIeL9+Tl2rYvrDH8VbVuPdy/emRPvQfzgCb+mCNbJIFOH
 cWHzHZ9Q15Qm2x23r7Fj0hHBFkP8qIFhazB9hGDgQnoQs5S5uTbSNAf+TtHTgXBEaH1Y
 9Z4i63dpp8DlOLibFRnHRMbJ/8WE3XVmCSkSzNLSGxx/Mk932KsM9oWJxULdQ8DZ2hZO
 OgGgIuJdovB+/o/ruoTxGYzNp+LmcLw1LUpgPCvNpgk1hjEXkwPMS0dvIdXUjA4/dgQ+
 zXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397190; x=1714001990;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sixR/gBOEBj5qXOGxidlJSRG/Di+AE5aPpjezwvz9zc=;
 b=Em9Cz0JnRb+mJoMvGMvv/2RxbYX2u6c33GaAjbbQC/+oWCGlb0Pv2KFN0QuAb8o3pJ
 rSxCIvzc9Z33MabfmB0RGGqfvU/0qxsyZTvaGL/j3z1o952jL4xegioCM90qszjAp4Cj
 i9C2rpDFvKZ/B76xwbD3Wsj8whh/mtspg3ui2v4G3fx3V2ycUsFdlgnwWwjAWpIFOMga
 ufyyX/opq9ryyt1aNvb8LqbIWiIxlvvoqUGmyrRiMqNkquoBkwY5Bg9+q+RHtDwPJx8e
 Mmzbz6AK88g4NBVJnyZLVkQAOVBWXzGYJdAipGdpYvBotGoB4g6kfw591u1wM99+WHyv
 1ZiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4c1m0TkWVEFhH7M36RQxZblaq72eI2Os1kjw64xUztS1/MO3cdZ32fuX+xI3vDbJqvvwt8Kms2kSZQRwTJ5UGEdzuks/ud6q0ISeiQ6SQ
X-Gm-Message-State: AOJu0YwfCVeclF9UwzGh3eb4AgM9U9x0x+0Y2Ma3++BBM/Xy06exEBoC
 PDoI0zLygYQ0oQen9Rpc98G6IHjUBwNMLEiWFyF1ZUfwnWah/uOaumhz7DxeV3E=
X-Google-Smtp-Source: AGHT+IFKufzXZ2Gsb5UM4eMIb+d0hKtHZUWXaUXnT14pNS5nm7ekyhYyeZIFtXrBF22KdOM7pdZbOw==
X-Received: by 2002:ac2:5b9c:0:b0:513:21a9:79a8 with SMTP id
 o28-20020ac25b9c000000b0051321a979a8mr463106lfn.62.1713397190424; 
 Wed, 17 Apr 2024 16:39:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 19-20020ac24833000000b00518c3a390dfsm36302lft.67.2024.04.17.16.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:39:50 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:39:48 +0300
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
Subject: Re: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
Message-ID: <mg6ojmzl3snj3k6fuyi6opkbdovs7xna6sn65pjh52ii4yy7u6@ny2spvjjbfpu>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:54PM +0200, Konrad Dybcio wrote:
> Recent (SM8550+ ish) Qualcomm SoCs have a new mechanism for precisely
> identifying the specific SKU and the precise speed bin (in the general
> meaning of this word, anyway): a pair of values called Product Code
> and Feature Code.
> 
> Based on this information, we can deduce the available frequencies for
> things such as Adreno. In the case of Adreno specifically, Pcode is
> useless for non-prototype SoCs.
> 
> Introduce a getter for the feature code and export it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/smem.c          | 33 +++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h    |  1 +
>  include/linux/soc/qcom/socinfo.h | 26 ++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..29e708789eec 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -795,6 +795,39 @@ int qcom_smem_get_soc_id(u32 *id)
>  }
>  EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
>  
> +/**
> + * qcom_smem_get_feature_code() - return the feature code
> + * @code: On success, return the feature code here.
> + *
> + * Look up the feature code identifier from SMEM and return it.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qcom_smem_get_feature_code(u32 *code)
> +{
> +	struct socinfo *info;
> +	u32 raw_code;
> +
> +	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
> +
> +	/* This only makes sense for socinfo >= 16 */
> +	if (__le32_to_cpu(info->fmt) < SOCINFO_VERSION(0, 16))
> +		return -EOPNOTSUPP;
> +
> +	raw_code = __le32_to_cpu(info->feature_code);
> +
> +	/* Ensure the value makes sense */
> +	if (raw_code >= SOCINFO_FC_INT_MAX)
> +		raw_code = SOCINFO_FC_UNKNOWN;
> +
> +	*code = raw_code;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
> +
>  static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
>  {
>  	struct smem_header *header;
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index a36a3b9d4929..0943bf419e11 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -13,5 +13,6 @@ int qcom_smem_get_free_space(unsigned host);
>  phys_addr_t qcom_smem_virt_to_phys(void *p);
>  
>  int qcom_smem_get_soc_id(u32 *id);
> +int qcom_smem_get_feature_code(u32 *code);
>  
>  #endif
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 10e0a4c287f4..52439f48428f 100644
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
> @@ -82,4 +84,28 @@ struct socinfo {
>  	__le32 boot_core;
>  };
>  
> +/* Internal feature codes */
> +enum qcom_socinfo_feature_code {
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
> +};
> +
> +/* Internal feature codes */
> +/* Valid values: 0 <= n <= 0xf */
> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
> +#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0x10)

This is 0x101 rather than 0x100 or 0xff. Is that expected?

> +
> +/* Product codes */
> +#define SOCINFO_PC_UNKNOWN		0
> +#define SOCINFO_PCn(n)			(n + 1)
> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)

This patch works on fcodes, why do we have PCode defines here?

> +
>  #endif
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
