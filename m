Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFGKGIAXfGk/KgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 03:29:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7477B66C5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 03:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0BA10E1D2;
	Fri, 30 Jan 2026 02:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWfpbihE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0imf6EK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F210E1D2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:29:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60THeUNq3674038
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hpSG24Ae5cKV0szq3BxpaOqq
 p0fLm2M1wQhoDW4ZBFk=; b=CWfpbihEx54Q/yXbnDPFh8y34GPVbCkmiqaN3ngQ
 u8Bfm7VLXAn8X+X7Vi6NBD7ExXyWbqh3i5+3iyW2dQSuBDgdWk83XS7n5uG5nlfT
 J0rU4usCNKEXgw4Y/OOK4itYsaNnJFg3vgud3DI+tzDKVnORFlv6vExup6LqXOXo
 xn0yP5J63gs8xGRjpuKibo0sVlvuBQO2tQ1PFKMZfGiUCjwpte48F7EB7QzzxT3W
 RiM/uz7dOMbKRxcwDMM9JYG46BOwOCTIJbxUDidYdw2k83i+pfXJvw00KivEPPpL
 eqAskDj82VGOfmqsm+ENPXa8yh0GPTAA3GXH7ijTkGYAtA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05q7jukv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:29:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5f52fa0d3cbso1521739137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 18:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769740154; x=1770344954;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hpSG24Ae5cKV0szq3BxpaOqqp0fLm2M1wQhoDW4ZBFk=;
 b=Y0imf6EKHZ1zrTbMJHc2x0WYaGeog23ZcAoKRlfqpYNYRgftIUC0KMDt34/k7gvT8z
 Pk6t5UEFjvUAMp70R124OOI0QeFsOgtcDZZM/w9zIZXqDbEVQ+kU04HI+Bh4RIdcHYRP
 BPTLobLKScoXWj0EaUlwqSLIPZKtvZSKt6+07Hnt61z8/Oh/R+5ilyl3f+tSgOTUv8Gm
 XdICSq/wDE9yI29soJWagrVOlf7Q8kE88yF0S1xyoCg8cdnoH1o9tMjtixElCXgnruFv
 l4Cfu6aWmlFu3+CHodrxJefZZgbQCtHsJkv7n7TVFIOIb5du9KEygQ85gi/YbI5KurBT
 egig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769740154; x=1770344954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpSG24Ae5cKV0szq3BxpaOqqp0fLm2M1wQhoDW4ZBFk=;
 b=Nr3Dx/mYAUWaRyLj3zq66IWwreZ93mcwTl/GrXRmQnP94ovl1ziCJZ/4fNIVZvoyPo
 kDt9CNuvwmILCNkRBZ400IgVGgEIydxZmwAvNDJBpArjd0hHyncxJf/w/1iUULi/sDli
 Q7HlEh108kRa9v0WyQ7Sx84fEmohiHzJPEzkDBu6sDktDRTHlqcMXjczlLpUaldQ9C1L
 ANCNptVNy4GjuOB7bMpWUuOqZZJQehY/Cmtc7OcbMuaW8Swtwdj6fmT9eHQj2pFRhcjS
 UwLV2TTbylKvbHmAcmi85C/M7SjHOsEpwavaGLo1NniCDj4+V9eZVlkAVUAxzn870Rtc
 Z7zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWABxQcK1muye6C1eTXP58N0rHP+zk75UfBxNp0BTz4T8tyeWhhXDpKb6D+xVJnoURBVvcTNyTi/4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR0dNK7SPOG1hgbxLAKikS/6mnmCnKdhaCpXFDIB1CDJMmzm8H
 2xL+Kjx0PfW4rvozxHvQRfVfM0IpkiaSfvTpv6SqaZTq8VbzbH/GF378yeitaNUs66ILyN1TzdQ
 xvnoqeLUBequNsmr294fP5TNDe8QM+ohEx1y2k3jlK5AssFqi5VZmzVQP30yTfnS892lRD8c=
