Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155989A86D
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 04:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C37D1136F6;
	Sat,  6 Apr 2024 02:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oswb0q41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5531136F6
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Apr 2024 02:21:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-516be63af88so3187192e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 19:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712370087; x=1712974887; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e3RQ6maZdShuVraNYItBn9lrjW9BLdIDbgZu10qFIzM=;
 b=oswb0q41FsOWK5UQLcHYmfk2OzwdWh05KRvYEQuveFaTkmzTVMRMgw1+nvzuerHQMx
 8yA84ys2i/yQxqR76REFt6gKc8KxHTWZP/zhJ6TvEatoTLmRYxiVrvyuaHJba/uednfC
 /+O24tUdX3jSmBc5oMc7oxsnIiaDYhjyK0vlE8hGzuPkvZklB0UxoDK7vqMxVEaKT0SJ
 YUbcZYc2bRypMbyN6Pvc2zL/P/WWIAI9pyenr05hiw0n2VY2crQPKYNPyIXZ63a1uhZa
 eRpX8ZA0NnJymBvbDBdb9HKEZ8/znfkJSzMbpeY5njQ/xmjVVTU8xF3fhNlmoH5Qiouy
 vOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712370087; x=1712974887;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3RQ6maZdShuVraNYItBn9lrjW9BLdIDbgZu10qFIzM=;
 b=AEhcYai57gsb5QfEbedjSYx8CuAjGVhuoenQnePnuzyITxlMwyCeZpbB2zPkoFVl9W
 n1UdApR8dIDc1lz6HeeuwnEw/yLSC5UbmDpdGL5RUPb7XnpKJV+iAKW8LSS1p2FTqvIe
 D5djoz9zzWlc6BDr6thAls1zhjkgzs10CmuT9LOnRTo30CQV5Fn2dlJje7uvfPdWFIgi
 LyU0I2INHlWxWCweyq1FPj67aqEtJR2V394wzH0E30MqK7ZSGAc8iCtwHshT3Ymy4bdX
 c0IcEmSEp/A8ctRxOA5vUa1TJcrv7l4Kzk9hVeToyIRaABMMGUfHTxIU30V/CC3hzMTa
 0wWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCxAnnCvLU+7vYU45wgLkqeDWwtq/eN2mYxNaqzQ0Nxhdy2G+bPjMA+um4QAnw08rixLrNLzakWBl4Ol7QpHeGoiw1vdHOhiW6qj83oLCG
X-Gm-Message-State: AOJu0YyURVnjrwXvL/hpz3IAh1ORt5TAcRaiAacB1z8/7Q4m040Xj58I
 hMXGCF9MpCdisTXORZfY1PKDpNL+XdGgNA6uSzyKdECxwJW1dgqlCG4aK+hqVWI=
X-Google-Smtp-Source: AGHT+IGCUxPA1x4pPvDKIPymyHQ9MIdDiuKIitgDDF5LRK2zKejYoRo8ce/mKSI+1tszTynrahREJQ==
X-Received: by 2002:ac2:5b91:0:b0:516:d259:ee5f with SMTP id
 o17-20020ac25b91000000b00516d259ee5fmr1862751lfn.7.1712370087329; 
 Fri, 05 Apr 2024 19:21:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 w1-20020ac25981000000b00516d6924bc6sm234716lfn.175.2024.04.05.19.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 19:21:26 -0700 (PDT)
Date: Sat, 6 Apr 2024 05:21:25 +0300
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
Subject: Re: [PATCH 2/6] soc: qcom: smem: Add pcode/fcode getters
Message-ID: <zc5u7ixaser6ekl3sltzxccstu63tpydxybquxz5hcasj4cmfo@csjwfifugeod>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-2-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-topic-smem_speedbin-v1-2-ce2b864251b1@linaro.org>
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

On Fri, Apr 05, 2024 at 10:41:30AM +0200, Konrad Dybcio wrote:
> Introduce getters for SoC product and feature codes and export them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/smem.c       | 66 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h |  2 ++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..e89b4d26877a 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -795,6 +795,72 @@ int qcom_smem_get_soc_id(u32 *id)
>  }
>  EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
>  
> +/**
> + * qcom_smem_get_feature_code() - return the feature code
> + * @id:	On success, we return the feature code here.
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
> +		return -EINVAL;
> +
> +	raw_code = __le32_to_cpu(info->feature_code);
> +
> +	/* Ensure the value makes sense */
> +	if (raw_code >= SOCINFO_FC_INT_RESERVE)
> +		raw_code = SOCINFO_FC_UNKNOWN;
> +
> +	*code = raw_code;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
> +
> +/**
> + * qcom_smem_get_product_code() - return the product code
> + * @id:	On success, we return the product code here.
> + *
> + * Look up feature code identifier from SMEM and return it.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qcom_smem_get_product_code(u32 *code)
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
> +		return -EINVAL;
> +
> +	raw_code = __le32_to_cpu(info->pcode);
> +
> +	/* Ensure the value makes sense */
> +	if (raw_code >= SOCINFO_FC_INT_RESERVE)
> +		raw_code = SOCINFO_FC_UNKNOWN;

This looks like a c&p from the previous function. Should we be comparing
the raw_code with a SOCINFO_PC_ constant?

> +
> +	*code = raw_code;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_get_product_code);
> +
>  static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
>  {
>  	struct smem_header *header;
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index a36a3b9d4929..aef8c9fc6c08 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -13,5 +13,7 @@ int qcom_smem_get_free_space(unsigned host);
>  phys_addr_t qcom_smem_virt_to_phys(void *p);
>  
>  int qcom_smem_get_soc_id(u32 *id);
> +int qcom_smem_get_feature_code(u32 *code);
> +int qcom_smem_get_product_code(u32 *code);
>  
>  #endif
> 
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry
