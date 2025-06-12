Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8201EAD69E7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A7C10E78A;
	Thu, 12 Jun 2025 08:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWchK8px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961C610E78A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:06:03 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BIiMZv026034
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gYLKSuEg9yfr55w0b30ljKxa
 Qtj5FKzqcidTfQG7b1s=; b=hWchK8pxGoMT2/EG1HZjedxu+PirePqVOZPXDA3W
 5N7W/ppp/7y8/AbzqgzDPXSdNpwsHrSHQJGKBLRbxnwUnH8oNqH64hMyR3QPlwAK
 qVnvLLcpuGey6Zu4mq0Vbg1QAeuAaXh5FFrnQxjs8sCHgYLepdSYHIic8NOMK/Zy
 XnU+CxuLkgojBgZrHS20tYzvntbOBCRHwvdhl2JUCOzIZhmEwR6hj25m8quPsmSA
 XfH15gFX9TXVHQNqsz+E9AySOg43qGEIbklGh745jjzoHPcuwaUBSXJoRH+jU9b7
 4Uqi7kCPVUW/4LXVPSae4TCl/RctH7klKLoaM8HJCgj9BQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2yahxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:06:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c793d573b2so115979285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 01:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749715560; x=1750320360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYLKSuEg9yfr55w0b30ljKxaQtj5FKzqcidTfQG7b1s=;
 b=CVYC9g+duOwgXn5DoQUZjpkhyDQXhHwEdeVGEeLdOgQbYI3QeoVEJT5T42pOCBEb12
 UntAuQHr/3vA6110wOjH+eA/5VQ5UgyNUDjKojQXlKbSuZDs5DfmO2p004SWOVGWKsRc
 /ZZ3iCgaxqH0hE6oKmY8i6v3bzRjRXu3IU8ytMj9D0uN8s1kCWnVUvR5mGxXypkgmK/6
 iXdnDNE/SbfDwpwXKfBRGxLyROgukpTlpGl1BKbmhBMechJGC8zn8cYK2b4XVOJByULT
 LBYY57lTu//F8vLLERKb0lwpSt5nLQPPruYakgNEWdjoMMxtea01jgwmt3uHhHiAxtDp
 dFCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA2qGrWauwKRyxSP5ibeqYXcJbls0CAwGnVjol+WJqmJh0G7nVLC5kW5c6ZpMvwpUJ1gA2UPVv4ZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOXQW12QDXnKR4w1ezc1be5HETjiWX7xznTMwcEM1rzbn8z0LH
 lbZntVAOn+FUd3Z06/RhwQei4Qo0Ph6bJr11Uizdao63QCkdXaRcYWZqcinJfI/J73XLhepIQzz
 z8BQbwhjx8G5+CwAV+UYoThU+kQiJrFR9ZJJk4N4v3p0Ib5MckSr4PxFcxoHj1RQNNMyck1w=
X-Gm-Gg: ASbGncse5MCqWUNzj1XCQ3KkEUmoGbs5Hy1FwGNDgmInxTqA+FJHcB+C4Gn5lBlJFds
 zbBaeEhuG0kHGhGlWVWjm7VwZFoTsq3utqxLFeVt5ZjndUwsJX8J3Tkz1GzuIrbxYSVtUwLNFwf
 YrVdXxgF+94EDOvIu6M199GNHuNRxuihA0pAFlf4sxGOmDvHukXf0USWrXQ8cvbMAz8xcWMO3Um
 mzVvh6lR4QTl/8FhhEcHP9JpjJ8Owi/wLq3FJDxjYP57A09/rjWYyind3gN1FDhRKAoMGBmGK+f
 mBIalKG6XrdCz3ARXNfQSh8VkQjE5/esU4We55FNeoLPVCbATi1z2eY//OyfLyY0d15cvq4K7Pf
 loNdZDA3ZMMi/nHx35a1XP/UOKGJLgpaZTYw=
X-Received: by 2002:a05:620a:2d8a:b0:7d3:a6bd:93fc with SMTP id
 af79cd13be357-7d3a88e236emr679314785a.28.1749715560597; 
 Thu, 12 Jun 2025 01:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtEx7/LfcxXUMv7FkqbwpLWknBCvl7pRsgiOfE3tIOvpsdV/K8xXm+GR9qDQXkbL/OA9rOLw==
X-Received: by 2002:a05:620a:2d8a:b0:7d3:a6bd:93fc with SMTP id
 af79cd13be357-7d3a88e236emr679311185a.28.1749715560158; 
 Thu, 12 Jun 2025 01:06:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32b3307ae32sm1370641fa.39.2025.06.12.01.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 01:05:59 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2MSBTYWx0ZWRfX19Df64N9dist
 yzfWQd2YyuGe4jKHJirjtmdLVS3xRkTE/LvJQppGzsEnBnFBDVir93zujw9jtbTCJ5BmYljWTPw
 avJkZAtmhXbY1o9KiMMKVU0JWaWV8ckvRGQtDPBEgegmorTgROJ8ThLDX7yF3v2FFRbagR6Gzk0
 LVAx14GwrFuYqxNYTOcU+OPhVNZgYBWT+wgjrugFe/EHpK2sEx5sMwIskV6FjWEK6WsU21w1IBW
 BVg8TGpjbxhf1KoJAxcMgIPPAXDrJMUD94JvRhcw5BGLzVjrvFQqdB3rgAM40C2RSsdGLXZyeh7
 lbtawPh+qieo/qmzpeVK+qgEoeiAzaLTPyq8RHpYTjRcEdC4f1SqnIWjZdR/RGlY0ipWT85BLBf
 HGpJdYLEgpg4loCnCol00pnnyYbnYDc94FUeEwDbFofAGhkGOReuozbVo+zrFa+erMC2AJd+
X-Proofpoint-GUID: GuxU3o6m7sSLule5IqehTVKWM9Yw5h02
X-Proofpoint-ORIG-GUID: GuxU3o6m7sSLule5IqehTVKWM9Yw5h02
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684a8a6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QxY6PIr9u2238qDpXlUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120061
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

On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> > On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> > <ekansh.gupta@oss.qualcomm.com> wrote:
> >>
> >>
> >> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>> interface but support for unmap is missing. This could result in
> >>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>> Can this memory be in use by the remote proc?
> >>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>> running on DSP are not intended to use this request.
> >>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>> use? What happens if userspace by mistake tries to unmap memory too
> >>> early? Or if it happens intentionally, at some specific time during
> >>> work.
> >> If the unmap is restricted to audio daemon, then the unmap will only
> >> happen if the remoteproc is no longer using this memory.
> >>
> >> But without this restriction, yes it possible that some userspace process
> >> calls unmap which tries to move the ownership back to HLOS which the
> >> remoteproc is still using the memory. This might lead to memory access
> >> problems.
> > This needs to be fixed in the driver. We need to track which memory is
> > being used by the remoteproc and unmap it once remoteproc stops using
> > it, without additional userspace intervention.
> If it's the audio daemon which is requesting for unmap then it basically means that
> the remoteproc is no longer using the memory. Audio PD can request for both grow
> and shrink operations for it's dedicated heap. The case of grow is already supported
> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> memory) is not yet available. This memory is more specific to audio PD rather than
> complete remoteproc.
> 
> If we have to control this completely from driver then I see a problem in freeing/unmapping
> the memory when the PD is no longer using the memory.

What happens if userspace requests to free the memory that is still in
use by the PD

How does PD signal the memory is no longer in use?

> >
> 

-- 
With best wishes
Dmitry
