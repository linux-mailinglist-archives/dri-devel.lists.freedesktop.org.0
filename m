Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6BAD6D8F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1316910E76F;
	Thu, 12 Jun 2025 10:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGT0AfTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9710E76F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7j8qi002356
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bei7vpBLRM7JsSliScp8d4kP
 UcOnvEQKa+rJash+xv0=; b=VGT0AfTwwq0qzpGH0lUkHbs59BKcBup8GrV4yaTZ
 FJdnCpiSjCqHpUj1lJ6qjjMl40cJ1iW8sr/ZqK2rN5C5umd3n5O6eoNtfv6UigTd
 jhk0gO+KJ/oLGv8d9RUD+fborANiLfhJUPL5i59Ffc4T7UlmwMKNvO/y7lR71/Jy
 gw3a3wenP5JRvmWjapubw0NKG3UyTV1QH0UF6eDWDz4DQg4KLuYevI9IC2Z/28NU
 sXAfr6VneNdrY5Vbuq9SYlNNM1drLAXfbok1CvbQ/fwqoiJcgzA6O1rag/6fGcZC
 czXGH9B4IvBeQzuXusAuk5R/ylIJ7v/9Hb8VVI3sZlMlZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgy0d17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7cf6c53390eso80455885a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749723858; x=1750328658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bei7vpBLRM7JsSliScp8d4kPUcOnvEQKa+rJash+xv0=;
 b=eSsw/KhnYjIQ/K0mj2lktRVJXIe/YO/9v3gO4Nc5aNDQK9B4amFyQtSxxNZXSyHDtR
 DJ5O1sILP0G1Do/Qrs+iKRWOOcCnIlVgkbaPl6vFCp8uH04ikYHnZZ6HeCARQOiYwMau
 zyN3HC9kHZqlz4qf0D0uxigHj6saAmyhqyhojTtITAzg7OwBbzoiXdC2TgsXqmwhQLGD
 4PXZNjcMG7QLsYJl57EzAu3YEUKyA2NKQsGv8SXpjMBkI2v8/fsCxD6or09E78soDSgQ
 +Q/92PClHa25f+0oZwXN4kS5mGGGuybEgDQeG5GuA4UIgUPpF+3FKD3Zz3Y7mqBFFvqx
 S47A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXumwPqrUZHLI6Ys/2W1NVwZaQZcup+Mqa1ilMsKc2jYyZq/NViIk7cwtLBX3kJL+cpWs8O9iq9abI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAkT0v2qLUejsvB7V69lK03IDDM5lI73x4A6XcELIW2ARiAZTx
 /1YJg83ZL3a7bJOyKNA9T/ftfs5N9TTdqeUUXePqV1T1dV6YGwFgVbKaQZ25rD+mdOC1gl1XTkr
 j86N3Rc9XopNu69aPrIgaNHha6koLUdB0cAsPmIzCS2AsfjYkvTkYhkWkvLZGWwR9CggGZ6k=
X-Gm-Gg: ASbGncv8a/Edtqzu0zdFoZ79GxzpFPei7uQxZQshu23ygzDmApTOiiXiwB17ohrAk69
 i255ZgLy15wTbfA0tI4qA4aofEISHGhHcVptdAC+tir8F+f68u2QKb9I/IINLqB55nU9y/79wcH
 o+1ff1urU3QYsseps4OCNhiLsLzX81+rgoHg527ughOs/5qXuMS/BHq6soQAEs1VfeteboHv4S0
 0vaIzTWYAVIrTCIcHYvZQN/gUgAgrw7qo/CMOIrY8zbuzVnTvf49iBRnZlFG+Ts21vFqw67unkM
 ZH7n5OIavgwEEfGsfAuKY3W9kov3HKPxsf8rY+PEMi6sdTas7QYWtBM6YfaylcoYdazzoW/rqYz
 VbfmZWUDp61F7GoOBLfgJZAv/4iWoqz763jw=
