Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA55CA49AE3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524210E2AB;
	Fri, 28 Feb 2025 13:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG9WXvGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990C10ECAB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:46:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAX58d019989
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r95R7tzUmkOZqqPt8d9Jdn6qMh6aJzeR3kWmNTHBidI=; b=WG9WXvGHGcttu2js
 DCuqRGAjOgoNRrEHXkchcTJaHmlv5baHp+U+jGwVVve2pYqKca5aR+7K0nYL7fW5
 b0r3XIcLImfHYoqR9uevUu61nzalX4fdXYLQoT+0IUgs6lCLEEanOGJdWNxcWHjK
 dM1sCwYKjdn+8oIQf8TgQEjxfUznmUwY6eL7LdkopGYUzAbTBv7CXJJDEVJhBhm5
 bungXysf8QqBiHN8ER9EdY3EbKF8fzc01ayBdrUxPPIVjqw4Wa3SG0ekkiqyE0Ms
 XFWwkhvqVlLpY3H7EzsrUZ96Qsmb6o798Rowot+EUOG377r/h2HGAWarXsimaoIM
 8zR2gA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4539upgwn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:46:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e662a02f30so4668766d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750378; x=1741355178;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r95R7tzUmkOZqqPt8d9Jdn6qMh6aJzeR3kWmNTHBidI=;
 b=hM7GERoYTNmodAxOmRE2mliU1wu6ZNV33Ji85J7/BTbr7JMlBLirj3/7x0ulmgJbYH
 M5H0mg0umXlDdzATl/vq+mVkYf0COYMdvqlGp91w/Q/yeHvrRDrq8XK2WmEE7GpGsbL8
 +4pRWlReszlGHtzJLGsaL1RWc7bWJ3Dcs7Ogm4wDWX6U2Q28TF0Q1vAnafNFcZZ1eVmT
 1RbFuX9LFbnDCU111aaX/sIrTvYHjAhXSBLPrNXK6r+m7SqSVZ+VxQNo4fu+PyDq7wqd
 qAV0OkH4eSyKt1OYXGfNpj8Lu/vniPYmPIuy4lRU78mEdXylBF6nnKtMzY2/SJltwJOb
 BAsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz4yjEKajuR256pGzvaFXGBcTbuJmkDZthcHpvS2lTAkANBC3LbLEyn8e+l+sDKkxe+SdtostN+Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEHrZ3vQlGTJlqIpqueuraA08v+PJvaDsV55XWwlzY+Wh2uHXr
 goPvCs9JH1pdb/MhYxzuRo19O6qaROopcAEc5XQGkRGmGD/0p9yG6uERN+CMv94YzhNv6m6coX8
 NDpRXQJDuuSGeCH4yiS2QlRpg54RKItNRDOTXp06Dhmk6AnE1MuA7g/j8+J986JhI3po=
X-Gm-Gg: ASbGncs/ZnmuadLK9M4fMw5w1ZHB0SeY9b2OCazHZ/Xz6SeliQNXMlbNlxhI4RlSjN0
 VnVMS0aEOX0fB4xc2dIs2P2Y7jMjMxWNMoQeeeKj4TrUVVlC4/8q4Zi5p6x1qHelEq10KkVYdr1
 0MVyi26XKH9tiPqYZ/ydBrSeuL60GpdsTvxYsDJlKmRqSn1WA3IU11iecPaKXzA5ZnDDFaP8IEa
 9CC0HBcQFBgVstR2JbsSaBq5phYgQXQDofOY57beQK1uxgTuFZ7HCB6VN42WgIe51ypWAynO/t6
 XCm9zdNSmmrb2c1mssI5wzrMkmkC9JwIe603+gupmdQxJL1XbnCHBwt1bS9uP3UJSoANUw==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ed4:140c with SMTP id
 6a1803df08f44-6e8a0d6de81mr17037126d6.7.1740750378608; 
 Fri, 28 Feb 2025 05:46:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWmbVtyz5v9qdeTk2Q60/snetUXxtadcfnzHCU2jryscortfPes5qhPNB3YWzaAGxONm8dXQ==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ed4:140c with SMTP id
 6a1803df08f44-6e8a0d6de81mr17037006d6.7.1740750378268; 
 Fri, 28 Feb 2025 05:46:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c43a4e26sm2502065a12.66.2025.02.28.05.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:46:17 -0800 (PST)
Message-ID: <9208e80e-b7cd-4e7f-86f6-1de264c13e6b@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TxrVDq7KcsLJQSqYNVeUkpUYJ2l0et3f
X-Proofpoint-GUID: TxrVDq7KcsLJQSqYNVeUkpUYJ2l0et3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100
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

On 28.02.2025 2:43 PM, Konrad Dybcio wrote:
> On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
>> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
>> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
>> from the PINGPONG's feature mask and, as it is the only remaining bit,
>> drop the .features assignment completely.
>>
>> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
>> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> With the commit message fixed:

I like to copy-paste too.. this one needs no fixing

Konrad
