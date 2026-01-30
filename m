Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PHsI7ycfGn2NwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:57:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9EBA40E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0C10E26C;
	Fri, 30 Jan 2026 11:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBsZJa06";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eF1FjJ3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123A310E26C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:57:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60UBa8LX996159
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e1fXKHZMycN74+GHHi+y/sp4SJEcWi40nQnF91q3AIQ=; b=kBsZJa065k+BbQho
 EbFYJ+sHWRg7Y6/HMUyRq1f+eVjZ9As0oSIY7XRuLQDA7qcukZ2amYzI4CkPCsOf
 elCZCSxMO4ci2dQhB+b54MiaFTXZdMG1sHM2zaYdMt5eg1Jft5hKUG/9sgvjm4FP
 SwG47WdKWCeLaRK++8AVOKuf576RGxShnCOhUS1Wwr8Z9yEYFywmEMKoaisrg9dH
 4KDuPVMRUNns5GTSYVvVYPg5jiH6Ty0L96wAA05vq+v4GHO0ce+ikZHDHPjQ+dpV
 7eOkKyuwZM0/icTpnUHGSYDjP3ADx60w3qrXTR4aETKxkpTtz6RDx+SpVfJY+X7p
 +NSkGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvjynk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:57:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34e70e2e363so2202512a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 03:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769774262; x=1770379062;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e1fXKHZMycN74+GHHi+y/sp4SJEcWi40nQnF91q3AIQ=;
 b=eF1FjJ3v17X5mzMeXVlEGWmkzLc3JVzOwbFgHyWZNnOJDeUkiRm7PdhO8QGLon90/e
 MUwe/JuNYwd7fTSnl3M0gWYT6OTCzelGaFcirM1wohgytdKl0j9dPPsVlvID2r1qo43r
 fU/Yyrq0zgJUK/H0RCBkAQdJYFFBEuQCQme3/GmJDuNBT2hsh6otAb7DMlFMADvJTOhn
 522TrCsORyc1S6SUjlJwcYr7agsrR+BPOVWw8ikxSiw0WN2mrtcQYQ5NCWXk8GMNeNo4
 FBSjdK3vzq+c3mtvidv7MdZ2jtlM7SWkh00DwpVZC9cDRW+auDLFGGAP8AQRSlh6N7g+
 E66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769774262; x=1770379062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1fXKHZMycN74+GHHi+y/sp4SJEcWi40nQnF91q3AIQ=;
 b=WHrohnhHGUaIG7QJEI98+cAk/iXnVsQN0ecJxieIZOL1RIaKLfuK+CJuDihk3jgcNW
 mq4DBsvNMHOkbTm2bnZxjwtsAxyzGC1LeIwGAwvaFmZhlgFiO9FLuwg/fITrYObRJg+s
 1bfxYJTvHXIugiNEzURo+deDg8wUvej654fOZb+Ki3eYtxajplEobUAvynWZu+TzeIfE
 1OA7HFp+kuMOcB32c9k2ItWDCEpdepkdhspn/+YLVTi/ge7D5ftj/QXAX/PcL/dtxWId
 STHLfWJyPAvmYy7WFH0kdE+wu+USi2p7s0T3OqDqYJvkgdjNMz6FBbIC+HTKNBnmJ8MC
 tM6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXMHDb6jIMvmFLmdQDsO5y3leE2iEqa6oOv8JpjRYp+2SoGszErDG9PfNehNTN5PsmP290cWxOfRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrYlPr5ztryPmLTqulSdr0mdR312I96yCGj57Uk+R+p6ME80xN
 TgpCBnKTUkhkFLpKCWCcrNYIB9F31QQoj/y/QmUroqlDsY1xY9m7f+mxCGBY1KRkPeNLbIjU6CX
 ss2dNmh6nPPzkQKvPgGE9d16Z5Y5glEwg3uvUrhNbnfT46kMUOfGoOk/zrCIm65hIqSqTTbhrJu
 l/gS8=
