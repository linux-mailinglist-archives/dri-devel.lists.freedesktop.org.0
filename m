Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLI+Kh9NgGlQ6AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:07:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C187C90FD
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435DF10E230;
	Mon,  2 Feb 2026 07:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="akFM5S10";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqMrtJed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160CF10E230
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 07:07:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611H8aUc4111460
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 07:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r8wAJw2mvNDaqQmH4BmcfF4peq5J1hUYKiatN2uAE7k=; b=akFM5S10KutWitgj
 hQz5mwhd5LGxpe5A74duCKVzeG08wUHBBEnoDe/j0rO2yFl5T599+qlEJF1ME4U7
 AZgDPKvkpAKuZTuyp7YcKImvvKoFIXWnaw1YFM0uufGvUgjYb43c/yl1YtP22+08
 1bFB1E57DN8vgrX6Exm0TQcLwJyI+5in4DJwRB7PE1Hp1+XHBWg7bbn3EZh7Bcqd
 PRy1jt3Ibs+icCMUJWieyW9et2vCpx75NWfh6ul19+P34ww7ufW4g910H/zVTvhY
 /atiWkGY/CqUODe6FSW6xJgh4/y7VOik5E0N6Yp6jRgZtXRwa4BpHCk3n+ulj0LI
 OMkEIQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arec9xy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 07:07:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-35301003062so10275437a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 23:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770016025; x=1770620825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r8wAJw2mvNDaqQmH4BmcfF4peq5J1hUYKiatN2uAE7k=;
 b=kqMrtJedGGy658MdNfgcRO77ZitYADpB+B5rHrpIO02Fe0eNw09b+VXrcDT0dByNQA
 f1faCyJlKQD/gGdp6kor3kQYjs3lg4xMwszDlnpa4sRAEHsWqGiLQTQpp23qQlQ9848f
 3suE0GwSIJTN3rBV4KRDxZgbwB9HAr9klIoOlFvt+6SWrAPhBfMU690vIE7wkupwGAwN
 P3jaOQeLq+mn4ruIi7dEqwN6kSp3KCHpR5WXLX4r8k4P1j/jfvVVZn+iNkno/Cw4B480
 gWhcNtNw+KENroWzY1Fe15jQvD4KjiSgtTRi6acj8ADXsabijWsawud9+iE2vC2DezLk
 n1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770016025; x=1770620825;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8wAJw2mvNDaqQmH4BmcfF4peq5J1hUYKiatN2uAE7k=;
 b=f+2GmURxYXcwOdVRb/Yr4mva8ZY6bBgm1KfxCAyPE5cuzBCdLJGLW84WtMTU8PA+pz
 /woX22w1UgI+nFwlrHcBTo/B7iYxe9QGfGl6yPLR9pyTlAGZIyjJMRYiAAPibSJXVIY9
 /KYE00P7mh1u9zhmoZNg+rV1hs+cov6fw40zD1tUnIMxL2LhakhKrtyAnRp1S7GPH/bT
 UMloFJirX8fHYciGz2+IJbUudTWTquQaF8mXTqDuKTlPcHkpTxNzLKeUNL4Qu/qGFFLx
 +7lnq+LboghQKtO64gSIfDc8xM3PNoUFmBSJJEPiO86d5pZNdxhEM4A3Fucw/hdo9CqR
 tKpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8MfmR/kzQcPLqcVIZJ2vG+1dqug68CGWMUl/kG5RKdPacZgCmvkUL9C23pC4+VrraDd9pRMdt9zM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOE/IiHrnd5QY8wU5TeQdjO09fHIaDQWn/zv03MoRKFn+pg5OX
 1aePfg9x8/+FhARn5I6iFIk2B38l6Jx5dJtMXkek9K0mjRiijbvsGqzcphx5lPZl2HuOxnFRnju
 yh2ZQmW/uOh7K3ezTvUSYm7Hdrb4kbQlerKW1C1X6WRbmzBPE3HYcuo19LTOs5TlPiqP0imW0MV
 CssPR1Ow==
