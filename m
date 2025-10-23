Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CDABFFDFC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F278610E8D3;
	Thu, 23 Oct 2025 08:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwXrVfJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4010E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6aMVc028864
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K4NgzGTqEzB8dTS+vj4Q5OscJECbKhME9FM05+rA3pQ=; b=JwXrVfJnC5SxNroT
 GVflMBI3RAKRv0NmMCdJaWepOjMtALVL9U44IHHQeuH5eWAIDka1Dgcynx5pHyzE
 WllOeefifpEOemyV6kf1p9JYfyD64jX003N7sphlbqzsgU7N/RSMmCnmSYWg4MQS
 OrgxmNPg6zrQOLn6MMSgEyrwtWEfqjaKwGLfGP+1i97SD1uYEtxeD4pypUk6xnn5
 vnZnvC4j70Q0fuQBYXT2ac3I5QywqtnfY36RLNneIv7myopRelXimm7uoV64tvSo
 IcoMVpQSWSqmtlJCOSMKtpmol3quSrgUTvX69Q8SODTVWTwryzRwmdVpKj+ZhePx
 n6JP3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wd95c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8b86d977fso1460121cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761207761; x=1761812561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K4NgzGTqEzB8dTS+vj4Q5OscJECbKhME9FM05+rA3pQ=;
 b=ZFujBh4oSfs4xyO4fDX9b2qbzC+t30hXukwsoeE4A6F2qEA+MoLAwRtaoXDMRKjC07
 Ah1IiKWAJJp844cfW9L2xfMVXyDF8QNd5qdWThAThRNQVmvERZ1n+xvyGlFOOGbF7AdA
 E08zAoT+HEb/N1ZzFzhnuf1RgzTQZnc7wPjvRZ8n7QLOYHobM0TwJk2FqtdAw7bj3lMM
 QVmekpETHUp5aRFyuOChVcFf1hwdqJTkTrGIS2Uk/WnkTRudTgwWtcwHYV1L2roHcqyL
 yja49gZB9lZ94dtg7M6xVb3RaKa3PDLzq98EjZyPwNpi9al0jA0JZ7yXB3uJ4PmcIECq
 Fw/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6SXWybkMSRbwXISBqUuDG+uJ155hycUuvy5VcMLSnypsi5g6qS5r2ubdAfScrtJC6ME2GHytoSgE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfB7aPmNwv6by6oZVc7IJJzmk3aoxgsW1F4W4Op+zq4ZQaV91s
 7/eWk1u4iI8SONA8+FkJJEdq6RiTu7eckXGCiDiMzaudjxtVh7BW+W+27oWCsZ04MqSfkKrfttP
 5W0ZdKFkHLPND4JtxiAgpt9oBj7uMF+xxTOI5aeNaai9obfiWNs/JJzmB4fABhBHAIo7V53E=
X-Gm-Gg: ASbGnct/ETK95WQoFhLGjv+jrqhqHJMveQi6jsqxnrYM8poAbWJdUoo40N5CKbrx0lR
 +2Wu845erTwH+3rz1XXhundZ9BvXDGnBFLNQAylSUjR6e2anQCQlH/+rsGTwtSTouwrt/TEgzat
 W1PnmFsrrObHo9+1ou3wy+IfVd/d9kPgA2C5r2uCa09Zp73mit6ZlMeq3/R6UkhqUkSnYwlJEPH
 e+7K4H2UkBOdHU5RRl7lhRsVL4cOpbxkvw5czMhiHE26NeF92W9bqjR2Qw3qOKSL4d2OFKvYFLv
 AuNKFHiMwlRKlbcQbqk49lf3+x4JqVwEhj9Nq13347IvahtLnocF4j+qKswxSmMzggqxq3A9jAW
 izaQbG1EBJgZI3I0E5167pr9MZMz8d5HMSMUxr1hew7K6zt9QZ4NToep8
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4e89d1f94eamr202274461cf.2.1761207761125; 
 Thu, 23 Oct 2025 01:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEoh9odwgEcJ5K/DIdlUh+JcVJr4l9Z1HO2TW/KV5jjqHxmPJPsVObSKYBvA63wzdqXFK5BA==
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4e89d1f94eamr202274191cf.2.1761207760689; 
 Thu, 23 Oct 2025 01:22:40 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f3348cfsm1093740a12.35.2025.10.23.01.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:22:40 -0700 (PDT)
Message-ID: <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VY4RiUclC0xKUycQbNVJVmneBg0lWeuy
X-Proofpoint-GUID: VY4RiUclC0xKUycQbNVJVmneBg0lWeuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX+mpWroF2MWSX
 +VudE0Zy0N/hkrIqtatAXzTa9Tkb4MCbfg4TBo9lNtnnkf0hrpfeDe4DGd2ZlGMh0biQkRWs3dA
 22S1h/vdOcgTMYiGWXieFoaPME+WpjsCvzTlBm895A610LwxncymuaAanTWGLA3RlumqsxHH48b
 8BfBpXB36g6F2QP2Has9dSPHPRtDqguFiG816DfE3qZt4vzJ4YzHui6wGmv9aHoHvejImZ/aORM
 jFhjqV9FH8DWIjSDOa/05Dmyt6ubxbC3mlwkBFhx1cN0/H6zwwuOHkwuPtITiMGKpMyAU31LU9b
 LxObYOqk4eKgjPhufqJjcjAdHICJCPQZWN5HPdSut9evCP0kHqcn7OHWEofFlF9hd/m6EiOy6TV
 qiSAx/EkoTLFEyQ/DSUvTS110eghug==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9e5d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=91DCyrf_GaaWAzlYtecA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On 10/23/25 10:06 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Build the NT37801 DSI panel driver as module.

Yes, we can see that's what happens in the diff below.

You failed to state the "why"

Konrad

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8cfb5000fa8e..537a065db11c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
