Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70539F0A36
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70010EFC3;
	Fri, 13 Dec 2024 10:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EG9tTFfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF5810EFC0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:58:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD45hQ1017168
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zCJavJQ71PqZHCYPa//4JL9cKiXxNPidx5M706eMzJ4=; b=EG9tTFfm2TloFuR+
 3E01OEJ9VK1ZzJceSpF3cGNO5HdcGNeHBhrWFukSPpRM2uJfdmxyAz9oHcS3UlMB
 t45WovcXkChj2msq6YYuXdTNft7aPcHmOEqkhpjrUBLwUFzoB9AlsDAJ44jRcct2
 mdoHuRUhDLcUV2RIEn7ixNK0gKNQ5PDy+scUaVI7pxp/7S0IQem0JBLydCc4J7Yg
 DHtIRYkyAx56ZYeRkDzwLQawVflhKcHX0YoxSKTGIkHPrt4mxH597yZWOA8sa3qc
 wCyW2Rg6bsHtrdCOq5c7O9bR8A1u0TwZnwUL5AVU3kw1y3lEk+DNL+uSUENP2XXB
 8s8QBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn11px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:58:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d8f15481bbso4614846d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734087501; x=1734692301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCJavJQ71PqZHCYPa//4JL9cKiXxNPidx5M706eMzJ4=;
 b=f4LPo9SZKJl7d/u8qUCAaI6JPHcYwdsgoQBMkdL+XzMNxipwTqQY4Q3eYqxsvcxjN1
 uUbp8jFmoWVPh3l8KT1wGljwsBz13T6TrEDqL81okUmOcjOHoq7PVtl78BJtbEprLpax
 WhbKihHAA/lFBx9Pb0TDH3UNI0+D5hm7NmVwoPZAyh9TtH5ckg0RsYivZAqX4VkBtsAJ
 pG7j7xxinU8LpNfDOSmdvP0G15vDLajrqqaln/aA6z8YaG2wxnDGQ/jdFVcczBHrUjdo
 Sz2ZU1NDOsryz0+rrO9diQZRbW6ZPHpmFHg6pzgzd9eJZQT3D08GxODw0PXAN+8IGZbW
 uNdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIFBL3Q4uuxvT+OGrvHRDR86UI5gf3AL4VEz3Q7H/fpLmdw8MWkl+FhDKofw/aR7/TDBAp4GksMlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjAPMgqDTZhnq3T0vXz1iFoXqBGwj4QFE1gxzpkHvlVhmCr9HT
 1u4v/JeUR8ILwV0roH7eyirs262tZLYC4+Kgxts+eChHRQBv0T8mawCsOzG+xMxrTAsOGiw1tuI
 OJKAu+rV+kntXLezk/spOTsNptgiWBPQO88m5KnKN4c/6ERiqckjLzdQSCmdyPf6TCC0=
X-Gm-Gg: ASbGncvreSq/a74mo5MRApFAko4j4BwK/BIXQq5Twbp0ZhMyQfxEUNcVjhrxEst/Ils
 Rg27hz9RcStKeGFoQCmsPkGDmA7kiAC13nEzzlbCrxjq4nv61tvcMBVAHZYGX1Hmtw7rQ+N0gjR
 j5SSc4SH7RlKUA7IuO9DAAQ81HSCo5gn/CIwacYlvimQE+SDm/qXLV/CvAWbVcre6cB2oSNbjrr
 t3U950xGGKihl0HPCdzVrKD+f52ZAKpCYsMkcEg6mgfLDzB9RYuM14YqOd+BY810/KRfrDn5szA
 +yn/kFjkJfn+YNxO1iBuOq/FrkJhu10bigIg
X-Received: by 2002:a05:6214:f0d:b0:6d8:99b2:63c7 with SMTP id
 6a1803df08f44-6dc969a9b25mr11838686d6.9.1734087501503; 
 Fri, 13 Dec 2024 02:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsGI6dtYfqNBiF9YOclKzsnUndifeUSlM+bUU1xm7lXts86DjAKnT5BGz3KaXNPyr6IOpU9g==
X-Received: by 2002:a05:6214:f0d:b0:6d8:99b2:63c7 with SMTP id
 6a1803df08f44-6dc969a9b25mr11838586d6.9.1734087501091; 
 Fri, 13 Dec 2024 02:58:21 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab897873d9sm23026666b.191.2024.12.13.02.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 02:58:19 -0800 (PST)
Message-ID: <0cc06b94-806d-4e63-ac57-9d9aed45a3e7@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
 20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
 20240924143958.25-2-quic_rlaggysh@quicinc.com,
 20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
 20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
 20241122074922.28153-1-quic_qqzhou@quicinc.com,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xVV5Hf5yKlHuyExY-USpgdN4lfGfzRWE
X-Proofpoint-ORIG-GUID: xVV5Hf5yKlHuyExY-USpgdN4lfGfzRWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=781
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130075
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

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
