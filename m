Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3DA49AC8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C644310ECA1;
	Fri, 28 Feb 2025 13:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuawQ7rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F61C10E2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXIlk008977
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jUsBvFfhxrhyKEITeHg16SL90hIVl1i/tkcjRyAbRMk=; b=MuawQ7rN7uMY4trK
 9U0OV8+fLM7b3FJmBkcbWeksm90hjlaAt5uaKzIoNOW4ODG87JtUjOFXdrOrgQov
 jcFg0a0ag3EzpFSrFWw/XupXTOP+TG4u5eyKxcZkbCi/I28ej+sX2pt3cvHwOxc2
 Q9v1FGWvwapWWfx9d7I7tyPG+9dctZGWfoAziqDvsoYw+VWgqJMYfj0bYivCuDwk
 T5iivyqltIL8reAKTkomLwzNxoT1kLOXWed6X+CVGOXprgPcVusFRO6IxiTJjKYM
 RbexFxPM1yy7sLvR1J+OL6fQVpLbDzcypH93SDCJOmwqePLaNSzmoZFJyXUrEvAv
 j9M+HQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6p5jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e89b0adca1so3865056d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750192; x=1741354992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUsBvFfhxrhyKEITeHg16SL90hIVl1i/tkcjRyAbRMk=;
 b=lUtuI5jJNsGxYbfPX9tO19/XoavWWiDwXGp//68mwlsJJXTmK/FA+Ai73AtTF8YFYC
 W3oaHzG9ETpWAe7dt4vxqndNiqG5E/30o9KNgtDVEOEn73Re9eoelQ9QZIOgkJA7Hc7N
 rxvVnA1ZILxIQd/xSEbNOLVYyiYDP33edsh5mHMIH9KstyKLVtdQGgibrEzITgY2ip4f
 6WPD5+98KIhuKJXABDkcBXxnKSod+0okuhFABbvOtEPo1T9PHHjCuLLfWS1e9Yxj9Uix
 /UfE6bUMrsJwE0ojXawQLEJXRgUEg/utyHCnEdB/+ZQ0szK1KjHS917dfsU1cIQIOa6u
 hr2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/6J8Jx5RuGamqjAzIJCzwu3Hf4GYGKys1ZMV3+/hJmIC876SfCzNdNx3OjBbzQe/ESy3K/+t3pSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Ql0VxksGYEu4bIWGWQ8XQZkGyNs1hbvX62MsuIy07mDdjHXD
 jNH7DiSD9+/WkmVOIFxWDAz51SSIdNNY35n1ai361NbxXPethn791hp3gv4cAryHQdreR3ttOo/
 G+gBtgcPVUQu0U/D8HXS3ZAqIDz/RbO3qWBCuOlBOEDTLhS6ntaWQbVoSWqoyegWLRhk=
X-Gm-Gg: ASbGnct4egBVRBMydbKHBn87C1YOijjPWZNmWY14yibpC77AjDSGTWsFO9jOFq1u7dy
 B3Q0lsOiy1Fg2ADT9IR70AJYxZQ14VG0W/+V76ARPuBYr7YGyZXBAyPy6R3K9Te3G8SbqaH8epF
 4mzMzxWABvoUduBFKC6VLmxUNMVLlJjkUzSvG1nY1zNDrT0TTH4mt4MDEEd4xw7ukyAcyvgDr05
 GpvSiZA5RND//UBMfXZP9s4wUyf7G07huwVTMgH+JBdsX7F7WfORZrNEC5TUhe+96p2gdqDrgIF
 kIoJoqnbaj6cpWvXyM+T3HamrTxrKMJfAoyepbrSmnLo7vifNRMvkNOEXGB6/xY4FRUJkw==
X-Received: by 2002:a05:6214:2b0b:b0:6e4:3910:ecf0 with SMTP id
 6a1803df08f44-6e8a0d82de6mr16983656d6.8.1740750191796; 
 Fri, 28 Feb 2025 05:43:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2eA/mVAmzoZ00yrwl3fYZmJW1K5Im2B6KfwGP2t2rb3Y2cUvSzpqF4mUz+BIR54vSE5s4Uw==
X-Received: by 2002:a05:6214:2b0b:b0:6e4:3910:ecf0 with SMTP id
 6a1803df08f44-6e8a0d82de6mr16983486d6.8.1740750191306; 
 Fri, 28 Feb 2025 05:43:11 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0db671sm291962566b.72.2025.02.28.05.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:43:10 -0800 (PST)
Message-ID: <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NN2WmY0e3gXQhenHEN-O3A7Xi1I4XF5J
X-Proofpoint-ORIG-GUID: NN2WmY0e3gXQhenHEN-O3A7Xi1I4XF5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