X-Received: by 2002:a05:620a:4447:b0:7ca:cd16:8f52 with SMTP id
 af79cd13be357-7d3b35bfea6mr343781585a.12.1749723858495; 
 Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiRYepXEg3WA0kVqMAAKmdx5rX+tZSqO2LWnuB7dyJHukSnp7ktrS1ClN/yxXDi9idO0oT2w==
X-Received: by 2002:a05:620a:4447:b0:7ca:cd16:8f52 with SMTP id
 af79cd13be357-7d3b35bfea6mr343777585a.12.1749723858018; 
 Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac1ab231sm64419e87.132.2025.06.12.03.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:24:17 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:24:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
X-Proofpoint-GUID: XYOAav2o-OVHEcQC1XQwk1RKiaWQ-404
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684aaad3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=F3-oJ8RDkLYzbOVVXy0A:9
 a=CKI3rSdrBKJ4BORm:21 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XYOAav2o-OVHEcQC1XQwk1RKiaWQ-404
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4MCBTYWx0ZWRfX+TEOO7KqQe2V
 dC9/LvXR+bNXJqyKWKKYrvS/gk+vejNksMiSyMgc18Sze0eBPekaqyaz3n5s6aGPJAjP/egx5AA
 r5pMiSG5XkFZjnsipXW+AYl77hd29f8tUrgm1teOjT9vnhqQ64aLrPgGnMdTBwnpKxmWvwgDsic
 ND76tshYWNX0b+UsILQTeu9eUDwXnBnXXAnL+W+ZjkovyM6uoNXgnzODy49d/VGx4poIAIJr4lW
 BHveP3WZLfurKS9436tbKpUiuwULcieUIyCW/BPCIHa97ICEwHz11SiVCwDnO5hQFpGCSrsX+1e
 CBwflcIWZwF410VwbR7i+yKhpzfaJBEvDMem8+uR82EXn74BWl+kj+TgCx0il9ADXnTHy9KsjZJ
 WSlvQAzrQ/eS9ohO8F58HYkFYEAnvd9sMytyzFnIFHQeN0zWB94/DKjeuy8z1Mh2BRwkCoDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120080
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

On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> >>> <ekansh.gupta@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>>>> interface but support for unmap is missing. This could result in
> >>>>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>>>> Can this memory be in use by the remote proc?
> >>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>>>> running on DSP are not intended to use this request.
> >>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>>>> use? What happens if userspace by mistake tries to unmap memory too
> >>>>> early? Or if it happens intentionally, at some specific time during
> >>>>> work.
> >>>> If the unmap is restricted to audio daemon, then the unmap will only
> >>>> happen if the remoteproc is no longer using this memory.
> >>>>
> >>>> But without this restriction, yes it possible that some userspace process
> >>>> calls unmap which tries to move the ownership back to HLOS which the
> >>>> remoteproc is still using the memory. This might lead to memory access
> >>>> problems.
> >>> This needs to be fixed in the driver. We need to track which memory is
> >>> being used by the remoteproc and unmap it once remoteproc stops using
> >>> it, without additional userspace intervention.
> >> If it's the audio daemon which is requesting for unmap then it basically means that
> >> the remoteproc is no longer using the memory. Audio PD can request for both grow
> >> and shrink operations for it's dedicated heap. The case of grow is already supported
> >> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> >> memory) is not yet available. This memory is more specific to audio PD rather than
> >> complete remoteproc.
> >>
> >> If we have to control this completely from driver then I see a problem in freeing/unmapping
> >> the memory when the PD is no longer using the memory.
> > What happens if userspace requests to free the memory that is still in
> > use by the PD
> I understand your point, for this I was thinking to limit the unmap functionality to the process
> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
> memory from userspace.

Ugh... and what if the adsprpcd misbehaves?

> >
> > How does PD signal the memory is no longer in use?
> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.

I don't see how this can be made robust. I fear that the only way would
be to unmap the memory only on audio PD restart / shutdown. Such
requests should never leave the kernel.

Moreover, the payload should not be trusted, however you don't validate
the length that you've got from the remote side.

> 
> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231
> >

-- 
With best wishes
Dmitry
