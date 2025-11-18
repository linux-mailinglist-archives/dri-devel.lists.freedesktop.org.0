Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C308C6A2E0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178210E4DA;
	Tue, 18 Nov 2025 15:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9lpkOE1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMF0y3Co";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD810E4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:02:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIEHP2N623776
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hUrNSJYTmXMjoKKQD9ZpQXQjK57lxOnUpWoKKuPXIJc=; b=L9lpkOE1wnySmBQK
 DLzhtmybslY8dr0oLi5h3Dvu4iYKrvMm/0dXzVYgMYt43Q0ZvNXsG4J1mn6sdMEG
 6JvTnz2ygfgemLAEMvMVSx/Wji+c8ZnzosgHCs6hTQmc/+D08O1VjydVzQqQpb5b
 PSsolpA7wy9hYa0+mwjvqEizvoF76yeN37jW7rQmhx5qOjQR63+9ypOBPJHxV20j
 5fYG5A8HP61o21ecoPoq0PaMl6ZiMfVOhSMJr/r6oeYjDDVOb3yVuDMIr6oyLmSz
 XfwvSjAvuWfLpopyhYerQpGOrAolpEgERyUBT3Joz7L/Vlgkz+Ru6SnENItyULuw
 yYCUIg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfatw4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:02:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-559ab9b8b24so665656e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763478128; x=1764082928;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hUrNSJYTmXMjoKKQD9ZpQXQjK57lxOnUpWoKKuPXIJc=;
 b=MMF0y3CoU9p00btMZRvI6cQfqtKX99CYpwgqnHZ95k6VWEzWcqW1gE/FpAN1+xlD0w
 pbfYOuinicVx5Y2fbGNxWfZw4F6SJJUSCw60ceMsJOeoGBYM9bBM2Bu9EAjfqalmZyXy
 sywXElHSZEB1zHJ7zjgNx4AqourD/4f+ZAhpNi4yNc9OghpfMJWg5xkKbWvf53XorFDH
 KMYo7QOTq5hQKtPUJa7PrtzNLhfZQUsvcqQnHZ/+PTTOy4R5SK/GSjEVjKETjlCqMGYD
 ihmpVxD3O5hqlJAN3LLgZ05ctMmYL5tmR8/1Vg3p+pllRp3AnnUFwghP8GRBBvvSFLnw
 6+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478128; x=1764082928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hUrNSJYTmXMjoKKQD9ZpQXQjK57lxOnUpWoKKuPXIJc=;
 b=pYzmRmLxnQbioUj1epe0m0mrRECojAjrZnM4YxLT1180UygmLA3M5WAs/B9OUlJF3M
 yyx0YXW+xQAK+ILL2Qv23o9YDOm2jFHakp0UqK+dIaYMNVdBnQ0O2VcbsmDUVdWyN84n
 oGypP65al6oE7D3baX8pJczUT83/pitXzaELk/Pm9b/GvEKf0KPDavs4HQ2pmqXGss/m
 WCcMnb4QizVfAfLb7e0oE0zf8m3d5b3VLeLvTehz66Ys029KlUWLLLFXEvArIoM+NIMl
 Mrypw7bfOCGU027ziAsHT3NloD45NFoRki+oX+3hA06fuSz6kYDlyNj4K6q964IbGL/e
 6a0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMcdZSIX6m4OD+reGcXmhD/SnFcNX/zsil0ONmNiWApsAEPXoFv+f8K+R2Loi+Eoz5fwqQBpvommk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZcRTYDJi+nbxOl3GXVo6O5V+Cbrsr1g3RmioHoWsKzLsH4Yeq
 LMhwwh3u2H4NqfV7g5bJ4yR5cPuIuqJ9fC/oiuGRxR7oor4Sh0a2bJD25J64NWk23nZg6zC+2I5
 K+oWVKp1e2+zB4alDjZhSZsdCFWRTnaZvWVThhnegIyha5HRgHslWib+kfbWHOzcAhqEXbc8=
