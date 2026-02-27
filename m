Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC8YHJeooWm1vQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:22:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF901B8C97
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E335810E18A;
	Fri, 27 Feb 2026 14:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTokqWTm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkcC71EA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BA210E18A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:22:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61REM8N71010572
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +ubhpkZa0hLqmSxZSdbrhlgK9Ltmq9zfNYUEta6sJsA=; b=NTokqWTmeMu1jIvQ
 kvsoQDduSEYU2Q+QtFPLGjde7uoNHUzOce7J6qOAXkH/PSEipfAfvxfrGWr4wYeM
 MLAPHj4MnbdgYillxNUoqHHNySplYIOSHHO2c0oq7BlaefePMKbwqSEOJCrmQvJ2
 7/guS7m5bvv6njMl32GIc0U9+lL0/cxf9DNp3ULbbdxns6qnlJGsq5RoEXmK3ljn
 BS6ugXfK2GQ7MRna5wbEwyczEr1My1NjLZAStNUSUhXK1G13E0rrCckHiugPREFh
 NPvFdm/Xtj8S0LtHrQTosnKywBHRfyWserOUz+zGxlCYUhokHBjVC0aQfvbiI3/5
 xToqpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f00p2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:22:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-354c7febaefso7147775a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772202127; x=1772806927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ubhpkZa0hLqmSxZSdbrhlgK9Ltmq9zfNYUEta6sJsA=;
 b=SkcC71EAFyHc3ZwdxV50CTxzFrdYwRYTCsSDwws4TbL2XYI3ayziRiwswn3AkUvHuR
 K/YoTWPw6z/3/n5pYyEnNalNbIXgbnu6/pXpPtNdPFfT3159lSupqYBlCXughaOExKOE
 A8PPdD9pJpLDqqjNmfKIVYgNQQbiGkxxDIumTOE3kOo91I5kS9XKPuBr64X8m4Jcy3Qb
 YQbAiipsJ7/3oxIqIm2oRRua8ojUMbE8FIvoZcffnUNdbV+l1tcjFvzWUrH+was25Wuc
 tWx8rHPILJR/j1nZiPGEzOUSvavZlYKSdmdiXxGOV3hDKQlHdXP4gncXKHUQXssIAVxW
 Qq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772202127; x=1772806927;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ubhpkZa0hLqmSxZSdbrhlgK9Ltmq9zfNYUEta6sJsA=;
 b=NqJ+jygPimcVBiv2QihCZoMVvmKw2QzxoJ5VFC8k+nNBpGxTpTGqAlfWYNCFeGRk08
 jSF75e9JrTqd0F45eaAxTXEnUny4V0S9Cmh5qx0/rI+xaXc/be9FbHsUWdX8icKDr5K6
 ypqnn8lU1LYt6Gm0nuYfy+hZDkc41uXhFveEc0jnBitb8S5kHGhkoq8Y5//4ePItEwZo
 zj6zAuPJxqAK0dEClZr8L3SapvTw7wlWmbOyudh/zzBzljL0vJJ0yBHmdmQnkI0epbuj
 Dv+4zvxQj/GKRG+TXi1YZMyL0IsOi4SX6olJV+cwqzVWIoQh3cCBGuKjJOjpArCgXNBS
 kQFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVdCQbqFVJvu5hcdBx9exKmpfP/glBJijGyMXcJwkg61fBwXJpzgH8jCbrkJWDvCPm+ZJWF1gQYIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ7YZX5pRbxyKwb3hNx09fEmqr6E7hJcDryuF/o26OHvgna3qz
 EqhcPpayugI8aoo7DB6iVHIqhSD2LHvfJ7FJLfwhsyvoD06gWbAN6X61LDzUsOdm7Ekp8dlBbam
 x/BwXjl10si4r/TYKkIEcfs1fMaecHivvQ5Q/EWI5GcWdDYjhKBcTcC1MRvCbMOX/5NXL8oU=
X-Gm-Gg: ATEYQzyyQP6BrMRWNArRGh22vq9sHdmzaWqwrZAJcGVGwQwOeP8tMUpfVEGKTMSRdjb
 DwDIED/yQNiHnB5dajiujztI478Gjzh/dngw/MNJVqHuO5fivFPZ2cIeWMzFYsHRgTSuQPm/jKW
 qq9Ttrz3XbBptJqdeJ+jSPRvnQ+7lJ/5fHqcac2DjkmWmYH9D0L1R/ELU3N1A7LyBWLFo3ZevAu
 2QGQIvlxLDeCqQwCF8U3ufZkBaQdt5LYpA0af4VDzpdoRuFb9lxJjolG/YBWH6gGfeofRAb3cec
 +Ef+STL6dHlZr3a3CdVQHBWJElZ+VOV76MobN92lfvC6ECy2fM8wYPeWBTNJbW6+sgquG2wxVE1
 Lb1VElLU9eVhJiJYXcN3+9D1vC0GsU+1ueVfGAs0le/wSX38=
