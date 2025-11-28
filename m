Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C23C91E03
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 12:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAB610E120;
	Fri, 28 Nov 2025 11:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZCG08Xz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRRuMZG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDBB10E120
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:51:19 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AS8ObQP3531060
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8Y4HkwU6VB0BlJn1ldJPRjT9M9YiOglI+VBFFOqOkV0=; b=jZCG08XzGLgRZ0k4
 XmRxd8ceviz3iln2b7gLfOCn5DgP8ZXNB9KaLti5cNCazH4f8CkDnfbj2giOZQnY
 IYHoJjUplrpPIRPkZ+41mJmG1N5R8Mr9Ea0rwX/jZk15OrQuSFhWIAiWWWxUNT8h
 n1SiLOGz9i1Gxu+RYFxi1210byXtVppg2a0qJ28gQ9+PxHbc38Dzjllul49cyAdg
 86GYK4G9qE7Sv5TPzn+H3wwE6dPJ5HyKSR6E5uwS3pAaQTRCi4ZVEkQaDRHh0eX7
 p2CD+sUc/OCu2x9raF6y3PJvgO8BBVQrpGi5oncZjJ0YP8gmi+8E4Ko49IJJBwcG
 2hMLjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rucs5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:51:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed83a05863so6235701cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764330678; x=1764935478;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Y4HkwU6VB0BlJn1ldJPRjT9M9YiOglI+VBFFOqOkV0=;
 b=eRRuMZG5VfZVq3Q0gh3Hx0EwI8qSOtzbTl4jB6axgxGV6CXt+s/40akLHs25pBck13
 5728gJfg6kcxXn/pMBDy+ssWCrKVdq4eP5yAty2960OLpaUBM4YVvDGXCZchXZAwaQeM
 qpbLrlaLBeDIqXTl46Si6itprkQxYiwFjhaAXLVgsGZMVJMrXANllTtrTdPNJ4rUUR7c
 6UtW6RkC9yn/KfbeL9rSjzIVaw+vgF+341bXWIilsyK1MqoZthp72BhqHgUqA/x737KL
 xzyMmJgBvK6zHM+b0tVvYrid103W2KpnVgw6wi2okyD87+UJgTlyyiUetVdNoEUc1nXO
 iFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764330678; x=1764935478;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Y4HkwU6VB0BlJn1ldJPRjT9M9YiOglI+VBFFOqOkV0=;
 b=Pd+A0zOAzAPypt/PusESa7CBcHdxq2RpTp4HekKh16rLxTrQj1pyiBzXny883Gs6Xk
 onwOTMzKmpmvHqwwStrrAxLL484j+zGbayvTQkVTLE3SB0ao/WTojDSey1B2mqqC1XG6
 CkiImFQQlpFOML67r155a42JdfSxrVfD2OPPu9ZlKQmjUUxsqJmKutZ8aGmzcN8hXZw+
 +wN9XujKFU8RrS3ISU6MELTLu1Eix20p8Bv9HPHpKo2LejSOYS/7Rxt5JURF8rGSaNCU
 JIlZXmttMIQj65oBhnidEhhUeq0sA8Omb5YVXTiVRtdFqsCPzhz0Ur3WFRXJpvS/iurt
 vO1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7ru8hO46pMFj6f45jmfUZmAcMH7F9XkPc2urxfq84DDf7KBG4MwScjS5duX/ONlDF4KNbHh4pLoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFTyUl24BFAWgHx9RjmG4Z8pt8HK1itYhoZNhCnX+kbEKCyUp7
 WYIttFSAAgz4VGAyn1UuKMYe4RYlSg0Nxu78Dk4fCXZc9o0P80xslkwZANdWc5CGp4iJ+Zi6n2c
 UP4xGthozBBawNiyDNLKXdpHWgKW7f7bmOc09bTLLSWtxUv2yKyq0Lm52lJx3gGM87/mZTz8=
