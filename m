Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNwnH/g4e2mGCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:39:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA89AEED7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073210E855;
	Thu, 29 Jan 2026 10:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYOIPuWv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnEodDXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D432E10E317
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:39:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TAAaxg3713391
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8nFcWZSxon1A1m6tkx1GK8WmBFbfomcGS+iTKwPNJrg=; b=gYOIPuWvCXd5tQe9
 DcwiewBtUph03uNBa/ps7tk4klnw4MDPd8SPThIHzMVINib6WvcriRRmmDB8dYbu
 Q/66SOT3zBHmqAbwXOoENObGbl/KUORbO3WscHCK+nM2HJofhINh+ZYLuRcyynSf
 nPiDIsFAV8ujS0+I6MgBnQZvnKWOkchZf7M+a2Wsqm1RC4mYERcYgKEeP7s8/B1o
 DyTatLn+3pJVCDcaelUZyVLxEgQ7PULLYLsy502ByHQ4nabos/2v7d9/8hxbeOr0
 oFvKxePN3wQzzk0qVN9ZioeynP76byZoBmgr2BxMlJ0AbLfrQ7X/8/oZUbHhOT2m
 FRP/TA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byxcu9gcg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:39:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-bce224720d8so567289a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769683187; x=1770287987;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8nFcWZSxon1A1m6tkx1GK8WmBFbfomcGS+iTKwPNJrg=;
 b=AnEodDXlA2jdr7T/WJezjXqWXa4W76/dFdqQM3nm15N2GhbhKdw3VA3DwmcdjNQZws
 TSyGHIf3DjoKzH+qv812TqZ+SEqLJgT2tZQ3cksfn+Ap8Y381wA9lpZK94ZFPTtd8zlc
 eFtuj8NSukvdbX06lUydPIUYHj0fv4KcDDWkl3tDsnkOZjlpK1UQiuUO5to1srAgJzCF
 n+NhGY09o8ISPQn/t9fWTgTxIdsHKbLivErx5q+K0yzBfudN44ggUlemZnxsy/RNyJuy
 Oby7OvxNLhJv7qgYMMHvZk2nldeS4cPJLPCl+RuDDY5OUdc/eAzbcXEpHJTtJJ1OgQjc
 4Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769683187; x=1770287987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nFcWZSxon1A1m6tkx1GK8WmBFbfomcGS+iTKwPNJrg=;
 b=ZcEMVD/dNLWwQDXGfvGRZx5Iia84+8qQMWuO1WXJzA5MfMdgj2k02MyhierCjDO/eJ
 oLxsemyNXHzv9JOSYUbw+4Z6CoHJOWBeGX3SQsXk/4xBwMnOFoDnC4RV+n3DCrpAdwB1
 oI1VcfD/yiCP3CdPW6y+iq55WA8udcEqeRmLMH+w4C/KcOSK4J72C9M8VBoWvVegenu8
 0dTLxIl7WtIadL4ZubVdqL8dj6AGsFDM5gFaMx0AM0bPsNaT7d8sCe+7GVYC9TI8m5cI
 7NTGqgl5LrvoXxwX1UNqqaNRSb5/rOU/1XxN2/ngFKckQpJCN+qpQ9xbZDUmfWMQJv5O
 ZtLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU850QEYuBfs/h8n9YLLoFEKtrBbrK1q0LR3WjSLcKvfBPXEDk3n0W7QkrqAq1S98LWiYMbyhzPvV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9bQTPmGNaY1DR9IeIWPhr0fL/mp6f1ndFFbjTNhO2MJNPSNi3
 bWqdMGPjwIO2lWdUmQ1livd6UI4wbYYDcCsGAGpF3f+dTA3ur1G34/6HHBgEYv+tx+S/yPChVQF
 P4yV2ZB0Dx2cJR6m4I4JzhOkd5Rhoq5WCMehpMsN/HBbhkeQt/dtR5fAVnlbgi00B0ttuLFAhay
 5yfrw=
X-Gm-Gg: AZuq6aK0ZsG7vJKR1WS1MAtI195Pb+vaQsfzl3Tc6q1862VqEr+XOgXs7imQGlOQwnm
 qtDwH23s9u5shnybvHA5FhlauVX9t7Uy+bCG5I/7bzonqvS9tSjAt6J6ItWfCl7k7xqbVq9MxgO
 gYt9HFUw+nmP0+L+2qvfPOpGdjmUY64Klhldv67avym3+REDgU7hZDvQymGfDiJ4lOpStKbbr/N
 PesXh4SOh4NG/8qFpt/YCP3AEN5RRy8lh5GYEj3npNFBzNHzDcuOyZifEzkKR8V3yNtKcwcXfgw
 L6NijgLAMfVKtX/Qnh9N22+Ik1f9XYmNFkYsSzjS1E70Z19jZliSg1gnLiWcuL4H2BoMH6ohRVT
 dVU7blNs2d6vYZ9wUbAJklQLwbx3GMxG+CfN0xw==
