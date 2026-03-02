Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPUQGouzpWlaEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:58:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DA1DC436
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD8610E363;
	Mon,  2 Mar 2026 15:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5Wehurr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTh5mm6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A710E528
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:57:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229K5Eg782876
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 15:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NxieLgf60ZQks4kzdgoyGzleMAEm98sGfiRnLZPCF/Q=; b=i5WehurrOreDe16L
 FEm09Bfewv11v6ml3LurqqJb8vq2DWcdIGVLGuZOTocb8fhaZKx1OKi7vFl9WLjK
 ECxWdBIwcdsyF3gFoe/PUAjfFSvhofEI707EKrhUTRASNB7nx18IHWUshc4Fz56S
 4vquWLy+jQcCeTCPLooBWMCLCoW4jTUJ80KMV/xSP5dXmkPyCAlSU96GsrDsoceZ
 +us8+kJjFpeA4/1EF+ivA6MGqM2E6Vi5sON4mWjaQLwR7CfpUf9gPDLJBMQzIKF3
 hXzP5h25Qj6cvyULHMMBHPTfUdpi8DXSoPvR5nlQYuq83+zEIgsxlVj5njxZyBuk
 zUKaTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u01b8r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 15:57:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb456d53a5so439476985a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772467078; x=1773071878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NxieLgf60ZQks4kzdgoyGzleMAEm98sGfiRnLZPCF/Q=;
 b=LTh5mm6vbv8kJOMH0xiWa2Dib36B4kFDNjYY4vCaIO+lsC3o9BpZeAkKk9VMhCobRe
 3/5z7GuPyUFh6oF/DIib846coP0FC0+eqTT7E4OE1QavGaLlWbLoHxq8R821SO20meKw
 1eHAsMUFXtEw/PbS+1GPqmdCIG6+XoQuLwsTD/f2ydHkVHKFY9c81mcJeFCY5U38MmnU
 SEPMzmQsmNftlL4XbT93NI/HsPGSOCy8ajBPWBWEatCA/mdHPBq4bgrmF1q6nwICIHKI
 f0mitnFn6kIPWrIDGTN+NZMxRkk0MBOlabSvrZAq92+d9ffin3N+lZUeDoqrMpOID8I9
 ykOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772467078; x=1773071878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxieLgf60ZQks4kzdgoyGzleMAEm98sGfiRnLZPCF/Q=;
 b=Ui/vjjbwM35s7VdbUbu6Wtolj68S3pnGpQn3WzpbLujOvRaaxkRq3B90OU9HIbj96m
 3eZwsTResST2ZVUAeNd8/UO4ixlrsZcd58+jCHut3cBZJSIkzvS1oXrBy8X9O61oDZOp
 0H7uXvaFjZQR65o/CfrBiEtB2ZpikcArJ3jOduhtbtzifn44G3DwQhy1Doxoaw3QDcmY
 BMxOaBk7gObVQxouIIjkJobLvUekV0A3PBtuUTXTXNR+oWMO+s4xwMvbwr13HSF8EM7x
 1Z5tP5qrHJXbgd1Ghw5PpfsNmFwFeqY11Ge2Z8KuH6OZhVRaWta/ySPuhZcXSrTB4fBL
 0PAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRe7dmI+JukUS1U/auy8VcGAoSg4F5WnjyKqNBXgUFqg/BvWlRupTJjH5aszWGUUBB6x4mmvRq5xk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPxqV/OTH4eyZ+Dsbx+9IZlY8kyB5dFUgQycrOSFG1ZDLw9Tc/
 GxExDpC+jtPKJ/eC3FE+I00tnTBMNdCuhTlkticKR8mISjIoI3gn/1beVAB+fxrhEcbwweh3m6H
 FfKIKRfnwViICRUS7GGh6uFqnb2540h9CIdlifplA68VkZ9JengTu30IQQcxjCYmodw22Rvg=
X-Gm-Gg: ATEYQzz9knG2PjIWw+CtBVdj7sTvL4twg5xGoyHrEdQVljPW/jVuvpKH0ZR1FhOBS96
 m3kPCB5mNvjXKvQ7gxSfN6LjHK1OXerpIFRolyFQWNPJ6Z7N/zq1xFqaNEC4KeIbAzm+M3fCe5d
 E9iizKq+Iga9YP/CFDSYnEt3W01HKr0r+563TwLDaKixluIsTzddOCGsLTn6h84TSMBHVv5iK5U
 t/H+dxVsnsoOxzYLTdQsdf1LaAu/P8Y5P08BSXZrjK6niHMjZZwFmEdUE8LCDkEkZqbERAYdXHa
 Cbd2nbuWd+xPrP7Vl12W2sIVj5oHeMY7pCKXnxZDuj5V4XJ597ppP3UXrcIOia/nqdXhWiu8DTT
 gCqpsPlgPAvdCwHUoQRSqX4hE9H4Sj2wq1RYzqIQ4ut9EN/pcgEQ8svF0fHeVrfVFSXdqEkJjjS
 051Rs=
X-Received: by 2002:a05:620a:4405:b0:8c9:ec71:b224 with SMTP id
 af79cd13be357-8cbc8da1ef9mr1219097385a.0.1772467077745; 
 Mon, 02 Mar 2026 07:57:57 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8c9:ec71:b224 with SMTP id
 af79cd13be357-8cbc8da1ef9mr1219092685a.0.1772467077142; 
 Mon, 02 Mar 2026 07:57:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ab1552csm479120966b.13.2026.03.02.07.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 07:57:56 -0800 (PST)
Message-ID: <ef6ebb5f-bc0b-4e26-b79b-6e4cdf0075da@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: deliberations about the future of mdp5 (was: Re: [PATCH 1/2]
 drm/msm/dpu: fix mismatch between power and frequency)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>
