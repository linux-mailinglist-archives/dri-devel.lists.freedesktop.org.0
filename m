Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB66B402AE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA7410E330;
	Tue,  2 Sep 2025 13:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3U9eeT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BF410E330
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:21:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5829xLv5030613
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JaC59KBlwwCcOLBxHtuji6zgMyRa9S7aKGEwvTUep20=; b=I3U9eeT5pnO4RJAg
 owJhVON8S/oZBIKm6nhzL1ZvqAWe5rQvOUY89w70y679wfzHeOg8OuSz4aXNokMI
 lA9NsVKj1PSM2bIiNQAics2u4s6NdTKUcXU0EgbeRwAq9LfpI2F/vdgHNubsirq3
 sEf1tqYfIIM9GnqxoNULC6ksTxsaXc1gmH+a1OjO40JwbcN0VakdTrM3WTpoqB9A
 MCGkNFSKZN3S0n9I1Xs5CJ1+GblJMn8Eg7objwj7zhl28mtKONd7SCNQJkPuQvz7
 rwz9TmesLzyO88D/AmiJ7sZ45EOTO1zMtNpLjXwU4E6ycwAcdd6FL1KLEnCQJ5WO
 r6jg6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qv8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:21:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-772642f9fa3so1251502b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819310; x=1757424110;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JaC59KBlwwCcOLBxHtuji6zgMyRa9S7aKGEwvTUep20=;
 b=eecQbO/9xZQ98NHYYwgSnJBsmtEkwS+goweYDpFeTtU8nlXPcezfhGJkyKHmBWDvhn
 B8aCJ7ozUrqdgBA6hfrzIFdMKkjv7MTDExfChsTtoWITKGXHgJn1D+vTIzX8rSMj+Blz
 OU/rSDVUSiheYkL4v0IkQ3WiU2EVL8sY7zbycR61UU8p0uXxuVOXU95RBbVIp+WdzQ2Q
 GKdGscqTlACio0Ijplsnem2cMzy56nuzwsCEs2Gfl7Fmtc3+QTztqCgZM3Q1IKMVBMyq
 7rR+6q6IKRxkKYXhksMj2QVt1TKrxtKCYt7eBTC9QXiKftmM4QbGCIq06dZd1Q2zWjxM
 7lBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTQoJi9XLAkFC56zYRt252CbKkiSB/IWg1V+s458LBPGYmAZLwD+j5+CEj46lbeiNchstUTqEKd9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiH7LZ/95nYIQFRVE9NNAjP1Glu3fu+gnyfyFHPoQ3AEO+Zf/C
 sYR7vaqnoHohqV6h41yTOlq/zGbdh18510QWJR2H6WZEdTG6v/jKJIbwmdghar7JxwQmbGCV6QB
 bXjlDhXfTDhMMRvcoMJ5vlgeAIj42DDbZau+1f3nBd8kdQgJ31Sm3M2GikDgLBTVyIrpiU7w=
X-Gm-Gg: ASbGncurarma+SLI72N8PFLYy2T+Eu8Tv8lKWBa1z4tQ300XLQW7Qq46hrbwq2hliUY
 amHNlNnBEYNsf72rkUroDZDyCGvfnXQqAX1dh0MPos1X9ewbXx53naewBPsH4Sez/Dj+Zk+q1aE
 fKCSlRiGruCT8gk4IU1iZFILBROrb1ecGTtlkyBdLVqZ2/GotXusvy4ojWf7TmHJqhdhpeK5yLs
 AamZmTesnmDqzFELlImDCaps8EgIFug+xudIcWLaTbHPLxkKAFHjzUNqcjxRzNBgxQCHq2AIQqG
 gXg6aZ7P/z+67q1HM9bAzTsxmI7LOjEdYLBKELfEnxLHBDItsahqqzcckCh1sA==
X-Received: by 2002:a05:6a20:9145:b0:246:3a6:3e47 with SMTP id
 adf61e73a8af0-24603a66346mr664561637.12.1756819310278; 
 Tue, 02 Sep 2025 06:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtkIfOFvD0HUzJY6Lkpwe4Ds7LLmmdnhloqIvQ0PtyT9neILbf8iU/dMY87XxE3U3HYu3y8w==
X-Received: by 2002:a05:6a20:9145:b0:246:3a6:3e47 with SMTP id
 adf61e73a8af0-24603a66346mr664480637.12.1756819309536; 
 Tue, 02 Sep 2025 06:21:49 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7727bce1b58sm143396b3a.9.2025.09.02.06.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:21:49 -0700 (PDT)
Message-ID: <72cc7f71-fe49-411f-9a7e-71c4f51c283f@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:51:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a6xx: Fix GMU firmware parser
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-2-f3ec9baed513@oss.qualcomm.com>
 <9df42327-b417-454d-9f4a-608979498f79@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9df42327-b417-454d-9f4a-608979498f79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ZIi8aQ1tgmdq2PFey2Q-vviHTlyfSNB
X-Proofpoint-GUID: 4ZIi8aQ1tgmdq2PFey2Q-vviHTlyfSNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX2MMx+7Mh74SA
 20IhwGBTfTIFhjeXpv6946VMickOjghArYogRqOyyh9jHEVYhfBkKNpkVtwJ1lHsd1T8sYobeV/
 LS1F2NH4zS4ghI5Ewpm2ouAZie9/Iu2Pvhr08ABtVQ5gsAfZe8LAiOiD4CNK3R1uC6Q0FSBTAj0
 fuzYfzLv+NZOmmcw27EdrDZUCZm6ntILGteH2esjzk0XkYtwjhZKVqTFo2AFy1B25QvAJuzSy+j
 6VPT3LDT3szp+ETgWD9kVQbgvo0cOOhNDyZtMOOOeyYds6vBJjKAptqffsCdFgT8O1KtHFrGpeG
 bxjQaHloeG/uyFcnpOZtVpc5k8DOOvN3pT4vMYCobFGAt7K5RANPmmLG2N3iFKqUIGOQlF+Tz3n
 K6yCmVei
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6ef70 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=L25_lxYj0dBuOpUmPZMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On 9/2/2025 5:59 PM, Konrad Dybcio wrote:
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>> Current parser logic for GMU firmware assumes a dword aligned payload
>> size for every block. This is not true for all GMU firmwares. So, fix
>> this by using correct 'size' value in the calculation for the offset
>> for the next block's header.
> 
> Hm, I haven't seen this in the wild - do you have any specific examples?

I saw this in an unreleased chipset's fw. But felt it might show up in
newer gmu fw versions of older chipsets too.

> 
>>
>> Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 28e6705c6da682c7b41c748e375dda59a6551898..ea52374c9fcd481d816ed9608e9f6eb1c2e3005a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -758,6 +758,8 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
>>  	return true;
>>  }
>>  
>> +#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))
> 
> CHECK: Macro argument 'blk' may be better as '(blk)' to avoid precedence issues
> #146: FILE: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:761:
> +#define NEXT_BLK(blk) ((const struct block_header *)((const char *)blk + sizeof(*blk) + blk->size))

Ack. Thanks.

-Akhil.

> 
> Konrad


