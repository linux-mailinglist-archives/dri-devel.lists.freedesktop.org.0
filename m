Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFAAAE1DD9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 16:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C93310EB75;
	Fri, 20 Jun 2025 14:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAJtHpAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6557F10EB75
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:52:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEq6Rh010944
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=; b=ZAJtHpAg5TytFv3W
 kvuEP7MlYXk08pMf7BPEgfge3rI6e1pJiKr99ASdea9Wguhu2WqaLVwo/hjsVtL6
 3dgUGZpz/CmqkHIg007vyaJ7HlUJ6R/Bo/Df7i0zzmZgjH2LHc8yzNCo+GdNTkny
 mn0iLXTk5buYeTmE5nZpfKBmadFdmNILbOOEp8XNX3eEEd1w64JjX5vndaZrlLlV
 UQInlFPbKPV1t+Nc2WT+3Dz7TAjHCoiZpzHzR1tTtT0xetNlcDAPOxVuQG2iJGyk
 RzcHwfFAGdEqnujpE0OrkBPgJQkxfSCd49PTSZwf0l6ZaXuDRJXwaqGntp6tRXIy
 igOgSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp6290w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:52:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d094e04aa4so55704085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750431161; x=1751035961;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=;
 b=fYXdRoomcvBaIEGDTwZk1uOjLmue7Bkr+GwEfkpfud422A3sYnq3CNXtklr5l8xN4x
 5qMLEXC47QrgPz2oJqJYIkSHu1m39TcLXQ4VN+gvzO8JQWEEY1h62YFks+EOEp4Xfcp6
 SdhMFqQsQQ+eIM/ihdff2TOHITCZU+EbgIcWlHWDDwOzl6v0Nh+B6F4zrj60IUIGEIdS
 6MBUjeNoTLBJnWSNLbepQ0/0O4U6hP5BHUlvCW0vm38o/AEqgsoA4HJRAfqDSpOXu1v6
 EnH33OaehHFQ2rA4kt/lHzf5r3zf88Cro7cE74XxutoG4OaYBYZ1arGA3Z++901BLgfd
 xw9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkIEuaBUsFQlTbKGzc9kidQThJIxNCeQDfbgcdX4Inlzje1UcBmr40Ugzt5FOT+CIkc2LGD0KqWG4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi4xRrt7cw1Uwy9fj0yLs3zb6TWI/GXy/Eomv+6jqTAU+KWn0g
 U8K9Mek48rsvNigtmJMMOV2Oho8FuebDb3Npty1fqHTlRKB/0KfAunzwmk0G8YnCbZCxmuJr43x
 DSLydFmAEWR/EQFh1IuAF+mPK802jC4T/x/o9Dzf+alI9yEUmwmEURvgVjrf1y6XBT6X6HYs=
X-Gm-Gg: ASbGncvcCpmGct4aMNqr/QsTAEPKR/vxnIAQAUlWORGgicq+oyktaSWbvQSDAexQpyv
 +Zp3lrGBKQhE4zkl2EDL418IJy4dn1z2Yi/FYEoB1JaDeMjh1uvjPe+lmmE1UnaQ0sUl9HHqVSV
 9DxsQRbdds8ieJor45ZJaif16ATRtU6sU4yLXNmaYKtYSCwGqPMCQG5IlBOvoZi4wccL/wE4/or
 ztAOFQJ8Ljb/bfABmLJrZ25MzAiisqN1YpO/1CPbTuvYx3giNJGYoB7xglPQdOFIQEGfuDY1d6E
 F3rAZ6IKfBkwuFI5l9w+Hvu8rXAPNRVG3P/UzvrhTzC4T4aU6L6xF7Z8iGeoGJDqXrTOYZgk6sy
 XxqM=
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id
 af79cd13be357-7d3f98d9073mr155712385a.4.1750431161600; 
 Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWSbj3zLVYKtfz8K+lKDPK0MngK/y7uQ3TDDGuLOc5VoymNZIeGKtQmf1ZbkgF7OimM7IZMA==
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id
 af79cd13be357-7d3f98d9073mr155710185a.4.1750431161098; 
 Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae053ee4ccbsm173800966b.70.2025.06.20.07.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 07:52:40 -0700 (PDT)
Message-ID: <e1b552c1-de9e-4c6d-9340-232427442620@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 16:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mOIxFzW09ZHTH170xb8ZI1TJUtH6gqXv
X-Proofpoint-ORIG-GUID: mOIxFzW09ZHTH170xb8ZI1TJUtH6gqXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX0Xp7UJEtI+hp
 ZoQUY8CpQzzXCxBKTyDEZ397zx+gIwlZNZ8ss/tY7iK37nGIp1XCLca6lADn28wc9X8Sff8w1f8
 5xRUrjU5CiTMxzgQt70kDNoe8CkpHEHUlVdZZD0h/k1bF83y46OI0um1esvs1ZS7A701fb8vTvu
 FqTvR5mN95xzMC9PkQz/3MSylkxs6uK2j+p6vj7Dz5OsorWkXUc9JGafXNafwqndDrdNoXNkb4a
 9fJ01FAQNEYbvILEYOeq7m/TJOOA7BAwwSYS3aeSw8raZ7iu3vQure26eC11lUDl+BPIuIjDn0i
 3DaxRjpSphFycRC/7wJkqwdgkVRGbmC4EsGPGTLGZlb4AQK2WRVgnWJU55GKEOUADcljXvGZv71
 +EWmobKKxeLhoiqgXcQWG648s3LUS2v7e5PxCpNPOJKdo6XeNvlMmlNNOoPNBALtd9h1FQSo
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685575ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=5RVeKMBEKdVlAG-YRsMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=834 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104
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

On 6/20/25 8:54 AM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
