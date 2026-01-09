Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44ED0814E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339210E83A;
	Fri,  9 Jan 2026 09:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxQnQQuo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVhN8FLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43D710E83A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:06:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098oCmX3218559
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 09:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=; b=MxQnQQuoXitKlChq
 l6q7BSifxiV8rH5QEvjeFOrhempCtgTZ+u7ooGB/UhvHfgEfbqxdC6yxub6E8Or0
 yVjrRcxF+ffMhmOKd4z+ERj0g0kpPitgJGPsk4mgbqKegMyM1uZaCrGjOsEUhx9k
 KhAfUKLGpS94BXJzfEpLTJErc9b/8oNC+3uGpoysoODh+lj/154yHOSRdmZsfHx2
 iHCPpriFcXjxgVFZR3/vaaYFbcAAJ35tWqMWLuvQR8itwMbWK1O/lxxHrM2EvN1M
 8CwtGZq9JJp9N4yrgFwZsRcEj3zLAZpE1aNmEC2ah5L7RqMez9ND+vsQHRjh7o4B
 LSb6iA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0hwbr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:06:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b9fb4c55f0so75298685a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767949593; x=1768554393;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
 b=AVhN8FLwwskuIAHbZJQrhibQ4BnaA/7QYirDoX7rFpVsGdhRa3Ge7m3/G93ApYPAMR
 569JTgUBKlz6MpiCvfJdmpdtZWxIVlk9u93OUwAToZ7zIbDTffZEuSCUt/mYwep1v1un
 I/J2GZ7m9M0JK7hcCM1Ka4UvZsfRog5joDXQpml9LGROHtqqCvzDRxUVu0lXFMYo9Xe1
 FNenjGcv+e6LF3UJzps5lhs10GX/FcmQNRMAvLWHcpKFdbA6WB6a3tmrP1HXsxPA0bnG
 xH+TeS0xeWmNF/Peujt44ya1ZaApHGULNWe5yZ4Sa78wo5S1jgHM79TQQ7D7jqySb0EB
 nMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767949593; x=1768554393;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
 b=u5lReLNrTuZlXVFFD2ATu+DiV9TDsmVcFNSEd0YG7I55yxmWfxHDRTOIMCVHLUqo0K
 zXbZiHqVyreh25mZ7FMv5jANElksdkyl8e3PN0dAHUqRfIoarKy1ZzFoOVuq0q3tWpI+
 9WtTYNvskuO9QLRtPVAlUVEzHVG0mwmmY4f2Mk9er0oL31LB9tqyXdYm4j4ItYlvtZrf
 kyNVqglVrHs+b3fiGud0vgCCWX6zz6TVRppcZeMen7sQwjkRCByRUw9Wv56AqpcjlEfm
 DL64qBnmY1lR7tS5lTchsMeFNzLZGw1x4ac6gDqwL7V+ojf7VMp2C0iHmLnTLnfQQNxB
 q7qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4WBbdzyFl/Fa01zW1dpk0Y4xNpsF226ZxItjbSt8Bkq/G0UkAMa4uRjQy+fp3MHn5A4x7A37RAME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu69OQELTnr4/v9dekxxAP8bhGhYGaYoEoUKk7FvqxK6xbuVWC
 tKjLzLpFMlVxi9nx8e9azWEVGbX6nDAVGhwgNVOt9y926b+gBk7rZvaYbssW9LPbqMW0UHKIYQ+
 vzeVYIEkR+Z2CqhAvbvsmMlShFVUOysNiU71AGpWO3pNdXhqs3T+X9XN6aLWah5Sn7ki7u6E=
