Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B356FAB1369
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0B610EA2F;
	Fri,  9 May 2025 12:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZjXYxWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B5210EA2E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:31:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497ZuUZ019254
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=; b=kZjXYxWoB1YUebRG
 f6ccXE5+Sl/v7vPq99CnhIpu+kqFGVnlF+8TfqDZvKsW4xdvINzbC2J9SJZDFCgI
 Uq52JtYhgCoQ/2k58qAjNFrG8XdSYt1PBbprQ9nAUnzuD+6XT3xbOaNevnRxkD5Y
 ZLh5gj+o8YLwoYlvgaTgL/Kj4gB6ZzxyHyq/3ayjGQKAGZEXGiWIgem9IH63QY1T
 /t8JmeqD3fbZFM/DhiI0pSgGjLOFQg7S3bqZbcH+sLS7C67U4zolRQ/Xvyevc1y8
 X9g62UfAmSqC2AwXvhZHJ9BC78JDSK+lopbCCJmK8fFHdYKKi+0orce2K00g58pZ
 EHwiIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj436w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:31:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-48f812db91aso5217021cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793871; x=1747398671;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=;
 b=LGfijiyNHk0a4f25GKamXsMOYkg5KkM0fTfpNNlRX2JoZ1GNZ8Q+vmCF5rauMdNBFx
 4SiHdbguSoTVCQITEP6+wMOkoDDAbUARrntnD/HqOURtshOfMLI2iv9zIrJ9NfzoL18v
 IKHI4PV4NuVWrIV7u33xqdavj4NyQIylfgQ29qg2BtZzNbBVSAxC/PYbWdV9FcObUBuN
 jkE0YNAWpJLCB+HdhQefFCmYv/HF+ap/v/8n2SqSLEoBYFW2R4PC37Kli3hDVsA8DZvv
 EWZANv+YaseeePnDn0OnVL2718nzq8qP9vXDKg3QV2fcZ8Z60XxLhqKzq/WM/KY57xfE
 JmIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyaSToVpJfZSr+R8qgGw37rYPpRs8umqMnrlAjAn6rMYd3pCHLDXSQr9CPceQ0aKZFnZWRcvhvuTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysVvBGRboVF0MagirYvqKcm8kmtgnhDHUemMytZW6Qo44wM7Pg
 drwl0+i8m38r5gs71wrXuPKCbl+JFoIv1m3NUbY8pVlUYdbp3rLby4xYgcS7X/mi4ow4o9SQwNy
 9g4XLCr+StMpAA5tdC+q3QFh9F25oShvmUecfHc4IruwSDebT2iBzO2UyWcbBSec4YLQ=
X-Gm-Gg: ASbGncv1rMcIBZjs/q1I2XzVfc0Q4dqngk+dmWNSdjB8CExkA7U5q0qBLeHm92ZZ558
 pIR5aNUGrz+JGLlKqbu4AHos1t0ov+KdHlxJyKCdU5OavU810Ztr6ygdXZIii2Bz2E/bRC5gL7H
 IUKQArToU+M725S79G7cUt0dTXNkFSQvVAIl5x6SeFCdgl777RTTtICrCVD8lhORhtWzWBwOx/T
 WYUI00g6m0XI/uOSjpxMFxboSc0KRO34vSD2SN/Xejr/avcfGLGI7FYmwV+rZjSNv3IwF4nClPH
 QgrFGaWY8ecrY9yvhhE9aFrkGsWP2QJZfSIul1MlPSsAhyp93Vz+00/YHjAsOSsle/A=
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id
 af79cd13be357-7cd01109256mr174580185a.7.1746793870969; 
 Fri, 09 May 2025 05:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgwqc5dmv1BuLfl2iNwP5xWwVZa7nyp8TxQ+UzvepLaRqf3krtNvF2xEsEPUvN4R2vKmFTQ==
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id
 af79cd13be357-7cd01109256mr174577685a.7.1746793870580; 
 Fri, 09 May 2025 05:31:10 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d70d55bsm1302110a12.65.2025.05.09.05.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:31:10 -0700 (PDT)
Message-ID: <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681df590 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dGexCodceDVc4I0WR1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfXzqkL9GLU4gwK
 pD14qzLR9zo13Q2NptkqHej9yfTUqoPmL1nV/9+3Eo6CPyEdG3q7pEOH3lfsY201HvOZfyqriyO
 QfZBaScbhuclLwAXQQwft5qCXgt1Y/NpMS6hXbxRy2LkVnDWUPTc/FtpKyMYpKE/zz3tTKUfK36
 vc9WNKbThPZCPP04fLzA9mQRTnMBbwlNg+5qn/oQh2DtoOoqWAucRVIS61UtEMzI25UXW4mJYxF
 4iLPmSO7dTVxUshU40d7HxN4HfS8U2HwsQ3FIXrg/il9U3RIbEoDfTCULmtK+pRfkOOGK39ad+P
 N8e6b+9StFIvvDCiH9wL8QmpmBh9CPMUouTCnf1t2PWm4+mHcybbYiMkD2HWrU//0hCd4QrBa9j
 9RJ3D83vNBnlTQBD4CmgFz95DE1/dAGGrAIb/ibn1u9tjdkLx0g3TT0Z4iuIoluO6LDwCKQk
X-Proofpoint-GUID: pGBI40WZPAtJe42mrtupzF1BqKa1QggB
X-Proofpoint-ORIG-GUID: pGBI40WZPAtJe42mrtupzF1BqKa1QggB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090121
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

On 5/8/25 8:41 PM, Rob Clark wrote:
> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Start the great despaghettification by getting a pointer to the common
>> UBWC configuration, which houses e.g. UBWC versions that we need to
>> make decisions.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>  }
>>
>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +       /* Inherit the common config and make some necessary fixups */
>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> 
> This does look a bit funny given the devm_kzalloc() below.. I guess
> just so that the ptr is never NULL?

Yeah, would you prefer this is changed?

Konrad
