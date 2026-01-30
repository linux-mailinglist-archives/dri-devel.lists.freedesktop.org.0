Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBGFInCbfGn2NwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:52:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96CBA2C0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5939810E1BA;
	Fri, 30 Jan 2026 11:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIQZxfxT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNynltWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC3110E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:52:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60UAs2uX891584
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NACypJ423bQETWp3QTda+kmcF4j0ws7q8gc9h2VRpCY=; b=XIQZxfxT6C/JJcZW
 34qNv+mGZ4x+e2AgkQamMa3zP1LAyrOVCG3S0V1pLLellukjLRdnO3ymsjfNDIxW
 Bx2pw/xL1nJkPGNU0cbSn2uXnuy35FuuUPxfNUVVuVQ5Oi2WQXFeCzmB0GahHvey
 pkUSzx2G8MFScesjH18Ek5QKL9SL5MFGuXJFOcq5ly+TW+0uDzJIBW7Ab0dDq4Do
 mxyDpvrThFNHRP/8bZTmcAz1C+CQh2QKYibqEAPYATQ4DWCiODvBOMDRXR3aQxSg
 SERUaXT/RE6au6bozzanLx/KpRjVEpBURc1pmiv0jXYWFQTfaP7RI3AxkgBT/MF8
 Jxc0hQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7t14k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:52:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34abd303b4aso4440282a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769773931; x=1770378731;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NACypJ423bQETWp3QTda+kmcF4j0ws7q8gc9h2VRpCY=;
 b=gNynltWrzVlcVbpBa89f1sd0DpJ7FqbwpOKuF3OAZS/jYkcbBbXx9ZUSx8eYAt14cW
 CBPZPzvjTLq+nDC8NLmyyDfa7TQprbNWt8/Ac72szhbKv1ycI4nUd1PwJNBxQ/fxnj7t
 0CJQstYtNiFYtT+6XpidQoWYwLt5FQ2UhYLCODLvUXCm8ULkglxOJdXJUpB0AZDZeF8w
 tmpC11rnYWXq0CuoGLc4LQrTuwo+eVQNiTQ2PMVtCQ1uzO6fNGfzq2R7G12hghzR9uiI
 CnHCkpvDVSgOnoQfLLYOnucTUV++3Gdnio9fyKm6s9GltNy2c5Co3sa3N8/9qw1XeH+B
 OF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769773931; x=1770378731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NACypJ423bQETWp3QTda+kmcF4j0ws7q8gc9h2VRpCY=;
 b=pDWKF9Pkulr8eASxlobQOWiIi4fN3gLp4nrGvPczhcOwd8jL3EdaJHSK5taLVJSo4v
 3t4fRfvPF78G+vOiTbb8L45hdskX3G5Y1ysF5e5OdPIFN6qcq0kV9GDN3F3vrC9hYxSf
 YLLSiLPE/IYZZq7KbORC0/3QzuhrJQ8hkkmj5n87rKZsDL4yxVX7DuklKsLrbTmNQtbR
 FZgPWyEdTG2f+ZFjjJkcQBGglWOGpm0xGYB9zONB6pj+9xHSna4iMnk1M0QiHpCqlbDu
 mEBe2+O6NgP+0LvmEm/bdEmfhNq9cMlQTjtIMX2U8vuW2UrsNNnGGnX+Tbezzt2tw5iJ
 5NwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULnylB1DMVRBeFPYyxd0q+9Ck90fRpWdjXOGF+9ItcbSp6ozHyiVzSUTrrRmwCk1VeeB0uFeG00Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqIAB1dEt6DUKeOcoWt5fbfMDcnLJQw5YJnyqU72N5q5jpH09W
 d6Y86P55b2jYNhzCyfGAW/00fUgj2na/Gu+6JsJrTE2P2AbO/F2SJC/nMWzsV8wIcmVEvHPDaBs
 nTx9T+FbsDQkaiOuMNZSpzscAvr51ILdH4zmr7PATaMa+dIgjXDTRS92iawJHUwk0FGCccAk=
X-Gm-Gg: AZuq6aLzV9iQNlRiwmd3R2GZYzpVE4JLFOZr8RBj0E/RUn9KCYBkJ2CEyaXfqj9zna8
 GTJFNkaz4bAhGaHCNqT1AJwsXLlsWXJXV/XRqrPDZ6vmP65FQ7UozwavYIauKw4r/IWTnqDxh/Z
 lIfrtdLyhq8kFtAEqXWjLCxvrYqcUd1Gi0YmQWZRc6Fgm6G90dwuDANyUVIFj5tGkWUWWJYlhE5
 NTUj1o+By6X+B5qiVOs+tTtKvtevddDFHj0AyJ+MNn9FffD2MRWlAMoZNB4Tq9FhbO/B4uYTUsp
 SAd4WYIjWTxI1N/oqtI/0V2PhLQ6JnB/NcJi4b7ywbId8IqBBbtSodZ0ZUQTqKm74PzXZmzku9/
 VypL5s07ZAK5K5UqhjYegJlpxO6MxozrfkHBvPw==
X-Received: by 2002:a17:90b:6c3:b0:341:8601:d77a with SMTP id
 98e67ed59e1d1-3543b3b54b3mr2883671a91.29.1769773931071; 
 Fri, 30 Jan 2026 03:52:11 -0800 (PST)
X-Received: by 2002:a17:90b:6c3:b0:341:8601:d77a with SMTP id
 98e67ed59e1d1-3543b3b54b3mr2883650a91.29.1769773930565; 
 Fri, 30 Jan 2026 03:52:10 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f2cb5adsm8083054a91.3.2026.01.30.03.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 03:52:10 -0800 (PST)
