Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886FAE45AA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 15:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2655310E1C6;
	Mon, 23 Jun 2025 13:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK7GbNpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54A10E1C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 13:58:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TZ6I020990
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=; b=DK7GbNpcZaFHiJ63
 1jj2VqudphMJnRJdIYUaxmX7dxhdHWTIY0OS2nDiN4a61RVr8cu89xcRyGdgmRTa
 GhLwq++sMu7DgR70uzwptTFprZjMz/Ah5WaMes+sDFnu9AYuO3BOB8lbeI5dP24I
 RX8mK20MwZDrbp6KsLUZXEiHnJE0PIWQWunUWX0z7klfvXVz7Llg8dnov2KLu//P
 AQA3TRgjUd7dn/XdqX+VurjV5xErBCBM0sCuSEgHXpYH9YVSqtqjcXSwVSgFf6FP
 PHUzxQ2ntcw78aS+p7BIhuDo91BrTmR/Y+yL0JOHZ8tNKYxDh+y8tIlTYIn7ILCu
 Aa6I/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rqnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 13:58:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b3216490a11so1456635a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750687114; x=1751291914;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=;
 b=mwgBdvzDd10hRrcxksJqvghKHKprlr51yCddb1qVK1QRAhuJLfxB0iuOcJA4GoGnaa
 AMQkoSbIUhonfPPtZYGnNU3SJVXDQDxFMo2oiS2X9VkDJgI4s75W8cHPXQggB5WTiUcp
 JN3X7gc14+okhbDEqABePld4yiL5+i16oTb5DbEaPzr2Yga++iESw88K+tv32WBV/COj
 tVHcql2/v4B9dbfHGLrU5rvYioLFB2GMo5HIIyWVzEuCCiysjIZvZfrGbo9I4VqbU69F
 82QDHmzD2kS8oNWctAfvBRnES7WzIW/wtS9O+2JFDjDd9JVtLSmPq8f7UNVqtBAjcde2
 cc3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2aL4MIk63bKfz+orvz2KDkVd5Wr1e3MdigqvV3rOk0/Q20uWGxwPF5a8Jr212vnYBiERBvje8PyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfccY6aRJ2Xj3l5yWep0zw+msY4RngfgOwQqyh6TrDKVmzLU2j
 ZdUppIPnPlO0fpRXk3mEhoNxZB7I/eFg9wmwm90XhKMKGIhP7BFitoHdXp2TSnKFtvywNQqTPbo
 Mq4JeypQGcPXwe8Zadzptjn8dwW2zex9QxmlMB4AiJ1sdzt2JKNNPYdCja4VY0SaH0zCD9rQ=
X-Gm-Gg: ASbGncvS0FhUjANjFwsqWhD3xiztFrozK+uTPFsHM0xxn28v2vzN1XjrSBU/H4wTX7k
 DypSxfTRfcFKPE4fCNIGccpqNcycfFcd4pYPgyaQMDqX/LIQwOMF7wwbXRCsvtjbpEhp4bIoFnd
 4o0MUnB9WtE6lTWCzfkC2YLZQtiLNSr45fqvK0l2S4xSbRXC0LjbD9UxoijQmDxQoVuRUBAIkJr
 dDp4XEG2dvAJWXRklwhGa31Kk/9c9Ibs3vcGSGab4BY59QJ/KN/iQOPqV/D7JDXTTHi9HJYlyzD
 yiCGy+hH9yxDQfm1+LXuN4WUJUHEjRLqCUFaa9RaTA==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id
 adf61e73a8af0-22026e3fc69mr18664031637.9.1750687113743; 
 Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVl1R1DUJMadEXAlc5CPHNyyosQFNPkLwlX/IE9EL9s6zL6fnh2dV9q0vTc02V0SmdWqoDwg==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id
 adf61e73a8af0-22026e3fc69mr18664002637.9.1750687113387; 
 Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Received: from [10.204.101.81] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a66622asm8539213b3a.137.2025.06.23.06.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Message-ID: <e8653c35-d6bf-4992-9edc-414309768bfe@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:28:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
 <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MyBTYWx0ZWRfX9ASDWGkiFkYC
 MYrNYiOIQSAEd2ldVWoh4uOCxLFV5BF3USHpDp2dnI7av2bDw3kN6KNbT8Jaa3IDpDKRqYZpbQJ
 ulTlhmfwwqmKUyhT5ozeP8gNoL57/cMgXcdW/I/eM8aI2eG9YsULd6xiuWiiEp37kjobeIaxw/R
 HBxhr7nAmT4mufgiISQVtTlbtWWop4kZivrzmFmqdASmzcUefNfw0wC6oJXUS2qI0WdsY+GFpjM
 1NkosGAt8DmThFNFibZPDl7p+ZzIDhHgbwax+nGt56PCd9WCzK1g9yBHm9wToeVg3ov9MttSJBZ
 i5/F3IB9za4UeQjhPMCefBnE405Td88kRIU9yUwLeXaevS0wmwDJkSeUp2qNqfZKoWgTXDYi9Ke
 XHEc1XO7peMem3fNTt9J2ycQakgxWRBpWspFQWlJMOfcB+PzKIMX2AuV9MxeEqD35+hOxG8W
X-Proofpoint-ORIG-GUID: _3Ayr0HHBa7N2NTKtbbQ7uj30DtPxnKD
X-Proofpoint-GUID: _3Ayr0HHBa7N2NTKtbbQ7uj30DtPxnKD
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68595d8a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=Od58GZWkWy8WqyN3Zg8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=754 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230083
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

On 6/20/2025 12:39 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:54, Akhil P Oommen wrote:
>> In order to enable GPU support in X1P42100-CRD and other similar
>> laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
>> as a module.
>>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Defconfigs cannot be tested really...
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>>  CONFIG_CLK_X1E80100_GPUCC=m
>> +CONFIG_CLK_X1P42100_GPUCC=m
> 
> Not placed in proper spot. Don't add things in random order, but follow
> savedefconfig.

Ack. will reorder.

Btw, can this patch go via Rob Clark's (drm/msm) tree?

-Akhil.

> 
> Best regards,
> Krzysztof

