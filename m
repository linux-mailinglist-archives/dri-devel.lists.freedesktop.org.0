Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C008DC1CD12
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE7910E825;
	Wed, 29 Oct 2025 18:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrtjO0xF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEc0BTzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509DA10E831
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:45:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TBvqW73692136
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KNrmvG4hljyJlv8FFuSoEqbtyZ1QSGCkdul7UXaIQ6c=; b=WrtjO0xFwoTy5Nso
 8nVEynN8Gtmn+KpDQCt8lQp7vMAvIqsFo0T/qs98tbzADLq/PXCHupDVA+cc4Y76
 gQikmdHS6ahH2Kz4PeGMkbFMvOH5XLZss3oszWXvR5JApXjwkSLj7U+l0dRIQXgd
 ZCqvSAz//ZMJTZTqkuuxmwEJ5JpvGr4WljyrKiGBoOI6KPwm4rB2apKgRhqgrbPj
 WiW44CRd2Y9pv4qjt7IEMK3FNIt6XFg5if/WT3ZFyJ5XVtw6Jlj83T8+VvYo80er
 gwWH+MrXTXKXPIzN7/6fNXgkpO4stNj6y7cnxR7jTNIIYBav13ruHsk94AH6BjU3
 /ij/CQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2krfw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:45:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-78117fbda6eso169338b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761763511; x=1762368311;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KNrmvG4hljyJlv8FFuSoEqbtyZ1QSGCkdul7UXaIQ6c=;
 b=AEc0BTzNa+71SC6kf2gp3wKa3gaBKXHsWBj5UiniZlO6G5RxjD001LbSZYGZpTi/pC
 QN9QfEH5RlyuS28reW8zki9xt46t+aX26KWuccVlZT9SDQRYmMXqNoE9dBpvb4t/h5Fk
 jPtr6kqljNQZ3vhagoXXkINtIe1qYLKQzx/3cTuPQVWOOwDJhGHYyjTxWHxPA5jBr5Sv
 w06L98nEBIRHeoPdEyAVpVEs5VcU5v1FIaJ2bMaNk4RjdDcpGMr8ktgJh0tNiz9bYJHu
 CH9Ev+xEOnBm2Lrxn82TDNyNapd52M/Zw6ExKnaWbitI0yfGxoujw/Ym8irg2I5UGlyT
 7MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761763511; x=1762368311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNrmvG4hljyJlv8FFuSoEqbtyZ1QSGCkdul7UXaIQ6c=;
 b=OuqNTbZXVfnbvsknu02+cgn2K1+FH5q/0U7TpTDhy6GgoDC/JQZZc57oM6GyE9LAwQ
 cTU47hs9KQZ5lSTx4NdnL8q4yX/P9CutfWNAHt1qQJDLpNBlCvFw7rd23rmMFGOPwqbQ
 WIoppPKczZzzO4580DmNn1hAvjBgzys5UVlwelwRm9gbYt/xwGbN0Od4uj1YlPf76YlR
 Icc+NQcxT12AnCF+PG6Wnidh5DWEks3m3sVX5m8HzerhBktGZErkFsztBi3iLBWBmunT
 2XDAmzQzK2N0CYRBV/dBhPSfntWqEmo+toZrLbS/fhN6va6cDLohJRMZcQsC5umgk289
 z4tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTjZrIaoCsArMzTSXMP9YBdtlQZt7TM1C1xVP1KerMDXPRe7tx599Hj1ZwWPWsRZG5mYlS5gK/qSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmwd8ARzhvJahG+gBnJQJ7GQMS4ST35uT9TuKddxapxrvUtsOL
 Fc8Hf4VvuKP3T31tsrDQbCG9bhT53mS7AQv6Awykgcmy0RTykBsPKP4HkCeh/g52qRdUJ73X/zf
 4MVYN86wIbhaEy5q2O7BBfgZRnytBSL4nSa1wHC0SDQ45Rm0ZwLm14vE0EB2n98WFfH6s3Sg=
X-Gm-Gg: ASbGnctzcYrGAmOQgvmZc8Xcf3PiZT2ISPBb6Hd5NgeeZD8wH2dgYhVH6PjvSBWKoy0
 HgaPg++FJWR2E6JHKGTEaxGptI0mB3fubvRk6b8YtR/uOqIzJKgb2yFBO0jIOQUPnk+kq4QRNcg
 TkA4X0PHnJXC3+oVC7eB4ravZr/Y02cEi4/uVk6CZrjuMl3DlY8ZvOtuUZ/+6X2dFqWrMrtGGes
 t179IEG9HD5UEL8p6j283ogVJPtn0paWsZf3DtZGK6r8D48DKxTMh9g1IOGyzVAT+cQJ+rQ/eXN
 T+I/oyQi6qPa8xnrZw+9Iwljqo7OpzM/qEqzIEUcpvgf1ZRtG28oB/SojMb6wsa82sZDmq42z7+
 9jenNHAlHEiYjLI188ifiiqBZb8Mo7zSmaYtUa66L2EbJ5F2LnQDh
X-Received: by 2002:a05:6a00:180f:b0:772:114c:bcbb with SMTP id
 d2e1a72fcca58-7a4e2cfcad0mr4291556b3a.4.1761763511196; 
 Wed, 29 Oct 2025 11:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7BomDjxXzMC5zTFfaznhSAkjg7QQj/gYWzxRwvfKwRp/e5bx9u4x1jTXz0knu5wyFN/G33Q==
