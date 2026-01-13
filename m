Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54786D19E8E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EF310E508;
	Tue, 13 Jan 2026 15:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXl9sfUM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jndGCD4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E96D10E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:32:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DFTZK03299678
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=; b=TXl9sfUMemknR8Mb
 76dTHbqO9lU1cgVVu25AZBNFAbO8f29gSh/HSGavmO6E0Q0Rch91BuzQZsgedaac
 vMghU0Nj4JHCnjyJj/rnMYLr6FDzRdvMSfW2YqPTpIYYnrxqwJrWNv0iMrarGHyk
 vUrMKq42wnUMobiK4oNaBFsu7zptDat6068H1YHfNuAo3BUm11WIcFJgJmEJxlbM
 a1hvcOBHqJBclj+OB6BxxwawEB4gQJEaN3UtS6uRvOxvJafc/eP7spLP20DG9VoG
 zEUIdTWtuyTuDhtm22YskqAjLFLxcXQ5PQQCjd8dUtKZ8sB2hwopcVG/1wG1ZACE
 46ytWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmbaja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:32:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5eea40cc21aso263046137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318325; x=1768923125;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=;
 b=jndGCD4bczr7c37i47DrpF5r2vICDzC4SsT/08/gtzs+5QRbBn4sMPaBNDmBg03T7H
 ygduTM/ItymRhHAl9RNKQbKerqTYtwVbmXsyu6hW7VT/KEB06Ee1+6qWWBFttl7KG4n2
 yuo7d6We99qV5thz/6dzerTYXQEU35VavXpHXYIK6Tz5FWyt2KiZaWzcp2Hp/NYTW5cE
 MMlHLcv9hwEcratlq4Q7OudVQrGkWC9El27ADm1KID7gQQVZX1L0ypwXAg3unJJ2lxbF
 H6WapAcW1cLj26yoXQ0vVDuJJz9Cni1Vvk3V+ShJ0KpuSkXfmeqalD6PYJZXnKYY2Yiq
 DmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318325; x=1768923125;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=;
 b=xKkBDDXhNeJyVlMCT6CdizcH/8ftvx/HIpUYUE4/xD4Wx4NZNFeEUwCdHq5bfAZgXk
 YKjXB1zKN/PeFoZm1UIpPONVRpXPJstLyy3OZaBBvU5k7yLoDu/w++KrymJijgC+xbN3
 CUrkBrcoycNXVzKr19rAGpFUPxvUMN/ORTEjGfk0uP+BHLGBGpTsv/4LvebrH3hoAISy
 xzsouYVcNH4WlSo7R7uZ7GSGukvFU4zd9MZ/Yndc9pT6t8DBjDcuwYQ0pAA2OS6fwsZA
 Ha92Xs4HI+oI2USVhqFnTxtlOtqpBesDFOmAYgPSREFy8lrG/Q+Pcdo22uwxaQvsTi6Q
 4EXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5bPWMOY6f72dZcO7rQnOCrXPFW8WyF+8r/xRYZC2Q6Er5kfBU7PBGnegAbCrFGNHch9OnkY1QY5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl7/b5FPBOxa39zCjkOilgCvUynKtR6+rz3LEWmvOreFFuoJde
 Aqr1z5Wudg7H0VM6VtoYF0t1nA/Iu7xAVn/cpN7a+JuV+A2HlY5qYnJrYlYpt5np3AVqefy777X
 VC0M8CvpmbIouIOuz4pTWWLnvdcPnaJ/bJIXJDEAV+DQ16xQJ8UsiXQHJLGRHfCQcgCN+tSQ=
X-Gm-Gg: AY/fxX6fcCdGjPjpGTZ1WMCnxeqz/FCktazSHYSKEVT2lr5jwWus9Xy8axM8G/PgCBT
 LV30dgKSeCr2tjhzkAitkgYnpW03zX4eQ46WMqId6h/0nQi+4KYCel9gzz2IIlLyEvILiZXlXuJ
 2gm5vVrGIye5Ley7tBT+QNAhpdMg7+ODE84R7eH9Owv8Qrrrvpp8RAeiVJq8keL39zVupBQRSYk
 YiXh/BwLuSWx6zwc+FLmp1JD14iwI77QnyIRcnRtsOFewbtAEKitdT2w+W36S7MVyGQgZa1viVB
 KcSG4Utou+Od7cXqoVKAu+7pHcjWf//X7WDp4YXu2RDhGnEaCKXQTjQozBkE2B3locCVmL4VKYh
 F0R2+89FPkK+UbsBJ7r5kTvK7MkuAsUSMwyO4boviaSiCDElgX+De0J/HvMEH5JJ+hOg=
X-Received: by 2002:a05:6122:9003:b0:563:42b5:457d with SMTP id
 71dfb90a1353d-56347fdbc21mr5167763e0c.3.1768318324028; 
 Tue, 13 Jan 2026 07:32:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDxp+V1DqoIerolnxPkbDym8KjSTKMypTINzAGYcZIuAStLsVttNXF1ApjLb6xX+Kb3BXSCQ==
X-Received: by 2002:a05:6122:9003:b0:563:42b5:457d with SMTP id
 71dfb90a1353d-56347fdbc21mr5167689e0c.3.1768318322712; 
 Tue, 13 Jan 2026 07:32:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b872152ee10sm534347566b.34.2026.01.13.07.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:32:01 -0800 (PST)
Message-ID: <0f786783-db0d-4bae-b3ea-cab2ea85223e@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dSi_d5RLTyjsBulQZsr29IuVHUUdheGZ
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69666576 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zvAHPaQ1O9Bprg_nwmMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: dSi_d5RLTyjsBulQZsr29IuVHUUdheGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX+x0pue2dCYoh
 HAlSO+LEaEwFPIFgZaawT3LUnSWtFJ2AKFp0nXdimB2RLJzI1t8Ii/CJRfhIFyuSztMNuNrGj4t
 Mr/Ja9HQIY6kQYfHDKfuCPqQ3D7edOkcE3WH2z7t0AVMkP7bDcJaeNQqW2eZuNoa2GsWsNvyNJA
 DCPGNHFgnjNupBJHfeJcicuqVUHTRCrCkdIbxn547LfsvAZnHJImnCyc3ep6WFQ75vOb3W490j1
 O0RZEbbim4zpEWuRgY1aSnSgHpWnS22ex1ZfnAkgehRsz6djGn5EGd5DAC9AstQ73MCc3wTgLpj
 duUhdl+0U0F33hXMN0OQinT3wbKO96Bq6tGQa5Z4p93K2GYRPNNu6dtJixwT2jBMlQh0uNpGBXN
 9koYKHOCXI+CR1Qzw5pPYDSSIj0T08EBEsQLnTo5x224/aqEftH4Dd7jCpAbORjuwqeav571xwb
 ZqgJXTogHP0Sj8NzmEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130129
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

On 1/9/26 8:11 PM, Connor Abbott wrote:
> On Thu, Jan 8, 2026 at 9:22 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
>>
>> Patch 3 should really be merged after 1&2
> 
> No. The HBB value currently returned by the bootloader is *not* always
> the same as what we use currently, because some SoCs (like SM8250)
> with the same DT ship with multiple different DRAM configurations and
> we've been using a sub-optimal value the whole time. After all, that's
> the whole point of using the bootloader value. But patches 1&2 will
> only make the DPU use the bootloader value for HBB, not the GPU. So on
> one of the affected SoCs, it will introduce a mismatch. You can't
> change anything until the GPU side uses the new ubwc config as its
> source of truth.

You're right, sorry for that

Konrad