X-Gm-Gg: AZuq6aL1o8eqmTJnPHa/Gjh+uAEgQPFfePU2dciv84U2ZavtD5sOh77nK/oC85VE1lT
 YRRtRJ9bTtR2N9fglq4qmQCncb+3RGGM8yfthPf21kINVBmD2m41DAS8crv7ndZ+dtukR4Cv4CQ
 uOiZCleBOp4haAN0mOhOaiKxGGjFYJORphEVnJhlyE2waa0HtmA3ZPo4ULcwc2RPyzTU9BMp5ZU
 F4XJIr9SF/B3krVUITosCsp25upvBxCJNBWIBOljx48VocxPLQOB1uUCxAsATrxmZVru3rYbpyj
 7OTy16mGmWhUhaBZyHpQ1X9wbkB7lFGXm84buJSsDuUvuKqdIQumg4rW8lEJux//niiECI4eMhT
 Eybm3RFmSP8u0+5bXMCCMVM/WNW+HbQg3fg6MJhGknwuo68Hc72Z+5cFvBWsMEmxazVlcf4Xm/6
 GU8SprP5/gk5uh/GI7aKdJQ5I=
X-Received: by 2002:a05:6102:2909:b0:5f5:7791:c2cb with SMTP id
 ada2fe7eead31-5f8e272c0a1mr436150137.41.1769740153759; 
 Thu, 29 Jan 2026 18:29:13 -0800 (PST)
X-Received: by 2002:a05:6102:2909:b0:5f5:7791:c2cb with SMTP id
 ada2fe7eead31-5f8e272c0a1mr436139137.41.1769740153306; 
 Thu, 29 Jan 2026 18:29:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074b2e8fsm1444402e87.48.2026.01.29.18.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 18:29:12 -0800 (PST)
Date: Fri, 30 Jan 2026 04:29:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
X-Proofpoint-GUID: qSs6FsWBymHtJEHWmk5sgFamvHgLyCtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOCBTYWx0ZWRfX+iMHiQjClYdc
 6mXWuOfQoeqyj0UA2UyATnYolmbJqMOr3N0IMaoyq9t+6FAsq6LorqadYH3VawpfAShs/04qdlM
 Qh9H6GiVHkBPq4bYedaAacV8lotUZXXox+jiUJfR8H+Y8NGyXzFNV/gi+gbEw+r2ziuHIej95Ab
 KllxEGEnThOWBWho2O/HrKJ/g4S081ENGvXGPGRMak7jtRiNYjtdq7IJAnebvr5Smuxyj3PBpD7
 RO+sTXuf3eOZTAisdUfCrzxyHKWVBYAmdpxknpXd6/UGhvDQQfaKmlzUi228DHeLWY/1ROBy3tr
 Q8yn3rmkAUWRUsp1SGWV1Z0GXBOXeskROXZrhrcTKDVFWPLdhIHlUJcEzwCaLqfmkCKj41pIO+M
 DHLIaYnt+Lb5hqI4QYO58CE1mbCnCODONwlbFpK5SoiH8kJOZxSiaAeGqiKPK88CebOfbe/Py9J
 eoe3GhA6TBojsBCGN3A==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=697c177a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uw1HqZhSIWayQixwtEoA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: qSs6FsWBymHtJEHWmk5sgFamvHgLyCtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300018
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A7477B66C5
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 04:09:41PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> >> Currently, FastRPC only supports mapping buffers allocated by the
> >> kernel. This limits flexibility for applications that allocate memory
> >> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> > Hmm, for DMABUF we need _import_ support rather than support for mapping
> > of userspace-allocated buffers.
> >
> >> Add support for mapping and unmapping userspace-allocated buffers to
> >> the DSP through SMMU. This includes handling map requests for rpcmem
> >> and DMABUF-backed memory and providing corresponding unmap
> >> functionality.
> > For me this definitely looks like a step back. For drm/accel we are
> > going to have GEM-managed buffers only. Why do we need to handle
> > userspace-allocated buffers here?
> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
> change is to enable routing of DSP logs to HLOS which is done by using a shared
> buffer between userspace process and DSP PD. The buffer can be allocated from
> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
> 
> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
> with this change.

So, you have the DMA-BUF buffer. Instead of mapping it from userspace
with unclean semantics, please import the buffer.

> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
> >>  1 file changed, 86 insertions(+), 11 deletions(-)
> >>

-- 
With best wishes
Dmitry
