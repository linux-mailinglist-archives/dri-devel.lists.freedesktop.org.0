Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wARkGEVDqGlOrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:35:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94E3201A07
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFD610E18E;
	Wed,  4 Mar 2026 14:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vcq0XTgA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTY78ogZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9400410E18E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:35:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624DOu122861188
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 14:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VxKyQpAO52H/UKeLl72yH06DrNEkOADt/RkzWxe9EMo=; b=Vcq0XTgAihQCmCFd
 N5Tvc2S9+TrbaUhusiygGxg67r3mRI8yPoBgxXfSxFaEb2tglmaugwlxTlxDIMdo
 M/U9Zq5rrOeQfbZk2M2g+sU3xFu40Qebah9pjReVPwLEHizXQoaYYIPLPbeKtYow
 vDHIt2yPlOR8nCfPKM9VxjeyyHSyoHvIbq82xDRTJJ0rcXA4jS/1ebz569gFQOfO
 QTZD20lpAuAY/4FUkuN4KZYbdgoy94UnoSAnqPPE0IRr4SrpPncAVPh9TJtpTqy8
 lHZSTj22Ta0ROipmSICVigfpteGfPZdQyBAN9fCCUifooYit+CQQYKbuwPtz16Ib
 zSGFaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9m7bx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:35:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-35979a03106so4193341a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772634943; x=1773239743;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VxKyQpAO52H/UKeLl72yH06DrNEkOADt/RkzWxe9EMo=;
 b=ZTY78ogZ/p2tHTLVFq8qUlELaiw7i9O9IkJ3f7f9BrmTFi7Q8p85gWaqIkjnMx/tdp
 cLCD+ITLEXQBlnW1BdncUDx5W6Qcazc4mHCYqOerhNDitYfVkxo/W0+ih9HZZLDrdQ4U
 MNn36t0W1KIWTFjVgI0478++rQIAglIvdrWTFCvM0kI4I6BxIpYPUOspR+i0w6bu6IHR
 X6Nq7GD3j6uqYgwv+OQBBWaxtxSoAKY1NgL9YYzNby1RAsbjFSC4H2+HQhOH93kZxynP
 g0ECj9i532wPu9jqssk2bsonke25SjWWERaeZ7wQma+hKZ2Hb5AXndwVfsxX1oW/OAtu
 +S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772634943; x=1773239743;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxKyQpAO52H/UKeLl72yH06DrNEkOADt/RkzWxe9EMo=;
 b=l1NVdEml79HUkzAd2R0PiOn3muJQ/vIi73sdOzbG4vGZaU5HLYd+7XmGwmSQEV7op4
 0fTfJPdKOpl0h6H1bC002mixd2onJkBP4P8nUlEQ7pIme8E7jH00SbddjSo59/wafcTl
 yZDlHAy0Vi46fq8EbR8eDThobw2II/4lqzERWs4YBN4+Ar6+2skJrVaALdY9UV4OodaU
 8d/D6GLsyrfZ+X7SC4G3kDsQKDy6HpY/cIgN65iuxmL62ynwNraKv2tBOqnfIYs17rVz
 wARr7e3gCoo9f1cjx9IMaOD30LTWDinB3OyrM7iOq3vWHasj21WUcL2B0/j0A2OzZhId
 A3AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAYi5QrC96lVkcBADnNzLY9fnQPd27Rra/rgYJ7H9QDUWo6yRtRdt/dxE5fZ7ISelS2fYxQQBjY18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXPD/TvyyajiyOzmrKcka6KuxZdJcXf39dzis620pJOA/xzk32
 RwxyPHl6hfIjwvkgCHkZX4K8wVRalM0OdPtk2rRWpQcz7FpK+qoFA074QD4CNzJXo/SYrISuGxK
 RhCnGdKG+r7szLLbzwYWNGUlyFjGpKro0ov7JKtSV69VR+yWSsgvdlqH8YYRPoov1/7Bm2PQ=
