Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441DB0EFC7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AF310E138;
	Wed, 23 Jul 2025 10:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdeZnmv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D4810E138
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9DJ4o011559
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ADPEX257lqLR7aZspkqZLx5E5CPI+QZpWMnfs3fbuRI=; b=JdeZnmv59F6s3ybT
 mj/FzWcRtRL7AR38Xeel4YhTE3aoxfIBO6yRr1VYw+jXs1Wetl0N/h/2xqSRMx5l
 xUDssShPLP8Waqh7FtemfFjAzkM7JbswAqU3YX+/EsXJDOaeqw9Mp2FVPxp5f+1Y
 FWIQkJhI5FoIkhu/dGGAwDKiX4+z2jRrf/Omt9tXVYX48zzZufwZfJdWqNIoA0EX
 aimVtxzmKM0qixrZcxLzbY2MmRylj58rj2kqzBV2POpuQ5nC/ObOImkKiF0qDt2T
 JNm/Zw7dvxZ4dSi5o9bmXO0C4PrqHTusGZY0bFZSBMyAyddofVkW9l4N+9rTnZOY
 /WNkQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qcsm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fac0b29789so23606556d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266450; x=1753871250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ADPEX257lqLR7aZspkqZLx5E5CPI+QZpWMnfs3fbuRI=;
 b=GehXZ3vbR7z687TWX0XerwH6T4pThw1HPpXzoCzbzuA28hnXAX7NRPwHukz4Fmf9nB
 zyoivM1GAXGzthETgeHOc2xWWnoxT6TjMwMKsXl8LPcuvegknGr6YKX0qTtkSxWam2ee
 96OgdbriGPHkUu9JR+xoZVXlF7C2NW/tE1nD2mel9rWrAsEPUM+ngIw8iHXCtbkS+Zlq
 qi/aUE/Hz1BenoI+ecsxBf+/SVJ/+mS0ETrLg6nHMCk7/MuCi8gK9357lrRX1+uHIzEp
 +jXEJyWmhwPnzpCjxIvoZkJEnUyUta9J6Q9LlOGDLPe03g2qBuiz0FKGROhbKtWLeObn
 oXlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQy9pYLxr7XHz3fs0SLjNXUBzFxuHHgijEbl2a5ZTdIt7qkbkLpOz+jNCBULDzy76QWuW9N9S3ZHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZcrcCzvl1UFlNgDf8RFAys1N5CEExY0Dy/EoQU67jPTw/G2LD
 Ch8Wm3dOlxwoz09dhp4QfePzTmq07A6pDB6+Hk9A+fNcaDioJL8QXBx8Bj3FxTgmM2HCmeOBVr5
 XUhhFdzR0IwpeH4NYM4x1y9lfGRZHC/ZsLrUmfc6+qf6INSdb+GzRsnZ+2/4NdpFZEKBiiYA=
X-Gm-Gg: ASbGncvBmRe18bXvPbo1NFFchJVkEMnQGojpASt8qCBXltalY2MgZzpzDyEqGq/sO4P
 ovi57D+aeYNJTXorM1eTiCCfjEv3sgOjnSn/rj156wKYF8bhVqQCM9dNJ2LQ/FnWHgEGCMvKo1l
 rSlyw+1Ecv59iX6yxJmxD3IU13PMUY6qz8Q+dLqFOe1Fttob1q30+IrTQnmXPTJb29nTo9TGI0a
 dkYxzM5SF3Qz4+kHxcF9ys5DCdOk5mZ6QM6OuLksfErb7ijkj3avZiaMi7a3wr+DRfbjSTx32nO
 Ud7dtAM2LM3wck03aKvoCT5OrncY+RvS8rwFi2kah8oTsliAWCOXVZy+g2lVchqpfspZk1HfSt1
 C3CWWC5SMkr/wE0+d1Q==
X-Received: by 2002:a05:620a:9157:b0:7e3:31c2:2808 with SMTP id
 af79cd13be357-7e62a1635c2mr84740885a.5.1753266449887; 
 Wed, 23 Jul 2025 03:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlbBqrpR3KQ18lK2XKRLKljilp74CSPk27LxST7ZbUN/lfUZkp9SSjf53wAC8c/dVC+rHKMw==
X-Received: by 2002:a05:620a:9157:b0:7e3:31c2:2808 with SMTP id
 af79cd13be357-7e62a1635c2mr84739285a.5.1753266449263; 
 Wed, 23 Jul 2025 03:27:29 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c907759bsm8191624a12.54.2025.07.23.03.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:27:28 -0700 (PDT)
Message-ID: <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
 <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OCBTYWx0ZWRfX7eBHxWYFXxB+
 YiXupWiWWIkfEO3NRWKS8xpNfogGX00lEYECIDTZ13XlOBlAvlLUx3IF/MYrShpS/V3xcrc+XgP
 klahZ/bIpUfwK/1agwzalxwXrb6aalFcPLPnr8mJN7d/qDAk5Eov1SiOUWFAmGMAqnmdFcMsUYy
 0PrTycGg4BFy35E4jjzDVRK3JNpXzibuKdZFZmAPoAWyxKDpkOaGpftVfFWQrqGcosH+hPuiXUM
 zVy4INC2B/5WVj/DmmmhJy1RH2qTgJGBAoOkLM3uSMcPNYChBSmerAjNCmyyMI9CvkR2waG+PvC
 uQo1iKjvzWD8q+ZJ3N7EBq0Ou3dGzZYCng487+seNimWlQRzal3BXfIOE7TXYpJLaagFhbdnRNv
 y7E6YE5anWuYNzkL7pQTXvdz08YtMqcdglVpfR4IDrfKyKT4UM026hLi89RxybNIxrwr0AFX
X-Proofpoint-ORIG-GUID: yCjDuWkBT3IBxro24aGsj4tTfdPLkdKz
X-Proofpoint-GUID: yCjDuWkBT3IBxro24aGsj4tTfdPLkdKz
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880b91b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JXpgR7ONGPNzM5tbrfUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230088
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

On 7/22/25 11:27 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>>> for a gpu. Based on this flag send the feature ctrl hfi message to
>>> GMU to enable IFPC support.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>>> +{
>>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>>> +		return 0;
>>> +
>>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
>>
>> magic number?
>>
> 
> Let me check.

techpack-graphics/adreno_a6xx_gmu.c:
537:#define A6X_GMU_LONG_IFPC_HYST      FIELD_PREP(GENMASK(15, 0), 0x1680)
541:#define A6X_GMU_LONG_IFPC_HYST_FLOOR        FIELD_PREP(GENMASK(15, 0), 0x0F00)

(same value for a7/a8)

0x0f00 is 3840, which smells oddly like the XO clock rate (possibly mul/div2)

(38.4 MHz or 19.2) / 3840 is (1000 or 500) (ms? us? cycles?) and the other one is
(333 or 667) - without any further information I'd estimate this is some sort of
scheduler tuning

Konrad