X-Gm-Gg: ASbGncsUtzUE36RZr0m1+TGNilitcT6tHf4+VOWJIRa/UVLJhBX6/RPlJZncAeS5Oqi
 3BW6OltaBEH3E5ESKjExBnLv+VH1Ifrp3IGlXGAKgVEFbaf3KdZkoGOX3ViZWW0hi40lHr2WspS
 KETzVYue0goG8mMSnXFH0wYcZrwQ1aVQzYRPSbBxPXXiDwKjL6GV2l7WHSTBZuWODyFT3FnU1GV
 BV7zXWNDiaoyyY4jNU/VjvAHqxPXjddxQ0lP6JoZ2PSlvrMD3Rb5YgkwKgXMKzLzu8pOHd1TI2d
 5engBgW65Nr9coOwr2KE2PGuRW9QLSTUPdSi5pljK7mxzxIdphGcZozjP8SPx9HTFYzwBSpILve
 tRpnoeUvyevGe+tD+//OptdqOjlbul/6A0l89XLV4LyNgzI5mw0L5UmOrAERZRe4m4jI=
X-Received: by 2002:a05:6122:c295:b0:559:965e:f563 with SMTP id
 71dfb90a1353d-55b6022382dmr294123e0c.1.1763478128169; 
 Tue, 18 Nov 2025 07:02:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNdpAi9psxKjHYX6MDx32SWpcDAp7KKwR/Qhg/KcXuexIH+OyCn//NR5c0LhHORUR9Ji1u2A==
X-Received: by 2002:a05:6122:c295:b0:559:965e:f563 with SMTP id
 71dfb90a1353d-55b6022382dmr294061e0c.1.1763478127363; 
 Tue, 18 Nov 2025 07:02:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f8767sm13141599a12.9.2025.11.18.07.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:02:06 -0800 (PST)
Message-ID: <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfXzmLekJOI1Cm+
 LydeSv0956yLVH4+ZmAYOV/XpyqnkVDzAN77tiNXqHi8A+hBcZUZRQmN8IkttO8ldRQwFG0zND1
 fDFYojqYmru7bztih/9FCBcIV/Gs/rDHNL/JyRQ9rHz3XarpBsKAXSG44ZOF5YL2RdZtk4vMWBf
 Btpy1/VewDm6so9hERkPOfIryINdhWolMkNfYebAXlR7RIrgF0u33sJ8w8bvJYWrOEs1FOB4NaV
 hXhA26/RKMdPFOlphMuB7CEvnQcor9FjBkle3Zs0hUXm5bhuZF8o8bJDXZPGeX6iAnnCsDhmeqO
 CO33wP39GgZBDD0jOAQwHgZEtMJW2hRF/HWjZA1Qaz/ZZcVUIh8TZ5IC7AHuTVjqg5tq5NMLoyK
 +NotBbPH5Df5CuJGfq72skiZnue+lQ==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c8a71 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=08wX0RkXSFUxxunu3nEA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: y_dJsh0flaIYSx7AiSE5bac6YUi6-mpT
X-Proofpoint-GUID: y_dJsh0flaIYSx7AiSE5bac6YUi6-mpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180121
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

On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
> callbacks embed knowledge about platform's alpha range (8-bit or
> 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
> alpha and reduce alpha only in DPU-specific callbacks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
> +	const_alpha = ((bg_alpha >> 8) & 0xff) |
> +		(((fg_alpha >> 8) & 0xff) << 16);

This begs for some bitfield.h

Konrad

>  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
> @@ -160,7 +161,8 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
>  	if (WARN_ON(stage_off < 0))
>  		return;
>  
> -	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
> +	const_alpha = ((bg_alpha >> 6) & 0x3ff) |
> +		(((fg_alpha >> 6) & 0x3ff) << 16);
>  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
> @@ -178,8 +180,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
>  	if (WARN_ON(stage_off < 0))
>  		return;
>  
> -	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
> -	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
> +	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
> +	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
>  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
>  
> 
