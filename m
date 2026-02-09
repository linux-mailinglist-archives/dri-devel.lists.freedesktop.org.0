Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oERrBfY6iWlD4wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 02:40:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6647310AE40
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 02:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CA110E067;
	Mon,  9 Feb 2026 01:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR5tw/qW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/9GJgOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9C10E067
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 01:39:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 618MkrVH1214864
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Feb 2026 01:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7sqY6ei5RD5wGCvV//10Q+1Z
 4jf+VeHpf+2w+y/9dIM=; b=NR5tw/qWztSbooPlA1az/fmUD9oesrDI7oAp/8V+
 kpbB7OtFP8yekHNb07KEO7Zhj9faPa+IXxiDLrCc3LrMC8rfo1i+g99fK+/oUdIV
 Sii/NKY/CjL5aA5TkB688LpK6Iz0I7b5zASB8KjJTk/ukBrwPB2KqJ5hllOXyMwJ
 /PhNATL98keMiDvZqg3nBVm6ULC7/eKRyK+tO0pRVH/FDdr2nqaouRyGFY8sA+d2
 4JfjKoeeG1GFa5j7uztSRgPbwP2PTS1q+ZRwig0Ph6Ay3dCCIT7+wZYel/adRSm+
 /69FvQHhzfN4ct098FFv6FllGuBx9QKCQ070OTKmMZKuxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4u8yd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 01:39:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71655aa11so1754238785a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 17:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770601197; x=1771205997;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7sqY6ei5RD5wGCvV//10Q+1Z4jf+VeHpf+2w+y/9dIM=;
 b=M/9GJgOs3ibxYSjn9Hs+1KRgzAO3YhLeiaUMcMXrDqr6PUKPSl5Wbf0gtuDLNBwEZB
 tCxMxTTtAi0lk8N6yM/p5+lzFpi32Wbi3kXMU67Nxlr5O9Fu8IhGlrqKQEyxH0NvcRWJ
 bGr8NxO8IlFtHS3xsVIxcVcGurmYTrYG6iOOIv4xJ1tFnI8fmcKWmPnsgE1On7/fM73y
 iySOn2Y5S6/wurai4GVt3C7Od3Vqjwn2QoZfUyqrSgoDm8bmpF1ZIncgGTacHcjzaxDY
 BiWdq/JdHMXRcwQtu3CDj3TvhD44IWkz9O5g8OHI+LHqSfEWVpkVTcEN2l7Hwut9pbPY
 AKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770601197; x=1771205997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sqY6ei5RD5wGCvV//10Q+1Z4jf+VeHpf+2w+y/9dIM=;
 b=TGpTsPbLU/LZa4IoYXEmjsASMhEMHx30uuURlCb67tMV7SyTdXrFiYjjI0h7AZdFwS
 T7U/Aq2jmPKB2kQsD4t9oeu1ZqYnLtSHiahZVwjDcND7IBaaWWHj2akppp2609TtyBJ/
 77I6XIGs6Ly1tGfaQVtTZVLKCQhYHenJUlsWlwBB84s+Gofzzu8Im+Iu+ShazBPe6GlI
 W4R1ET0pbVrkxpAeShGCwSGBrvXdAvoLdrMBNEDWwTUdDaDqp8gPIbE8NRqevfF6txHN
 /JJ4Zz+Wjd7+kG1s46vJGv/9h95NJcxBNb3gKapGCTADJ+BUGXh/QV4PqnDqqk0ANP8+
 YoOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJA6uTB5km04VjVPpN76AGxkjiZfbGcblmLW+s3hNawrB/knFuhsTrGIHUF/n7U51k3R1Wzl9/XNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNFIpPpWdBdLsIGgh2UqDuyjNkBQaMCsot8onF36PYfzSnlyOb
 QAQtvKlR3TN/98RK4dTI0jnXVGLEq4fGw8mKlmBFJ7kp/zAMURoayazB7XwZfi4MxVnuTOLLsej
 YCEbr6NUksveY08bHNCivIL1BK3i1BRWjSNGcZE2whnyVTxdBuk59zkoj+epQXrDK+OC3iAg=
X-Gm-Gg: AZuq6aJtNi3LWuwdqv+n41VeRTFO4wE1vx4EumDrX72CZ0b8DPLHnXG61HhTiEZLx6V
 8/YlkK52tcPebvg+xzP39Jrl9Y3s3kToUuJ+IktLf5ShapNLYmwtovsc7vOiB0Oc1elkKg95FbK
 CoGbbdRj0lLJfHk+vMwQH0MmGDaYP+urv6GJK8RL1XCk+nXz+flpZpM/yITQk8mNyumOvhE7/Is
 QW29V5uuIeUcDnVN+6AAKDSQh/yCg4ohDS3p/2N0hcLit2fd+cDq+/wZ6ZL70WQ3PPVQCw3b4Iv
 sIofcYnYnlePymJs81lGLdctBp2EO6zmbbwd4hSG2ZfC9N01We2XRu/Pc/dLBSKDZhyMk7jpWcL
 QRJSDLDRBr2khry4ZgQJRlg1f48suFMbAqXtWJk7vzRY/yD8O9X6FTGatXKWgbVX7Yc4FRcBWLT
 tU6wLSghHNRXf+ubWqfDCQSSqfps2aJ6qIpXc=
