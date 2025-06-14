Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F1FAD9F1C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 20:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18110E035;
	Sat, 14 Jun 2025 18:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4BOk5zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF75810E035
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:43:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EISd67008036
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=; b=E4BOk5zds0DrD8NF
 shEEzA0umYdl0+l2QQoDtHcBw3muKjC9CdF0eGWK2JNLFxH+WubblyadPNBhyJDt
 pdj9Gee4bbCTyNCIlObEgpXkd7ae/0BTqpnVCZO3Lfg+SK3uhS8vvoWziYgusxa+
 AuIiZnsYaItRG+Bt+CubgkgVNA5IuJUqElDU9TdWnFjjt3Ay5s+kVdp3iQefFfX4
 NqnCqEKE6ZAA6hwZMQRhN948mAJzLL9KTH6DGyLD3iCANdTsO0kLGUGTATNwArcs
 AuVbw/3v8ac2hLPzkgBQSO6Z3HDhsqFdkZOOOmUYkmgR13zR9ZbL9JPWArBm5Qjs
 vN4WOg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcrvw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:42:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4a5832bdd8dso6732611cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 11:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749926577; x=1750531377;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=;
 b=lfZseFHbMZ6FVBridDys3VH4MEqbHlx80PcTbJoYNmfBL37x534OhUQTUD3s16ciBT
 F6AoVimeJzfYMzn31HRIPGXksy9f6OpGia1164R0UYfEK6N4xim7wjIq0Tv4ckoxsx73
 I7h85mTDmBDcZ+DBckVqsVVBIhMWc0rbHdQhELS0IWwltp4YcIaheeRFztDZM97ooG1S
 0qSZA4Qpm3+tkkwPedsFLp3CtyRiGa4dU2SyUwcGC0jrdA+5t4kAAtlYBFLWmD78xsg0
 8B1d6htey4QORKon12xI9uJAziB9tORJVHVu/zxwqF2M4bNN5pvfAK1E8o1bpGXB77Xr
 4UJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhYlaV3IGQWd2MkrqwmYVr4qUlxJZtB2uyROf7N4F0TG5euk50VW5WZ5uZzmQS3wGwbZbcC8flf4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN2VK206lswE9b/N942uPPVQh8te8jymcciX2zndGiL/k0OTbC
 PrbLkzINDAOH+4nNvgSNhh8EyZsOx3fpMRVvlAl9zNVevN9O0JE9LI1ok4LbPeeOi7yJyAGOuvL
 ytBRFpdQgqkvBN9J7zZiMhPP08Hu6JSWRTnHSjKtV6Ta+g2K2Pypg4aG7cAdShB6bggSSjSI=
X-Gm-Gg: ASbGncuubVjXAA6cu5FpCjNNcf5M5vJK3kGXMkqL4QF87rLvGqsQ6ZR6sDEPvo+TnYy
 MiEg0b+kX6mGN7X0KaujB6ljf5Bmch/GOT9PHKGfl7wns6oWBdRyhHpsFx1TTHj7RGlKtWzhXAB
 XBiyk/APv+5aJULYRa3xZtFB418hUMx5zCOgjKiJwgT0rsRmzQr5RKnqZQ7x0ziviXbkDvyiOYb
 uo5+fz2WCqVt7ZIpA86ehGYRxPykDE1OMefdg0l5MQfKYaJRt7R90LktOsg/C4DgFXr5z4jwDH1
 RyqGev0FkQ4nNC2Ytz83UjOjBI9wZrOE/jrSv4NbvWRCbgy6kNB0T2dndk7h7HAhCGcMhYKY89Y
 x7vo=
X-Received: by 2002:ac8:5d0f:0:b0:4a6:f809:85d6 with SMTP id
 d75a77b69052e-4a73c568fd6mr22438921cf.4.1749926577329; 
 Sat, 14 Jun 2025 11:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkYi18BH9yEJbdfQSZZnPYYS236AqGcoTRf5C7tWQLhoDTwPCEtKNQkvCzqxnaF0WVubY/jQ==
X-Received: by 2002:ac8:5d0f:0:b0:4a6:f809:85d6 with SMTP id
 d75a77b69052e-4a73c568fd6mr22438731cf.4.1749926576868; 
 Sat, 14 Jun 2025 11:42:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6090063ff9asm293673a12.21.2025.06.14.11.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 11:42:56 -0700 (PDT)
Message-ID: <29f1de05-0e55-42b2-9bf3-894bf4f07808@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
 <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NyBTYWx0ZWRfX10x4T9HUpe9y
 v+c9MFaAa+Rdeu7iPBle8R0qWeG9qWREXK6CynSf7+zw1/NinhQ4fIDCuYLudGK6b8JdEQBApub
 JwmvY2WWN/dHIXMNAnjrMLJl2VteyQ5rmm096aYXhPwh1azQU27G15SO5Y7XZFgI0JXx+q+brZ/
 /8ToYojMsXL0iwJ4y3UIuk7IDy88XXuDK1WYdKzSwcLbiZNCoa5O4RT+g+B7iwtTMVfzRH3z8Ws
 RYVPcmJ3czB1/tCSu7KHNsTnrUDUaslo3ElUOvyDdKhcBdQTxQi0hG0GKusdDhO8tNnNFgBeTZp
 fe2XhFVFEDHphpS/pqYLtDffnfthH457dzi1ioFxEkEek6udIFohcmE/KRloqa5+k6kotu2eYuf
 ufzscYCUEhSxry6i//IBfueI9ngZSn2D3/kCch9VgVJrcjZAd5zPo3MZixRjDQUjLK1IBYzW
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684dc2b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=phG8Y4mLfM-ETw-KuG4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bd3uWNfgOKHdiPTeF7bUNTnOr2Dl3wJq
X-Proofpoint-GUID: bd3uWNfgOKHdiPTeF7bUNTnOr2Dl3wJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140157
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

On 6/12/25 11:19 PM, Akhil P Oommen wrote:
> On 6/12/2025 5:32 PM, Jens Glathe wrote:
>> On 6/11/25 13:15, Akhil P Oommen wrote:
>>
>>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>>> version). X1-45 is a smaller version of X1-85 with lower core count and
>>> smaller memories. From UMD perspective, this is similar to "FD735"
>>> present in Mesa.
>>>
>> Hi Akhil,
>>
>> when loading the driver (still without firmware files) I'm getting a
>> speedbin warning:
>>
>> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
>> missing support for speed-bin: 233. Some OPPs may not be supported by
>> hardware
>>
>> I've seen that there is a table for speed bins, this one is not there.
>> Tested on a Lenovo ThinkBook 16 G7 QOY.
> 
> Hi Jens,
> 
> Could you please try the below patch?
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2db748ce7df5..7748f92919b8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
>                         { 0,   0 },
>                         { 294, 1 },
>                         { 263, 2 },
> -                       { 141, 3 },
> +                       { 233, 3 },
> +                       { 141, 4 },
>                 ),
>         }
>  };
> 
> With this, you should see 1107Mhz as the GPU Fmax.

I see your dt entry takes care of bins 0..=4.. this oversight worries
me a bit - are these values above (post change) all in sync with what
you entered into DT?

I'm not saying they necessarily aren't, but I want to avoid
inconsistencies

Konrad
