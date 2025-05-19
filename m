Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A669AABBB9C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C814510E3C5;
	Mon, 19 May 2025 10:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqPlFKgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0B110E417
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F8om014390
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ezwPMR8BMohMqjYrOQ8JruSRo2RSohjLEs2OJOIJnhw=; b=nqPlFKgDtcJTNdC2
 1oP9aMoBx6nrqnnJuWQmxp9B/vOaolIc+Y3A+WYU3zrGgijg7O9nkhSNFpIELShO
 rxdId+AzFZNx3mLnOpaf10IUFwocrgMhJxRzLgR0369oRH40eFekjitj26vqTKNn
 xaUCM9AOwRPNjO+JxEV5hWzbhasn/1x4TehHUSOdyPrRQfq+vV98NtLR8umWg0Vi
 01Jio9f9Xm341DOyopowtH4P85xG8AAXv4gX4dyYwIcpiaJupIzDj779bPoFMvSp
 chKwifU1Wa8wHIBtSlZnKdBOChD7kHB/maCTALbzBYUbky4IfNJoWpcb2cwSZqFt
 JbO1Wg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh5ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2320502023fso17924395ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652319; x=1748257119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ezwPMR8BMohMqjYrOQ8JruSRo2RSohjLEs2OJOIJnhw=;
 b=uI+jRJYZbLBZcQJZI0u9jds4BuyIisd6d2NFbGDidTBqZjiLP5W6gG1MZSlnuTwMGd
 2NjfDu9Gky/uaXQ904tblyBmm9NINkkQK1HJi4Xr7+yngYDru0wrdmr0OUwS6AfAz4V6
 R5ggiVYIzF5nhe7Ymct5Qxa+YETunYJNzjj/Lgy0l3KXNmAHcSGKMlwJB3Hm3E+R+2QO
 RZGsurwu0CZO2KFLh9Zq9Nc/duJBLd9wlwAC27JZdD8sEBxdt/7jUj1TeXnB6Dzqj84s
 O7uyQbass56HTb2Fx1IdzUinZtURZ6USJG8i4KR/ODaznusAum7+/WDFbheU8E4LBf/K
 wPLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQT8l+Y+3cufV1CVr2o+sUd+7MIHTDOUDfB3cuK5BOmtVopDBqrQ7XpsoF9zpT0crtlvb20yYLtp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7p5gZ1kBXQFqd0vt+nwlmFqwe5fqbZlxtyWr6lPja1heZ/J6Z
 BGC9KqV+zz3mRGBEQUXM+kSKTKJd4xyUV2BQLXZ6hfsOaK+d6x1Mew+tvygt6gIVKJrjkDB+rTP
 wZIRX4e5oa894pJunFM5Q25DexE/GMsJ51z02PCATBAXLcAaKOC8ninMjk4dZfJkQp9nI6Yo=
X-Gm-Gg: ASbGnctlf4FM5jaTSGpZMEwpCR8z+zlrq0DLXT7D7BOOGZyIJpWqcsXZQ1+t2ywq5VM
 ePzLfMAtlo4OTBxWeJM7yAjW7FXSaipQRiZY6AUu7ZnbfShQ8tS0YMB67SEPWNW7Px3JQe3AnRK
 vSkZcpOJVfOyaA4VWlaazJWoCPU2SLHoZGpWSJ9b261AEwdOkfXYQ2c8vTyR5ol1VZ57ZXo2dTQ
 7LUD1JE20EWpu5bed42R7bItImGvbxq9xS7naML1Al6Uus+B2vGZ5MyGbylFwTKWgQWkyp9IUmN
 oa2GK9NsD6qQZKY6H0ulPq/w+wfcBG4RnCTkOA==
X-Received: by 2002:a17:903:17cc:b0:22e:5389:67fb with SMTP id
 d9443c01a7336-231d43d9bedmr164170415ad.7.1747652319372; 
 Mon, 19 May 2025 03:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3EdjbB0W7Ag5YgVP4lwZ+LArL30OC7oyQH+NM/5K3jhYFi8kBt1aEKqOsDIaJb60GH8INTQ==
X-Received: by 2002:a17:903:17cc:b0:22e:5389:67fb with SMTP id
 d9443c01a7336-231d43d9bedmr164170195ad.7.1747652319028; 
 Mon, 19 May 2025 03:58:39 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e97db8sm57252635ad.110.2025.05.19.03.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 03:58:38 -0700 (PDT)
Message-ID: <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:28:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XqTeMy4O4u3McyThmwE153maRym5k4y_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX0/1GZXshCLdu
 Bh4O2unYrjFLNxTlkfU+7IAbNeBl0evpT57dxAUqLXGAPrUeCtMWQoW73ZDXgusLUxj61vQ5yHE
 z9hAT2YusAobKXmc/ykBrg7vmjjfcUxgNkNNM61r5dtcQiZedOiI/pUGcmrPirYO5QthYuOfIJt
 kX9/rhL66i/ujYatWTK/SEynHSd51UKVrx0WRAywWM610P/9HfhbQCWBW0bjwmQ8b8sIWgFelWb
 7PEn9XyjJNUbnlz/Zn1HZzshqBeiEqEBOMvcxaJ1QPpRT1z5KwMTYIyr2Pqgcv7PevgPF2Jm6hW
 eKBpLV7t6tz3W/np0Jk4UIWyM9Jyng2sGJiDxyWmP1YE4AHooH8Xs8JoUOowIVPFKAcRuOh6Npv
 /NSVoThz5bmIozAzTy0DGHRK55sTgAkYcGSbtyfj4BXwVV3CRJ0P1ja4yFe3NtjD6n5HnoYR
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0eee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zJRMy9OeSTis9rFUpe8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: XqTeMy4O4u3McyThmwE153maRym5k4y_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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



On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>> User request for remote heap allocation is supported using ioctl
>> interface but support for unmap is missing. This could result in
>> memory leak issues. Add unmap user request support for remote heap.
> Can this memory be in use by the remote proc?
Remote heap allocation request is only intended for audioPD. Other PDs
running on DSP are not intended to use this request.
>
>> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 51 insertions(+), 11 deletions(-)
>>

