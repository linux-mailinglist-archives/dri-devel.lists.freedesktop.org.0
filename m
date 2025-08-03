Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA45B193E2
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 13:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F9310E061;
	Sun,  3 Aug 2025 11:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJIwlYss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4F10E061
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 11:49:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573AK24C019486
 for <dri-devel@lists.freedesktop.org>; Sun, 3 Aug 2025 11:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=F0atcWDoi+Vh1I34Vx1HQrc9
 2SNS7uLMwCYa5Xut8DM=; b=SJIwlYssh9KLB/uQrHMtx6S0u09XzPlNa//seJws
 sPxs0Y/oCGI6ZNtXcXgADEGYO1vuOsW5zp64v9yb9cqdENyRma4Xnkp0xNePOX/I
 fiObKaDKS98g6F0uD4Pvx5KtnuA0OD7g0FP6EGanq0CHjqUgK83ZHLFhVjLGxWnf
 WKlySZ1Q3XTKQoneGV/5W0uBmCPLt/VQWnL9gb6Nxhy/nS1GW9T66YsKZpfShLEu
 rXIk+Cd7cuiJONPE+dGSF8h04Vjj23dwmZ96lw8GIwb4ZnaWTC6UfrwqPRsCZDp6
 C7tJFs+ts0SRJ/bOUwoN9p7Eg5wB5EbwI7hI4jcLPWjuyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489aw727wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 11:49:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e347b1a6c7so836381685a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 04:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754221794; x=1754826594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0atcWDoi+Vh1I34Vx1HQrc92SNS7uLMwCYa5Xut8DM=;
 b=pXSp8sjGSbk5YST4ioW+nMafccACt/d9vYPKN+7cELGOA2fdvdFcxUzKqiW3aqRqq6
 4KAOg7IeeI433daDn/pVa+VmGaEHLeQuitoMDYlm8XazCpTqWDnVJGjKeigSH142CLtR
 bO1pzSTrdknp4PB9lUT03lxo8WTUMxjgImUHFJ5U068x3kr/2+fQmdh+xTVfn4PBvj3Q
 PWTGuordouy8cjuHSYkQBFiGzlORSGIZs19iyx4p0Ewc2LQrG94b1YV4seXQG8/NMI/h
 WuZpi0ZRn/y03KEx9+yTHlfyX/gtVEBkKSq7yhY/0G8SG3pG/IZFEwQtSb73bOdlaN8W
 Ue5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCM8tJB4yi55m7C2/As3Pvwwkq2RzdqbzRFQ0xGQbJStrLaXnmyZfSD+RvoSEvKYN2dWPQ7+/hkjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUOWCUl8O8jXXPZz9KRkQ3LtMLhPD1ufBOIWN9tGpPkuIn9Kj+
 0emauI3pF7yndVO8oR0a6Kky1OTeYJGgkCUq3FnI5Y9BQYOCOcCrPbir5wMl7qP2WjrNHuXQhzF
 NAAEQr4UJ8BZqaXP8sF2hRG7uzNzTVN85aDo7kh4J72fYDUe2O0VNUApG5Iy72QqsJyWPxco=
X-Gm-Gg: ASbGncsqJ07aMJXk/2D38au4bPlVf06eMxx7PTCkgsPMjTy+7hHC0cbSSaal2GcIh2i
 /W7+mzlofVl4wqC9WVtlJ+kw/k1ZEDTDLJRAONrORikbd9CLZbVo++5uAusgH8pcNzJlFb+vt5A
 bB4vh3XotiEfeJWBt7GPaSAzLZpuhmLJ7Z7tXRIQW50YrTvqamfJ1x7fNH4hgFNogUgwHyqgQ9p
 gUXHgyEC+hJByNzs04rsF2rcUWnKK+mQLau0YwfRnQ4eaHLSe7QE+eLO7ChDiAmIfyHHdg93wCq
 +xo5tWf5F4op0FEbB5xlzAyXm6H2BYUbvBPr3JcqUEenhYdGEYNh8tDdMFrYSG+e0kg4VhH3Pod
 n/aCtpMUSWQb1aZv8EIulh6EdVdS5Q1LPJfts0QEz4kDZy2i1Fqp1