Message-ID: <7e52f1d4-c05c-45ea-878c-cea2e6354c3f@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:22:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated
 buffers
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NiBTYWx0ZWRfXz3/N7ZCaQb8w
 wvoUt4ppjOukV2Dw7AO9oxWvwpKQTrn6M4f+9x3OVirxfBxLTuIB7Pc4P2tuvNn9TlFe80W4RMI
 7zmDIZrQYE9G1NDEqa6ZnBd5/UEt98oxiSnWITB8fLRIQ71u0mmoCZtGR02CW0QawinvfS6CYvW
 DG6Hz75OPT2l2DW0q0S7aUD6Z/NfDBxLQ+Bka1BzZdO4j01G7vnO6Ijs7tkPdev6pdlmm665Wi1
 ZFxTyL3S9YasHt8O8jM4pZqHnnlHxIJFXaZQ1KHCC5gKEbhXWfeM/cc0JVXPGzYy7nH0lmHbwid
 lgmstlMcKHKc2pxwJe9zXtoyucdeH/7mqqu2leRuFgxSFWSpXiRsjbGBjBhOtg0Uc7riCdnNwba
 1IoR2fnOogDZPUbcbMnVIr+p/iiRTNROQGzCgqRv3p3lfqSQXAjEYCXC8CngteK3Mbm65NxZTxp
 mFzBiFidDnScgUsCWCw==
X-Proofpoint-ORIG-GUID: IFK5WvwqhklWlP3RkhpnNifnQ1tnqxj1
X-Proofpoint-GUID: IFK5WvwqhklWlP3RkhpnNifnQ1tnqxj1
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c9b6b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hcJ8E8GYhuT13GVzWLAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300096
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: BF96CBA2C0
X-Rspamd-Action: no action



On 1/30/2026 3:41 AM, Rob Clark wrote:
> On Thu, Jan 29, 2026 at 2:39 AM Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
>>>> Currently, FastRPC only supports mapping buffers allocated by the
>>>> kernel. This limits flexibility for applications that allocate memory
>>>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
>>> Hmm, for DMABUF we need _import_ support rather than support for mapping
>>> of userspace-allocated buffers.
>>>
>>>> Add support for mapping and unmapping userspace-allocated buffers to
>>>> the DSP through SMMU. This includes handling map requests for rpcmem
>>>> and DMABUF-backed memory and providing corresponding unmap
>>>> functionality.
>>> For me this definitely looks like a step back. For drm/accel we are
>>> going to have GEM-managed buffers only. Why do we need to handle
>>> userspace-allocated buffers here?
>> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
>> change is to enable routing of DSP logs to HLOS which is done by using a shared
>> buffer between userspace process and DSP PD. The buffer can be allocated from
>> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
>>
>> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
>> with this change.
> So, a mmap'd dma-buf is not necessarily pinned.  Or even backed with
> pages.  So you wouldn't want to try to map a userspace vaddr from a
> dma-buf to the device.
>
> But looking at the patch, this looks more like mapping an imported
> dmabuf?  Presumably going thru dma_buf_map_attachment() somewhere in
> the existing fastrpc code?
yes, when the fd is passed to this call, first fastrpc_map_create is called which is
calling dma_buf_map_attachment[1]. After this the buffer is mapped onto DSP.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n781

>
> BR,
> -R
>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 86 insertions(+), 11 deletions(-)
>>>>
>>>> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>>>>      return err;
>>>>  }
>>>>
>>>> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
>>>> +                              struct fastrpc_req_mmap req,
>>>> +                              char __user *argp)
>>>>  {
>>>> -    struct fastrpc_req_mmap req;
>>>> +    struct fastrpc_map *map = NULL;
>>>> +    struct device *dev = fl->sctx->dev;
>>>> +    u64 raddr = 0;
>>>>      int err;
>>>>
>>>> -    if (copy_from_user(&req, argp, sizeof(req)))
>>>> -            return -EFAULT;
>>>> +    err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
>>>> +    if (err) {
>>>> +            dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>>> +            return err;
>>>> +    }
>>>> +
>>>> +    err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
>>>> +                              req.vaddrin, &raddr);
>>>> +    if (err)
>>>> +            goto err_invoke;
>>>>
>>>> -    if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
>>>> -            dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
>>>> +    /* update the buffer to be able to deallocate the memory on the DSP */
>>>> +    map->raddr = (u64)raddr;
>>> Which type are you converting? And why?
>> I'll drop this.
>>>> -            return -EINVAL;
>>>> +    /* let the client know the address to use */
>>>> +    req.vaddrout = raddr;
>>>> +    dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
>>>> +            (void *)(unsigned long)map->raddr, map->size);
>>>> +
>>>> +    if (copy_to_user(argp, &req, sizeof(req))) {
>>>> +            err = -EFAULT;
>>>> +            goto err_copy;
>>>>      }
>>>>
>>>> -    err = fastrpc_req_buf_alloc(fl, req, argp);
>>>> +    return 0;
>>>> +err_copy:
>>>> +    fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
>>>> +err_invoke:
>>>> +    fastrpc_map_put(map);
>>>>
>>>>      return err;
>>>>  }
>>>>
>>>> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>> +{
>>>> +    struct fastrpc_req_mmap req;
>>>> +    int err;
>>>> +
>>>> +    if (copy_from_user(&req, argp, sizeof(req)))
>>>> +            return -EFAULT;
>>>> +
>>>> +    if ((req.flags == ADSP_MMAP_ADD_PAGES ||
>>>> +         req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
>>> Side note: why are these flags not defined in the uABI header?
>> Ack. These should be part of uABI. I'll create a separate patch for this.
>>>> +            err = fastrpc_req_buf_alloc(fl, req, argp);
>>>> +            if (err)
>>>> +                    return err;

