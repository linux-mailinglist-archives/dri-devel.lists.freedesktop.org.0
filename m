Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C587A88126
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D8F10E5BD;
	Mon, 14 Apr 2025 13:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSx59Lrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A610E5AA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:06:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qNY030621
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J8coqQeKvuFh+O3TZuuEoTer55FpYo41z991GNWMMUg=; b=bSx59LrnlpAfCR6t
 90Qfr3Piwo2r8+qIQXekEASVX5PDX0gqN2/lfXMu4RlPUPiGZ/vpYavUObSUEAPV
 UCdx7I/l2CSNxD/YKXAo6IRyqqZwIJ+p+Ovntnx8bubpWRpyLyu2n+Er6foLh20p
 3COPambWzbpDsfaRWwjj9kiDj8TCmGeGv3EdxyMmUTdqujA2DoRvelj8yHE0Xb5x
 KPHROGhRH4AFdslD0iqTPr+DAyspuYBY/hJ38B/bj5zMO6WA+JIGyRW1VLuZNvnY
 SWxx6pJzvTvvgsEgaeXhw913dF0V6CqDQKu9XvYFnbC6PZUrHadTR19DYpG/NKyS
 GMvYrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj4t7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:06:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54be4b03aso86183885a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 06:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744635989; x=1745240789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8coqQeKvuFh+O3TZuuEoTer55FpYo41z991GNWMMUg=;
 b=frfiGYk+lMmexBwPPpq1hns6diaQ6ju9zs5CDp7NqebOJlI1RRy6FOMdD7BBoqNtrf
 gxlf7cX89hJjrjciI5/p8TXbSOs9TForrq67zJzUMG0B9vmWm2SnCIRDV4uZdtsXeCVE
 iIpHe10uB2xBxQkXL66jP9WIs2U5vAAHOpAnnnorF6w5v8PgV5xVuQMGDLkbE1xUHaAi
 9QoTClJeefxIHWPbo400mnV+KRcHRcYetl/eB532Eb/t890hY0GLH6kBVILVq0Zs6jLT
 AObWatnAfvFDQmIjza+GgSFKVqukWnfDBlxiAkd0m+cLJR4iU/or/m8HvEOrbs+ddoe4
 uRhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlDG2P3KgI3JjFfUuknVs0R6aj3/S4lB2JFKB05409rgOf8FMPiawryuO+t1pYEDnsYYLwFPRHUgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLGdnjV1p2PAgWLvA14sRjNBNGEZxHSTI/p9mLO4O/FTrEvKBK
 f1AaB9y1fZCKLjZe+KhMcRK/iy+1y89tXS3htVXePuUTH5ZV+G4B8YKyfc7VXGH11LgC18woabb
 CQsaGAMHrn8HU1qsu1+Jli938YjbMmmyjTTbbHu/kmMZtz81Y/XJE89uiEz6kM0uZ0ws=
X-Gm-Gg: ASbGncubbvJEFlSLhyIXuhQvL2dOVkXx5V/XPqr2pD10ysiX5AtNegJxsG2Pab95W+h
 o+unDW9TNGPMpCt/A+cmWb+D99vp5dM6qKP6MNDZp3y6sqXtblVhDWgoetszZ4DwD5Xhhvl41TV
 AOiOkpq6b0fA0zcd6x+aQy63c7YARzrWJRCZkyJ2ly2PrAelCOZx5uLskXlRV0INocOa2CFBiq9
 Obcpbpsoc+SPGWm86nkWPpUjFmcvJacwHXhuqR/V4DrMuCwQMkoNn5ue7ptlBW6AeD+nvaOr2OB
 lE5J2s9tLZb7FuEzuqnj3DRyPVNsaos=
X-Received: by 2002:a05:620a:bce:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7c7b189ed2cmr593264885a.3.1744635987449; 
 Mon, 14 Apr 2025 06:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF6qbagUm+W4XTsW+veeL8DouR+tzZeh7A7q5mtlDE4nmmTvZe6ePtnwhw7Dz4PGEXvzT/kA==
X-Received: by 2002:a05:620a:bce:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7c7b189ed2cmr593262485a.3.1744635986887; 
 Mon, 14 Apr 2025 06:06:26 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f526da3sm4827693a12.67.2025.04.14.06.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 06:06:26 -0700 (PDT)
Message-ID: <868c635b-0b26-4062-9a44-4ba07ca684f4@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:06:23 +0200
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
 <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
 <qdip4rtk2zusxkdlui4ujnybsh7jfqk25tazx477tueytp6cbm@dom2fduk2r6z>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qdip4rtk2zusxkdlui4ujnybsh7jfqk25tazx477tueytp6cbm@dom2fduk2r6z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd0856 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=BMwtVS2TDCMlKGfjk1MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eWyxivWyz2lLCZs6KJCwjGu5WuvdYonm
X-Proofpoint-ORIG-GUID: eWyxivWyz2lLCZs6KJCwjGu5WuvdYonm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=597
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140096
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

On 4/14/25 2:28 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 11, 2025 at 12:52:32PM +0200, Konrad Dybcio wrote:
>> On 4/11/25 12:50 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
>>>> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
>>>>>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>>>>>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>>>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>>>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>>>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>>>>>>
>>>>>>>>> This series introduces an API to retrieve that value, uses it in the
>>>>>>>>> aforementioned programming sequences and exposes available DDR
>>>>>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>>>>>>> information can be exposed in the future, as needed.
>>>>>>>>
>>>>>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>>>>>>>
>>>>>>>> - SM6115, SM6350, SM6375 (13 vs 14)
>>>>>>
>>>>>> SM6350 has INFO_V3
>>>>>> SM6375 has INFO_V3_WITH_14_FREQS
>>>>>
>>>>> I'm not completely sure what you mean here. I pointed out that these
>>>>> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
>>>>> a6xx_gpu.c.
>>>>> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
>>>>> fix screen corruption issues. I don't remember if it was the case for
>>>>> QCM2290 or not.
>>>>
>>>> As I said below, I couldn't get a good answer yet, as the magic value
>>>> is not provided explicitly and I'll hopefully be able to derive it from
>>>> the available data
>>>
>>> I see...
>>> Is this data even supposed to be poked into? The foo_WITH_bar types
>>> doesn't sound like a very stable API.
>>
>> Yeah, it was designed with both the producer and consumer being part
>> of a single codebase, always having the data structures in sync..
> 
> I feel somewhat worried about parsing those structures then. But... the
> only viable alternative is to have an in-kernel list of possible
> platform configurations and parse the /memory@foo/ddr_device_type
> property.

Well, this is where that property's value comes from..

Konrad