X-Received: by 2002:a05:6214:cc4:b0:707:3f8b:a5a4 with SMTP id
 6a1803df08f44-709365781bfmr87897056d6.13.1754221794093; 
 Sun, 03 Aug 2025 04:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjhr/vnQ2UfAYXxw4URGjLAiAh2TXLLrb5gVPWPnRmIZywfUY0NMaZxf605O95p1SSwKofcg==
X-Received: by 2002:a05:6214:cc4:b0:707:3f8b:a5a4 with SMTP id
 6a1803df08f44-709365781bfmr87896826d6.13.1754221793639; 
 Sun, 03 Aug 2025 04:49:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88cabb67sm1307362e87.152.2025.08.03.04.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 04:49:52 -0700 (PDT)
Date: Sun, 3 Aug 2025 14:49:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Cc: airlied@gmail.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net
Subject: Re: [PATCH] drm/i915: move struct_mutex from drm_device to
 drm_i915_private
Message-ID: <kqvtvlhwbwrkdueeszroeojflengsjdvqwu2n6lh4stl3vm2mg@7xgftffaqecw>
References: <20250718161725.289944-1-luiz.mello@estudante.ufscar.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718161725.289944-1-luiz.mello@estudante.ufscar.br>
X-Proofpoint-GUID: nF9gRPmODwYPB59KVzKj4l9Z6k7YO5ta
X-Proofpoint-ORIG-GUID: nF9gRPmODwYPB59KVzKj4l9Z6k7YO5ta
X-Authority-Analysis: v=2.4 cv=MrZS63ae c=1 sm=1 tr=0 ts=688f4ce3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=JRnknix9L4mqcjwq-FsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MCBTYWx0ZWRfX4MEvvwrMplq4
 xOf5j3KDX4Yj8Z9Q6F6Kxaqw8wJwEXd6oXA7DOEedrIMANNPvJoYlRH5a+pA2BeSXJqAMZLUJoz
 Aap0KJNggknXkXdrBfw35Jhg/ZcnS/uXAaBhFE+vn4HpHEgpdOKZWRB48MW508iA/ZDhf8OKyNy
 P7iHi4WhnLnZQt5BAblp3vMvZLkiHY9C7nCflE5EQF01+5B2ncOkUzBwOKWEPRzI6FBZ9e9NNg3
 mtXb1MCM6dCzD/WZ+2oShqOSvJuEke05QjXxKLa8GTtZdp2qAPKcMZqknNvveMD+10yYEqD9QM7
 EMcr2+Uh5T1mNeuaPy//zoyLYK6OR6Tpqtvw85a4EyzD6/MLCd4kmB3J4Pvgy2ai/jVCXeqo6G/
 eVAchHrmXz4fMGx4sUeQ/mOvS2a55gbSpVp+b2Ss6oX1lCAQXwN7b3zSr7Y+Wr6FUxD68ycH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030080
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

On Fri, Jul 18, 2025 at 01:17:25PM -0300, Luiz Otavio Mello wrote:
> i915 is the only remaining user of struct_mutex lock.
> 
> Move it from drm_device to drm_i915_private so it is only used within
> the i915 driver.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 4 ++--
>  drivers/gpu/drm/i915/i915_drv.h            | 8 ++++++++

You need to perform actual move: call mutex_init() somewhere, drop the
fields from struct drm_device, etc.

>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index e8a04e476c57..7135fdb0ebb4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -678,7 +678,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&i915->drm.struct_mutex);
> +	mutex_lock(&i915->struct_mutex);
>  
>  	if (log->level == level)
>  		goto out_unlock;
> @@ -696,7 +696,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	log->level = level;
>  
>  out_unlock:
> -	mutex_unlock(&i915->drm.struct_mutex);
> +	mutex_unlock(&i915->struct_mutex);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d0e1980dcba2..c585569b6036 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -224,6 +224,14 @@ struct drm_i915_private {
>  
>  	bool irqs_enabled;
>  
> +	/*
> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> +	 * for BLK. 
> +	 * 
> +	 * For this reason, it is no longer part of struct drm_device.
> +	*/
> +	struct mutex struct_mutex;
> +
>  	/* LPT/WPT IOSF sideband protection */
>  	struct mutex sbi_lock;
>  
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