X-Gm-Gg: ATEYQzz6gxcCMIPWqCtUFYhAcGmOEBIvLJk7S9y28UzF5EbHnFU3u+ggZ5Xg3dr+Wan
 QKOFGHk2JH2hnu2sIezRNsmV4j73BIJr0Li8kjhh/5mzh4pBkEsoiPKSqG/UiV+Tbtk4abaNAmH
 9QEkK0j9Kgy9SwzSFRB1zG21q3N9aP0MZAHhLP6NggE3DT8y8FdDORlFtcueCX4xyCgP3P43zlI
 GkbsQjV8P7f98SQuMYRP+zFSSNqeyyen4vz4JeFs9b2rvFag5vv8yMN8ygu9GHw2HBFIXr+ceHa
 uGmFfeTOfLLjN6j8Dgs/cwBcWIMSxYhwJLnVuolJlmNYJmoMgW0nG7MTamNwNUXrHTt5yemFydc
 ogqNt28NAtvUuPC2U3R9d8VJq2D9CSSun9z02yu6580YfkkE=
X-Received: by 2002:a17:90a:d40d:b0:354:a065:ec3e with SMTP id
 98e67ed59e1d1-359a6a66920mr1865464a91.26.1772634943398; 
 Wed, 04 Mar 2026 06:35:43 -0800 (PST)
X-Received: by 2002:a17:90a:d40d:b0:354:a065:ec3e with SMTP id
 98e67ed59e1d1-359a6a66920mr1865427a91.26.1772634942654; 
 Wed, 04 Mar 2026 06:35:42 -0800 (PST)
Received: from [10.206.105.210] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa82cf71sm16879002a12.26.2026.03.04.06.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:35:42 -0800 (PST)
Message-ID: <bb8a6e27-1b9b-4db6-b668-314a84b79b80@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 20:05:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user
 structure
To: Bjorn Andersson <andersson@kernel.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
References: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
 <r4b67y3zbhclkdskbyobtypkrz5pszykvt2hitntvdimanuwe5@34uqxkc34ub7>
 <07d585fe-dfd1-41c9-9c58-b2f9893e572e@oss.qualcomm.com>
 <qoknqyxewirettcqlymmvnrrn5mft4ugf6zthvgmpeoapotct6@dundgjyvtjj2>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <qoknqyxewirettcqlymmvnrrn5mft4ugf6zthvgmpeoapotct6@dundgjyvtjj2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExOCBTYWx0ZWRfX+lDqMQm2f5zM
 0SM2uel9lbH0swGJ4viT9JKT3JEH4qZ3He8VSoDSmx3aoUEoWuKWPBmBIMYQj5n8xtQ9tSsIO1S
 n710VakBRwQpwm+SuM1B3wmj9tK2ooYbxGIXjjhQ8AnY+T+8QOpUIZFNNjVh8zLUQn1q6nNhdzQ
 H/1kI5/FsCK+FLA/XOEKy/X/sQeYaJDp+qkXi3w4TbnDLW5s2FAX2vFnzTgCck9eUdG4Hb9ZQHy
 Q6vd+LxmAzQsHJRmZ7j8Az0oumAMlsozjNsYSMZw9Kh4Jo710ybUnU3Ku1tJRgaYEsbicOc9JrA
 4iS5SlNQkBCQKjYGUgoY8BdkkczoXFpZ9lo5E5gl3dJ9NAgdcdnTEE2uP76cREFidQlsu18LGf/
 vt/jL2Yt92Aahs0IeuJBmanfJpqtdv0vWVweyHdGuoreIqyhY4+iKWQdo0nWFX8G6W3um1SMOB5
 oX0dSfnORieM305FU7A==
X-Proofpoint-ORIG-GUID: -AIlgyqyLI74Y49JAZL0d52fcJDdDjzK
X-Proofpoint-GUID: -AIlgyqyLI74Y49JAZL0d52fcJDdDjzK
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a84340 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=lEOYtOyc511SuodwwMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040118
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
X-Rspamd-Queue-Id: B94E3201A07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[anandu.e@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim]
X-Rspamd-Action: no action



