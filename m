Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD80AB14B4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C51910E0CF;
	Fri,  9 May 2025 13:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWHmYOaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E2A10E0CF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 13:17:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BupnG022769
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=; b=lWHmYOaDVOS64iQx
 gAimpzphqGRZjeVZBWY4fj/6W2tWL3efI9HtoYbq1lVhmARYW/pB1HLANoqVpYnn
 AtCEvEQnViELvI1v7t3y/astKCB2e+3OO6fSjgs8SDIrHx3S+yVC4iJGLWMp9Uuw
 647S1BnuCRvVuBAHlb3Wo5ElUmdxM5xvOsFxt4HcJhTnHN6OhK3OR2vBFfH5ZlAt
 nun+a2aOBAhFd05k3wvSNsq/u9ylOrkC0bm8ck/Rswd6sucP7oojzFG6XsXInOhq
 BdTM+3SzEf3u4sn6q3slL0T8a3Ly2czqt5C8ZPj5JE0CK6UNJlnBgGoLigmUQw/S
 EZ+Jew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp84tpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 13:17:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-476783cbdb8so5454701cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 06:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746796667; x=1747401467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKPwnoZ4z7Zq1QPdVARuUad4atOXjNSus5NyMxTgizU=;
 b=F3gbD77Y2SC4uESDl3BFOzzAZrN/MP9kWFr1zg/669xVaYX9PPLESaVcpOAr/XZ44N
 qaxJNB0TmkvErK8mEe/wRzbOQKeYMKsoPuYDdJ9lvGKQtJU4S7EyhT1L9Da0Fd5TcpqP
 LYxF8BEc5yUouIadB7CPThApfGtZ0LCPV8T+KZdXe2C1iT8Jaa3AoCVFsOrmhRc10eGp
 Sf+R173kx+0r0wj4bmNIQnhljijqWZH+Y1SYLEyz53z3SebQq5gcygxd20ea7/NZznSw
 Rf4Usr/M0WuANwa2pS27tt1/3fLytpoRWsUhQD8OqZnEU1MBhDiu1EaxZq/oYt8xmWqy
 iNaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsK5Md2fljf6/MUQoSIdcjXUef0nN4M++sEbjH1LxlJ2Zz8z8kcxAqQKOo6C4jiVA6vnzV548ZwwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBLS3cGROQPjTECwNZWOw2OMyr6P3vq4XR+eU9/PSSE4xfiKhz
 CcG8b/G9u5tw1CuW2pVXE8jL0GPWSmdoaWIMyB8LrFywBiFN98xcpf+Ui95HnK8H0uuPRnXFMCj
 M0Y4+4Eh8Olj8FW/kRdRKW0NZ+nGpr6k79uRhndurxFMKsXO/dDpclnt1qUaBu+65Ceg=
X-Gm-Gg: ASbGnctguyAOaWwczpJqWi9CONIGrLgsEEnYoz0/VfSBZNTRd+5QdPZGXBru5zRem7J
 aHFXmCXj1voJvDEzUksoy5CVBrYPOEUrSNp6DmgvgE7zEoGETeWWUV0OkdI+K4X0zeCPr+/XZVv
 rJli/zgo02uYShRYzGNiN4lmIh7OAP5lDpNPyzd/VkxRvq+JSg759Myz6e7aoz1nUtRHFp2DtGI
 UVJAp/w4XRr9ZKnj1jeKJ10yVsTBeftZO7X1YLe76S8EZi7iHSDYA3vmKiUsN0vmYVPBdxQpo9F
 AiNJMow/b2LiJ3UtceSMo4Ms+416kz3Gfiw/OTrcU8haRgJw9CDCy+CdlsyHNryUbeI=
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id
 af79cd13be357-7cd010d4ea3mr193942385a.3.1746796667391; 
 Fri, 09 May 2025 06:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+qsfdtZ6DmZdlZShEv27vJFf9u9wNMnx8fyO0XHAbQLPHn8efyDQhYxt7i9+0FpxG4WsvJA==
X-Received: by 2002:a05:620a:40cf:b0:7c7:a574:c0ac with SMTP id
 af79cd13be357-7cd010d4ea3mr193940885a.3.1746796666870; 
 Fri, 09 May 2025 06:17:46 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe4c83sm1414304a12.8.2025.05.09.06.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 06:17:46 -0700 (PDT)
Message-ID: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e007c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Olu6NZbg64VfH8RIhVIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: QkpJlJ0hdo6y_AVMrRYp8gCwYfSmx3nf
X-Proofpoint-GUID: QkpJlJ0hdo6y_AVMrRYp8gCwYfSmx3nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMCBTYWx0ZWRfX3iZiPKntdpJI
 HAP56pRRuFalvQTTVudbnp+tF6oLa4HWRXG9usyvSDmvPuoRx2guMGSKs6VpHLbh5Xemdb0RRRz
 iHFIo3/fux7673QhOWQIXOno9y2BPBB2JQqJ/BT8uU06P9AjfG5X+p7KGGsKYMUdKK6F/QFToSE
 J1OBWmUBBJPHplq5PzFMIAf8OBqfN3eq/D+mmi4mG8LZB8VbmUS3IUSaMvwas6xp/Mthz/NRJlu
 vpXxxQFVLTZ6QBFor80E4zHtkwSx80qMbgDuXFa3TaAH01iAFVrteIrDNIjUhT6f70cFM1qEumn
 sun98qYA0eOFoVA2393LJIAUiNesh23LTjo2wjpUpLsvwWGFU9737gRqroAqRDKU/CkoJTyWeJN
 h2vQ4ft5aSZOE1xpRPkAJR7n1/Yz70DqnIsuuycxdmhDkzOBm6urMnbk+WM1tvTqAeFKhiyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=974 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090130
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

On 5/8/25 9:26 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> This is definitely going to break userspace, because the kernel
> doesn't expose the UBWC version, instead exposing just the swizzle and
> userspace expects that it sets the right value for older UBWC versions
> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
> It looks like the data for SM6125 is just wrong.

Oh that's sad.. I'll drop this commit

Konrad