X-Gm-Gg: AZuq6aI69G2RInXrqWUk847TbjydsDwjuYCxcHQKmyqLAbLQVEMMh5g5QHVtFBimt5i
 PztAgBTOom3TtM5dXUP0zrDeWKeYZHdTX0xEWj+Cbu6xaWMbT1hVjAkJ+MyxDPc11zupFMk2fGE
 LgMW6j0Wu7NPQg09A83xwq29FaafeQl/MldsswgS5R53hHOVDtv/K8IsrGwH5RHdQmf1S/2LMSA
 3HNVNi116ye+EB8+0JsZ2Ey0pprlVa5cD2ol6mp8FrrsbYVCelZ0s2haXANT7qfDbk07aNK04aC
 X1N4dWDfdajBZr3/5x8ZLrbtJKFzmAD0oDXUhNecEIkd6phiXgGsFRsONR66e7HF0Uyqiv6NNFa
 Q7HdFc7Yvlc1B4S0NxxXtZfjVE8Zo3lzxQDo9ttAheVaLZoNbu9XNSjmQOG1WRla+c4WmGqWImQ
 218P69
X-Received: by 2002:a05:6a21:338b:b0:38e:90ca:5a2b with SMTP id
 adf61e73a8af0-392e003618fmr11295136637.17.1770016024622; 
 Sun, 01 Feb 2026 23:07:04 -0800 (PST)
X-Received: by 2002:a05:6a21:338b:b0:38e:90ca:5a2b with SMTP id
 adf61e73a8af0-392e003618fmr11295117637.17.1770016024084; 
 Sun, 01 Feb 2026 23:07:04 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6558a1a5c9sm10616655a12.8.2026.02.01.23.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 23:07:03 -0800 (PST)
Message-ID: <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:06:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=69804d1a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sQQgYFI46jR9JefEgf4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: f32eWAPiiE2NrI15ZHeNTMFEkVgESFop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfX9w/0RGGWQ05V
 IfdEdYeBRwx+8tWX8rFFRK7Bbyq2k8K9NYoT4eBewR0jnYxXDx5wLMiIqCTyiQu+IcFevU+XjtA
 Wg2GE4kcsuLM/ia9McqM2cVohJkDZMY4r5rtdxSTkPcqtvDgKMTUdG/0yw5y/QkFNnelCu5q/xf
 /1K/q14ji6aFIN2FWmo6C/kAA+vIirG1GQAbHMQYLBOE7CIJOOpPBJxsbA3kHft/5pJX+OuUEky
 4wRkccE3KFMUtCOi2L6qXrO0J0QH8m2CzAevVJNiZZhS1m7sQX65cFpCU23eQFFiizbEfTZxuQL
 APbYzrBf9zr3uWRGJp6Z0Qf+A5ir6I/GRdNGVDbYjoskqfxpczHnwsJ3JxSMVJ8Y4vO1GzdLfqs
 NQF4itQc6PV4e9KYEnkZ20hIYjS3WJdcJNaRlOkgjWZLFThx2iV3Mr07FCjERg9ETpBlHGMVc4Q
 A+EQ4UAbnU/41sjeFYg==
X-Proofpoint-ORIG-GUID: f32eWAPiiE2NrI15ZHeNTMFEkVgESFop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020060
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1C187C90FD
X-Rspamd-Action: no action



On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
>> The entire reserved-memory region is now assigned to DSP VMIDs during
>> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
>> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
>> heap lifecycle to the rpmsg channel.
> 
> Why?
The reason for allocating the entire reserved‑memory region is to avoid 
unsafe alloc/free
operations from user.

This design(alloc/free from user) was fragile because:
Userspace could request free while the DSP was still using the memory.
There was no reliable, kernel‑controlled way to know when the DSP had 
finished using pages.
Remote‑side “reverse fastrpc” free requests could not be safely trusted 
or validated.

Allocating the full reserved region upfront removes the need for alloc 
from user completely.
This way the free can be moved to fastrpc_rpmsg_remove(When DSP is 
shutting down).

