Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08BC7B8AA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 20:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD46210E8F4;
	Fri, 21 Nov 2025 19:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ7gDnR6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRAhkBzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CA410E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:36:14 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALBt0Ie2841430
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=; b=FJ7gDnR68uMEAyJz
 nSmtdm/8fFl8SQCkfhws3tHJom8LegtPc9xUeg0HXY/Ym9jxeBxuYDhnQNsNjJQp
 F6kgjqThSQw4xIWL3X3uFN0pf+9w+feV869TPxUVrgj+WrY52EpSYzT4YkuKbRU8
 juRQzVr9jKcGjnWMlY6v2ps7QAe3dSXd3LYGqbvgps91uckgtQMZ4YcsdhrafVBL
 +hdfXeoif0GRvOKmuA9UVE/ynjXyKVrJxKCPsQK3grhm08hzRGyMd+lvVdiIiapJ
 GC76S/qGACUJY+bR5U3umLVbkvhIqNjN1uggcfiguO3fPBrbPl3WXCQROQzkUD5y
 1qFKBA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvjrsp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:36:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee05927183so5737771cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 11:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763753773; x=1764358573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=;
 b=CRAhkBzI0100aLwwcaalDQrF9hsMBf9OnNSyBj4ChDEf7H8oQsxu+mr4Ipl7f6lXzA
 MEOkmxW6tPY+T9ATbKZxw9q3DtgHgIsrr+TOy5ggC90H0FjuTXe6Y/Z2wyMpaILTAwZ7
 M2yPvV8f4+1yj7C/mvuGUCN+nR/48UM7wtzmZqqmRLMEYRIOPjqu66ssQ13UvENc7VrL
 Q42RzlK+p6b2TKQ7WQfCPCxdCpG2tN1XSkkB5GMmi5XIpl3mWVKBQNSkpHOyF+hmykC3
 vuubuMQRHtSn4X+MdtBqt6Z4iBcra8Zxvalllwm0RXpWE3FMywc11B66bTvS3pWapsbV
 3K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763753773; x=1764358573;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=;
 b=V8jJGqU7D/J1VbGi8YIMOykUiEpxxSyTrySGjC4kMlUcBdbKT8/5UuvuYlejU06TNy
 dZSHC3n+uCnkwHwGB2mVQB0qZ9q3mur6A59RUzxfSqqExfYnww7pdJGemFBIyyIAARI+
 xewREClSpIb/f7vV/OvSzAc4aIDXzbw8ek9kzgVkSApPxfZldg6aYx/NHoxJf9YWMHJu
 PZy72FuER8jI/XMd2EfVwJl7b0Q8AKcnguxcEpooc/+rgckd93P2nIu2D4XhKd0rFogq
 izNyaF9jrKFWrP/ihGUROslDKvVx+e6rCXY18J+2eLfh/ALVbEa7IhFbHAOb+3Ewrh5R
 fTjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP3d70H7mHOde5p3HzeUN8wyl6wDqo0iUyIwCvoM1x0Xa0tSvhezvQSTJ3/wzRhtQ+81ByHGrH+o8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN5zafa3GNhERkVnJMSspa0wCJFm+BTWRtY7zldEL+eUZ3d6Xn
 xcZp+9DxibOl4CJAUdLrS9DMYBXmdGKJ8XsLckVosQdo1N7CsMbw9AYF4gNCnpLI2Q/oOJE74Kb
 XXrKKLMEtqHmH4DrgGTe39pKsUt60XBOrMu5WxECDAhro7rWUQOr7+ZjZzEnvKgYiT3DRESQ=
X-Gm-Gg: ASbGncsDYffVWoEgqKs/lCTbTFrgUud0UM0HlJYRufr5/uSPiWqKygtkXV4QLRaCavQ
 LSWvBSNc/Tt6jREzE4o6dN8CUnjBtN9h4tF3ol1aMJhQRPm2QKlTolf1YtJvuidtb6DxWlNU1U+
 u7qbvIlOSJg/dteKjpA1+6LAuLb9iiA0u9KQi+ytqWFfytcdQ5Ry/exHEDndkdwHnBsEMZyp4n5
 NLn+Ipn6aI+kMj5Ijphq2Cy15YZCHeZlMg+Rq+NUD5ZvooqeZiX1m4HJKWOvBpuz68PIBuU3K8i
 PLzWVImLaoU1lv/+v1P8231lGOAIwKcwZ++9dk0RX4AK/bLIBy1kRC+extbEtef7XpGquT2VDZQ
 xZAhFbLtY1wd0M+Mx76L6LWNJWvQkXn2apSDQIBfB3S89KXH0LSwhDwK+752MaqHbVe4=
X-Received: by 2002:ac8:7e86:0:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ee5b7cd506mr25736261cf.7.1763753773432; 
 Fri, 21 Nov 2025 11:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY9s0z1teqxiBYPmhtD0WstyGisah3KpFja2LwxDn3PAOwAI9PpAIasklAbMLiLD3zuXJGRA==
X-Received: by 2002:ac8:7e86:0:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ee5b7cd506mr25736041cf.7.1763753773065; 
 Fri, 21 Nov 2025 11:36:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d73e6csm537409066b.25.2025.11.21.11.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 11:36:11 -0800 (PST)
Message-ID: <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z4xGvWAqO_Grv5RSsAiyKLhXx-BtsqTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0OSBTYWx0ZWRfX5UeBFW3RpOHR
 TAMxh6I8lUv0//D3dK7SBzjla44+JMT1yqULk0cQrAj9p/WA3Mxy2x6wIx3ospwRHZHCBkvK/+E
 hMF3z3cYRE3i3WnI8evCLM38gPFTpjp+xds7lHP34/htPBuaLKeKNpDDZQDjGqGVMQlvoFAKr1i
 AeADt4ZWJN0X4BfYbhr43CCTosL7yA/lCVIO6q009s1BjyD8L4OHJGvj+rLIdc0PKGWGCYzjVok
 VTBm+EkhrC17e5leNDeUBWyp30omB1eQi0+XeBxcdnxDcrnNAb9tyZrJbKYVQ0i5s7kxha3lOTV
 XuhtbkpQA9AaseaX+LPEWzpSaRwMuUNygEdEN1IexnypnzEmmqTercqHU1n1dni3d1G3ZFsKrpe
 kozrwVIrn9Rjsn6QbjEiv1ZpCQ1oFA==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6920bf2e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8
 a=bjsXyR8rEHG-ykOKZpAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: z4xGvWAqO_Grv5RSsAiyKLhXx-BtsqTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210149
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

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> Add two remaining bits necessary to enable Adreno A225 support.
> Note, this wasn't tested on the actual hardware and is purely based on
> the old KGSL driver from msm-3.0. For example, running on MSM8960 might
> require adjusting PM_OVERRIDE[12] registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/msm/a2xx: fix pixel shader start on A225
>       drm/msm/a2xx: add A225 entry to catalog

Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary

https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c

Konrad
