Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CACC4608E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 11:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2A710E2CB;
	Mon, 10 Nov 2025 10:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRR5fElt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0B/hisC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FAB10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:47:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AA5039X4029952
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cBJVNfik5OiCeMMLHOumoYf4lo5WTFo4GRQQQ/riu2k=; b=bRR5fEltyaQ5HPAz
 Wmj2NCLsxpW+BbxhoGgmu7VRuHespbktdXn3g0KRMdigp5cXpK3jbg+hzcyYqdaN
 VragxiCG3MUVqHfEZa0/a4HmlUc70SlMHHy6ClkENRP8umVJzaiD5uMv0jq4hNTH
 hu7ABM3UGgi+jY9AP21cAhkpuXwq2GIu1Hab/jPc4xv1X+j/SOK0kuy23oewlPmp
 OM7NsW5S3BPhZeFEpYTaDw0HVIce4sM2RxChQMLR/zO8QziFelLpZoHc9AF1c0+1
 PWJCK0vX/PmQH9P3sfYxQz+/Img1wReVi4l/TqKdLSRKiWfUwNvm7qKYy3nIcyJ6
 5bge+g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvjce0a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:47:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7a432101881so5227540b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762771626; x=1763376426;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cBJVNfik5OiCeMMLHOumoYf4lo5WTFo4GRQQQ/riu2k=;
 b=U0B/hisCwTsjVa7M9jI2L0EscxuSNNWvHKytJwiGo+iuLMOuw0av14hU9edAkXW5Xp
 Y/f+Q+qdXDnNNvm0575KMkfsVqRlTULppESlaHuRG28vpiWq+MDGuZ/hFRqUqIa5bZwV
 S19xjizgrnOJurVJ+zZzHWQXfsez8nIfNKPtUUlQQixXfQCxFJKUcAT4Srx72sF0PBSB
 BhN/4lfcuzRLAj9eoiovq4X0cvcg8w8QNVqP1VxMGlBdivn/+rX9kEbLzJR+ghOHeczF
 AlAB70DBVpBKYmt2MHnYaJ9XRNlhGS6dTARl8slLQBQiM2dUvrAJMDWhtBK6lwlgJzJK
 E+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762771626; x=1763376426;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cBJVNfik5OiCeMMLHOumoYf4lo5WTFo4GRQQQ/riu2k=;
 b=mLrodXKscoez7W9OQnWCu4CT3QhkZaMhlY5EFCVY/xIxflT8Hc7rhYnBiWm9IzagY1
 tnJTfa2L4ocXuyZAJ6S9yMtVcy8QFWHWSeR3BfGti2TarPyw3A3yd1QgRJR0TGum6nKc
 DMor/6wt6xjvLUNQA0uDaRrAqcn7UUWZWjKaMCGPMYqvA4Ozi2kNu/jk4V+7QuyPg6A1
 p2PuMghTwab0gV1TCBApIkJklpOYcL442pv3XZueP4MDIwMrucZl1smHrwE8B6mMNFQp
 APRpLqIGxmQtZQZaOx7EWtJ6J9ZpPH8V0889avCXGq92ZSP7Y3JmSerzTKz0GgdXRsEz
 RhoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIqb3ES11/diusCFaaMLj81QKHCbW4gpJJBDuj04uERLMl7zikd//q44bv66MDQRr9mI36m4mwVq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN8kRkIyskdIKvThWSNjcMw2DSffRcHn8DCFckLJfyxuu0HodG
 RhkoOpDeSErIgg5ui8f+MnFD9uQZl/gBwTYHSqZKyYoqEQqUMlarjTk0kcZYJmIdwgjA/5yzDFf
 Na52e5c4dcuur+x6M1IgIV/LDpXLsnDV09stU+LA5JLgAVCnhxCNISaEwkmvatlzZBCSIdZs=