X-Received: by 2002:a05:620a:3909:b0:8c7:f6e:29b7 with SMTP id
 af79cd13be357-8caf1bc28f7mr1251010185a.80.1770601197463; 
 Sun, 08 Feb 2026 17:39:57 -0800 (PST)
X-Received: by 2002:a05:620a:3909:b0:8c7:f6e:29b7 with SMTP id
 af79cd13be357-8caf1bc28f7mr1251008485a.80.1770601197078; 
 Sun, 08 Feb 2026 17:39:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386b6236232sm21901811fa.2.2026.02.08.17.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 17:39:56 -0800 (PST)
Date: Mon, 9 Feb 2026 03:39:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <k2jiy66ruyfh4v5go346e7wa2y6ujxjzl543imq3n3k76z3dju@jvjwm2k543k7>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <33xoq7nt7j3sgcrnxjmbfogrdy3hyskym3yzurmqzwdqxtlgwe@vywpjmegteel>
 <ff888cbf-b1cd-4768-a056-3667f94903d3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff888cbf-b1cd-4768-a056-3667f94903d3@oss.qualcomm.com>
X-Proofpoint-GUID: 6FONOCdA4PK633C_HyWQ1elOdieuIA_5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMiBTYWx0ZWRfX3DBqNi76+z4G
 BfeTtZtMLnsMrY1ZPwebLz0ItFkKXLeODtJ2wX6/Z4ZRpO15L4f4n+Wj1LcFTSUakVPL0ZeTqnx
 c1AA0PeBUE1mfuYEGu6NTw5z6dfjqxntqH3T6z0O3C84B5vXV0N/FSqjrX/xekdXcizI2wSsGET
 Wh2W67BhIodh4m+JVqtpbIufOhblGb3cCDwICJffmFbk4puceniNo8zN0UIIichVnglPUiYZ320
 mSxVc7Gx+w4TW5DbGA1qXqidT/I6/eMKRWOqI0I30wUu47N6789INHhXCaz5VtijPtZWPpfXlRl
 xdo8KPYmIrg445FZkQ+NboDRH1HsuYQsnEcHaJ0fsbCAVXHxeoWp43AdJV73mJwFo1loEEizs3V
 LSvkQB/P7fYNjnfR9E9dWa1ZYIqbjgIdZPf7jXb02kmcX2fm4ryCLDnDOEYSRVS2R5Zi9V87rF+
 cqAFD0CuKfFL/OtIEQQ==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=69893aee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9kWgxbULufjU77o8R-YA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6FONOCdA4PK633C_HyWQ1elOdieuIA_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090012
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6647310AE40
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 05:27:37PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/30/2026 7:59 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 29, 2026 at 04:09:41PM +0530, Ekansh Gupta wrote:
> >>
> >> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> >>> On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> >>>> Currently, FastRPC only supports mapping buffers allocated by the
> >>>> kernel. This limits flexibility for applications that allocate memory
> >>>> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> >>> Hmm, for DMABUF we need _import_ support rather than support for mapping
> >>> of userspace-allocated buffers.
> >>>
> >>>> Add support for mapping and unmapping userspace-allocated buffers to
> >>>> the DSP through SMMU. This includes handling map requests for rpcmem
> >>>> and DMABUF-backed memory and providing corresponding unmap
> >>>> functionality.
> >>> For me this definitely looks like a step back. For drm/accel we are
> >>> going to have GEM-managed buffers only. Why do we need to handle
> >>> userspace-allocated buffers here?
> >> That's correct, GEM-PRIME will handle it properly. Here, the reason to add this
> >> change is to enable routing of DSP logs to HLOS which is done by using a shared
> >> buffer between userspace process and DSP PD. The buffer can be allocated from
> >> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
> >>
> >> So this shared buffer is getting mapped to both process's IOMMU device and DSP PD
> >> with this change.
> > So, you have the DMA-BUF buffer. Instead of mapping it from userspace
> > with unclean semantics, please import the buffer.
> I'm assuming fastrpc_map_create is sort of importing the buffer by calling
> dma_buf_map_attachment. Is this not the correct understanding? This assumption
> is based on the existing part inside fastrpc_get_args, where fastrpc_map_create is
> getting called for each of user passed DMA-BUF.

I was thinking about dma_buf_attach() rather than
dma_buf_map_attachment().

> 
> Moving to accel based driver is going to standardize this as the .gem_prime_import
> implementation is going to handle this case.
> 
> //Ekansh
> 
> >
> >>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
> >>>>  1 file changed, 86 insertions(+), 11 deletions(-)
> >>>>
> 

-- 
With best wishes
Dmitry
