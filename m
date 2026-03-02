Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAcZKMSUpWnXEAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:46:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6571DA09D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3763810E355;
	Mon,  2 Mar 2026 13:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je1CKi7B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFjnQfrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C1710E355
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 13:46:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622B3dsH3862797
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 13:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1VKdJzwWet07SkkHF5W6d2bdvsrjsh3dEIsPyBtnJEY=; b=Je1CKi7BU1g688PH
 y8YnJD8jhlgcf/vJinCIcNZBZp7jN4JeeqrslCoo1Say3NV858reSa47jjrnzn5F
 OhbTFLL/z9F6NnPyM+K+4wzFMpsmlvj/0MOiZtjeD7CFtLoFPXYA6uv7YQddzmQ0
 6MZsh9rJu3gsCBizu3N/uFM7VscB1H10B+aiiTFVEtt6avA2VhHlKhkXc9g8nHmQ
 h3fRN186VuL9iTgLXoJGEsJ9L9JChWHJUfkucQxqvUS0Cp8k63v5BL85bOJHIpyC
 lCj2aN2UGrkrqAMC3TnER157y82X8qImmG7PRuwsifCr1hxbwUW9hJhHZ0b/uNS+
 3EAEhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjget0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 13:46:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb45a6b860so325286185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772459199; x=1773063999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VKdJzwWet07SkkHF5W6d2bdvsrjsh3dEIsPyBtnJEY=;
 b=BFjnQfrJw3giQwlCH6X7P0kYVfln3RduxkofPyF5+FAnnslp1x3haAuG0xVenM2IjK
 uhlq0QkgIInet4Rf/7M2aPVue/Rw0neflZRoo65pBYjAQxpXPSZqGMwIjQx06TAJtI6I
 PYUBCsopzlyIj9Orv36h9jcjDPapU4Md03860ZWtrhkWwcILrXYbjny1PNJO4OIsh7s/
 T0hMQZJUIjHIEt2Ioxe/QcjwLEziDmoaSef7++3Qzl6C1IFG6G8deVLwoGY7doT6ReYz
 4jSKTtVuPvcxVGOZ4yqFC3r/bmIukcQgpE+rY3Bz1PFg4QDjh1zfy5lv6tQoIlEjUod2
 +w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772459199; x=1773063999;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1VKdJzwWet07SkkHF5W6d2bdvsrjsh3dEIsPyBtnJEY=;
 b=qGxTI9Jo4DojB/8N+19nBHU0S2BXg5EJMJ4yD+SFTfgWP5upO/eRj0GqfHapZYS3BN
 4uzw1EXw9RudvO41+XLBj8hM0EKbKiwPNomdC7VFeSmAyImlVx+3ivgQy+LUU3Rxs/F7
 lxjMT6Bj+7YDoypMXxOY2xtWPg8eHKm6x2Eo6011oYhXda+YODnaxCHyAlyH3LmIZ11D
 xth8lzjMG/fajyKTfuJdyeEquOInu2uGfQXIYq8Gb4SmLUOJrjjaNxCac6YsqViqO1h/
 5BqZvtn826TF68D/MF28iFCf0jezyDdogIzmkn3lExKAP/uf95EjZKLYJ35fWt3gRdZ7
 bEpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX05ckJ4jjCnSjoVMn4RM3dL4poyoxFyw7BTNVbqNa0RAHeRbWin3Kq1XI0s4f7A9AOgM6mqVJstuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdREcvpZd5exLoaspwSzWl5ycVAV1GtFvIjeUH33tPb27gYAAe
 wGwjzCHp57pY6me9G25EBlKAzYOy3O8nPdqSy5op1LRXbuegQWndwfJh8SQIpzHSUudPM4YTqII
 gxZVqsQtqcQlsa/pj0pFf8k26HMs+o5UsE7Q/wL5b0ghyS+tHOqwT+Qm6+mAMZBuKVVWYulc=
X-Gm-Gg: ATEYQzwtTi/iZpzq03xWtE0jghAAW3k42lg9/rfAACZAtZ+1mASZon3s87bbSYxqHVv
 +KZe8E/lNsao8Jh6aI2hS/Jzn5Rlf8geAZgsj6QEDNJyk6OlO8RkBYzS1oX14L71hvYiVN7AFW6
 eiEhlp1O1g4e4GvIeUQFlwdewC8pYmAPhGw6zk9OpLjT0mPcEK04NbhlirOaa0fppt0fzLO6iYM
 YPb5ZiTGtKcVXYR4J9ZcDbIpkT9LwEbxoeRq4l7MNAb31c9X4EleCr589NipUW9cMGaq5/4mzpg
 SZJcfYupj3Sc7iE/9e4a0Bs/migKRDC+sZIOKXVRAP67T36cg+FWj0YrzUu/1wgNWBOobi8hhSL
 Qekv4X/JixuEk5Z19n3NaivS6e0u2Vl8aJCTjdOLSDCZnzCpNQFLE2L/1jjhFOMAMPAaC9A6BBv
 o5+Kg=
