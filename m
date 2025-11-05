Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF2C34940
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C31310E6E5;
	Wed,  5 Nov 2025 08:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MacXn/Ie";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpBHj+FV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58FD10E6E5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 08:51:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A57udsb159611
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 08:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=; b=MacXn/IeuGbJuE4j
 wckOCLXMyzABVkYtoQlcbXbl2LnAPJk/bvrxciicyLWj5ArsPqgZIt1W3r8r2eSo
 Wz+Q+IkcH/FCoVOEC8udC1ZMQVyFbeKZmgu1J8Twqdx7vrC4YZQZRStUVdebPLhR
 jjZ0TtnzxIu3jAHHnSGoBQ9acGkb7byqmo/GnwAUhHC49myHK/tl5gecgeWaw0pp
 6wLOJ4M30EGW8jDTRgsszA1EDgJk3eiNZpGqQm/ueBxi5KSHb5XguQqni/Njmgm1
 /bNrJL/2OJOOxt4oR1svKMIPG5SCOVE00lQLSFFuvAhAabS4YtnLmd3tDhi+YP2+
 GVVmMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt058t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 08:51:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-826b30ed087so20313336d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 00:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762332701; x=1762937501;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=;
 b=GpBHj+FVpVtLD3FftwP07Mb0Md0m9cylBccEeudHKr6NmNtXSNqa1+ADEfho5RdO5s
 7Oy54QZWV8HwTeztdLJQUOlnDu5m+Hlk7qTGucoz2/v4UFmHMjCsyj6FlqJ3dpRVr1b7
 6aBw3we3nJkC339HUCpArQJKBCqyX+2gGlBi5uauYsgH7PrdEb6qshMIo6K+O1ku79ru
 jkem3sZuFlmGvKAsucDloj+zrb+irJ1U8FfKvevFp7Xa1XmzvXZe580Y+RLSiFPeRqlS
 XylkCJWDwSO8zAx4hP8+yjzZaY2PHpuyvOJih1X6tH4UZluKkBd7ybQlk/gWDlMpDNdd
 VdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762332701; x=1762937501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=;
 b=iLFxuXwUSBn9gTKMZCVrmbmk+V6PfJymHZTFX4hixLeYqT/hEFQ4cTg0PmlMYKsoxF
 MS5CXczZIjlPK+a/y3c5gKt1vMfZPJ3e9CLG8yg1J4DFRoQY9HYnEfvwaRoRXNnKP5jd
 h6O3nRVbjaTXKnpDtErgA+2+O+ubNQ9f3IQxDLIrR9RjBT1uue0V+5ZmHiDZII90ju+Y
 Wk18ltPDGl4uhDBSnc/gEH4pAptk56mrwsAKmpSJeXxGy5GHBZYx9ZNNwREggSKVHl60
 7BkKDtbIfyr4vn9E7qBjcg2HsqdacrX0JGukL6GNItWzTJu+Bdm8ZqKVwb4+2AooYnGg
 WU6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcwv3jJsL27KgOTQ2AOQKmY2VIRQhJJz7T2F0JshF3B+M+Gp1sZ0//NeBur1N/1acdRR7hhNEshug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoGgZBBakwFV7bT3/1W0SE4pD+h89lFyp+5Sf0JZCOss2fJNOM
 FEr6wopyU9Y4rMr4gVTVxuikzA/cqmbNlO7PSQxc39h2Mc955KUiO66WZr68j7wiC8Xxlvdgoj1
 CpHjh03JNZVPElPtVlU19oBOxxZ2Zkl37GdeQ9fSU/ZzrHABx28i5n/TT34f45hB+GAm6Kcs=
X-Gm-Gg: ASbGnctCjw8QKUFAsugCJPgHos+NYUqYhI+p1o+kSZbEuJp0rYr0xNZfhiNf2Dygg8g
 OQUJ3vlhtVUhq0Txx1chgVTJ8CZoOn2s+/EWyRdwt60UUzQlMRI4U137ls8ZVGaumGVhK6K7xv1
 ToTEJrhwxL19Ai7dukBh7MmOrASskTtk41MuEyAGp9DhiHSvOu1UbIZaf/nhwapTw00ir14eRv8
 n59pEJvk5j4xl9mRJVjbZFOAjdNoVW1QAp3zoSbQEImBVGM/DdEQbWEQUFUt8C4lQcWJZ15nz8X
 vDZt3xabqqeP0Vc7UYEBDqggWE1tEmJg6QUbUv2JjJaXuRcVZhpP71GQTl9p7ezot6Id0ioR3XI
 ZI6q/AWzRMHvCd1GsXgSU/A0mKMRAucAzFbUS6hVaS71mr4Mqq0holkqu
X-Received: by 2002:a05:622a:1a9f:b0:4ed:4369:f3c5 with SMTP id
 d75a77b69052e-4ed725ee834mr21592681cf.12.1762332701127; 
 Wed, 05 Nov 2025 00:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8BF9xVY6+n2uyxJUIST3H7zllQ3FZVT76UKK8QHLabE8qTZfJdc6qVuYCZ3/l7BmrDK1mmA==
X-Received: by 2002:a05:622a:1a9f:b0:4ed:4369:f3c5 with SMTP id
 d75a77b69052e-4ed725ee834mr21592561cf.12.1762332700558; 
 Wed, 05 Nov 2025 00:51:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640e6a5c773sm4092065a12.18.2025.11.05.00.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 00:51:40 -0800 (PST)
Message-ID: <40bde143-fc3c-41b0-8861-9c856d52bc8d@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NSBTYWx0ZWRfXzH/29XD+9KJ+
 29LRx/sMkkNeF85wvVcpqQlEUtNVlWs6sX8kLNfNlmp1VIy7FdO+CgugMZ31Ma2i50uRaVtkTC4
 6RC6PODNrtAy1m0wgFpc0DLxdaM6LbHj4/66jo+6IyuR84iblRDDthVbHgBbCyYPdvZDLFgSgiD
 2MMFvwA2oNzC6tva9RvuSP1+cq2TtoVqBt5deyZQmzU4NBidMiKp4UusxOme7p/1QBvnziN4lg0
 jej9NXSUw97aT30HVGifEFMba9t7aG1f/IhFsmXbu7KXOb80lUp2SSwzHk4U9/Qr+8tzJm6W1sd
 3ok+iZ+/awD3CC2klDXgFsBHolkuC8Ji2CG95ozULvHJolIpytspw8AIm/koB3Eakxdj54R7I47
 evH3TMCCQ6TTCFE3+I41hcbgbWRhvQ==
X-Proofpoint-GUID: 2L1UHQ7WFAHfT3Y-8yffVtaNM0Hu_LIO
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b101e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V8cJkdWAq56nonIdhLQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 2L1UHQ7WFAHfT3Y-8yffVtaNM0Hu_LIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050065
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

On 11/4/25 11:02 PM, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

About time!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
