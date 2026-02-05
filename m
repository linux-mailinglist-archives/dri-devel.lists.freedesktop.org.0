Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIZUBzFdhGmn2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:04:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84BF0405
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B810E808;
	Thu,  5 Feb 2026 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYzPURQU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTFwik+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B6F10E808
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:04:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6155qtgd4167184
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Feb 2026 09:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LByn2VpBX5A4tuU5+bD1nh0xOghUOXhc6iS2XDov8zA=; b=aYzPURQU3nY/tKTC
 tJDlUa7yIyknTjAi+coZKgJ3rSfqCJKG4Ks7vlW4W5f9eYhoywHJyRTLCcVWSpuj
 1r1lwiYUuq+kkqYqJGTB6XoR3H+wyn2W8XZkrVPXnLOOkKP/MQX4GKXRIXVQ2fa1
 yhDtdPeKS11Lbts2oerydXWlP5ABSemXix1dVhXykovgJBxcDSNqbrV3Qd+5Cb16
 MGaVcfVyxSK2GMboeai3L851AW8C2pYZAv/Fxbw/Gs/TdwwoCXNvmi2j3sHcABBb
 oigkC9V+y55u3kxlBr9Lq0ItzcoNaRBm8aHj0p9I+NeJwncdvyv90vOcUa1IAVHU
 1X/EHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8jqq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 09:04:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c551e6fe4b4so458484a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770282282; x=1770887082;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LByn2VpBX5A4tuU5+bD1nh0xOghUOXhc6iS2XDov8zA=;
 b=gTFwik+kCrDLs8TEmzkGLZTVaWuaZPg+bTm0xobvNX7Ezu24aPX/y6hT9o1bjmQwME
 lT5JkiJ1R5YBr3RmulbdZiNu3Vs9fK1wESlEdXTpWOJGj2cJ1/XLhGffWRfkEnizFpAN
 +H87NZl1MkBRNNEWTQwNHvGV45UoB6tmNHEJlrwBG5U34OM6ESs2RlIxep4+PMYD0/4i
 2ZWiAle8UNOBNYGWQFV4qCy4xVYInI9fPCDJRJNN4b3I7t9oE3C0jZc7NUW2fdxdAvbg
 prRNdJyZpitGI6WwXgEMm7DUUOZoRThaRwYOZrsrCpd+ALjy83Ze5aCU/w5vvji+38Bh
 U0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770282282; x=1770887082;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LByn2VpBX5A4tuU5+bD1nh0xOghUOXhc6iS2XDov8zA=;
 b=xB+9Mr4r6bVKRRUEFf380zys6fq8CcuirLRbLkdLlpip/WqDBcAiV3yLKZg6XE9YbE
 EXegjoaG7z2hB3NifDmiDusfmrfLvlo7HUzfjHbEwGT1P0EJ/53NNX+n4fqetezlCQ9y
 WgmhBgxXgGunqE5lUVIBNeJe5Q0TucpluumOHw8YnqhJrtft3ZYcq4SfrooSox/tYOGe
 +6TRSVg0hoFdWFDK2H74cVqDfytMUmDFSlWwnJJD2oxlqS2FnkcdF1OV0aDUfsYmPYF9
 NFaIgpo2oeSeksm8xAehZBCNfIZOfd4V/AK540yqrWQ/5kiLPGMRFWiRAmrlICZDMBZ5
 KvZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5PpVwgMeqdebtyLw3E8ZZ49QzfGJ/XrD4cN/gG/On98DRxlrjGm/yAGBnSeKmGnSquxekDSTy6/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk/fRdpNdBsv6KOR6hlnjfFKIDRWIYCIQrKRYzhQZglmFYqs4e
 uWiuXKCqALNIMAGVQAUpve0Iex8qYnRgVe1RwD2dUf65H/pzNf5hys1Z4WQelUbsFAc0fPPVlyg
 jA5nYLd22UUHzt9mIa7ibQARFOT7DXajAZo8ehEy0wJp7FAy8W/+cJQWr3gBGjybX9nWKhw4=
X-Gm-Gg: AZuq6aJTCxF53qD/4oDBeie7bmRDe1vpVYlbH70zFmvpTN7UVx8SpQfre8d34M+P4xB
 ERW0+Q8tMzhyAItV8/mFN4Havh/ddZHVG9e9i9gjXkzP9lUOZl1FpZpf8KJ2ACILNOCuZwdQy4k
 bTBs3pYVTPD1ccqetSVBGQkDLZR5hTwg5oSuFo29mGe/ukEfuarc1JLtW67PtsPPKz/RjCQWV5Z
 bhJZvgrmnV68gy7B1Oc5sX2FXVDkKJALLtPCO6Uy/sW4tTbmHgW+dWQNivwu8f6O/u/8kt3Lkaq
 Jm+31GL+xPOhd1J4At6O1LHxZZC2Y+qwVWwf9wuyGany4Pci7gC/0u0/Uf0KPd+srTUGKrIC137
 AWMSh3fvE6Wi2XuY0E/40p7otyqUb2EXVrZ0aUCQpqechVdVRlx4KOJm2D7Xuq/4wGvE/5GvCFD
 TkEx6N