X-Received: by 2002:a05:6a20:56a3:b0:387:5daf:b302 with SMTP id
 adf61e73a8af0-395c3b3e08emr3018165637.65.1772202127213; 
 Fri, 27 Feb 2026 06:22:07 -0800 (PST)
X-Received: by 2002:a05:6a20:56a3:b0:387:5daf:b302 with SMTP id
 adf61e73a8af0-395c3b3e08emr3018128637.65.1772202126574; 
 Fri, 27 Feb 2026 06:22:06 -0800 (PST)
Received: from [10.206.105.210] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa848471sm4642084a12.30.2026.02.27.06.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 06:22:06 -0800 (PST)
Message-ID: <07d585fe-dfd1-41c9-9c58-b2f9893e572e@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:52:00 +0530
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
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <r4b67y3zbhclkdskbyobtypkrz5pszykvt2hitntvdimanuwe5@34uqxkc34ub7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNyBTYWx0ZWRfX85ChwrEi39wJ
 2Ppp9DSx7ghcg28WmF8JKAHktmwlvBD61xdvp8Zj9rAksfW+Rtv6lJ/SUMgkFwMS3QZy6LS/IjI
 dh084BGILYLrIgSn6bovxBFwMR1SZl3kR7YLXcF3kLsQINAaDGP73DITLESsZg5P4t033MisoEA
 tsgJneBmC3FHGep/mj/cG9gM0i8qxnKCyOoJgdnDiWpHUjyY800WPAa2Q96gOKt41nG/Gyw9SYQ
 pzhXOPp+/Fvhu1E8ZlA9LWJcoRRgvoO4SsAUk7bj8zrRWbprae8Hc//I80pxyjTR1v/8MHRyXT+
 HY3nXnoeOVWUDVKzFgyMLV5rNWE2ru5VLOvnHAD6MVc6D8V41XlrLTILCI8pnQKAgJRDzO+zLsp
 Cyew4PPN7I/+tWLRcXFTEAEEPgm9HhpEBFNOZkDjq6D0IlkHUrVg+xa7YYzyZsztC9piqqAQA4g
 viUUD8fyEcyf2+3lQ+w==
X-Proofpoint-GUID: mVrY_iwvHw2HIAjzdq4aV28tdanI87Ax
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a1a890 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qfcypaD7E2ZuPNguhDoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: mVrY_iwvHw2HIAjzdq4aV28tdanI87Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270127
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anandu.e@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8FF901B8C97
X-Rspamd-Action: no action



On 2/26/2026 11:20 PM, Bjorn Andersson wrote:
> On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
>> Add reference counting using kref to the fastrpc_user structure to
>> prevent use-after-free issues when contexts are freed from workqueue
>> after device release.
> Please follow
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and start your commit message by clearly establishing the problem, once
> that's done you can describe the technical solution.
sure,  will update the commit message and send as patch v2.
>
>> The issue occurs when fastrpc_device_release() frees the user structure
>> while invoke contexts are still pending in the workqueue. When the
>> workqueue later calls fastrpc_context_free(), it attempts to access
>> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
> But why does it do that?
>
> The reason why we need buf->fl->cctx in this context is because we need
> to mask out the DMA address from the buf->dma_addr (remove the SID bits).
>
> If we instead split "dma_addr" into two separate members of struct
> fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), then
> it would be clear throughout the driver which address space we're
> talking about (is it the SID-adjusted iova space or the dma_addr_t in
> the particular DMA context).
>
> In addition to making this aspect of the driver easier to follow, you no
> longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() (or
> anywhere else for that matter).
>
> You can just pass buf->dma_addr directly to dma_free_coherent().
>
> You're isolating the fact that the firmware needs to see "SID |
> dma_addr" to just two places in the driver.
I agree with the refactoring direction you’re suggesting, and
separating the address spaces does make the driver easier
to reason about.

That said, the UAF isn’t limited to the buffer
free path. fastrpc_context_free() also calls fastrpc_map_put(),
which reaches fastrpc_free_map() and still dereferences fl, so
addressing only the buffer side doesn’t fully resolve the lifetime issue.
So the reference counting is still needed. I will update the scenario in
commit message as well.