On 2/28/2026 12:44 AM, Bjorn Andersson wrote:
> On Fri, Feb 27, 2026 at 07:52:00PM +0530, Anandu Krishnan E wrote:
>>
>> On 2/26/2026 11:20 PM, Bjorn Andersson wrote:
>>> On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
>>>> Add reference counting using kref to the fastrpc_user structure to
>>>> prevent use-after-free issues when contexts are freed from workqueue
>>>> after device release.
>>> Please follow
>>> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>>> and start your commit message by clearly establishing the problem, once
>>> that's done you can describe the technical solution.
>> sure,  will update the commit message and send as patch v2.
>>>> The issue occurs when fastrpc_device_release() frees the user structure
>>>> while invoke contexts are still pending in the workqueue. When the
>>>> workqueue later calls fastrpc_context_free(), it attempts to access
>>>> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
>>> But why does it do that?
>>>
>>> The reason why we need buf->fl->cctx in this context is because we need
>>> to mask out the DMA address from the buf->dma_addr (remove the SID bits).
>>>
>>> If we instead split "dma_addr" into two separate members of struct
>>> fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), then
>>> it would be clear throughout the driver which address space we're
>>> talking about (is it the SID-adjusted iova space or the dma_addr_t in
>>> the particular DMA context).
>>>
>>> In addition to making this aspect of the driver easier to follow, you no
>>> longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() (or
>>> anywhere else for that matter).
>>>
>>> You can just pass buf->dma_addr directly to dma_free_coherent().
>>>
>>> You're isolating the fact that the firmware needs to see "SID |
>>> dma_addr" to just two places in the driver.
>> I agree with the refactoring direction you’re suggesting, and
>> separating the address spaces does make the driver easier
>> to reason about.
>>
>> That said, the UAF isn’t limited to the buffer
>> free path. fastrpc_context_free() also calls fastrpc_map_put(),
>> which reaches fastrpc_free_map() and still dereferences fl, so
>> addressing only the buffer side doesn’t fully resolve the lifetime issue.
>> So the reference counting is still needed. I will update the scenario in
>> commit message as well.
>>
> I presume you're referring to the "vmid" we need to rebuild the
> src_perms for use in fastrpc_free_map()?
>
> I think the relevant question to ask there is if it's really a property
> of the "fastrpc file context". It seems to me that we could solve that
> by storing the src_perms in the fastrpc_map once we've done the
> qcom_scm_assign_mem() call in fastrpc_map_attach() - so that we can free
> that object without having to reach out to objects of other lifetimes.
>
>> If you think it makes sense, I can take the address‑space refactoring
>> as a separate follow‑up patch and keep this change focused on fixing
>> the lifetime issue.
> The chance of you fixing one lifetime issue by introducing one or more
> worries me, I'm only familiar with the driver, so I wouldn't be able to
> say with confidence without investing more time fully understand the
> various lifetimes. So if we're going that path, I'd like someone else to
> step up and tell me that it's good.
>
> On the other hand, the two changes I presented above are logically
> simple to make, follow, and review - and they don't complicate the
> driver further. So that would still be _my_ preferred choice.
I understand your concerns about the ref count approach.
But with the two above changes also UAF issue will still persist.
In fastrpc_free_map() :

if (map->fl) {
     spin_lock(&map->fl->lock);
     list_del(&map->node);
     spin_unlock(&map->fl->lock);
     map->fl = NULL;
}

we are using above logic to remove map node from the list.
Here also we are using fl->lock to manage the map list and
this map is part of fl->maps list as well.


I suggested ref count change because it was handling all the
scenarios we discussed above. I am open to any alternative
suggestions as well.

Regards,
Anandu