References: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
 <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
 <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
 <5wbvy257s553jyqzgqacfxhbeqgkrqui2yspqwjh2iyiz6ljoy@olo4l2kbrcjm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5wbvy257s553jyqzgqacfxhbeqgkrqui2yspqwjh2iyiz6ljoy@olo4l2kbrcjm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a5b386 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=xg0hYumib2hcNOQJ:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=yKqxEvMnOuzkX6i4LBQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX7XpO8/PgxvTD
 jmCYIOXsTzKEOGy83R7f0UstIPMH0zikHnWjr2U1WObJbF/nePaGWdNWF2QcUr+PM/ZI/503Nan
 jRT+aRbxX9I0kIS8reSPFM4iwKSBlmhrg3rNle0yvqyvX4rpaO7OjxOIwwbywe/vUyeiqHiT2pu
 tfLhvuZ/GQxwjaAN0zAVLa99wrWgXh4kzroXd1NOwqFQ4GlW88sbPG0E6i/M0sZXmdEIdPH8Bf9
 bvRDJdHUK6H9ntwVXaW50zp15oAlQERMgiYvrbX9L94bbflt4rj2KxcfOX+CTReVwUFaW8+Ip/8
 7DvHTIc4Ev6/07T2OaskPioWbjyiadfA7XeSEoRm67aZ87zWxR56RgTl2KszXkBqOFYaVI+zPtw
 e0zbvjqBdYr2OJopk0IuAHdadejrSXTBoW6503C+KVXYj0ff7JmDI7Fr/YDT2t6PUk1CPDuKnNE
 ltS4vIzXSlre6Kru2bA==
X-Proofpoint-GUID: KjqIi5sUElcEn9s0I6j_cJYOtTARTVVk
X-Proofpoint-ORIG-GUID: KjqIi5sUElcEn9s0I6j_cJYOtTARTVVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
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
X-Rspamd-Queue-Id: C88DA1DC436
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,m:stephan@gerhold.net,m:nikita@trvn.ru,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org,gerhold.net,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On 3/2/26 3:27 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 02:46:33PM +0100, Konrad Dybcio wrote:
>> On 3/2/26 2:28 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
>>>> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>>>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> [...]
>>
>>>
>>>>
>>>>> 1.1  - MSM8x26
>>>>>        Probably Luca can better comment on it. Should be doable, but I
>>>>>        don't see upstream devices using display on it.
>>>>
>>>> Because there's no iommu support for these
>>>
>>> I promised to put it on my todo list, but the list is very long.
>>>
>>>>
>>>>> 1.2  - MSM8974
>>>>>        I think it also had issues, no IOMMU support in upstream, etc.
>>>>> 1.3  - APQ8084
>>>>>        Had hw issues, no testing base, no MDSS in upstream DT
>>>>> 1.6  - MSM8916 / MSM8939
>>>>>        Can be done, low-hanging fruit for testing
>>>>> 1.7  - MSM8996
>>>>>        Supported in DPU
>>>>> 1.8  - MSM8936
>>>>>        No upsteram testing base
>>>>
>>>> 8936 is 39 with some CPUs fused off (unless you have info suggesting
>>>> otherwise)
>>>
>>> Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
>>> 81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
>>> Author: Konrad Dybcio <konradybcio@gmail.com>
>>>
>>> Please remove it from the mdp5_cfg to avoid confusion.
>>
>> v1.6 is strictly for 8916. 8936/39 both use v1.8.
> 
> I tend to agree with you. It's interesting that core list doesn't (and
> likely is wrong).
> 
>>
>>>>> 1.9  - MSM8994
>>>>>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
>>>>> 1.10 - MSM8992
>>>>>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
>>>>> 1.11 - MSM8956 / 76
>>>>>        No complete display configurations upstream
>>>>
>>>> +Marijn, is your computer museum still running?
>>>
>>> Should we open a Qualcomm Virtual Museum?
>>
>> Maybe someone has a drawer full of QSD8250s!
> 
> Only APQ8060 here, but it's not even online after the reorg.
> 
> Anyway, I assume that we have something alive and kicking for:
> - 1.1, 8226 (currently unusable, no IOMMU)
> - 1.2, 8974 (currently unusable, no IOMMU)
> - 1.6, 8916
> - 1.8, 8939
> - 1.9, 8994 (almost dead, I'd say)
> - 1.10, 8992 (almost dead, I'd say)

My estimates for 8992/4 would be just a dozen or less enthusiasts, at most
a couple dozen. The platform is in a tragic/borderline unsupported state
upstream today and little effort has been seen to fix it, would probably
need to come from us anyway, with essentially a re-bring-up..

Plus those have no IOMMU either (same camp as 74) and even if they did,
I reckon any users would be happier to run the actually-maintained codebase.

I think I may have a partially-ported 94 branch somewhere on some SSD..

Definitely more of a 'weekend project' type thing and shouldn't be
considered a blocker.

> - 1.11, 8956/76
> 
> It seems we can ignore (or drop) apq8084 (no activity since Dec 2019).
> 
> Already in DPU:
> - 1.7, 8996
> - 1.14, 8937
> - 1.15, 8917
> - 1.16, 8953
> 
> Which means:
> - port 8916, copy for 8939 / 8956/76 and hope it works

I suppose it's not a high priority for you. Maybe some 8916 enthusiast
(+CC a couple) would like to try? (context: DPU1 support)

Konrad

> - add LM-cursor support
> - deprecate mdp5, possibly moving it to EXPERT
> - add 8226 / 8974 once we have IOMMU
> - drop mdp5
> 