X-Received: by 2002:a05:620a:2806:b0:8c9:eae0:d1df with SMTP id
 af79cd13be357-8cbc8ef417fmr1208187285a.6.1772459198574; 
 Mon, 02 Mar 2026 05:46:38 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c9:eae0:d1df with SMTP id
 af79cd13be357-8cbc8ef417fmr1208182885a.6.1772459197877; 
 Mon, 02 Mar 2026 05:46:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b93987b9f73sm259566666b.47.2026.03.02.05.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 05:46:36 -0800 (PST)
Message-ID: <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
 <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a594bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=v90i8EJGIdyDnMh8qEMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: G48krH26qyGO6YTPciL_Xjq_nelEB5lr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNCBTYWx0ZWRfX1Jh0Tw2AfYEH
 53sL4EBcY5iwa4paRJGrA0cw2/H3cLce/b7hvFOo4EqS7THL15sW1L2ht+d4/B09L0IPBMf/5mI
 h+Tv1WOBYdadoNxY2+yv8K1k6s6uhPQBT7VnfgehC2JC9RTLm17iR0hHQYPSZxbEvGFxCDCAjLh
 lNkE7FcttCpABk9MaPwVWmY4S8NlmnyiDJGZXeuiifiFOI3ymP7iU1rcm/hdN4lD7NG48LPdds7
 FqyS9sPDprxFpW7rfgSrO6+JfpLlflsyLZEp7WBjG4mtWCIb63/bVDEbD4gwklyTqSDI/SCZbpd
 13a2ZHKfTSw8ONm2ibUwoYpucFo/hNYmC2x3Kt5YGQebZTJE2udcElHAhAnAUV9hhkzBQ5w+Vjw
 AsH0OrVh5XbWS00te2VB+CqLF0eOtC9pqm9EAvElTMbohhqRNZrjRJNZ7o7bRKzlGn1gzFoZN9H
 IzU0a9djlv+5SG1B5Yw==
X-Proofpoint-GUID: G48krH26qyGO6YTPciL_Xjq_nelEB5lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020114
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2C6571DA09D
X-Rspamd-Action: no action

On 3/2/26 2:28 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
>> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>>>>>
>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

[...]

>>> 1.0  - old MSM8974
>>>        I'd rather not touch it, it had bugs and I don't have HW
>>
>> I have reasons to believe msm8974 v1.0 never reached store shelves.
>> Let's remove this.
> 
> Please send a patch ;-)

done!

> 
>>
>>> 1.1  - MSM8x26
>>>        Probably Luca can better comment on it. Should be doable, but I
>>>        don't see upstream devices using display on it.
>>
>> Because there's no iommu support for these
> 
> I promised to put it on my todo list, but the list is very long.
> 
>>
>>> 1.2  - MSM8974
>>>        I think it also had issues, no IOMMU support in upstream, etc.
>>> 1.3  - APQ8084
>>>        Had hw issues, no testing base, no MDSS in upstream DT
>>> 1.6  - MSM8916 / MSM8939
>>>        Can be done, low-hanging fruit for testing
>>> 1.7  - MSM8996
>>>        Supported in DPU
>>> 1.8  - MSM8936
>>>        No upsteram testing base
>>
>> 8936 is 39 with some CPUs fused off (unless you have info suggesting
>> otherwise)
> 
> Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
> 81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
> Author: Konrad Dybcio <konradybcio@gmail.com>
> 
> Please remove it from the mdp5_cfg to avoid confusion.

v1.6 is strictly for 8916. 8936/39 both use v1.8.

>>> 1.9  - MSM8994
>>>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
>>> 1.10 - MSM8992
>>>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
>>> 1.11 - MSM8956 / 76
>>>        No complete display configurations upstream
>>
>> +Marijn, is your computer museum still running?
> 
> Should we open a Qualcomm Virtual Museum?

Maybe someone has a drawer full of QSD8250s!

> 
>>
>>> 1.14 - MSM8937
>>>        Supported in DPU
>>> 1.15 - MSM8917
>>>        Supported in DPU
>>> 1.16 - MSM8953
>>>        Supported in DPU
>>> 1.17 - QCS405
>>>        Zero testing base, no MDSS in upstream DT
>>
>> No upstream MDP5 support either. And it doesn't seem like that SoC had
>> much uses that didn't end up with the thing glued shut..
> 
> I saw and touched devices, but that was display-less version.

Only further confirming it's not worth pursuing

Konrad