X-Gm-Gg: AY/fxX7uVlnENSqN76/RVBCEjzn/lNkO5dM4KVQWTGMs0APrpM0SMw+KRLba4y8kd0E
 vcPYvnbeZQWb8/e5OSTK6JDhEUSUcgBKNP6G4/3ym39i2UD4hxro1Jo8unjQnvZt3NqgAqltJ1u
 C1T/k6HwhY/CsYBJEL3aV4YsXyUGIWf5xA3ZY9vuNwlDCLrUmsoOGtOI+v9wRzKu0YoEjxztJxR
 dhLvXfpHppBYwE+44UeBPbzfda5Lwb9M1BG8IjdA4JWoPbC3dWS/wQTeGf0MJlQoPApnrPoqb9h
 niF9umamEEnTpAvw6QfJY1XeM0zRW0CGGsADd9BCPQ6tsK92p+RH/UiFj3crfMVxj5qdVJhztIB
 88Ekbr1L5OMNZjyl91o+ltrt6e8LFIW2qAoHLPxlOVCyUQ+STbjZomaSBJpmuzydHh8Q=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c3894104edmr885986485a.10.1767949593050; 
 Fri, 09 Jan 2026 01:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNhlqG1qVA0WeSBPAv41iXJojsZ0EgDiNOaWVzG9AckeDmRxc+YXyNI/94n7ZKvJNWAxmdPQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c3894104edmr885984385a.10.1767949592559; 
 Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4479sm9806221a12.1.2026.01.09.01.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Message-ID: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: or5mm-tsrswgGB2iVWUO7xHdpj0gMsnV
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=6960c519 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=xIqhFIF2P0JOsuq1WLcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: or5mm-tsrswgGB2iVWUO7xHdpj0gMsnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX0nhEaUBTEdwb
 5oSg7ax2MwdYTi3mhmtYKHeZNeKb1OIeqOJ6BZmJEP/272ZqJbS3NgQK9yAWCMDK0Q1gDuWi+cw
 EAQQKceui9VW4GldXjIku4tn5YTcGUAhKJ+ltEh1lUoBM0cs3oBqa7SVZ7tiV/hxqnlHw/69cEw
 ddyg14r0COXLhixeZcdqVgKVryVNh4qRWFO4NpZEPoGGFaEJtK2zXpAw59iC33lYpPh+DFtu96f
 iGBxDGv228Wcm2x/oy6Hsd97RoYNVwylnPS4+FFlJit+ftIb92npjjdD2RnTQdRMTDMHGuyRt+n
 JJxa42kyNEn/ItA5qdioJaxnbfoSFtHuHieKtDM6gyuAzLrnMtoJNP5V2gpxBmu0t/Q7KraIRT3
 C8Xihf74+g4sFHpmwCp+Re49oVZRpnlwy1CZQvmRfg/CatbSz9Ip6UuWvc8YORl6VNxILbaI1wP
 nqg1ELf9D/WoiI/Pl1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090064
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

On 1/9/26 12:29 AM, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> Change pixel_div to one to make the division well defined in the
> presence of an unsupported rate, relying on the DRM_ERROR print to
> indicate the error to the user.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cbcc7c2f0ffc..e4731c059ed8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  			       bool is_ycbcr_420)
>  {
>  	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
>  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
> 
> ---
> base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
> change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Dmitry, would it be beneficial to throw an actual error when the rate is
is mangled? i.e.

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aa2303d0e148..4f710b8e6bc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
        return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-                              u32 rate, u32 stream_rate_khz,
-                              bool is_ycbcr_420)
+static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+                                 u32 rate, u32 stream_rate_khz,
+                                 bool is_ycbcr_420)
 {
        u32 pixel_m, pixel_n;
        u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        u32 const link_rate_hbr3 = 810000;
        unsigned long den, num;
 
-       if (rate == link_rate_hbr3)
+       switch (rate) {
+       case link_rate_hbr3:
                pixel_div = 6;
-       else if (rate == 162000 || rate == 270000)
-               pixel_div = 2;
-       else if (rate == link_rate_hbr2)
+               break;
+       case link_rate_hbr2:
                pixel_div = 4;
-       else
+               break;
+       case 270000:
+       case 162000:
+               pixel_div = 2;
+               break;
+       default:
                DRM_ERROR("Invalid pixel mux divider\n");
+               return -EINVAL;
+       }
 
        dispcc_input_rate = (rate * 10) / pixel_div;
 
@@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+
+       return 0;
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
        msm_dp_ctrl_configure_source_params(ctrl);
 
-       msm_dp_ctrl_config_msa(ctrl,
-               ctrl->link->link_params.rate,
-               pixel_rate_orig,
-               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
+                                    pixel_rate_orig,
+                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       if (ret)
+               return ret;
 
        msm_dp_panel_clear_dsc_dto(ctrl->panel);
 


Konrad
