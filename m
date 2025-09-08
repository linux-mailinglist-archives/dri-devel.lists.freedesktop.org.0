Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC784B493B4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F3610E172;
	Mon,  8 Sep 2025 15:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFIdD8hN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8B710E172
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:38:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xWrB007791
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 15:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7VfDo+K2YxkxcNLtYJDXPL/1mkJcb89EfTCTUVk46hQ=; b=GFIdD8hN8FyF4bNq
 dhcqYmW+iPIZ8TBq67UlEy0/8yzA3wwwpTrRyxIPuKOEergP7gnMI0zpbK/dn29f
 XRqI7AbVN8X2shw6sNLMD/hNfk/37wp2yktw8PqpDnEJ+CHz+tAX+NK9hKxUE/iX
 Kr+pkHyJSI6G7+xZ0d9oljO+hlnTjrVP3RZJdx+KAHb5Wy0Qoo5PvDrYBP1CjupA
 SsTpnwpGbRKas8Ag+0PqeB+SX/1deC9XXir53r5AfC1C3MEhkFeKQBffcu9Ydqv0
 gcS5sXoIN5Op9wOfZIvAEuhjF+sMleHovORE50aHAyTAUXWIR1EO+MLGC7xvkljz
 dQJwjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8d2n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 15:38:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f15a5f3dso6676171cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345884; x=1757950684;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7VfDo+K2YxkxcNLtYJDXPL/1mkJcb89EfTCTUVk46hQ=;
 b=KPUOgeJXkAgpjmZ1f4VKpYcQeMV3HI00pvzuRYx0rrthwCrxYnSW2qIf6YEKjcYGc3
 XaEyEIM1XHVIqZ0QUfJqEKH+vJcEpn1ef4s/jb0MAmytYizrY50bwkyl17hdo2EX0fev
 H1/nOLgqp6GTe0o65EmoQXDL8hx2vAM59LTrgedUnsGdLiARGS7e1QfRETLG12b+Itt2
 O/IRW6naUGiUbf1ZSRAVhYWi8MFLkd/BUB9W2ZqA9yKdGgLZ6pqF68u2W5t4F8TFcW8j
 tzsfVlrdTHoxfVJ6ra4zGcT9X9Kwq0dotTsOHsPG7j/4Cu5es8fmmjl+FQmQgoPBVAo/
 BH7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV0I0kDafjjDrbhsLUM9hmXFYQ0Sn0GYppowtr9syeMWywRc2quJvpz+hQz/+ulhmQ5b8DTNK4XpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2EyBOcfMUQQWHvVcvt6F3l+8GEJWnTNaz/bKihDvZK5VUFH3C
 9Lq/xOJXWfPY+VnYft3VFOkpVT0eL3khtM57Dej+9lwWlFcmzJAtP4vdRAalT7H//rVb9bElceF
 Uxz5RKd1wsjI2IJ9kgMbSHN5lZ/YyEoICrq6srWBagedzhCb2/XI26Nml4qR9+ZvtDILt+8o=
X-Gm-Gg: ASbGncsBAxlJSt5lXx386VjqDVHCiefJv3TyiNQi4/TyKX9Ac9+s3K3GEmlPfwHFXgQ
 SO3fU7fDP1g2C6q5uDrwDUYf1Ez5tMP0YtOX+RQXYqfvUFHrSj/J2wWYTPLSYZj8Yue/niOqyHW
 2RH3hPME6a/kLtiwiYPPL58JSJeejw36Gmd/M17KbQ8KdkSIvevtpdE3Og5FmLEy9fjQuOT8hxa
 hBuFBM9j0X82ykPzOv/DskjyLT8qGlgRlee+G0ufKS/z6QGpV4CVvBnwqd1slj6ac3kDJ7RkV8K
 wotX9GS2rWYg0Go8I63rDEK0B2VQMOWjvUUc0yWKEztwsfzS1tNyfl0zBw7IOHM86WBkp2JSk2S
 FzHZVjqutx4hx0nh5Vwegww==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr58304601cf.7.1757345883533; 
 Mon, 08 Sep 2025 08:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcsvpKBaQ4jCcWP5NtvuePywTOTY5oNYfv92gdyrYQkqbJJAvrzNLEIVI6ZIbznl8lDhI5wA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr58304161cf.7.1757345882765; 
 Mon, 08 Sep 2025 08:38:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0d9b1b53sm2408307666b.96.2025.09.08.08.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:38:02 -0700 (PDT)
Message-ID: <59ac7827-6258-4268-8b71-4cbcbad859db@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX4HWZZcYFuOT7
 mwcqcnzWQ7IFB+CYefH5VFZ+PEh0rU1iGTkzQ+hIp+lTpM9d5q7MMkL5stJZJyDiT3yQHb2Xm3E
 rps8+814slEEj1uWyvidgtQnTImPiYARrYNg5p8JcoAEzow28krkNNJ7Yfg3stcexuXOfsYMfoF
 m53HLXAJ6dZqtrjt7M5kAmjnpVitdxUwIZCRwPG2YRzJk7wxbloDh4+GviRo2BPYzGepOhHHd8N
 7OxVAX/b565RjyOIddPeM1O7OVQmoUpaG7tsBOZrgBNuUIP49K7wr6B8ei6idBc7wXM6TxGXLhv
 8TINCLSPiDpZspNctqkEsOxS7JV0b9I6936vPMQBPiC3hBx/TY4v0c+In64OK3wroBDDZbuX9C+
 XAoBHdtA
X-Proofpoint-ORIG-GUID: 9akUxtAr0ZMlchBr4d_OLC3ejE-W0TAp
X-Proofpoint-GUID: 9akUxtAr0ZMlchBr4d_OLC3ejE-W0TAp
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bef85c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sRrLox2IjJLVq2cxUxUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On 9/8/25 10:27 AM, Akhil P Oommen wrote:
> There are some special registers which are accessible even when GX power
> domain is collapsed during an IFPC sleep. Accessing these registers
> wakes up GPU from power collapse and allow programming these registers
> without additional handshake with GMU. This patch adds support for this
> special register write sequence.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>  3 files changed, 90 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
> +{
> +	/* Success if !writedropped0/1 */
> +	if (!(status & mask))
> +		return true;
> +
> +	udelay(10);
> +
> +	/* Try to update fenced register again */
> +	gpu_write(gpu, offset, value);
> +
> +	/* We can't do a posted write here because the power domain could be
> +	 * in collapse state. So use the heaviest barrier instead
> +	 */
> +	mb();
> +	return false;
> +}
> +
> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	u32 status;
> +
> +	gpu_write(gpu, offset, value);
> +
> +	/* Nothing else to be done in the case of no-GMU */
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return 0;
> +
> +	/* We can't do a posted write here because the power domain could be
> +	 * in collapse state. So use the heaviest barrier instead
> +	 */

I'm not sure I follow - what's the relationship between the write being
posted and the power domain being collapsed (i.e. the hw not being
powered on)?

Are you trying to get rid of the delay that could happen between this
write leaving the CPU and arriving at the GPU (which would then be
woken up), so that the 1ms poll below has greater chance to succeed
because of how these "special registers" work?

Konrad
