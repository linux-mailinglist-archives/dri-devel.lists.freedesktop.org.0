Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D3AD3B43
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E689210E2CA;
	Tue, 10 Jun 2025 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn4SUFjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FF010E571
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:36:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6Vwqw001322
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=; b=mn4SUFjE8MRlZ8ke
 th4z4VSdiSRULhatOTzsxH3y97c1zG7QDfIUZKTm/6V7IOw8NTJXEcce9bnlNkqa
 dCLMgWGT83cZ+cqcYHmJ1t0AOAJp+mIkzzFgGlxhI847Sosgzv6wmT3F56XbzxDq
 c2p2JWle1/byMaVeY9OiCTu06028CUH6HFQ+pJdZxVYxs7U4hnb9HtReEdkxIQvJ
 ENBqgx+f9YrdpNbPDQnELhIYRDkrzTeHi5MwIOiHy9tpTmTXvzOGgWQUSyyS6acy
 88+43FAPKs6bOFi2QEzWcinAkUqHruexI4hoD8Eo/hdnPfd8c3UxCNHFY/AjFLIe
 Rf/1+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tcekm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:36:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d09b74dc4bso95859385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749566204; x=1750171004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=;
 b=JiNYvqVH0tzCKBbMmFvV/3GwVVKoJHvAVr8XRGvk8hvys91vmmzx7/HfWbhDcIGheM
 ACk3unJLn0WQsX2tuRO7mYL4AJrrGhhEGiTmMQ0oVe3tbVf0jmWoQTZQ0E6RUb8tfDP5
 oAhMILFfo0UzyXbEm74jlZSlPxHX5801DE9vHqQ7fDEgWwW/GpSmNGfTyX0hQnfX4Hjc
 Cxj4Ld//i59r1ZXUlmVJF5fGfrvac7Nj8JnXbVdf/N2G3cM9qFH2PqC8mRCPzDwC2SfL
 uDnyYAk2uURWLjnRSFIKcJbQuv0bPP74amWH4J5tIFeamiTywl+QzXGWLWxq/WZY8yOi
 htKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyrTBSCXG9XyNpjl6Ss3ux8PS2gm9fn7PKKzCm4gC3eESszJZ+E2qSH8aOBL5K5VAS1a6B+bhb0q8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9QZB1ZHlfzymH0J60XjODg5BO2T28/mwr3xsZhsC23l3SKaO/
 PboFuNFaq715nGaaep1t388sinhe7fNrSTINjxNVEiH6bPOEdF0x0DcZzuqo9THBezkq5/e8nyI
 bHDQ0BpDa8asqcfF4k5pQuOJKEHtNk+cKpmm5N792xMlFHrs/JZQEQWd0GKKL4bhzIYiNEi0=
X-Gm-Gg: ASbGncvUz2Lq3os7CGtqcpYUG8mL6DrDxH1jZEDTRkS2bJoF+cnEnJj4qcxvYOvR53t
 aM3yrMJh/Ft4vSRtLcMlRsMBCY5dedQJ6EQi+QsNs6s6CTzne+IFxI+1YxDwmrV/zVRhhXfDN6/
 GzbEBqJXQwYuPocthRODiHeaWqxnzujccKhy6iy0lmo9Nhr9jGLThE7nES/rVp+HB96Th2xKyWy
 neKB3QJF1YbqQl+361YhaUuqJR7C86vSir6YKbxM4xB7iCcNMXgQ0Zvpk78m6BYTzXQxYVYQanP
 mXPoCa0VbAzvsf9hzUH23dHY+sb5IRpylP9PSXqMf7eawNutJNMml57ocDFZ/3GKgYzpo+37As0
 x
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7d33ddf703amr932426885a.8.1749566203889; 
 Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBbQ7SHFJAIcnH7aGz2wAofoXXYsrztV5V109VXWdIgAcLNVnSvMvyMhOqmTXg8HcgDxWrxA==
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7d33ddf703amr932424885a.8.1749566203410; 
 Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d7542c8sm734986766b.21.2025.06.10.07.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:36:42 -0700 (PDT)
Message-ID: <33fe6caa-6720-4af2-a0d8-44b75b6792da@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W9nSHxx6JcIcOVbrEKDApxR4Kbxi0udm
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=684842fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtEEE0qNWcsMKkko6jcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: W9nSHxx6JcIcOVbrEKDApxR4Kbxi0udm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX2aePBERkyLHu
 FwaRudfWIupa/bgEbMUS5hzZPsIW3+lLflAoad2HLKaaB/9K+9uyQ/c5a9cS1QTDDx53odUQdDg
 7nUaQk7TCOQZfHr0p5DdkWmsiXmSpZVnysjis3UeUmR5Yutk0feTOI82rP/hAlkvpau4Cjdm0ZE
 xibHkSjkqGedQ5Xjv/tlh+7fxPtHDgrdqtbjXmbhpkSw+8ALQQq2aNr6fPOINIne4vb9ezf4GSo
 f5IclUMpSwRFxTZol7jqceAp6seZfnYAQT5hkdB7vLwYzrT4RfuUra5lo2Fi8RDkPPsY3JIQ0i/
 Iz8E2FgyM84GPioqqBbS0dXxeAC6CfcfOT14CNscai1sTB9xJGzVGGW8QepX499uQXa0kDLlflu
 pbmrQk9ZXtvKCD/i1Y3TI9KFd2gOuXEtGYQ5gX3NUoVFy4O8V/NU3e4H4yBCCzK77esB+5go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116
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

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Matches what I had running, I don't know the source for fuses but
I trust you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
