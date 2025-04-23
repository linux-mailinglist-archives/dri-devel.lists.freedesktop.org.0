Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF57A989C0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 14:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C678E10E65E;
	Wed, 23 Apr 2025 12:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9M+wcqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4543210E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:25:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB5FB4014200
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t2kUl9QgvO/uB6b51hcAn/oawqIiVbquzPdGvE1gnSU=; b=H9M+wcqITMErLoAk
 nCZGjwKmkqvEHEVExGXss+3rF0Imtxhh59d0youCTSamwjbJnF4KWRQ7zUSdrdE1
 7TFGsNEVGYrvgU7GPSAkBGDhcmdGmW2kf7RFQOwCNIVYuHFB/axONCL/Xpu3mDzY
 x5Sc7cM/yN+ay62Mt11+v8EWNlxGfYR7Iiyl7WR0pbqkoeRaFRop8CyqcQg0fBUO
 5rRqoS83uZvcyLewGFkwOjxhZCC5kowdwcsm+9Y2rdMRdGShrSTIn9AuW3YzTmUA
 SUA75r2+1394TjRCzieHwQ4D8c/GDx0lp7SRa45EexVwMcSepdKPN3d6A+Vaiv/i
 QCr4cg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a2ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:25:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8ff8c9dcfso16335946d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 05:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745411142; x=1746015942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2kUl9QgvO/uB6b51hcAn/oawqIiVbquzPdGvE1gnSU=;
 b=wEf7ou8bBaPzEdLxCMCamkNZaxXWdBq365C0yd6e/bLyg/xln09Zkw26g/foSiMCEG
 NUAV1+u1NPmGF0o31KDx6Tmw4KaHqSZ4CqEClYaVTk4lymboAqsHMbFLh+lscc2AHjqD
 2e0lc0Z74d13bAVDzegGAMMN+UDoKZdM+c2c6kjjITzDbNhZ0qAa95pt8gJTVn721+Vd
 DtagnWa6h9JkqolabOgU8d/7XHZhwHo9ZwS9/weB9ORC55FTrdxuBaRKNt2ohTtMq/4J
 EXKqhbia+QQ2uiFcao4k5bnpfrNcXYSU4bXXJ6UndWgoCzn2Ypsqcvgt8KC7Ssm5Gtfe
 BWkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz2HQH4jzByFYiqlxLJuVop0trXP8JLjTs89zq24vGl1MUxry73TQkOeXIiKsHH4+byczm2PjOOro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZQn1AN+WwoLA+YKsBqml2t+aMTJM2mzI2+8RpBifVLlFXHerp
 0oBFtj7d89MiG2KQ0KxQ1NrzJtljSqGwod20HT0JAbt8rd4tXJo8T68K3zlK6qw8FD4hq6ARmMi
 xXNGUTnhc9/DqEnNFltkaglRFC6jx3qfOEV/UeLlvsGkzmNyPk0GDfTdTI0azMKhreu4=
X-Gm-Gg: ASbGnctscixFLUoKPaSqUupPotiNidl89ZS6wdqflX7LLJvcVmmiRKhHSByA993H4xX
 e6UDX6aZAp9f5B9OIK282THEfqXTla1g01Vgx8ypZvnrJ4KEwlp+eLIVxsjV3d8m9m296ViouGT
 N7sKuLsUII/wl+VkJxc9PCxHC0yr7TrLKOkmx6GmlouR88QW+5596neQlVTwJ3eqQviYjUdsTWg
 soZbe1W/omYWJx+oSIphmtqhUBTka1N/CILmhhKpRV/3DsIhm2kr/x7nSvUlHsUtJ0pEviRw1JQ
 ZXtwcZSdGVQtotGHpO7V7MRDanK+a+scHAJCviTDmuodrmcEdN9TTy5v8UC5KQ4QoDE=
X-Received: by 2002:ad4:5d68:0:b0:6ed:122c:7daa with SMTP id
 6a1803df08f44-6f4b4715783mr16543946d6.4.1745411142437; 
 Wed, 23 Apr 2025 05:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8oXZ9JnKtVNQzSjdw+36R1Viqv7RB6F1PrfW3UoImxkzoWPf3HA1/z5215kcW7wchhdalKQ==
X-Received: by 2002:ad4:5d68:0:b0:6ed:122c:7daa with SMTP id
 6a1803df08f44-6f4b4715783mr16543846d6.4.1745411142040; 
 Wed, 23 Apr 2025 05:25:42 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f6255778b3sm7388108a12.19.2025.04.23.05.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:25:41 -0700 (PDT)
Message-ID: <8671d7f8-0d41-4574-a0de-aa40c1ed3c0b@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 14:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm/adreno: Add module param to disable ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-4-8dbab23569e0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-gpu-acd-v5-4-8dbab23569e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NiBTYWx0ZWRfX4F0uYdbfcI0j
 QBcci0+J5CVwQgYIFFmo4859BbAsbWN1unVktLNuxxvcrENqPXiK/x2S2Uh48JkW6yBlox0NRsp
 s6DVAMzHl9YI0ujIa8RO2f2aD4FvELtr3T+kzJ9Dv2cdSjvWuHo+tCt2mnpeJhpIoBrRlsPD7rz
 qTxuu0U4gcIgFY4tKH+Xa8QUfcWvcMuo3pyV7RwEo3HPAKFEUjoGv3mVxji7RatwXX8/1YIZIwh
 9/SlSBw4gALoaz7f9FUu7mVk6ylOHs1T+VHR3lx1uXZvrWCRNhZPbwFzXQDdUmfg6CauPk/HfOj
 8RE9odsD7+vS9xCAoGwhXfjhMjJ+8gG0PY9m6SP9ihvaRxwlzUyuBwl+uEzDZt8aDReDUOwI/Ta
 +vQk56g2fLqrNkweX4xeWueXDqeXO4+WjQI5JWMwJasliIBxAOOYk21FgkJtbAD3PaFh7bBA
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808dc47 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=T2YAUAM4dRpUgQIxx5oA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: ylg-NiEArwMSoM3zTVUeiw8rZVsBzlLd
X-Proofpoint-GUID: ylg-NiEArwMSoM3zTVUeiw8rZVsBzlLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230086
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

On 4/19/25 4:51 PM, Akhil P Oommen wrote:
> Add a module param to disable ACD which will help to quickly rule it
> out for any GPU issues.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 7 +++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 48b4ca8894ba38176481b62b7fd1406472369df1..38c0f8ef85c3d260864541d83abe43e49c772c52 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1670,6 +1670,13 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret, i, cmd_idx = 0;
> +	extern bool disable_acd;

'extern' in local scope is.. rare but sure, why not

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
