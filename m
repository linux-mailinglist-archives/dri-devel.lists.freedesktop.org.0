Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB669FB059
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 15:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0D610E31D;
	Mon, 23 Dec 2024 14:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDB4n/CS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBE710E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:50:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9TQAg019745
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wlZkphqXmIbiFKi1/5KSMJBOSiSfd/Tur2EcPwMtMKQ=; b=lDB4n/CS/aFu6dFR
 9gMEG5MKfcaCAFzjbChnRFIbNxweJJIxaoHlx5f7ezjEo4AlSmnh29xq3B/nEJI/
 SizRGRzgMQTmqdOClkfewFd9A1RXAyo8sUKU93oQ+BOskDPyOEuQNj7ttQHOKN94
 U4kgNlYX05exMtTP1q2008DUNe0lIJZ4xb+gAHdeNsackpDBXeg8uMYTYl1EeN29
 +8LCRtPlfRIY/k/hw5i+v/vgYjg5pchDS7y7oLnUdzNNxYi/CZ502RbRWBFUF7YK
 Oq153/D0gyEvOPgmqS6fNbhAaaUD1sNHwRzaDBcTSuxsCp6Y01822D/PXvJ8hw0B
 VXpYqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nn8vsb87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 14:50:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b6e43ed084so58041685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965449; x=1735570249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wlZkphqXmIbiFKi1/5KSMJBOSiSfd/Tur2EcPwMtMKQ=;
 b=h/nuBq+iE1MSAnldmF4vN9wzK6XbA3gTGn1hC/dvB5+Ae41Q0wf93uTsHJca7ZWO0v
 wTDDm+OqBPKDqi9S7V5FWmXuZjT5KJINrBullRYXgEswkmXupdtAykxtJofJC+j6d443
 5kjVtXGJiyv9bKL6F/Unbvyh8jTLd0oWk92vzmA4y4yux34bpjB1kp+7R7sKvirPDuxg
 Am5ke09PPWuIYvn1JKFoGKG+jWlPMYPr/uxXHKeDEg+29hVQ0q+cffJ4vnMq3thewT7A
 D1vu6RGOtYYglBaPhIarlm9U7JG4Zn+ZB2FnIWS6sM+soij53w+KFW+cb2SFZ4KSGE1m
 d14g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIiFJRj0ZnAlIoGZ+29F3/CesYeUdvPPnKDgmx1W8Jm0HhhmYAH+K0PWYtcL446exWL3fB0jZOAeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/7kIcjoB3diTG5JXIDpb3eI1Wt4oxAR1VzQQ83PNViO38n6tD
 eR3Mqv58z/AbmHq2xGaMsvf8fea5hx/xKTJOY6/yNCJPxojsrr4PvbJmlI9OU1vGb5BmF5ELY7Y
 mtYoikGYxae1s3oTksAbQXVhxnjwma7qFE6/vsrmoI79tWDm6Nomojpd4N7DBWbLlUoM=
X-Gm-Gg: ASbGncs4L890GkfcyGLnsJfd2qQW3EeLFK74LthkEA4Ao9ZigO9101tK+ebewCmS+cZ
 CZSRMJt3NnxCcYbKXhzbMt8dia4RlubZEG7HXqtT1WnGA6RMPWvduGE4DGicOAxfNSPfS2/togG
 bqvsJK8ofp/zoh6A40wKsBdh3vnOpIEEoj1/lJOm5Jbh+n9Tkywb2BOLtDE4H7axWocDA+yfwBb
 4qI0tBXi0xEnp2O0gKjbSQMcfoOxCKAe2hEYZqIpIJ2IwCWTgBRZ5ADzh9DtVyMIBMQT7CzqrYB
 rXXe80L0tqRu2kECGu9f7PUeK1AgFEWCYOk=
X-Received: by 2002:ac8:7c56:0:b0:467:6379:8d2f with SMTP id
 d75a77b69052e-46a4a9a3aa9mr86518561cf.15.1734965449064; 
 Mon, 23 Dec 2024 06:50:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg4F+nk4GXpc7g8L8mccQtbkn90gLkr0vPXtwNZH0T3hETGOnOws+UGYXkZ5e+hEAM71UD/w==
X-Received: by 2002:ac8:7c56:0:b0:467:6379:8d2f with SMTP id
 d75a77b69052e-46a4a9a3aa9mr86518361cf.15.1734965448708; 
 Mon, 23 Dec 2024 06:50:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830abfsm535310166b.20.2024.12.23.06.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 06:50:48 -0800 (PST)
Message-ID: <b1a313b0-fe0e-4612-b555-5708b854ecc2@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
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
 <20241217-topic-sm8x50-gpu-bw-vote-v6-4-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-4-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7KXUkc98DO6gmcvtrLWUmLtYoHN-Pr0I
X-Proofpoint-ORIG-GUID: 7KXUkc98DO6gmcvtrLWUmLtYoHN-Pr0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230133
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
> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> The GMU also takes another vote called AB which is a 16bit quantized
> value of the floor bandwidth against the maximum supported bandwidth.
> 
> The AB is calculated with a default 25% of the bandwidth like the
> downstream implementation too inform the GMU firmware the minimal
> quantity of bandwidth we require for this OPP. Only pass the AB
> vote starting from A750 GPUs.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  
> +#define AB_VOTE_MASK		GENMASK(31, 16)
> +#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)

I'm just not 1000% sure about this -1 here

Konrad