X-Received: by 2002:a05:6a20:7345:b0:38d:ebc4:b552 with SMTP id
 adf61e73a8af0-38ec62ddfc5mr7700199637.27.1769683187076; 
 Thu, 29 Jan 2026 02:39:47 -0800 (PST)
X-Received: by 2002:a05:6a20:7345:b0:38d:ebc4:b552 with SMTP id
 adf61e73a8af0-38ec62ddfc5mr7700176637.27.1769683186576; 
 Thu, 29 Jan 2026 02:39:46 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642b0b4c07sm4563659a12.36.2026.01.29.02.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 02:39:46 -0800 (PST)
Message-ID: <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:09:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MCBTYWx0ZWRfXzGc1irVV2hBr
 mDRoGK8lVdYt8mdbERNPHWPrcjd/6N7XLsICMk0DlRQp3woQEAaxHGpQQEpHeh82LeajpkO3AOi
 9DQ3WLtQPxiqEO4mmQsmf9np9ij0ge/u4HYdLPdt1c5USP5L0ytHVsY0F5KaVVtswHKZioBkgrO
 4BJwAeT+dcyIgq3cC7um1k6uzcpm0sbtzEqd5vkNlRP4EPWSn1DQH8hrFbjaWMoEJwiZSxVRzHl
 szP+jc09R/g7dcRYnhuF9eKrQ12Dz0r7LZ02f+jMAYyLqxZWPW2S+Y9tdbElvWX1kAt75HTSypA
 i0uAsM2Tt1FPIgEXWzRjgjHKnqvO/z/VQkXOyh41GIW3AIOY24BjMvwLvzpAp2p06IyxBz9bKWK
 mk4u6sh7HoEVjqKIQLppM6wonZHhbUYaFIaIbS6FZytnAy195zUPFvHcsvdRcs8+vak7JTBQOhS
 0NcCWWNi9IcGPLqWzLg==
X-Authority-Analysis: v=2.4 cv=QpRTHFyd c=1 sm=1 tr=0 ts=697b38f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZcInPQ15WBUuy6mFm-kA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 21RGktdnRqrJafxYYBa-4lwM5l0ARpbw
X-Proofpoint-ORIG-GUID: 21RGktdnRqrJafxYYBa-4lwM5l0ARpbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290070
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DDA89AEED7
X-Rspamd-Action: no action



On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
>> Currently, FastRPC only supports mapping buffers allocated by the
>> kernel. This limits flexibility for applications that allocate memory
>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> Hmm, for DMABUF we need _import_ support rather than support for mapping
> of userspace-allocated buffers.
>
>> Add support for mapping and unmapping userspace-allocated buffers to
>> the DSP through SMMU. This includes handling map requests for rpcmem
>> and DMABUF-backed memory and providing corresponding unmap
>> functionality.
> For me this definitely looks like a step back. For drm/accel we are
> going to have GEM-managed buffers only. Why do we need to handle
> userspace-allocated buffers here?
That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
change is to enable routing of DSP logs to HLOS which is done by using a shared
buffer between userspace process and DSP PD. The buffer can be allocated from
both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).

So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
with this change.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 86 insertions(+), 11 deletions(-)
>>
>> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>>  	return err;
>>  }
>>  
>> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
>> +				  struct fastrpc_req_mmap req,
>> +				  char __user *argp)
>>  {
>> -	struct fastrpc_req_mmap req;
>> +	struct fastrpc_map *map = NULL;
>> +	struct device *dev = fl->sctx->dev;
>> +	u64 raddr = 0;
>>  	int err;
>>  
>> -	if (copy_from_user(&req, argp, sizeof(req)))
>> -		return -EFAULT;
>> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
>> +	if (err) {
>> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>> +		return err;
>> +	}
>> +
>> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
>> +				  req.vaddrin, &raddr);
>> +	if (err)
>> +		goto err_invoke;
>>  
>> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
>> +	/* update the buffer to be able to deallocate the memory on the DSP */
>> +	map->raddr = (u64)raddr;
> Which type are you converting? And why?
I'll drop this.
>
>>  
>> -		return -EINVAL;
>> +	/* let the client know the address to use */
>> +	req.vaddrout = raddr;
>> +	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
>> +		(void *)(unsigned long)map->raddr, map->size);
>> +
>> +	if (copy_to_user(argp, &req, sizeof(req))) {
>> +		err = -EFAULT;
>> +		goto err_copy;
>>  	}
>>  
>> -	err = fastrpc_req_buf_alloc(fl, req, argp);
>> +	return 0;
>> +err_copy:
>> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>> +err_invoke:
>> +	fastrpc_map_put(map);
>>  
>>  	return err;
>>  }
>>  
>> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> +{
>> +	struct fastrpc_req_mmap req;
>> +	int err;
>> +
>> +	if (copy_from_user(&req, argp, sizeof(req)))
>> +		return -EFAULT;
>> +
>> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
>> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
> Side note: why are these flags not defined in the uABI header?
Ack. These should be part of uABI. I'll create a separate patch for this.
>
>> +		err = fastrpc_req_buf_alloc(fl, req, argp);
>> +		if (err)
>> +			return err;

