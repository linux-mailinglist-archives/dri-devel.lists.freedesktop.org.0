Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795049BB75B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 15:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E1910E028;
	Mon,  4 Nov 2024 14:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFl3mqvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DE910E028
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 14:18:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BtpVK022281
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Nov 2024 14:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u1v/WVvHGAo0bVyM2Taoht+/F9lPQwBWyf6U4K1s2Xk=; b=ZFl3mqvPbcrqu5Fm
 /tdQBLyc1RjQhobSxIgv3AoflRkDcnVMqMoINj4uQJrMxqktvTB6rn27n9CmqOur
 Czq75fWmigZZLMbsJ3t53Gt3ZlRiL4Oif9NVq9/u6JkNSNGmiNGPPnnGG0k9LB3L
 aGAlhLDddL7oTD+Wd3bunyRsHIPHHWHYvqvo4O143vt5SH/0Zt1aaDCu3Rp+Xvgn
 /vCyTIy46BxEQR+9JKGPTpu7VgLGNVhjhD4A++Ad3Qv8iQ4d55wwJvkZeaRBNg/j
 85kvTB7L9V3m5tKT7c0vJWwULTmzd5GWtwwZnvcq1U17sJpeNR3iBxRltqp/3bLo
 nn1YmA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ndc6vfwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 14:18:10 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a4dc12d939so8643065ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 06:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730729889; x=1731334689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1v/WVvHGAo0bVyM2Taoht+/F9lPQwBWyf6U4K1s2Xk=;
 b=B6aW3A6UNTMYRnHON/JIt0fACv0LFa6/7t4seBMlwDshmyIbfgk+X2PqfQ4DiG9KYJ
 8LURfdhje7u5P816PO87tKFNINokLEv08+FXDflnMETeeumIk8u8AbH0rp9wTqS/8DWT
 eIgA0QtF3XchSE64Ihtipop+xomfR/2pUeaiXTFdoa8pDXRk1CqX/hDV2Z22H5eC/632
 nY+FBhnICf6k2unMgL2z0f1iJxbbp6fjxoVglY17fXv09YlAv89oqbZ0anmGMdbkH22w
 IIdGg0dGemHRsb3DflNho9MJRAQJ2AUEDve43/7pUmPFNr7adGk/lOyKpOeu3RYSGWod
 hdKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV+sMQkK7lJ/NACp+nel3NZ5YfpvAMla5aUv2+J4Ps3c5MeNsIZv4jyXzVj2kClNml62gLi60oxSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdUetnWO6AboBLBZ/l2KCnFfS62ioQxNHYwk/OkeZj6q7OyD9n
 eSIDP0ypN3O/7t/RDRROXq34G61z0mNhtgM2TvXCVm6/1L3rEBTS7xbtCcCM+NF1/87pjEwySqP
 5NXm/R/+c03XPNPWVy7+JEqgrEj+rJSZ79dtnTYKavXT+ijmqt85i0m4jDF05wtT0h9Q=
X-Received: by 2002:a92:c561:0:b0:3a3:af94:4610 with SMTP id
 e9e14a558f8ab-3a4ed314920mr76086045ab.7.1730729889319; 
 Mon, 04 Nov 2024 06:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCE3MSfa+IhWcVZ63OZ1NsqKoHNMmvePwJ57m9ObdgTyluZNlPMfMOzkM+3rGnAfblsK0Ltg==
X-Received: by 2002:a92:c561:0:b0:3a3:af94:4610 with SMTP id
 e9e14a558f8ab-3a4ed314920mr76085745ab.7.1730729888716; 
 Mon, 04 Nov 2024 06:18:08 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e566442easm555348766b.166.2024.11.04.06.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 06:18:07 -0800 (PST)
Message-ID: <e1871824-78c8-436f-a41c-16ac1614004a@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
 <1543ae2a-76ff-4b36-adae-37076e48b7f8@oss.qualcomm.com>
 <20241021220914.vrxiyeoxjyxweovu@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021220914.vrxiyeoxjyxweovu@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ozdqSfq12swhrbA0B3HGhytqVU8aSVc-
X-Proofpoint-GUID: ozdqSfq12swhrbA0B3HGhytqVU8aSVc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040124
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

On 22.10.2024 12:09 AM, Akhil P Oommen wrote:
> On Mon, Oct 21, 2024 at 11:38:41AM +0200, Konrad Dybcio wrote:
>> On 11.10.2024 10:29 PM, Akhil P Oommen wrote:
>>> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
>>> the power consumption. In some chipsets, it is also a requirement to
>>> support higher GPU frequencies. This patch adds support for GPU ACD by
>>> sending necessary data to GMU and AOSS. The feature support for the
>>> chipset is detected based on devicetree data.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +	/* Initialize qmp node to talk to AOSS */
>>> +	gmu->qmp = qmp_get(gmu->dev);
>>> +	if (IS_ERR(gmu->qmp)) {
>>> +		cmd->enable_by_level = 0;
>>> +		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
>>> +	}
>>
>> I'm still in favor of keeping qmp_get where it currently is, so that
>> probe can fail/defer faster
> 
> Sorry, I somehow missed this email from you until now.
> 
> If it fails, then it probably doesn't matter if it is a bit late. But for defer, isn't there
> some optimizations to track the dependency from devicetree data? I am
> not entirely sure!

There's devlink for clocks/supplies etc, it doesn't apply universally
for all phandle references IIUC.

> 
> Since qmp node is related to ACD, I felt it is better to:
>   1. Keep all acd probe related code in a single place.
>   2. Be more opportunistic in skipping qmp_get() wherever possible.
> 
> But if you still have strong opinion on this, I can move it back in the
> next revision (v3).

I suppose the answer is yes, I have a strong opinion :D

Konrad