X-Received: by 2002:a05:6a21:6e48:b0:343:af1:9a57 with SMTP id
 adf61e73a8af0-39372486619mr5352465637.56.1770282281459; 
 Thu, 05 Feb 2026 01:04:41 -0800 (PST)
X-Received: by 2002:a05:6a21:6e48:b0:343:af1:9a57 with SMTP id
 adf61e73a8af0-39372486619mr5352428637.56.1770282280933; 
 Thu, 05 Feb 2026 01:04:40 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a933850f36sm46175105ad.10.2026.02.05.01.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:04:40 -0800 (PST)
Message-ID: <c0236922-2d30-4588-a799-0809d242ffc1@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:04:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Bjorn Andersson <andersson@kernel.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
 <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
 <4hnmij6jufkomwlb47fgg7ahwsjkamkaqx6h2t5cxoshfcdlpr@uh6n5tqofxdo>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, Greg KH
 <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <4hnmij6jufkomwlb47fgg7ahwsjkamkaqx6h2t5cxoshfcdlpr@uh6n5tqofxdo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX0v2TSPSegmT5
 If8dfy+ZLCNmAlfM3VRrkSSKl5rsPolVMf5ShckKNoSZImcvUhXCDVfLrSdyrySzXX6uAif/siq
 63fB8+gdmJCrw0RMdH88WLEfJh3dMMYFynO1z3KhBNz2y8PzhZudUzlW52p8ZbTU8OFPzhUQP4M
 ktsEKqXWvhPX1zyi3tybmwLfVKNTp/wLVge8NMKsm1eSCVLNCY7wxZP7jyaaW15pQNwqzTYJLQ3
 6VM4gJiTkpMuagUnI+wwztS9UICVs1CWsKbyiOvGWIjEWWaaKhGD9YmkoBvbArMLHDsXK+s+FGS
 rfbOb/lR9FSslBHbDvqO/TvY71zEJt6HNNJQWb9S0lBxDhcZvoXYJMg+UCObQ1WHyYIUx47K+6C
 y2fKg3ftivc7LIYwRepxPupV5dCnugAAKsHBdPj8FF5cDQUKsyzPEfGX8nOAQjGhS3sfrmkYRzI
 +PJNo/mXd/jjzhLoLAg==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=69845d2a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=RXZXvM6syZh7F40latoA:9
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bGoLoEmBaeDhUzP73iWT6kRC8v2j73i9
X-Proofpoint-GUID: bGoLoEmBaeDhUzP73iWT6kRC8v2j73i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050065
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7B84BF0405
X-Rspamd-Action: no action



On 2/4/2026 5:42 AM, Bjorn Andersson wrote:
> On Tue, Feb 03, 2026 at 11:19:39PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
>>>
>>>
>>> On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
>>>>> The entire reserved-memory region is now assigned to DSP VMIDs during
>>>>> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
>>>>> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
>>>>> heap lifecycle to the rpmsg channel.
>>>>
>>>>> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>>    	args[1].length = inbuf.namelen;
>>>>>    	args[1].fd = -1;
>>>>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>>> -	pages[0].size = fl->cctx->remote_heap->size;
>>>>> +	if (!fl->cctx->audio_init_mem) {
>>>>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>>> +		pages[0].size = fl->cctx->remote_heap->size;
>>>>
>>>> Do we need a flag? Can't we assume that remote_heap is always to be
>>>> allocated to the PD?
>>> We do need the audio_init_mem flag.
>>> Once the PD starts and daemon takes the memory for the first time, PD will
>>> start using the memory,
>>> meanwhile, the daemon can be killed and restarted. In this case, the memory
>>> is still with the PD and the next
>>> daemon connection should not take any memory for the next request. This flag
>>> is maintained to ensure that.
>>> The memory needs to be resent only if Audio PD on DSP restarts(due to
>>> PD-restart or Subsystem-restart)
>>
>> This needs to be explained in the changelog.
>>
> 
> Not in the "changelog", in the commit message.
> 
> 
> @Jianping please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> Your commit messages should "Describe your problem". From this
> description it should be clear why the change is needed and why the
> change is done in the specific way.
> 
> Regards,
> Bjorn

Thanks Bjorn for the reminder, I will revise my commit message.

Thanks,
Jianping

> 
>>>
>>>>
>>>>> +		fl->cctx->audio_init_mem = true;
>>
>> What if there are two racing IOCTLs, trying to init AudioPD process?
>>
>>>>> +		inbuf.pageslen = 1;
>>>>> +	} else {
>>>>> +		pages[0].addr = 0;
>>>>> +		pages[0].size = 0;
>>>>> +	}
>>>>>    	args[2].ptr = (u64)(uintptr_t) pages;
>>>>>    	args[2].length = sizeof(*pages);
>>
>> -- 
>> With best wishes
>> Dmitry
>>