X-Received: by 2002:a05:6a00:180f:b0:772:114c:bcbb with SMTP id
 d2e1a72fcca58-7a4e2cfcad0mr4291517b3a.4.1761763510638; 
 Wed, 29 Oct 2025 11:45:10 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a41402e739sm16392544b3a.23.2025.10.29.11.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 11:45:09 -0700 (PDT)
Message-ID: <ada53b66-48a4-46de-8eb2-4a3548b42f15@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 12:45:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Improve debug and warning messages
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251028070705.135211-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251028070705.135211-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: COIyJ-VLfJmCRhsJtNKZ5YM2B-bveW3-
X-Proofpoint-ORIG-GUID: COIyJ-VLfJmCRhsJtNKZ5YM2B-bveW3-
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=690260b8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ux_5SnO4gwS7O91Eez4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE1MCBTYWx0ZWRfX2AifXn7kVY6o
 rM5Y15yucUeFDXjiQ2Jv9naG6/mWk0FGfVWyCH1C/qAzdBRY79N/m9T30HMrPwjyJtlcnTiljgE
 ssKhzY7UhrLGUh0Ra/f1WoPe4nR+9tGHUd+ZDRMxxWOlnWEVJ320ME8wIMdCxnumG7DdXMX0yKd
 tlDDF0YHRzSILIHn0D7E2qj/Mm8q8q3YcfVOvFhuapVP/pUWitxwnSMAot1fvGgU40EQDrSYsoj
 lA8i29GiPVnSKchrOgevO/mXWB6/a0R5hnLOUVRKzBFyqi7B9nzq/1cj8TuWekUctCMA3syDKpn
 e59qPP3dPAE9I2Vj8fbmZMMeyuuBhiOlRdetuWcp0bOaSWAxATQV3yIYSCzeUTiUYhfeLBYiHD1
 BgTVKE23pX4d2/eY/ysTTlznoCmkAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290150
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

On 10/28/2025 1:07 AM, Karol Wachowski wrote:
> @@ -377,7 +379,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>   
>   	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
>   	if (ret) {
> -		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
> +		ivpu_err(vdev, "Failed to create handle for BO: %pe ctx %u size %llu flags 0x%x\n",
>   			 bo, file_priv->ctx.id, args->size, args->flags);

This looks like it could be triggered by a user (in an ioctl, and in 
this case the user could exhaust the handle space), so this should be 
changed to a debug message per the commit text, no?

>   	} else {
>   		args->vpu_addr = bo->vpu_addr;
> @@ -406,14 +408,17 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   
>   	bo = ivpu_bo_alloc(vdev, size, flags);
>   	if (IS_ERR(bo)) {
> -		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
> +		ivpu_err(vdev, "Failed to allocate BO: %pe vpu_addr 0x%llx size %llu flags 0x%x\n",
>   			 bo, range->start, size, flags);

Another possible debug message?

>   		return NULL;
>   	}
>   
>   	ret = ivpu_bo_alloc_vpu_addr(bo, ctx, range);
> -	if (ret)
> +	if (ret) {
> +		ivpu_err(vdev, "Failed to allocate NPU address for BO: %pe ctx %u size %llu: %d\n",
> +			 bo, ctx->id, size, ret);

Another possible debug message?

>   		goto err_put;
> +	}
>   
>   	ret = ivpu_bo_bind(bo);
>   	if (ret)
> @@ -193,7 +206,7 @@ int ivpu_bo_create_from_userptr_ioctl(struct drm_device *dev, void *data, struct
>   
>   	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
>   	if (ret) {
> -		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
> +		ivpu_err(vdev, "Failed to create handle for BO: %pe ctx %u size %llu flags 0x%x\n",
>   			 bo, file_priv->ctx.id, args->size, args->flags);

Another possible debug message?

>   	} else {
>   		ivpu_dbg(vdev, BO, "Created userptr BO: handle=%u vpu_addr=0x%llx size=%llu flags=0x%x\n",
> @@ -69,12 +71,18 @@ int ivpu_ms_start_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   	if (ret)
>   		goto err_free_ms;
>   
> -	single_buff_size = sample_size *
> -		((u64)args->read_period_samples * MS_READ_PERIOD_MULTIPLIER);
> -	ms->bo = ivpu_bo_create_global(vdev, PAGE_ALIGN(single_buff_size * MS_NUM_BUFFERS),
> -				       DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
> +	buf_size = PAGE_ALIGN((u64)args->read_period_samples * sample_size *
> +			      MS_READ_PERIOD_MULTIPLIER * MS_NUM_BUFFERS);
> +	if (buf_size > ivpu_hw_range_size(&vdev->hw->ranges.global)) {
> +		ivpu_dbg(vdev, IOCTL, "Requested MS buffer size %llu exceeds range size %llu\n",
> +			 buf_size, ivpu_hw_range_size(&vdev->hw->ranges.global));
> +		ret = -EINVAL;
> +		goto err_free_ms;
> +	}
> +
> +	ms->bo = ivpu_bo_create_global(vdev, buf_size, DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
>   	if (!ms->bo) {
> -		ivpu_err(vdev, "Failed to allocate MS buffer (size %llu)\n", single_buff_size);
> +		ivpu_err(vdev, "Failed to allocate MS buffer (size %llu)\n", buf_size);

Another possible debug message?

>   		ret = -ENOMEM;
>   		goto err_free_ms;
>   	}