If you think it makes sense, I can take the address‑space refactoring
as a separate follow‑up patch and keep this change focused on fixing
the lifetime issue.
>
>>    pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
>>    lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>>    ...
>>    fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>>    fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
>>    process_one_work+0x180/0x450
>>    worker_thread+0x26c/0x388
>>
>> Implement proper reference counting to fix this:
>> - Initialize kref in fastrpc_device_open()
>> - Take a reference in fastrpc_context_alloc() for each context
>> - Release the reference in fastrpc_context_free() when context is freed
>> - Release the initial reference in fastrpc_device_release()
> There's no reason to include a checklist of pseudo-code in the commit
> message, describe why and the overall design if this isn't obvious.
sure, will remove.
>
>> This ensures the user structure remains valid as long as there are
>> contexts holding references to it, preventing the race condition.
>>
> The life cycles at play in this driver is already very hard to reason
> about.
>
>> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
>> Cc: stable@kernel.org
>> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
>>   1 file changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 47356a5d5804..3ababcf327d7 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -310,6 +310,8 @@ struct fastrpc_user {
>>   	spinlock_t lock;
>>   	/* lock for allocations */
>>   	struct mutex mutex;
>> +	/* Reference count */
>> +	struct kref refcount;
>>   };
>>   
>>   /* Extract SMMU PA from consolidated IOVA */
>> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>>   	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>>   }
>>   
>> +static void fastrpc_user_free(struct kref *ref)
>> +{
>> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
> Unrelated question, what does the "fl" abbreviation actually mean? I
> presume 'f' is for "fastrpc", but what is 'l'?
fl is short for fastrpc file.

Regards,
Anandu
>
> Regards,
> Bjorn
>> +
>> +	fastrpc_channel_ctx_put(fl->cctx);
>> +	mutex_destroy(&fl->mutex);
>> +	kfree(fl);
>> +}
>> +
>> +static void fastrpc_user_get(struct fastrpc_user *fl)
>> +{
>> +	kref_get(&fl->refcount);
>> +}
>> +
>> +static void fastrpc_user_put(struct fastrpc_user *fl)
>> +{
>> +	kref_put(&fl->refcount, fastrpc_user_free);
>> +}
>> +
>>   static void fastrpc_context_free(struct kref *ref)
>>   {
>>   	struct fastrpc_invoke_ctx *ctx;
>>   	struct fastrpc_channel_ctx *cctx;
>> +	struct fastrpc_user *fl;
>>   	unsigned long flags;
>>   	int i;
>>   
>>   	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>>   	cctx = ctx->cctx;
>> +	fl = ctx->fl;
>>   
>>   	for (i = 0; i < ctx->nbufs; i++)
>>   		fastrpc_map_put(ctx->maps[i]);
>> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>>   	kfree(ctx->olaps);
>>   	kfree(ctx);
>>   
>> +	/* Release the reference taken in fastrpc_context_alloc() */
>> +	fastrpc_user_put(fl);
>>   	fastrpc_channel_ctx_put(cctx);
>>   }
>>   
>> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>   
>>   	/* Released in fastrpc_context_put() */
>>   	fastrpc_channel_ctx_get(cctx);
>> +	/* Take a reference to user, released in fastrpc_context_free() */
>> +	fastrpc_user_get(user);
>>   
>>   	ctx->sc = sc;
>>   	ctx->retval = -1;
>> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>   	spin_lock(&user->lock);
>>   	list_del(&ctx->node);
>>   	spin_unlock(&user->lock);
>> +	fastrpc_user_put(user);
>>   	fastrpc_channel_ctx_put(cctx);
>>   	kfree(ctx->maps);
>>   	kfree(ctx->olaps);
>> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>>   	}
>>   
>>   	fastrpc_session_free(cctx, fl->sctx);
>> -	fastrpc_channel_ctx_put(cctx);
>> -
>> -	mutex_destroy(&fl->mutex);
>> -	kfree(fl);
>>   	file->private_data = NULL;
>> +	/* Release the reference taken in fastrpc_device_open */
>> +	fastrpc_user_put(fl);
>>   
>>   	return 0;
>>   }
>> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>   	spin_lock_irqsave(&cctx->lock, flags);
>>   	list_add_tail(&fl->user, &cctx->users);
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> +	kref_init(&fl->refcount);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.34.1
>>
>>