>
> [..]
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 47356a5d5804..3ababcf327d7 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -310,6 +310,8 @@ struct fastrpc_user {
>>>>    	spinlock_t lock;
>>>>    	/* lock for allocations */
>>>>    	struct mutex mutex;
>>>> +	/* Reference count */
>>>> +	struct kref refcount;
>>>>    };
>>>>    /* Extract SMMU PA from consolidated IOVA */
>>>> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>>>>    	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>>>>    }
>>>> +static void fastrpc_user_free(struct kref *ref)
>>>> +{
>>>> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
>>> Unrelated question, what does the "fl" abbreviation actually mean? I
>>> presume 'f' is for "fastrpc", but what is 'l'?
>> fl is short for fastrpc file.
>>
> Hmm, okay. Thank you for clarifying.
>
> Regards,
> Bjorn
>
>> Regards,
>> Anandu
>>> Regards,
>>> Bjorn
>>>> +
>>>> +	fastrpc_channel_ctx_put(fl->cctx);
>>>> +	mutex_destroy(&fl->mutex);
>>>> +	kfree(fl);
>>>> +}
>>>> +
>>>> +static void fastrpc_user_get(struct fastrpc_user *fl)
>>>> +{
>>>> +	kref_get(&fl->refcount);
>>>> +}
>>>> +
>>>> +static void fastrpc_user_put(struct fastrpc_user *fl)
>>>> +{
>>>> +	kref_put(&fl->refcount, fastrpc_user_free);
>>>> +}
>>>> +
>>>>    static void fastrpc_context_free(struct kref *ref)
>>>>    {
>>>>    	struct fastrpc_invoke_ctx *ctx;
>>>>    	struct fastrpc_channel_ctx *cctx;
>>>> +	struct fastrpc_user *fl;
>>>>    	unsigned long flags;
>>>>    	int i;
>>>>    	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>>>>    	cctx = ctx->cctx;
>>>> +	fl = ctx->fl;
>>>>    	for (i = 0; i < ctx->nbufs; i++)
>>>>    		fastrpc_map_put(ctx->maps[i]);
>>>> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>>>>    	kfree(ctx->olaps);
>>>>    	kfree(ctx);
>>>> +	/* Release the reference taken in fastrpc_context_alloc() */
>>>> +	fastrpc_user_put(fl);
>>>>    	fastrpc_channel_ctx_put(cctx);
>>>>    }
>>>> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>    	/* Released in fastrpc_context_put() */
>>>>    	fastrpc_channel_ctx_get(cctx);
>>>> +	/* Take a reference to user, released in fastrpc_context_free() */
>>>> +	fastrpc_user_get(user);
>>>>    	ctx->sc = sc;
>>>>    	ctx->retval = -1;
>>>> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>    	spin_lock(&user->lock);
>>>>    	list_del(&ctx->node);
>>>>    	spin_unlock(&user->lock);
>>>> +	fastrpc_user_put(user);
>>>>    	fastrpc_channel_ctx_put(cctx);
>>>>    	kfree(ctx->maps);
>>>>    	kfree(ctx->olaps);
>>>> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>>>>    	}
>>>>    	fastrpc_session_free(cctx, fl->sctx);
>>>> -	fastrpc_channel_ctx_put(cctx);
>>>> -
>>>> -	mutex_destroy(&fl->mutex);
>>>> -	kfree(fl);
>>>>    	file->private_data = NULL;
>>>> +	/* Release the reference taken in fastrpc_device_open */
>>>> +	fastrpc_user_put(fl);
>>>>    	return 0;
>>>>    }
>>>> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>>>    	spin_lock_irqsave(&cctx->lock, flags);
>>>>    	list_add_tail(&fl->user, &cctx->users);
>>>>    	spin_unlock_irqrestore(&cctx->lock, flags);
>>>> +	kref_init(&fl->refcount);
>>>>    	return 0;
>>>>    }
>>>> -- 
>>>> 2.34.1
>>>>
>>>>

