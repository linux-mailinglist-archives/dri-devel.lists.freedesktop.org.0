Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFF1A82B17
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893F210E06A;
	Wed,  9 Apr 2025 15:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="crSzCxjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789F810E06A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:49:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398fYqI010807
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Apr 2025 15:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OfB1diTu8S+2+IjYQiq6NxbHo6UapGpX/p/Wbz6Phn4=; b=crSzCxjWuljA7YwG
 3hvyP3B4qsWxqr+qYYgK9MlYP5erpW2GWyefuR1r5vpHD1cy8I9TWSE4Izkf0gVi
 9C+SZeQhcibQfmpJupsNlTbcXJC64QGCnttIYzLLBtWXRou5/MgEvypCqYO6Jh8B
 WW5QqllGLB1y4v+WWbjs4KMz2Hs3OkrkhjO7pRUqfKRCsNXcPJSi6Oo0QGqkOjea
 /imDrzNxxhX3QrN0yoE8jeojpfSpdauv+mF7J3E/c6wjMSTNOIcALw66p8Oc+xIA
 YhYeInXE1V7/Wqyyv3Hqqs5S1/QCgdCH4uJBuE0LZI+wIp7vpA8P9/r2RGgOs2qX
 3KN16g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftkqpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 15:49:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-476783cbdb8so17446211cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744213797; x=1744818597;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfB1diTu8S+2+IjYQiq6NxbHo6UapGpX/p/Wbz6Phn4=;
 b=XJnOhh118mirOjOvjItC4vTBTE7BLXH8vnRDwvD5xUESGN+2OksL7ju58Hn7vDItR4
 wECLdfUDZMahuzamOXWhU2yZrr8HwyUSef0kNSPsfW+PilahI4ZEpMo3YYv35EKhPeBh
 H7M+aKriLGEyNDzKPYxEJ9MZfsoy1saBsN0CuqI+GLtlRYkuyGbuvVO3xW3mG9EP9duX
 Lp6nt0oa4ZxF3+A5kNoTiJ24WZH2Hwn+lU/SjnvgeGSzc4twCmloFAQjOjOAkIOmYvg6
 v/fbKOyDCJoWYkORIp1Ykm/Z6kRVqBuEG+FFZn6GZJxx+6wzkFokZDcpO7Eqc/661TeQ
 Yglw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI7DhG/37g9xI1NsaIofC86TChs0DykIST9fJRoaT+nKEncRnTBELUH+0jJ9xtk9/xcGocyAR5wW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPASe+xxyQFlIgL+LTtOSamTkndxa2K+gnYkXW996UCTjCrY/g
 ur8DATg3Kd7Yjet02kZ+XQcBpdEm337o7VsgP36UjUKpyTdFwObqqkOS01hGaBbCxKeJDA4v8kW
 cJYE2uQl3GuXVF3MDtrpDSsjugWVU/X5eOVYZmUICBZD0zZXhUQkofsIz3BAyC7A4h9Y=
X-Gm-Gg: ASbGnctvRtlveNS/AyIbJtTBeRWHPr+4Z/um2HrhnN6OYnkUTvhZo0Cty+eH20+sTv8
 T4blpmybE8aurCBsIUiUMlzxEqG/OTsqrV27PFX/MwIEc38bWgVaBDTHDcP8nWsHtEjnrDBiNBy
 6fP9fXbGOTt5/g0HJsJNTCQh0bl4MF7jvZSpuOEgoEhezI6QDXKVD8BjKjTJkMXFG3nhvkKUiIN
 t5EErfEedwfBEvJm0gN1atHSgANhQCM99+Hw8gaja4fp28slU+mwGddf2nSbMsPRUI3UoOtOS4G
 ipXWCjZCuYUzuYEfZk/K006uTujCZ076THIIFJQUR1+UxtfM+m7qaWz6vRyvDax/Gw==
X-Received: by 2002:a05:620a:4148:b0:7c0:bd67:7dd9 with SMTP id
 af79cd13be357-7c79cc38a2fmr170376985a.11.1744213797601; 
 Wed, 09 Apr 2025 08:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgLb4SIntY1KrRW8OaT6UF39Sv6qcj05/CcAG4bsBVpRe7H1ghDwXTdXn925CoiQqmrP0N/Q==
X-Received: by 2002:a05:620a:4148:b0:7c0:bd67:7dd9 with SMTP id
 af79cd13be357-7c79cc38a2fmr170373785a.11.1744213797214; 
 Wed, 09 Apr 2025 08:49:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4129sm117214066b.98.2025.04.09.08.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:49:56 -0700 (PDT)
Message-ID: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f69727 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bKdCaboesIjPuyFXCNkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xqLVEoVXhpNRCsagl6ANDMLI7lOsPSIy
X-Proofpoint-ORIG-GUID: xqLVEoVXhpNRCsagl6ANDMLI7lOsPSIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=612
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090100
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

On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> On 09/04/2025 17:47, Konrad Dybcio wrote:
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
> 
> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> 
> - SM6115, SM6350, SM6375 (13 vs 14)
> - SC8180X (15 vs 16)
> - QCM2290 (14 vs 15)

I believe the easiest way is to give them a smoke test.

In any case, unless something is really wrong, any changes made
by this patchset are supposed to be corrections

Konrad
