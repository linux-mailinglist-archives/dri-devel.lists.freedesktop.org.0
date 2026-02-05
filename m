Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDNDErZchGmn2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:02:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A8F039D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC39410E807;
	Thu,  5 Feb 2026 09:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9G2JH3v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ju6aE5B6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F0610E807
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:02:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6153djHj2759475
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Feb 2026 09:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VOdyGAn6x8GSzehJDyJ9HjphbmLW3tpOReuTJmduJx4=; b=Z9G2JH3v2b6P7yor
 /9sx4yGotW6kJ/btGBUXUE26kLTIqSDnms/J9+yWAqG2hPDjuxw6wPI76Y0BYYkV
 Tc8XF7M2O2Vpm0015J0cpbUfJhOzUYLDr4+iLnmBLX5IoShm50hznS+n+LJDMmNH
 xpQZ4a2ZELbqN8jbg4V2P0lWCE77xgJHjgo3xVcbpZnOgEirNL0+64trKlXHnHIc
 rDmC1XdQwMOuT7WVFIlp7gxTDMJbD84VShB2Y8Yh/FHGoYtBM4u5nxKwjmYZHb5v
 aef2KEQSElp2eSvzC3uMkOIclB1tWPdIVHf+AuX86LVByzzzR4Kn68xWrau8K9rh
 PacvXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4jpd11vc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 09:02:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81eef665b49so2074401b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770282161; x=1770886961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VOdyGAn6x8GSzehJDyJ9HjphbmLW3tpOReuTJmduJx4=;
 b=ju6aE5B62cdA5rf67nvY1q8iOgaPp8hMQL8IplXIZK0tEptQoBjQxeblnO+njcDTNa
 6YMhdyOtt0mMyYU4lyN3H16VAb/K8ZuneKitFn6zbgnhQEFk+r6hmPKpa4/B2JPrcNQO
 IPFkNVurkomiomxfzTAGgb934nflZqma/vfJUZiJdh3/oXx7UXvnyb4VjL58DflCARXU
 mlrsfwhJGeqdZEUlmG7lmyp70pcXSFf04Ycxoos8o2kcaA12EWJMruBHyaLzRbdjQZi+
 9CQlVjw1f2AgC5rH1SSsc6umc/DUMlGnrOEk2hpAloFO8XyR5s4LgvVg9p/Kfgh3GYGQ
 vjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770282161; x=1770886961;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VOdyGAn6x8GSzehJDyJ9HjphbmLW3tpOReuTJmduJx4=;
 b=ZQCl9OvxhojHqNHEiVcGrvMuW8Jlmv/3fvhxfqKsKEwsupuf6vLCialt50ofSPhP1U
 FYoyELlmWShyZUaTCWBpqhHVltjaGovp1GiWWAzWkQSAopUAbgUHUkz2DQ6eQcPKvRHo
 H5kBya2KJBsEXPa5kwgbL3QoDy5TXl6nMPSb7n81pk3E4RikzzYMtD02K7HfJ8PonYLZ
 e6KKndSXnwkEoBlmcKcyagERwwnU83/kj1tM1FCFvOowK8Zm/vADMTfsPUs8KKrid9T4
 fOQqp2heNTcioJ1kLYsSYS1sEJwpgBPyg8LvtP4OTowyLHUB5rULb0rAVe69vTkFJLao
 HLfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpQVQKu3ddAK9DfH/raSXJUgRD+ebV2OVhDAwNytwszItuF5CRB3J/lnTHhTL6TQRZbmraEmUzUxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwpW5zBL0nBwsEJeGhlSTZBmuJtEGec5YwJPVcd8bx+TVq+gT5
 lD5A6Etnh7iah1BOgyR3KbSbC+N/hCjLuHXK3ZHHG4tBK/DUFFd1j7a6zCpB1MAkJvTSHjd4YOD
 3lS7VY9p+z9zLe6G/5PvIDKXK9OAmr/Y9eKUeiYeJ/HlMrzhDFQV/kj+fwxKwoh3uxrlsP2c=
X-Gm-Gg: AZuq6aIhVUXeZv81xJ65/qJ8X7C+UOPqvxXbsHqrO+EhKaxtEZZB/jSjwusegEOK/BH
 jl5Edv4mhKbdVv5PoSvHFy3bOTQi5N2OjRnDDfcFWr8CbX3aWwFSLturWHpdXkbyI+8QPCMruFs
 sjrzLQ0nzKxiyIlPn3Mz4fvLO77eHyqv7ZvZ4o7UFbAsTdEJ1DqDkHd9GR+CS3KyspnsPmF2IbD
 RxJ/lLJy0CsM9QXGzHhx/ozBMsKjX9tQVSs7RcI2JNjRfAtXVcT3fqpFCFr9DhNza8TC+8FVb1O
 bx59KrYJmkPHaTo3NAZuE0nXKHnA4OeDtbTUY3Bshc7LI6YngXvCsUJl/75uSj3m+QGUgiMM7Ve
 6kaDxCPpIjZin2yh9z2civ5qZDEjt1WzsDpnGOF0oL9CMhi4C6hLe39wqH2y2eACptfG7qs2n2r
 gUhEoj
