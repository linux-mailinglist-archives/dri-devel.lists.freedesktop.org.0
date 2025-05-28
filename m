Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDCAC6B09
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE42410E00E;
	Wed, 28 May 2025 13:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IcMF8OcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87A10E606
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:52:57 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6vhCM002142
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uBOPP2nWIT9/99XuC1utjy9X
 r9ENEyP8GmiGj5aqQeY=; b=IcMF8OcTKzpCpORhkdZ+5HMQxFh8cpXzRL8dh9xq
 vy85syvW/t72U9pzGDYZaEjIibHFwKTEMF0i0+vR7siWRyWVKQ2S/xF6KSbVEAR5
 NSkywzlZatgJAYnomK4F7tQKUeOTnBkqZW28i2eWw8NA0daK3Sz/Z6Aa6pCmKAhx
 VqO+ik7C/3DyJJ7aXSdlpdyg4nIk50K2sUFvr0IDJNObnOJqwBvIO855rdX6njbs
 X9PZjdmjPNWpeyo7sM+kjkIv2JXtJq1ZyvX+2d9oCwAsEkWWbOKLbB8U4Ffl65KH
 We+JpV+Cn2GBGUAbx/GCHEZn7LEJOTQWqM3qlSrnKZICww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkv68q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:52:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fab1b8d379so23210316d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 06:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748440375; x=1749045175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBOPP2nWIT9/99XuC1utjy9Xr9ENEyP8GmiGj5aqQeY=;
 b=XX46jGsvS0vnUv+AHsBbAyEBjeFjeNfETSrltza77RlRvmChh4/88cukN/Swu/B0z6
 uaSoomTCYWukrXC38w6+yP1uF9Fb3JgNPZBFSzke/9AeAcyOv2JqSdDYUAOWLdD6325y
 zNZYWNxJthLoVzG4czloucLyEfRRuZ3S87e2QjIGnlhimgCQoF389JMzhdac2JltoUKX
 XfUgJsf191GQbxXdT6n5nafs7KWavlLhc5tRXH41aZWZGvYfxAnkLT6u76GZ2lAeoMbM
 d3XqiD0nO29R4S8lpfP5Pb52F1IFTmySYaQcF52EccGazXXWSX5dwVQyT+tm6LloqYL0
 ZgDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIvpeB5wAAT+iB1aDL/cndTviPWvSRtCa9Y6VSxopzLQTgfSm1F2RfMBN6xUk/Y8aEuJxPUrDRSkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLRSEiHFVEnylQdzB6aiRIrwEDox4AwbhcfnoKcMNA+rToZ70U
 XBSoAWc3Bih9m0thW5IWbNwUCXcssT3kcHhY+6YOY/pNCR4Bjtmmsph07opWWWPVLoA3SnbKivQ
 plAk4gl53DUAFGXKNbqDiwkdOKmLsO9D7e524w+hn5yTkN6mC3JWQVFefL27EUCgn/9nxPYU=
X-Gm-Gg: ASbGnctiBWnzBfYo2jYnGjsxawJbK4N8ifvavF8Sx0uabuyr/vlLzAEK7wvm/GAgokE
 55EOJyLy5ARKUIxM2mN3VlLfrmWX80X5iuofMd0wh3qa9hBQkCij2a7uCySSnCbPFeUgpA/QHtD
 LEplGhsK4OnMrRVFo8qC7xIdRupb1eiMEBw66XR3X310QADgpYTVdxHazZWQSY87v1TjQ0GR2cg
 W4wOeJufYX+G9piDkMNztf8CF9KHC5LNEOcjR2nFZoANrSYi/TzANYNYnTjoIGTsj5HHc/mXUez
 D4o1CjBq/ms3FxgSNIT251WvQzb0TTOSwn8dNa3bHL6jzUSeR/RNrbtisHmTrpbGZvW1d8d/VTI
 =
X-Received: by 2002:a05:6214:f0d:b0:6fa:c043:7781 with SMTP id
 6a1803df08f44-6fac043c742mr27775826d6.6.1748440375259; 
 Wed, 28 May 2025 06:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNkR85opKcDfwQLxCDd6W5iPsD1U2otytKAVtAxdS8qF08guHyXNDqm8ewQIw/BFu5tF2iEA==
X-Received: by 2002:a05:6214:f0d:b0:6fa:c043:7781 with SMTP id
 6a1803df08f44-6fac043c742mr27775336d6.6.1748440374835; 
 Wed, 28 May 2025 06:52:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f6a5fd9sm291521e87.169.2025.05.28.06.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 06:52:54 -0700 (PDT)
Date: Wed, 28 May 2025 16:52:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Message-ID: <o3oipiu2hotkdbihnlpamq3lmbpxrlay5tyvmir7qnbqhrdq6u@d52lzumxexva>
References: <20250527225120.3361663-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527225120.3361663-1-heiko@sntech.de>
X-Proofpoint-GUID: ZDECN_fZYSTdJG949DxSWdRi_8jjd64E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMSBTYWx0ZWRfXyBF5BJX1IBob
 MDZpgV16HXMW1nDGC6asag4eQBcmYNMREkhWIAOtCgMhamxNPmXfkB2skwGSO7FOyBQjs1jeRBm
 VZNHhullnn5ePQpyNyf91Rg6jvEGfPqHMF4WctKoDsp6qEW4yQQrU0tzi6J9Y0O/UNWeP5ds8uz
 C4NVXXhjXG0z9ynqefGg45w1ABONlqbe6epa590bqcQr6i8ndEDBrYmeWSW3MZUCbSwn2G1sFfS
 sNV4/wIIQCdR9Ygs0OEBUPgH7mljm/GuXXyWbenx4uiU66hJJcifYEeYvMaIWDIr7leckgYnp0P
 MQQY9YqA/Zx+udL9/UWcBR9irqcvcyBD9lj7JxxavGbl4ID1HECvG6hOVJPk9lHWYo13JOkvVc7
 jjbeUA6aO9pxS4AZbUkie9rW7B92QXHrh/7rfpgzeYVgEv56p14elespntzC9bQK6lAGtSxI
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68371538 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=A2JJf1eg9WQolHiAK1QA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ZDECN_fZYSTdJG949DxSWdRi_8jjd64E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280121
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

On Wed, May 28, 2025 at 12:51:19AM +0200, Heiko Stuebner wrote:
> Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
> calls to clk_disable_unprepare() during probing") removed the mismatched
> clock_disable calls from analogix_dp_probe.
> 
> But that patch was created and sent before
> commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
> from the DP AUX bus") was merged, so couldn't know about this change.
> 
> So in the original patch the last change is
>     if (ret) {
> 	dev_err(&pdev->dev, "failed to request irq\n");
> -		goto err_disable_clk;
> +		return ERR_PTR(ret);
>     }
>     disable_irq(dp->irq);
> 
>     return dp;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(dp->clock);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
> 
> the analogix_dp_core.c actually now has the runtime-pm handling between
> disable_irq() and return do introducing another goto err_clk_disable there.
> 
> So remove that one too and return an error pointer, to not create build
> breakage.
> 
> Fixes: 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> When I reviewed the original patch, I failed to see that difference :-(
> But I do wonder how dim was able to apply the original patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
