Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6920B0F3F1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BF810E7E0;
	Wed, 23 Jul 2025 13:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSqeGXi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8BF10E7DE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:26:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9ZStY027816
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v142A/UiqMfzDvaGD5c3CeLLc9g8lfXOT8p9oEHfIXY=; b=YSqeGXi1Vz8lf0zh
 KGMJFUY0vfZUHkLHZsEdKCduYiDKKcc3syvCxisEs91VtIwfAgZ0oQlDtE7xIgAd
 /45XoR8/s5x/ehKlNCD+hiWsYmffeysN0+TxsTkKhVogfKarr08MXEpf4SPz9DNS
 j9k5DVKvivbzdKzYyS5YMeh70JkrOXQSCsPj20/YlsaDDZjxh3EibolI7fJlvCNc
 xV1O036CZJq3YdxSZt4AezOTC/5xi/Dm76HXR/34cPadz9AP7B3vxYkjCZjnEVgq
 DLxytAUt71JiwyqoZdQtBQ9/8Vh8X2tkbblBG25/kkitU9t1VbkFhJfPO8KMig1u
 bl0MSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s59fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:26:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fabbaa1937so14329016d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753277214; x=1753882014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v142A/UiqMfzDvaGD5c3CeLLc9g8lfXOT8p9oEHfIXY=;
 b=V1TFo/WDaLtm6ogxRWnDZufzAtPsMHEXA/vMXND+o4ErhYxamM4JuT10AMTcbCpF98
 q9mTBEjfKuvzJDJBE+jGrWqXR7D88MspzjPyS4a5rqAnIQ5aBuGyfK+4fk1zaeaj/zDj
 dEsjcNoEus8cJg63xq/dC3+CnJNB8DeBKQREyJheUFCYIp83HAFI3+y0DtABpcHFe9cQ
 Kqypb7G7S8Dtf64Fkw1uLR7f/VcSvPWl75wt2S3kI4y4CrA38j/unpIEQNCOhqm3GcT6
 BgPvO0VhpqrCBDSKzSzNQUy4ENCfqszHCvfu+AyyKEox2LKVyvxtEt/LTzKBc2MMge1o
 EZfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUyrpy7nwG4etjSIuZ814pVhK6gMnbgrnwaytimoYzegiLkM3i99UV/qikUbjQI7V0v7W/QZ4PONU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD7Yrlv5Mwnvqxc078JmbIybHQecQ/x8ZZRI2GXhgVSFtRxo4j
 tqRz+AWp6W+Ei01i3Pz+v0FHg3v/Y/TU/c+NAnriU/6QcZQtCmudKOFycTNR+LMUHxYAqnKgkSL
 cThXEtKLlsMIjYo4AHB1ixmpm/tjVyteyA+F1V0IZJ+EZI4UA2iCEzQsQNyWwcRhSDtL8ef8=
X-Gm-Gg: ASbGnctejKxqoxxs/D3TPpNPksoWV8DOTlcFPjHViCRNSRoYhSxH8PZ8uXGhhk3g2xr
 W/bGRxHA5u1jASL6dlw4hr5ZNfQYgSvfn4oFtHR68n95RynsTCBQ5MSzBRhJv+GFAlzCONg+GGl
 xiGiSI2pKjT/gsWHNB98z8hfIGugyif+PCrlRTG1Jsb2qQcgY5KtWM+EsCAJX5j8hd3c949IITr
 5jDpQMD4L6BIwRjSkK+xMcVqUdwYwbRd/tMIvaCm8eCtIDSma2jIg+Dm0oFlRhzoImNwGAvrrbY
 HyEpPNseh4BY7btYxj6xf1K1rpwWoe1OVh6g7aPZJs8aaBhSVZwiJNrMpP8yqDJ3qhAhORCijTW
 4GNIS1KjbjFexm64gSg==
X-Received: by 2002:ad4:5c6c:0:b0:702:d9d3:cc54 with SMTP id
 6a1803df08f44-707006aa41fmr15997386d6.8.1753277214234; 
 Wed, 23 Jul 2025 06:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZJ8dwmCFipYmE82A1CvPITOOD58pCVlEI5f3YLgSgX6gVOcfR4jnt3jQebHNiXAgJLM3rdw==
X-Received: by 2002:ad4:5c6c:0:b0:702:d9d3:cc54 with SMTP id
 6a1803df08f44-707006aa41fmr15997086d6.8.1753277213600; 
 Wed, 23 Jul 2025 06:26:53 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79a089sm1046197366b.20.2025.07.23.06.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 06:26:53 -0700 (PDT)
Message-ID: <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNSBTYWx0ZWRfX+hkd+31Jmb05
 3ykyK0nnq9IV+62aUfAEhnoLO2Q35Rp2hG9OPumOP3udhrB2vrPQP18vl6fWOOct1S7Zp6SQ9lA
 V6dk7NvCvYqnqEfYTrESUaG7E/kaZkwGKt9oI3e/1aZQZvfUnCfj31CWKnEvcHDRkUyIih210bY
 OfqVYbpf46Gsx7q2pr7TT9XSo6xhdOnCidq0TQNoDw1MWMXzmh07t+y6smXuqNP6lBsbnY8K0+l
 7SpiEFkjNbsJOreVjrIBYfpCJAOjmsQTUyrtD5H5HCCRyIf0Sg2lzbeBSRnZ7URN1sMVBwq/RTp
 uzTeTMdypaN2Y+tSkIPfPzpSm8xBpzLN5K/zQ0cN72Fspa/YnNZESWhQcSXzJGutYQZBHZMa08N
 dv+taMQq2yoCb+z35QSnHFehjpGjUcw6U3Wea9SI8FPoohk/6DMFiP2IG9sSMpjZvD7kayuK
X-Proofpoint-ORIG-GUID: glu8IdZdX9oS04FOgKqyAfe7RZ-7A3GV
X-Proofpoint-GUID: glu8IdZdX9oS04FOgKqyAfe7RZ-7A3GV
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880e31f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=810 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230115
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

On 7/23/25 3:23 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