X-Received: by 2002:a05:6a00:3cd6:b0:7f7:5d81:172b with SMTP id
 d2e1a72fcca58-8241c4c4babmr6387701b3a.42.1770282161139; 
 Thu, 05 Feb 2026 01:02:41 -0800 (PST)
X-Received: by 2002:a05:6a00:3cd6:b0:7f7:5d81:172b with SMTP id
 d2e1a72fcca58-8241c4c4babmr6387676b3a.42.1770282160705; 
 Thu, 05 Feb 2026 01:02:40 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8241d1694c8sm5176743b3a.8.2026.02.05.01.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:02:40 -0800 (PST)
Message-ID: <b114f326-cbe3-4b05-8e6a-2d62636898c9@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:02:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
 <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 Greg KH <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfXw8y1voHkznkP
 g+wKWjFR/mzfP8jLuwtetWpBMR57Jon8H9CZoll7tGAxFY8TaoMKjsJOKs+Ef0i6Ytp/AL59KyP
 wsj8pPD937EjEWYIE8ezmLjAprHfeTME+87Ke515fiswVyC6axnfiqawToVDpLf6eiNMkHdZ6mZ
 NkXGFjrbO2MVUf5iu3GBJ1PxIIVM42/TxX7QEFX5NS+KtuRPwJlFczksy9txM2rgdQGWjCXIVk8
 VCV5AUToIARizLlKfGa4xQ2zB3nwGIFcEX8T8FBlMmH43bLZdbzCkhlYhie0aV7AZ4CNqEZHz8n
 nGU2U6NsWSMjmI5/a9pS0PhCcF7zGYBiOHS/Bzza7QlVqjGPO5e83YBJPcU30g3OnYq1U7zb+/Q
 N/oeMGCMYm6rZgYd4aOY3aLmH1w2Vz4P7N2acGOreuO88poaGeZq5hYWpJ2MatHSxoJQuQwqoLk
 m93195pGETMBAj4LOTg==
X-Proofpoint-GUID: 0abby9OWV82nBnD6m8nGq8TqDDUmRtGs
X-Authority-Analysis: v=2.4 cv=d7j4CBjE c=1 sm=1 tr=0 ts=69845cb1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hk6yhF1Z7CYCzsAHo9MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 0abby9OWV82nBnD6m8nGq8TqDDUmRtGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: A63A8F039D
X-Rspamd-Action: no action



On 2/4/2026 5:19 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
>>>> The entire reserved-memory region is now assigned to DSP VMIDs during
>>>> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
>>>> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
>>>> heap lifecycle to the rpmsg channel.
>>>
>>>> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>    	args[1].length = inbuf.namelen;
>>>>    	args[1].fd = -1;
>>>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>> -	pages[0].size = fl->cctx->remote_heap->size;
>>>> +	if (!fl->cctx->audio_init_mem) {
>>>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>> +		pages[0].size = fl->cctx->remote_heap->size;
>>>
>>> Do we need a flag? Can't we assume that remote_heap is always to be
>>> allocated to the PD?
>> We do need the audio_init_mem flag.
>> Once the PD starts and daemon takes the memory for the first time, PD will
>> start using the memory,
>> meanwhile, the daemon can be killed and restarted. In this case, the memory
>> is still with the PD and the next
>> daemon connection should not take any memory for the next request. This flag
>> is maintained to ensure that.
>> The memory needs to be resent only if Audio PD on DSP restarts(due to
>> PD-restart or Subsystem-restart)
> 
> This needs to be explained in the changelog.
I will add it.
> 
>>
>>>
>>>> +		fl->cctx->audio_init_mem = true;
> 
> What if there are two racing IOCTLs, trying to init AudioPD process?

There may be a chance that two threads enter ioctl at the same time, and 
seeing that audio_init_mem is false causes it to send twice, so a 
cctx->lock needs to be added here to ensure that two threads do not 
enter simultaneously.

> 
>>>> +		inbuf.pageslen = 1;
>>>> +	} else {
>>>> +		pages[0].addr = 0;
>>>> +		pages[0].size = 0;
>>>> +	}
>>>>    	args[2].ptr = (u64)(uintptr_t) pages;
>>>>    	args[2].length = sizeof(*pages);
> 

