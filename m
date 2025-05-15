Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98879AB8B62
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF010E8F8;
	Thu, 15 May 2025 15:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8nKleJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0710E8F8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:50:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFY26016973
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=; b=U8nKleJtoiVp0HPr
 Ek0MAMznJhONqXdxdfICIwTA8XT6akalaMuedCzh7N43y+Jc0D4LSl34+JQCJcd8
 xOT7oRbShJqGJZFqgFdJmVC6TxD766q9WehiJVIep+knlDBAlkUCAM5WQcwGXFrh
 ssDo9wjLPYIttGE1EVwU8AOVPgvU/Wr7wBpip+fIEeNKR5T4zWMWBWe/jxvlzmSE
 ilb/eX6at088x+i8uo8LyoyiSbonxTHu8jnwKt6qnQovQhhrrTMgf/ZMHbxtQzMU
 2TRmSSkzJJyVf1efm5N4JoT4vgGrqEoLpR6G14XeI57J/88Nm2lpnjvcPpCdk1GL
 QJuypA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmpu33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:50:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47983a580dbso2465491cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324220; x=1747929020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cc+zErqcootpPTjYvcB1ISvoOWYflU+BlMMVQ4RvB4=;
 b=tTqWRjgKUkiXdJ2srprwsQBJqT7Zuo1cumybuSpI1B8WD7gj/w0WzEAe/RQV/pT9KX
 muRtvicBcHFTgOXRdJN9uYpJBXt2I/lXxwbGJJkOpD3aw7eWVebpCdA5bKRRtf1js5uK
 Ah7imZ5chmksIJ8b+MZ7IX7xgN+jN7UjDY5Z1MWIsYn3bHNW0TAO3boJxHUu2B0hRGhP
 QZWX9N02BU1X13QmyZ6dnjBcngk7S7sxZNnoYG8dlzu6t+2ANBNHjZKLyL0kqTgpc8oe
 mZkGZTUImQWPwz5ldOSe3mT8yMmFRJilexwgEMu3DLbYTnboAz1VCF7lTKzebrCPtkkH
 cabA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXErgfhWRYJzMxOLJgvOKIeIk0HNUjYUEtNIFfn+mjiz4J6DzB08KdicItkcBaww4ffcVDtWYegIrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz99ujDVOsy6wFueAFkBSjX+uijSRXbebclf6y25nwBZVcmYsek
 1Ehy5qSjjk4/UwnAvUbOs84mUXhCclsRioNaNiLDroZnOTlmkPYeca0eU1WCL99aAAr2Gm5P+zI
 tazNMYF+xxZzrCOSi3CGHl74XYx3asRdVUiih6ZbU8lI7p3V0SrOCdV9W81A/Uy6ZCQ8=
X-Gm-Gg: ASbGncsLgZDoj67KZWhayaSq8WjQ7sqAtqH4IXfMXUhl6aRsGv05sfQ+JXjmXAXj8nR
 T4OB6wvTPe2x+gTvaN2mo3w3H1P6HmE9m5Crtx4TrAm9TaVenwsImf5pVB9r70AggrHT+FVKmaa
 tQmkzfaczCBXI7iwG1e///tx2ZS2OH62/4eR3XOSbFMx+4Sd01P7UimDb7WosQGCOoChJplQi4v
 VHTXXAmooCsf3Kz5ekXdiVgOjrNJFdNDFwSAqGBv2Ar9z1i7xc0y3s+xukghy0nDwYdroBjS6NN
 idQOt5zIf6yqyZtEqLmcmr13I/uJnQ2YoGu7I2zbIqUXpoTFHXVJJz56FuscfjszRQ==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id
 d75a77b69052e-49495c66538mr38609251cf.6.1747324219748; 
 Thu, 15 May 2025 08:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMUIAEtbW2Lfnl05viWeYgKuGoOg/uXu/bpms5M6DOAK+WjTQWzMp430rphpSK5jRVU7Lf3Q==
X-Received: by 2002:ac8:7d88:0:b0:471:f08e:d65d with SMTP id
 d75a77b69052e-49495c66538mr38609041cf.6.1747324219274; 
 Thu, 15 May 2025 08:50:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06cdefsm8041666b.52.2025.05.15.08.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:50:18 -0700 (PDT)
Message-ID: <c1a18f29-440f-44d9-be9c-fac49639ccbd@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
 <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfXzWKTiYIeLBXy
 eXJCTTxWB1sSVV63zc3uCSK5rlOagJDvf0EKymV+p/dH5jtjN/gWS07hSdFkvU7th5pJWNeaA5r
 h4Amb6tmQ+tDi0mCPrSiVo3dRPVWMaTxQ27f4TxrF07XLSrFq4teHbUkgKuEJkiSKJzXGPcUJdX
 j3YnF3aqywXGUahMb/yAh29me5/Mj2/OHlKPSLgBagk5N6IjgOdR2Eg/KnORrbb/m1jAfJB//DF
 KG2HPf3w0GmyjiRpgM2EU+YzF94aSv4w5Nsf0VpBJroKHpJUzccROz63CRswsrKP049N18R1psA
 ZtvQYpmOash3vXhzbP3mNOyDPymlkIkne7i0x7ZvSaUdc+M0Ovam+hg9w7I74cZfmF6pJ4BJ1MA
 vYZiDPyUunQNJhW3i5f7RbGC9CzgwIHhTe36wWJ26ru16GCZTHA/P9pEuql+95+/tBQZtaYc
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68260d3d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jzhEuBAUjWbXnsiB1ZYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: wdQHFFNhla8-_5JjFBtdc-gabbw3nmgw
X-Proofpoint-ORIG-GUID: wdQHFFNhla8-_5JjFBtdc-gabbw3nmgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157
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

On 5/14/25 9:03 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/Kconfig       |   8 ++
>>  drivers/soc/qcom/Makefile      |   1 +
>>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>>  4 files changed, 311 insertions(+)
>>
> 
> With the SAR2130P fixed
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
>> +
>> +	/**
>> +	 * @highest_bank_bit: Highest Bank Bit
>> +	 *
>> +	 * The Highest Bank Bit value represents the bit of the highest
>> +	 * DDR bank.  This should ideally use DRAM type detection.
>> +	 */
>> +	int highest_bank_bit;
>> +	bool ubwc_bank_spread;
> 
> Nit: any documentation for this one?

Not even documentation seems to acknowledge that bit's existence

Konrad
