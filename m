Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C50A85A7B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2E10EB6D;
	Fri, 11 Apr 2025 10:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJe0pVHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5217410EB6C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:52:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6enPD030663
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fNXY9rYt/z3Q2Ub2AXLO/VnBcVUjSATOzGNm4ge035I=; b=OJe0pVHCljdmX1ri
 cMA6O69qXk/bF3aoz7rXWnqHVtmj8eAFhoOzLphmmoLv9+p3nltv6Gu9P7KxMS8f
 T42v2gRq1zrf3hFExbI6KpZS/IJTRcE9UMQnetzquTPtcn4IevTj3h93cZzuW0vr
 0Kgx02LMvZPgNkwqvbtuYe6s9mHMqHMejK5C12q9dLkWNFuLHr3mFBosE95zj1IY
 3LNhhKJA+jmgRa1se2w18qU4CuCx5zTyBpCO9G9ErhEQteE/ErZD43UWC1NQRi1s
 FQ41FiP6OnHfuEm9ZoQ5y6X0SJDUNeEZnXjvqD8DICoXIt48s84C3VC73bz9fpTa
 8gQ9NA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftswpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 10:52:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c76062c513so41219285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 03:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744368756; x=1744973556;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNXY9rYt/z3Q2Ub2AXLO/VnBcVUjSATOzGNm4ge035I=;
 b=N94nwixWjcU+8sLaFHq3Prk9ewS87X9K1ZTCIHsOTDP7mOMx4S70bMHqmPgqRImYkY
 +Hi6clZ0KdxHFOQZIvAxVNArO9Auo/sN37VFNBZuifZICpNeK3DlkukgO3tBEcGBpLQ5
 Jt9W6V1L5HQ775DYN98L2HqIKdv+SMxJWvBlViJg5qp3VlUyo9Dgy02Tz1BOCSHCHCLb
 5ozut26j9AZgPu7RE3dDrx8q8+/RX5X+2br9f31dKv7/mOspgjq1bvg+6OFFC0I/9zr6
 eaH2hPgVmXYZH6mphosvktOhKo0gfxeDKts/ZAi1+58s0gdJy9ey3TJWnCGmQ4UYiEMa
 1RqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/4KmsowRM2iA71b5iY84fe7iOvEDxY8KLPw550IsOAxLSAM3XLLN5/sL/UNnmQLvO/N/V/OtRS8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD5HorefxMhl0QdwTAoN4NAdY/MTduqaJIF+tnK1B18FO4/0I9
 HgRyslTB+hqNjIRx/b+d4ClxGZWF7Hj3bzHTJdsOEy4hPiO76u5dqtRSSRtyD71YdaRG2LSkhpt
 qoDdQYFxDph65mMEylNmjacEIykGtmfXLW3ieklj8WcWzQDKavYXBkx6pAwD1SGCZD8Y=
X-Gm-Gg: ASbGncvocOjdskiSJQu94LplX/bg7NjfoaWKaH+6E82lsiS338gW4VdLDv1wezThUS4
 XPmirgomWYChzH7p7znW8wrNde3FWdQMHUZkxQdlYYDUwHDUeZnGf5w00Koj1sZiZDC3PRHOFmL
 008nyvEubnRnEULiJcwdHNB+yZy19u0ep5RT9z5gp2KOY0YMCfHieTOU9/65t28KfCix7OYwWCe
 4IB1Vjb7Swq/ZFkaPX0yDSBNl+/X48bqCtQU9jLFt5bytUKZ0zGKmfWzNwtABV5iN0O+fo5MMdv
 mpk67kEq6/5QtFqXQDKHWOkUiRRxhWBQjIOIxKZXu2eBD6I2e3I6epXb/aKddCezgQ==
X-Received: by 2002:a05:620a:c53:b0:7c5:8f40:4d47 with SMTP id
 af79cd13be357-7c7af1dc318mr119455485a.13.1744368756365; 
 Fri, 11 Apr 2025 03:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgpMoOoENvwdXllWONxEL3omMfIMcMMELpt2LzrD6jRvrCAkafmMSO9EYpuccU7DXY3huwRQ==
X-Received: by 2002:a05:620a:c53:b0:7c5:8f40:4d47 with SMTP id
 af79cd13be357-7c7af1dc318mr119452585a.13.1744368755845; 
 Fri, 11 Apr 2025 03:52:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccc2dcsm427286966b.132.2025.04.11.03.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 03:52:35 -0700 (PDT)
Message-ID: <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
 <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8f475 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=E-cWInRRfnsFT7zTJZEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FIwIMkCJT7YXEjKmUketeQmSgW0cG7g8
X-Proofpoint-ORIG-GUID: FIwIMkCJT7YXEjKmUketeQmSgW0cG7g8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=515
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110068
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

On 4/11/25 12:50 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
>> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
>>> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
>>>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>>>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>>>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>>>>
>>>>>>> This series introduces an API to retrieve that value, uses it in the
>>>>>>> aforementioned programming sequences and exposes available DDR
>>>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>>>>> information can be exposed in the future, as needed.
>>>>>>
>>>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>>>>>
>>>>>> - SM6115, SM6350, SM6375 (13 vs 14)
>>>>
>>>> SM6350 has INFO_V3
>>>> SM6375 has INFO_V3_WITH_14_FREQS
>>>
>>> I'm not completely sure what you mean here. I pointed out that these
>>> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
>>> a6xx_gpu.c.
>>> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
>>> fix screen corruption issues. I don't remember if it was the case for
>>> QCM2290 or not.
>>
>> As I said below, I couldn't get a good answer yet, as the magic value
>> is not provided explicitly and I'll hopefully be able to derive it from
>> the available data
> 
> I see...
> Is this data even supposed to be poked into? The foo_WITH_bar types
> doesn't sound like a very stable API.

Yeah, it was designed with both the producer and consumer being part
of a single codebase, always having the data structures in sync..

Konrad
