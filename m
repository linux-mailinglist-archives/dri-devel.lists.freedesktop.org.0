Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB469FB067
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 15:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8010E350;
	Mon, 23 Dec 2024 14:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8e7QK1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F248210E350
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:54:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBVhvY006947
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CMetpNC0r0sdi+rbTHxHMkI5qTPoBE1vQLNl2JxJPRo=; b=F8e7QK1dnVMk5SD9
 BBlhQLgeK+yp4+E3lygn5nCYDM6n16D9d7KnejaziWiIUl66uHrvjwhJ/nmXhkpr
 EkuyGTsUI3W9zGrtxEHPm3IqKJiOhwl1Xl/G5BLb8J1iaLCijeM+Aa7Us/WwTUKR
 wr0OuLkUCibzNJL6hQjKwa5rQBMDp8laTXKTQK3S/dLl8i94Pppije/a1P2H03tw
 cTdhOs+f1CY/ZXB1TOjkw42Dr84jI67FHkp+lHIU0AjrYyiwOnN5FlvsccYEkut1
 +tAor35CJuH0JCIc79tv6X4ydFxPDG3eO0+h9Rf7Yzfrgq87P7Q24fLC8tfL0vbv
 2iFOsA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72n8gth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:54:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d880eea0a1so15420056d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965657; x=1735570457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMetpNC0r0sdi+rbTHxHMkI5qTPoBE1vQLNl2JxJPRo=;
 b=twWJAGLsUcFN96ih5hk+GSbFKnYPgPbalTEWAoZt6/qAfW1I8wJZxuJgA0bh50vuGc
 8G2pyADE9RZU1ybhYi6bQx840RZdzvgn4bcbUilBOUD5qJ/iqyyStNU3AmmGGFdTXNuo
 J+JT/CtZkTnu3D433iPsMYdQJJYaSaJYOroCBCR3oWczOfExEVhHIZlInUCeqioHj8It
 phd00tGfq8uiItuhxUCxXjrfG72AGsvh4Jee5jF6KFIbf5RWdl4A5oQh1TvGb5rI5MUB
 ASdWRMkEp0lBIpi+Rj4FAsp5coxNMczzRw3SntS4AmmM6ieQzWh3bulYFk4ce0G1AyE8
 QDzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqEjTUuNO5wxswRfkMoaxT930Y6992+QIjenLljnkLUxWmDci2kF72V2papXUzrFmqXpupGZcaZsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwLGu98QlD/amd3QDT4Bt3936Bw46UHDwPuNhBEfjayQu0jNLB
 vRliLzAu5v9NM2HVFfz6aFlqZsETLC+mvd9slQAEGWbn4eqsWw6dUiPEvaO04HOddQWb6hAvAqv
 Zf4dGduW98lGs2q3sy4Tvo8S0VcnvIhte+C2RrZ5aWK7/zwJNsTVH+zTLIMFvDO1qS1g=
X-Gm-Gg: ASbGnctK74tnVFgYnjsUfmXDF+aXySyPZ5HmOddUeu2fTBocg2zXAtMoY9y1JVukP9x
 UFZL8b2B2rLkI1/NmvXroi6GQ0kMx+ZSfmrabog3kDPxtkXsQFzxAql5oa4EHrpf8kXh2Dn9HMq
 xjU0MbiBMSFA5zNLBmPyuXK2oyDM+HoxdvZjVjJhjkKbq8aedWetvXo1N3q296T7xdr1ZcDiR7Q
 sKZnEqz6IebHa1gr6vXEz06L4mY/Caxy/00JmKOnJU6wivBSb8ClSD8nMh67q+hjKaXwu4058zd
 VTZEbYlkN+PxuMYN9i/kn+P5JJ6ijnluoDc=
X-Received: by 2002:a05:6214:20a5:b0:6d4:1f85:3975 with SMTP id
 6a1803df08f44-6dd2339fa19mr73953626d6.8.1734965657242; 
 Mon, 23 Dec 2024 06:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUHjlXPiR8tK/MMFoP6x2egq/NcpOXsphsui195pchWCXB8kVBb97e8UecvHXUqfznd9wX+A==
X-Received: by 2002:a05:6214:20a5:b0:6d4:1f85:3975 with SMTP id
 6a1803df08f44-6dd2339fa19mr73953456d6.8.1734965656891; 
 Mon, 23 Dec 2024 06:54:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aae9a325afbsm311084866b.181.2024.12.23.06.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 06:54:16 -0800 (PST)
Message-ID: <5b1fa9a3-de58-4ad2-aaf4-f239f7c60ec8@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-2-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: guAmeU2lw1ueKzRhXyZBUBVjkS4DG-ZU
X-Proofpoint-GUID: guAmeU2lw1ueKzRhXyZBUBVjkS4DG-ZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134
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

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> This vote value is called IB, while on the other side the GMU also
> takes another vote called AB which is a 16bit quantized value
> of the floor bandwidth against the maximum supported bandwidth.
> The AB vote will be calculated later when setting the frequency.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