X-Gm-Gg: AZuq6aKUSGqMkSCk5gGVe9QgGG4iBUZE+dxQhQ+DqxhQOWuZrMl0CutShpBBYA/gZFq
 aneCMnh6JQn5pFH9eY7oZCdWQM+WY3pSfPMv18i+nL/MP8o+K7DDsw+atLFTypuds+tVv2wBPiM
 VmbHqbfq1W6joPski5VQW9Y3waZZj6cvbZjC9ALu3N2DCEJt50YfS3r8YjSd8UgfqPRgBj2ZMYl
 Hb+FW9mGImzZUvNlm2ozyxANrkmRuUfWFfSJrvhLlxIDA+quGvHtOQiGt9g+epOnKoXgxJlARnE
 jYuODLo6GEBTHPCh+GXXkDZb2/Hc2LioGolVqIjampM5YaneW/C9aldkbGdmvwGRG5vntjl4nxQ
 APepSJLCR61S6+wzSfW8EaY55BX6s9T/VSIZg1g==
X-Received: by 2002:a17:90b:5404:b0:353:100:2f20 with SMTP id
 98e67ed59e1d1-3543b3283ecmr2260470a91.10.1769774261965; 
 Fri, 30 Jan 2026 03:57:41 -0800 (PST)
X-Received: by 2002:a17:90b:5404:b0:353:100:2f20 with SMTP id
 98e67ed59e1d1-3543b3283ecmr2260453a91.10.1769774261498; 
 Fri, 30 Jan 2026 03:57:41 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-353f6206386sm11200479a91.15.2026.01.30.03.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 03:57:41 -0800 (PST)
Message-ID: <ff888cbf-b1cd-4768-a056-3667f94903d3@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:27:37 +0530
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
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697c9cb7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7TOm-_SFLvYlJXCAKM4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GaXX08fo22v_VoC-IqLRUv6ButyfBoKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NyBTYWx0ZWRfX4WSNstExmzRQ
 hcsvn9dIUIJutfVlZSF1BGMqu3TkmzwgyyFqpJNpoYSCjldqSOpZQ5tT4RRVeZzfBrMEZDb1Rqf
 eZJx6+dlHbkaw395gIHEpVOScMexA1BgX4rH52HMVCMTwZNixmhuTMAfDw8O9+eDJonN7smOtgk
 QGFR/K43u9d/m+ZGq9d0xp6fM6e2ENTriTGI2PtLOBU5E54IW/Q13m8ZP6jVg1foX3aOQLQOgKn
 qYFFaEK5ZPGPjNzibwZGbhkvvfpe7rA5CRh0bRt7J/faDjyKh5THVO6cj2vCW80732TcDY7zwDq
 l4z1W2B1wFv0Rhj49dbtDJGK5W5WR6c+s9/wzztqvfBzlmYOqhJHInGXLOcs2r5GKUZBnBrzFvQ
 qIhQF8UYUnzm1cxLlbp6mvt2RGAMrWZtHsyKY94GnE54dkG9SNLe/MhcUZlcGlsua5wRyE3zua8
 kVgloEHuy0DXBjlHVwg==
X-Proofpoint-ORIG-GUID: GaXX08fo22v_VoC-IqLRUv6ButyfBoKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300097
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: EBC9EBA40E
X-Rspamd-Action: no action



On 1/30/2026 7:59 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 29, 2026 at 04:09:41PM +0530, Ekansh Gupta wrote:
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
> So, you have the DMA-BUF buffer. Instead of mapping it from userspace
> with unclean semantics, please import the buffer.
I'm assuming fastrpc_map_create is sort of importing the buffer by calling
dma_buf_map_attachment. Is this not the correct understanding? This assumption
is based on the existing part inside fastrpc_get_args, where fastrpc_map_create is
getting called for each of user passed DMA-BUF.

Moving to accel based driver is going to standardize this as the .gem_prime_import
implementation is going to handle this case.

//Ekansh

>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 86 insertions(+), 11 deletions(-)
>>>>

