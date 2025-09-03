Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40364B419E3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AA810E011;
	Wed,  3 Sep 2025 09:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IM2RCMQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0842510E011
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:26:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832RHeg012705
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UjHv5Rny7NYvIIV6SOi+RWSfsQ+PhjUoJoUt/TGYKPk=; b=IM2RCMQjbHLbuwvm
 2BmlzDGPZayYsO2J1lR9qLo22+LH1D5ZvmuGZAYEa8W9HqsGkDBEDlylPrQPBvIb
 YE6Uo0ykRkO+REHUELqP0sSvnEEDUBogf6jmygOCaVqcZPZ26w9qM3idbW9WfL2u
 ZVuQt/N5CtCLuZt38SaCCYbglU/f0VEwphCzt77mSgJZB9jop3y14cEb+tCeRk9b
 WqUKC/lvGQetvcIbVaty673cO/NdMVs1rsbj11RlvTocqg6/DzMBhiBZtftQBzmX
 zIBjkmxrDwKtY/819dqGMpYgQBCXSPgy4Wo1AT+NDRYTZNN5RqSHj+se4zm5EaEF
 8lSUYQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk92tcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:26:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-715c9cad6f8so5521846d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 02:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891586; x=1757496386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjHv5Rny7NYvIIV6SOi+RWSfsQ+PhjUoJoUt/TGYKPk=;
 b=Z2WLa68gq6fHM0oLeEj9fPyOiBrVmvDEiy/qQWcXeTcLStImNWRNgZ6bHo7M8KQIJc
 JNIhwIEmQwQXfnRdTjy8BEYnumWXIgTlWwh9vSecxf0ZvB1xBuWkNlFdYrVUMACwkgPq
 eApuOkhkcod0O5XURGxovaGXcQqx1DRKklu1gaHvH6Jbq7OX5m1ko7os941YyHuZueoD
 f8mMj9JXgOptrrVtNuTKnMjir96sFWlfpTccLsHXtnyjiNOilHk4UwZsO1b2jcVKai18
 Sqz6DCjtbkdVrPDYJdlMbQ+YxITcotk7SuKMTXGL3Mo0U3lzUAM6PVTFw3CaBgCDh8kw
 Tdaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzaSCtxl889R8Ap94Kv1VJ6y32GUBKluH2AkPQxmVjugX2/LHouc3EgEHduwd2o1cn+bIsYkSSsq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+IyOL1xxl7b9+zIfcCU0gi9HZGfGyLEzvD0K6s6BcHZzq994J
 QgRr998NI9IKSD/YAmfwTUxjjepvA9jWzAnLOEhtM9W7/P8aN2+b92h+0qNUA0cNtzZQOHjiQzd
 vb+j2oa+2I4Rqwi0Is8w9vgyCrxoD2in17aaMo9QbaSwaEqgnMnMo3ayUrxebRldpKJGyrgY=
X-Gm-Gg: ASbGncspe1cGyVWSU6a02yjm9WjzMItEmTkACYhrhjaBMlP/2701J6o5F6ruG/C6pat
 ruQKGVg6AwKsibVwyrSvTXSB3p510hbPiBPy0JbviVkRBSTXJ1/VxmX23/xUxWulfOlOJsWEeBt
 M6bStCpdmAjPRUJupzmN4P7a6FZJNpeyAfYJ4apmJkdj7zjVKDmKCQydJg2ud1Y1Qt+i0moecyY
 RbRi7JNOfUWczKs++sx1GwAxbOHsXYAnT+jij2sSW2NO0jgQjYmboxxXyoLkvlvS9xL4MIuSk2B
 19RYS5rhWsHzZSog6KNY9PKZXfG5SqO3oR3Y4M1cdXGPzOPeGl9kRI8xK5jlLFUrEI5g0fsjtzV
 GohButIPAhhsqU53coCRBlQ==
X-Received: by 2002:ad4:5d4e:0:b0:70d:bcbe:4e79 with SMTP id
 6a1803df08f44-70f5a5fae45mr157318006d6.6.1756891585971; 
 Wed, 03 Sep 2025 02:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnGodqLINHIr1ti5AIWKv/NvUfg7lci7ZbbtsKiF5IU1s9PYba1/SeEbO5pfCLhRpYbPSD1A==
X-Received: by 2002:ad4:5d4e:0:b0:70d:bcbe:4e79 with SMTP id
 6a1803df08f44-70f5a5fae45mr157317826d6.6.1756891585382; 
 Wed, 03 Sep 2025 02:26:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a27sm11650300a12.10.2025.09.03.02.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 02:26:23 -0700 (PDT)
Message-ID: <7382b6e3-3872-4e18-a1bc-b2c75c888a5e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
 <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
 <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TuVTT5i1y6TSpw6-rvE1j2nyuc2DYLK6
X-Proofpoint-ORIG-GUID: TuVTT5i1y6TSpw6-rvE1j2nyuc2DYLK6
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b809c3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5-JTw_7GLCY5IPuysb0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX8VmsKAHAcJtM
 lAehrRY7z+CaWBfe7xu8tOoZiTzxpxqn9+EGpDu4p+SdHm+l9LoXOhIPKvnbezcLFWXONwgXSRo
 Capk7sI+UFZo5Cqyw8UUCDptNQwGQHfBA/xkiUw/En9jFUZak+5ZNcG53sFrcWvnKarMf6yDGKc
 TbMfyBRzOrVPB5nGTzXqpjRiY92QgAgn6Rqy8txkVk3jK1JtoiHl8K4DkccDvOri/xz5oXFDJC9
 oKMSdhwedLQ4EUpwKKEiEsHivX92RR5ot0F58YntBJi3z/QQu5L275MpPLm64+5TqOpOpz+tRyF
 FRP8MKHtG49xRW3DaW+Jy/17NDH5+0ZKz6MwmQCaxFpFfuqfuYHYd27hW0pcIj8T+vzm7+6/2mb
 E+R7juo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

On 9/2/25 5:57 PM, Rob Clark wrote:
> On Tue, Sep 2, 2025 at 5:33 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>>> It is not obvious why we can skip error checking of
>>> dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>>>               u32 val;
>>>
>>>               freq = gmu->gpu_freqs[i];
>>> +             /* This is unlikely to fail because we are passing back a known freq */
>>
>> This could probably mention that known == we just retrieved it a couple
>> function calls above, but I suppose the reader can come up with such
>> conclusions
> 
> Also, I think s/unlikely/not expected/ ?  "Unlikely" implies that it
> could still happen..

Yeah, "unlikely" as in "cosmic rays" or other kinds of mem corruption

Konrad