And I will be adding this detail in commit text also.
> 
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 95 ++++++++++++++++++++----------------------
>>   1 file changed, 45 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 833c265add5e..f9edca7a8de1 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -278,6 +278,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1304,7 +1306,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_phy_page pages[1];
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>> @@ -1334,31 +1335,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	inbuf.client_id = fl->client_id;
>>   	inbuf.namelen = init.namelen;
>>   	inbuf.pageslen = 0;
>> -	if (!fl->cctx->remote_heap) {
>> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -						&fl->cctx->remote_heap);
>> -		if (err)
>> -			goto err_name;
>> -
>> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>> -		if (fl->cctx->vmcount) {
>> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -							(u64)fl->cctx->remote_heap->size,
>> -							&src_perms,
>> -							fl->cctx->vmperms, fl->cctx->vmcount);
>> -			if (err) {
>> -				dev_err(fl->sctx->dev,
>> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
>> -					&fl->cctx->remote_heap->dma_addr,
>> -					fl->cctx->remote_heap->size, err);
>> -				goto err_map;
>> -			}
>> -			scm_done = true;
>> -			inbuf.pageslen = 1;
>> -		}
>> -	}
>>   
>>   	fl->pd = USER_PD;
>>   
>> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	if (!fl->cctx->audio_init_mem) {
>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> +		pages[0].size = fl->cctx->remote_heap->size;
> 
> Do we need a flag? Can't we assume that remote_heap is always to be
> allocated to the PD?
We do need the audio_init_mem flag.
Once the PD starts and daemon takes the memory for the first time, PD 
will start using the memory,
meanwhile, the daemon can be killed and restarted. In this case, the 
memory is still with the PD and the next
daemon connection should not take any memory for the next request. This 
flag is maintained to ensure that.
The memory needs to be resent only if Audio PD on DSP restarts(due to 
PD-restart or Subsystem-restart)

> 
>> +		fl->cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
>> +	}
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1389,26 +1372,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   	return 0;
>>   err_invoke:
>> -	if (fl->cctx->vmcount && scm_done) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -		u32 i;
>> -
>> -		for (i = 0; i < fl->cctx->vmcount; i++)
>> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -						(u64)fl->cctx->remote_heap->size,
>> -						&src_perms, &dst_perms, 1);
>> -		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
>> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>> -	}
>> -err_map:
>> -	fastrpc_buf_free(fl->cctx->remote_heap);
>> -err_name:
>> +	fl->cctx->audio_init_mem = false;
>>   	kfree(name);
>>   err:
>>   	kfree(args);
>> @@ -2396,7 +2360,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>> @@ -2408,6 +2372,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   				    data->vmperms, data->vmcount);
>>   		}
>>   
>> +		if (domain_id == ADSP_DOMAIN_ID) {
>> +			data->remote_heap =
>> +				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
>> +			if (!data->remote_heap)
>> +				return -ENOMEM;
>> +
>> +			data->remote_heap->dma_addr = res.start;
>> +			data->remote_heap->size = resource_size(&res);
>> +		}
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2488,10 +2461,13 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	bool skip_free = false;
>> +	int err;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>>   	cctx->rpdev = NULL;
>> +	cctx->audio_init_mem = false;
>>   	list_for_each_entry(user, &cctx->users, user)
>>   		fastrpc_notify_users(user);
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> @@ -2505,7 +2481,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap) {
>> +		if (cctx->vmcount) {
>> +			u64 src_perms = 0;
>> +			struct qcom_scm_vmperm dst_perms;
>> +
>> +			for (u32 i = 0; i < cctx->vmcount; i++)
>> +				src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +						  cctx->remote_heap->size,
>> +						  &src_perms, &dst_perms, 1);
>> +			if (err)
>> +				skip_free = true;
>> +		}
>> +		if (!skip_free)
>> +			fastrpc_buf_free(cctx->remote_heap);
>> +	}
>>   
>>   	of_platform_depopulate(&rpdev->dev);
>>   
>> -- 
>> 2.43.0
>>
> 