X-Gm-Gg: ASbGncs8ZB/h0JODyAI9t7L5GC7x3AG0Okh4ZgMMmWMn2OOOHvKqL+YnXS+K45zCjTy
 bPo5f48qCR1Rp23Vid2evQXcA1UXduecxxwL7lqhCOjWJ/uDYvJrXXBEuLXpqQFVX0AijvAzTMf
 ysa1Ab6JOU1d5pPSBLy39t2fX9uyG12TSWQiYtt/rVaDb/zKb3MBnSFwDsMIAWzIjODx7DmFT7k
 Xd4V3ewMABzmB6LWdmpeCgQonf9POR77EM27q5KUuS77Q5pGFAAr4wsG5/BOORpxJvscPZB+smS
 7kimL43pxTO8ozHphe+kA1M1T2qaH4+z98Benqt3gF9+2zqDOryxTKV2INkDy6z70630Hv7jBlb
 czi/WoJbj3vTUBBf1AGywruyqQI84LW/zDuHRUD0L3mwS4OIX4EL6HAuy0QnP3qqSWHY=
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ee5890bf69mr280595851cf.7.1764330677653; 
 Fri, 28 Nov 2025 03:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMxKtaanSk+Q3URUf82to+nSciPHkyfagFqfh5vwhL9TZt0ajEjveHRGIRZfNRyTIsK7Pk/Q==
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ee5890bf69mr280595521cf.7.1764330677271; 
 Fri, 28 Nov 2025 03:51:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5163903sm444341966b.7.2025.11.28.03.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 03:51:16 -0800 (PST)
Message-ID: <60fe241d-276f-489e-9c74-677dd154b454@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
 <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4NiBTYWx0ZWRfX8tYGIVk56wQO
 7K2Pzejg29zLBkQMcomdzBxOqBKaVxlDQLyAT96qkUiz+1vhZGbvif9NhemNDniI1UWzftaJRvp
 qPLXLldR6KYwxHb+ify/TVEzsonOG+juIzTebz2PlgvF0rzSoqkckhSJXBCfYp3M9zgX60UoB0G
 mTfSjtRapOrgeAdtgdiz72+kaVyxPm7+bWTJ3raNvIiA/Bxv79ZXxD9RaQ+7dTKd3dcRCNP10ZL
 0y5ZGeRguStsbpYJ/XmbabtVybRHLKlaEtSY+gV7FfLOv2svEJRecL6QoU4ZQAs9yJ3yO5Pw/mU
 aIOIJlFDtxdJcrTrEYBmtaeanWMmpm7f5Jx6Sb8tuOiPwhlhwMUrBfX5IDCX9qRCqf6MdNwBStN
 VNU/VvBXJ5FNqXEb3umtP6Zm/1jLQA==
X-Proofpoint-ORIG-GUID: T080UK2gNYOvyU02pJKln9_6uGWShsb_
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69298cb6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yc56PbwcTNiI4aD9GBsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: T080UK2gNYOvyU02pJKln9_6uGWShsb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280086
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

On 11/28/25 6:05 AM, Ekansh Gupta wrote:
> Current FastRPC message context uses a 12-bit mask where the upper
> 8 bits represent the context ID from idr_alloc_cyclic and the lower
> 4 bits represent the PD type.

<newline>

> This layout works for normal FastRPC
> calls but fails for polling mode because DSP expects a 16-bit context
> with an additional async mode bit. 

<newline>

> To enable polling mode support
> from DSP(DSP writes to poll memory), DSP expects a 16-bit context
> where the upper 8 bits are context ID, the lower 4 bits are PD type
> and the 5th bit from the end denotes async mode(not yet upstreamed).

<newline>

so we get

1
5	       0
CCCCCCCCxxxAPPPP

where C is context ID, A is is_async, and P is PD type

are the x bits reserved, or do they serve some purpose?

> If this bit is set, DSP disables polling. With the current design,
> odd context IDs set this bit, causing DSP to skip poll memory updates.

<newline>

> Update the context mask to ensure a hole which won't get populated,

"to avoid erroneously setting that bit"

> ensuring polling mode works as expected. This is not a bug and the
> change is added to support polling mode.

I think the main question that remains unanswered here is that you alter
the non-polling mode mask to become compliant with what polling-mode
expects.

Is that intended? Will this still work fine without patch 4 and the
new FASTRPC_IOCTL_SET_OPTION?

Konrad
