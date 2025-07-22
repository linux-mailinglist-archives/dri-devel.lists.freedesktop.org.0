Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371EB0E464
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E4D10E701;
	Tue, 22 Jul 2025 19:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr774tyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736010E701
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ME38ag009227
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NgleyO5RfA0jJonC4fbj/fBe3zzFRDRyWtUD4mibfAg=; b=kr774tyKpnQ9Zyws
 IuNzzBUb09SF2MpAfZsdQnslNeHCnvzeZWMs5fDOb38LZRUtSJnk3arYSHS5hXjt
 yCimrEi6zN5BHVIDmqBsUuN6wBtQTl6hNX4nS49QV2Wll6ZTEgl8EsR2BKZls5wc
 7X+gf3kHSKpRARHjXcDdv5q8ts/KWNteAlWdX23/ugJDhxKwXSfbuDoA3I7G2ZGC
 FHmn911HnathefJ52Ew8TVzbdeuZF4MAmQwASVhC07a5OdN0Y2PJCY6MnDRwMnJw
 Yd4dJBqOv0VRoiQ68WLJ+UP8+6TTwYsyA3j//zWz6LRTA2cMx0evaUs/xQCv155N
 uGGL7Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w122q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74d15d90cdbso4968966b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753213946; x=1753818746;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NgleyO5RfA0jJonC4fbj/fBe3zzFRDRyWtUD4mibfAg=;
 b=nmU9WkBK77vDcwfUj01jSvEPHK+x/Hjz/rsGjMwM74Gqd2s8KessWKZ2Jo/hnh787k
 kvbuQvrgogJ4pRTcf+koTkaM8cHyfY1+2WV5dtt2ZBU18xh6d/J6hUUBanlJwFTuDWxp
 HJNLw7A0taOF9sOznUQVGe0ieF4HC8zSvcNUzpPH2Y5N38nfZHtO+aBtYhCRss0njECz
 BAgE0syyjoS1DsPmnEUtQ6ssmRq0mQrA5hl8S3F6DvDhxd0ypKuAaKzxofbbHjYwXBqa
 Azh49aElREWNwDB3LJhhSC9saeaGbR3yo+2l2o8cGLtYMVfd3BHYpAA90jNAQLT+znbS
 5y6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKcCbz+7nf9IZzc+BTni1kcjt6+86VrZ3Gyzuub+ZSmRZ45mqgoCm4YSgxXvx792dEZ9DfNJ16Kjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+RJTJzHFW5lSySTSz2RY8ja+3xRJCcGXfAbGmF6ujoSlVPxko
 Me3slCtVplZnTEd+uZZcDzfE/G92LRV6pQ3OTSaYd46iySFOQUuBqOVMXF1/mibjCk5elBWhEqv
 G0L7bHJhbt1h5XJK2Inb/LfiUnlmvf/YeS+Qlz/ydHb8EqlTUORHDAOk/Uvv88bxEXhd4lANCp/
 zUdPo=
X-Gm-Gg: ASbGncu2Kog1tHteoCKhJZtPManT+SdOtyFRVVxrlqdrBOGyrUfjR/N1xCjJVSUbuAK
 d6+QXb9JBFxCt9jIz/Mosf/09NnmLYG6v2P4V3AFT28jlNwJmQ7fPJhjl3S5ifHNqVncvpM69BQ
 kSUEd3EZ6vrSKKfwHHwOoqSZzB/Ou9h9h0XTZkMLQ7s52AGDwVDTxy14TnNNJCRS4eylYj37J3+
 wd3/3FnCuHwWOnHbwaZ6JrlEJJU7XBR9tFsOS5Qzeizru/kF5ZMrkEYU1W5qk67a/5gVLyT0eFU
 u40JEEeUyx/DGgkbWqZc/9fIC5WjpJido2D+TcqmkMUKe+5IwLTU7Tk9R8YOsjYj
X-Received: by 2002:a05:6a00:2446:b0:74c:f1d8:c402 with SMTP id
 d2e1a72fcca58-76034510546mr882711b3a.8.1753213945701; 
 Tue, 22 Jul 2025 12:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUuhsn+CPJWTbTSXO1IZeQTiGzjVoE9h75N3Pgihn8vh+oCDCTqUQNSuxmfB1Ryj20g7s3JQ==
X-Received: by 2002:a05:6a00:2446:b0:74c:f1d8:c402 with SMTP id
 d2e1a72fcca58-76034510546mr882673b3a.8.1753213945209; 
 Tue, 22 Jul 2025 12:52:25 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbd63cd9sm7622600b3a.160.2025.07.22.12.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:52:24 -0700 (PDT)
Message-ID: <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:22:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687febfa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KQakvA195p00paWSqTwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: jSXnO-XRHr238JeOpUxoW-zHBrRIi1Qy
X-Proofpoint-ORIG-GUID: jSXnO-XRHr238JeOpUxoW-zHBrRIi1Qy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfXzPsrshP//ddm
 ZVrH83Pf/P2Iq16iP8I5c5NZ44ZAMWIo/Y5lhSdldeJzsmY9h6xDRgkRIrfSRBrPY3kynxaHpIg
 LDSm9VsYK1cszwPi+otAxCtGk6PdPXPrfyD+bWbBuJaqpc5KMdQ0hN0zhJSJt/K19+LqVNJE5Sg
 5cHs81nJOxSEB05iIGN5etcCMGuzouFY+RHmZVWvJ7h8vj4kZdIjqyGnvp5XDjJcHATQq9+ZQv0
 q00J2SQ+p3idyr0CgpkulRes6NA8Lm4VuX96x1pJJk6TZenY8F60Uxh6Y8o7K3d6iT/amS1IbZY
 dGMGtLE2YcOJDdRFrbegcXW+XF8rpUzVyLQgOc85sR9tZP55wytyXgWvzkAZ2VZG+tj9+mjjodb
 XL4PGHzAzyCswA8B3ONUvSB6iQNMY94O4u7P4B9UQE/vddgTKpMieVtApToAPHupM/OR0OI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220170
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

On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
>> different in A7XX family. Check the correct bits to see if GX is
>> collapsed on A7XX series.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> This seems to have been introduced all the way back in the initial
> a7xx submission downstream, so I'll assume this concerns all SKUs
> and this is a relevant fixes tag:
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Dmitry/Konrad,

We don't have to backport this change because the existing code reads a
couple of unused bits which are '0's and that is okay when IFPC is not
supported. So there is no practical benefit in cherry-picking this
change to older kernel versions.

-Akhil.

> 
> Konrad

