Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C2B44A17
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FEF10E031;
	Thu,  4 Sep 2025 23:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndKRIeWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B61310E031
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:04:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584I0vNP031818
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 23:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JTGAHvO3dzWq+EoS5uNJA1yAwMH+0tq3Qa7fTg/qeOs=; b=ndKRIeWUxsKm4r9B
 fkR9Vy4opdUjNOAoEUZCVRmZlDZuAKklzixJtOmrH8fKyqYbXmyPWsPHQTY4SUu8
 MT+ksulpUrWVX40qXOYEKmL8Uw65PveiomSAnElpPjGbMaIfpwYpkEQpNB/6usos
 Z5G7xCR+qq/3q4LOhnUrSWMzF2GX8243GvuRAQaRe+UTYI/JohHQaXBWOw92Fazw
 YyeTL8VcvQnIPFKZoNSd8lAw3mJ3sS475UXikkpgQGiiExFkGvH99JKsOCwrdDMF
 ktZxVHPlcAl96ALRYvdQ78+GwROlQzZlxiCbmFg6dM376m/I/KTwlsk7IMzEqw8T
 u0UWyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw09717-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 23:04:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-772642f9fa3so2479347b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027078; x=1757631878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTGAHvO3dzWq+EoS5uNJA1yAwMH+0tq3Qa7fTg/qeOs=;
 b=JGxbHDo68QoBzNCzwb5vDc0kLvSCraa6cyAQRciJ1uFtlGN2xZi1ieSOMee77pJIl0
 LdPwjdlT6J+xBSJu+Cdynya/QxoPc4FIXl6qSZlhDEjlsjGdcqEU6EU/KWAbLq54rI/t
 /j9t0sSFOP2XVg0AId8yIObAfC9Y+CamImCsF7919OTZyZOJnG2CXgdBszb1w7yfrXew
 +ZMpyqhLWM/kzdDTz2TUZhRY1PZu1w2DmWVEpIIPkf6a9SCo/S83ROxbUlDZLBxymqQ7
 MzvzBZDWLEtSoBJSQAUSDL/MEYo8aone6rzb42zg5Uud0aECh0mad/lAmXD0CoXaFcva
 llCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo9nV/2RWXG8y9fvqUVrXZ86DHvfDwTZS9rMNHEYATCjZhJ5ogn3ed85OQ9J+TCKpO4v8gkakJJ08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUh3FAx/jbR7OxqwbG3in9UkmpgUZ/YTL4neK2KmY1DJ7G0y/j
 2PADXcStSy/xAdwl7UeRaS8g/4iei7mD0K3RPJ0yx4Zz7AcZ0Cc348hj2+x6LXWbjMHzN89Fkih
 3l2CYjytzCWUTM1Mxg7xHo0b71Y+MSVybze40nbOhUpjFEtRmkP/ub3aBvhkwLK/w/28sKzM=
X-Gm-Gg: ASbGncvaNsWzcGy/bEKjAnqMHd/dCVFdjyETOXDvV28wf8O3LN3OX6mOfhYYoTCtP6k
 JFfKtakk8h7tQXVgvECm91nYaNXJvBWhj64mWtlbPUIYiV8QvLlzVk0R0YOUpx8FZACH9fZEjcq
 zHhZirWD32fHxo8BC2g/Q8pt9N7UoIDQsF32VQ8ANkTsZK4HqsGIzPxvQZ8FgIhZqpmBRn/u86J
 zudI5Br9x2uOAyEIpHC6Hh9XoWlVRFqxnnHgjtZoOcPvKGdVjP9rMXqsRMibRNCjxLU/z5tDbgu
 B8NkE65+A4XjaZ2+a9RAGMlz6gTg8XYk/xiCcLqlDpy55p59WIPW3b0jsUCkK9+NTaa7Tv6GpMY
 tyofLVZbr5fINf9jvuPJ+Yg==
X-Received: by 2002:a05:6a20:2585:b0:24e:3021:dbca with SMTP id
 adf61e73a8af0-24e7cc21f79mr1728273637.4.1757027077751; 
 Thu, 04 Sep 2025 16:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+iA5dJCDJ6EKl6d9KKQ/arjY5Bfhgn5AoMxnI2wmHjrjJTPiDNbZX78JO/uNCpw5DqrwAAA==
X-Received: by 2002:a05:6a20:2585:b0:24e:3021:dbca with SMTP id
 adf61e73a8af0-24e7cc21f79mr1728238637.4.1757027077247; 
 Thu, 04 Sep 2025 16:04:37 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4edf7ed519sm14309145a12.28.2025.09.04.16.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:04:36 -0700 (PDT)
Message-ID: <7ac0c9f2-754c-4ba3-bde1-fbde9f3aab33@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:04:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ad6A3vIhQVnoRA5o0bNQcq9mqbWJ_Dp3
X-Proofpoint-ORIG-GUID: ad6A3vIhQVnoRA5o0bNQcq9mqbWJ_Dp3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX7iM2GzwRIT8S
 8++A2YRoquHwjAqDpFMBA56Jl/rm/j63+hBjDFnSGHMyuTjL3ptN3i+9QYST9nhptLjYxX3xipn
 /TSAz35JdqWbemUBaY/o9nyUMvsvXeD0leZrJBhII6+7zTAsFpOXOlUFawoi3LPE4MmaK7LZplF
 Uc1lj7gq/4mxzCyIWOG7uBZ2HjVv48QOUs4zsBRxg+VkGE8bsXtSWfGsQJby4SGqa4bmMQXjtPI
 ey6dvvr1nuHRX3e2fM64BAlDf2SQTUGIjCqEarmIKrMrvOwebFRn7bOt6+/BS1Bvj4E2X/SCuvG
 8xzqgjb9l8Z3fRPBlk2ICWt1Ike5tzt/jUvSHK15Oj25MWoGAegiKbjPlrJgBZt9wMxdcelp+hA
 kBNym8Hd
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68ba1b07 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=djW4e6U6kngvZURYzKAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
> -flg, fm, np, th)                                                          \
> -{                                                                         \
> -	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> -	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> -	.alpha_enable = 0,                                                \
> -	.element = { (e0), (e1), 0, 0 },                                  \
> -	.bpc_g_y = g,                                                     \
> -	.bpc_b_cb = b,                                                    \
> -	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> -	.chroma_sample = chroma,                                          \
> -	.unpack_count = 2,                                                \
> -	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
> -	.num_planes = np,                                                 \
> -	.tile_height = th                                                 \
> -}
> -
>   #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> 