X-Gm-Gg: ASbGncvyfv0wuXbuIp+MflErWyg96Eo4II3PRuasDHPULT91PMtqrMcMUzBPZ2Gv/Sw
 MjVSevqBKztLOoyDCjaVe0gi0kgLbuU/4OZfdD6FJL35F/adlSM5IhO2Q7SN/+nMiWILomSmbFg
 We9NXIoeByMBg/aLccrSmLIY4RkaKnj57JLV5gcZDrL7gMsrdkN7n0zSZxLxuCV39Ea+gbii0jI
 w5e3/uFp/crbMriEMS0BJhs15N4oV0Q+p2ICJtsixuL1248JrDhLhfmw1WVtYSuPkHDsKDZyK9K
 Ivi/fG3RivK55uZ1m5F/dCupclXk7P9c6fsihDWpRxGhU6JPDIHdOHdSBsiaXtMZ6b+25Nk1uDD
 BTOjPv0esZ/HPm8EnsXzv/A==
X-Received: by 2002:a05:6a00:2315:b0:7a2:7d23:f6df with SMTP id
 d2e1a72fcca58-7b225ac3be3mr9947259b3a.7.1762771626242; 
 Mon, 10 Nov 2025 02:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4vJOPjqb72Lut8GdThOc2xoDZ3DeILcxOCSGvZKHBENufhfY65hftt13Ag1lzGMrSMfn2JQ==
X-Received: by 2002:a05:6a00:2315:b0:7a2:7d23:f6df with SMTP id
 d2e1a72fcca58-7b225ac3be3mr9947206b3a.7.1762771625715; 
 Mon, 10 Nov 2025 02:47:05 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc76c0e8sm11310969b3a.52.2025.11.10.02.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 02:47:05 -0800 (PST)
Message-ID: <0deaf045-4728-47da-8e1a-48a50d035f91@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 16:16:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=6911c2ab cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NnskH1bFij-3DXFgURQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: wSVNXJ77QZSPc7xRh3VR-JYdlnz8Cktb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5NCBTYWx0ZWRfX76F4DHy/EesJ
 ghE8SQE4bVqpcCCSA/mzigtDBSB0LqJrFRW6eIGWZUh3lXAtRRZRG9QPozLlHLvUm64byhwYs0i
 wJ8j8VJlpJsc77UfVAc8yr8zV4sjIyW30S1vGzCesNtxoImmM5Xnmd9WJc/xOb17qYXXhQnyaJj
 y8HNzP/jUCiqCnH1LNdnjZ3afBmA00mUbxov4gARL6GrHwUTlItziyD+HjSHHZhR4eBbemLRi1g
 iJd7lYsk39iT9i9eExikGlJ4oOxfhawykOl9ab1dAu7g+DGBfPILn80oahelqI3TsDa32zNlF7H
 9c8wTqlqWG0etdQ9AAsIcF5KhfeQWI2A8WIWC2qu+Uw/STsxnovm0Qw0HodGkhqURrr8ux6PrVz
 7hpy9MyT0iEdkMxE0b7QrIbxN+HBXw==
X-Proofpoint-GUID: wSVNXJ77QZSPc7xRh3VR-JYdlnz8Cktb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100094
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

On 11/7/2025 2:22 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>> This is a respin of an old series [1] that aimed to add support for
>> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
>> have consolidated the previously separate series for DT and driver
>> support, along with some significant rework.
> 
> [...]
> 
>> Changes in v2:
>> - Rebased on next-20251105
>> - Fix hwcg configuration (Dan)
>> - Reuse a few gmu-wrapper routines (Konrad)
>> - Split out rgmu dt schema (Krzysztof/Dmitry)
>> - Fixes for GPU dt binding doc (Krzysztof)
>> - Removed VDD_CX from rgmu dt node. Will post a separate series to
>> address the gpucc changes (Konrad)
>> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
> 
> The size stayed the same

Weird, I had a fixup commit which updated this. Seems like it was lost
somewhere along the way. :(

Will correct this. Thanks.

-Akhil.

> 
> Konrad

