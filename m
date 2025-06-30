Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BDAEE321
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366A610E49D;
	Mon, 30 Jun 2025 15:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2tLCm6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1078F10E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:56:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFJGSL032421
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=; b=F2tLCm6OVgJ5uM3o
 +7t/kkc3XyFSQA7vLg6R3KpOKbVMDK2sDZ3waa1SM22IyjoviFRGFE8XzamBmUjY
 PU2acpGUm+JVTTlD4DbAz3S2kKKuX/2bmgMViYatB+qa2B0pHlC7pELi0v3NxToO
 9mVK2iBNj9RjGVM8SfBmRUo3TnRBk+V42xUV+Ct+JToMQ6XgpyFx0e83x6w8ufNz
 TsETeG4+G+b626dPwfu/xheR9fUlvdpAgxfv0cBNKE8eLjpoE1VPNxhSY7JHeK+I
 3h+Vzsslh0KL/PsFIwBpfhtU8oLnqkczSgV4Ns5G7J7stufuHVwTI5Z5Pa6pStpI
 4Ah0IQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k5gjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:56:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d440beeb17so35670085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298980; x=1751903780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0Fl5LewKcARD32i6DxdJAAOcn3ZiRpvJ9i+gosfreA=;
 b=s30gQC53oDvBiK4MF/demJst6mN/hxbGXpc4pjyUBuvfacH2EY7eFE+vXbBuKj2ssU
 ng3tiyku5HyGXA/tJU3KRiGss2eudxuUHYVYDcH5NHi1vy7jzli/6oXMxY2DltwXxvPA
 4CyKTkQtgYYam/lY2TNU8tghbepnI/CME3XOqu1UxUPXloPE55a0CcYF9SLvFK2qW9qJ
 2OEfwGs1WsxbpUDHdTybZ5c0n2BVve59zJIvDQHKrwBeYkfSY4+MwqAHPWqN65s4Foji
 HEvsJEv43MtOmpdfLfVW6IEZgraabF2HCWb1tUqtlqINhwE0iRjY4mBt1Z6EOVWdoK8h
 2+DQ==
X-Gm-Message-State: AOJu0Yx2+ORKfnO2TWskyH2ikNChEbNqIy/hnYbGxssQkXPyQIYjfSMf
 usvB4uwYvidorWwi8MsjWmoHzoSQe5ndtoCPR4XQFax8t4b5ZuWwErK3CtEEZzzfoUyyj5BCw+B
 gwSQgqN6UjSPHBI0f7ckUw8RqUHOM8/QI6PjVJT2i+07KxR1hqsFxkKk/vEFLyTJ7B+aHSJg=
X-Gm-Gg: ASbGncvBd4r+QisLqNOIckdG37/MyvrvqxbUP1aaBiNcKKTKeojOVxVJyLu8nz6W5YN
 71s3rHfo13L3vaAgYoWOs1NJUkesxJ5GY4+GCWyPp7v5ZvGTkNxKIoyZksq29WUztsuiqBDqip4
 QDMGSIEhg0jYOs0/kQu+YpQn3a7HhVcz3xK7DdtdLTxnN5qVJ6a4YpmnvBpBso/iW/S1lYBpBNQ
 dYTubdpHbuRaCaeV5n62HP6vC+SNhtqxDUfP7gtgKZSNM1qNoXa6jxajdWvtjUzo0DE5zHPnVbK
 Gb38KQsdC+VnMkrHB+t5xF/Zu+PM9zPlp0rRTSGwA2EEGaNfJUxAzchWVUTKB7KKD8HVKnLINYj
 RPhSfDx8Z
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id
 af79cd13be357-7d44c21cdd8mr551568085a.6.1751298979926; 
 Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmRmTmwWyC/XAvDEJJwe50p+zxnhcywcSEGqHClp/yN/qqSKZwbpDjpuECX6rKycQCNqvXGA==
X-Received: by 2002:a05:620a:690d:b0:7ce:e99e:bc87 with SMTP id
 af79cd13be357-7d44c21cdd8mr551564485a.6.1751298979335; 
 Mon, 30 Jun 2025 08:56:19 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl.
 [83.9.29.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae36ffe2981sm484430166b.120.2025.06.30.08.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:56:18 -0700 (PDT)
Message-ID: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 17:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: rob.clark@oss.qualcomm.com, Doug Anderson <dianders@chromium.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862b3a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_ijeUKsmqluwEKimemEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzMCBTYWx0ZWRfX3gXm5l9KLB34
 9+oCdj+dDMgf2uBXkzuiaCpBHJpTfLLTCdi31B4L5dJYr7Foqg7926BQBKvEP86S3N7tml191Kz
 lNwJrtaYW+B2u95IKs4c1htyNfWAy6n1erA3WQsWiIOLZp8pE6wMRQ1IxWp9QHAsA1a2ipttZIg
 HqApGH+w5tImIk3wPCt+UfTix+vJkuZWIMMZDvOIo56UDlij7HbVT2gJiARGrUemC1s0HDp6iG2
 xKEb03gLTLzk47UTraf1rBHV6O9RaEE+Ciy3G6xQFOeX095YowLVrOYz6Oggu8cZQl56dFf1jzp
 t5kXNsFgugx1RJUW+ohvPvZX5CXp53wynqekQLc3sOwdmZoEViA0VMxDrOT9sTuM9oOtCVQK8FS
 l4pckJkjQFimslnN+INCB7cdOYDbGXyXnuoPGYbtlnt6X9NG4w8qs3hyCswxhIjfJvTYGwnv
X-Proofpoint-ORIG-GUID: jeKe2h5xT5b9z27NYKlNU9MyLWiP9Ntl
X-Proofpoint-GUID: jeKe2h5xT5b9z27NYKlNU9MyLWiP9Ntl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=879 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300130
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



On 30-Jun-25 15:46, Rob Clark wrote:
> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 29-Jun-25 15:58, Rob Clark wrote:
>>> These runners are no more.  So remove the jobs.
>>>
>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>> ---
>>
>> Do we have anyone using cheza at all anymore then?
> 
> Probably not

Adding +Doug +Akhil +Jessica, if we don't have any users, we may
get rid of it upstream, as it never made it to the outside-outside
world..

Konrad
