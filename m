Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108CBC16FA9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C86810E1E8;
	Tue, 28 Oct 2025 21:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d76T49Lb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXausgHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBF410E1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlNAU2502828
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DdP5TbkC149GA0FALd9E/e3/
 ojBpNA/aYkFJbl++16A=; b=d76T49LbrMTmJhm9EVksq+X3aJ8sP19kIwpRgBbk
 BB0EtVFUF1z0BGTOsp5l0S4eMyBwJ/IHUxuqAMrxyyzuy5eKrIT6FAgLuf6PGaDm
 uL82HuKSZnhWArjRbvU9OSaBUpAFs/5hn1smQ4tVEbdXeeo3/cu4tFjkOC1AlfpC
 coIehlmHJ45V/xeR8upzSgKrn3nrvDUx29oYfDLRxJCrBtq+8uZdqiC5JD1RSrcX
 XiPttyFU/hIQurwPgePCEXZcHbDOIpNW0iri56JwHAyj+dx58ZdyDI+Q0IC5K4qZ
 zrrgT6GQihp4y51FBoBtE4SwfSFnOuaNcEJHEm4QiNu45A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g7ca-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ecf8faf8bdso136227551cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686829; x=1762291629;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DdP5TbkC149GA0FALd9E/e3/ojBpNA/aYkFJbl++16A=;
 b=CXausgHFIKyvlwXIHgLMm7vnSyjAis2rhdjjJFXHcggWc3uTQYDGZj7oNtlInMRvgf
 X84PSfadkBFtP2zL+y+qCUMKjTHR4TyBbmROmliDk2PP304HcTmwnrmAgWqsohsMCjyL
 HYN78kM1ytV/JsOyLPxLhwFdp/VGU0YE/Kaq1EsS2+QFT73xowB/pff69/9GvP4TdPoh
 szyXWWdqHT/dLivBgRmvyIHpwN/4qm6pmnEUU/iVc3KT05SIP0DCe+hE3aZyare0PQ5j
 PqM5xwLZvRQc1uWBIJ/ag9BXWumSwGR7aOKgfkC8bbsl9R5VU+uV67D93kPpErJOH0dP
 4vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686829; x=1762291629;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdP5TbkC149GA0FALd9E/e3/ojBpNA/aYkFJbl++16A=;
 b=vTiKVBt+UI3v893jAhrBjVQcv/K/1MUxJ2/vKLbIb4A+fyweCUAhiwp83zEbzzUYwD
 v5Kur17ydox3vnlCfyZlyFiqkx7fpCDMvotcicN3xsPOqbsp7jmfm4HLfS08y/hWr+uy
 bZMaKzqAOa5qufE3T2iS+KuxShz6NPDyicb3r0veWZkPaVfPXStyb6aSYJwGEUcdCUH7
 JQsRn8fIjkzJnNB6L639Z2S94W/I5b9NA4aEuYVChCKfD25jwR/NyTj6DCs5inAjEfp9
 bZiqKVRvUh5mNixRtsiPqFnKszK/A9Lfof2+Wz7vywwRKfM3hT877yXo37Xme4dPybAl
 aGAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtQnisN/Q7WVnIzpCQVz5Wbql+paRwSEei1AqJnhHBJ9eqO1epT7tNNEiNdT+QCfaaeaSpHjcQe20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM4MEvnV9g5pPPIkarwSZR/RusCa0jg22Wcv94rjq872tMGiOa
 Qhuum544t/PNDEpvpDB0P2JAKbLrr2rsz3LhPVTiPoO2hyzepiPBwQZGN+YWgAZmevu6l1tmh4j
 TM044hzaUY5vBirmCRkHxdZfZwhJBefSBN9DOqzkzGdb2sXJZk/9mf4TG0xM02IooS9FlnfM=
X-Gm-Gg: ASbGncvDytrgRMy0HWOifIiptmVf36d8PMtsLP3GZklweCo9SvwcwA/FdbXzLaWY2RQ
 KeKEJsdr6HvR3YeveDTFN7i1gcHv7fKQGM5DsIEVqPs3UI6gQi8ipt9ZBfppAT6sX5+AzdzOUIc
 S+UscnOVSYnKj8S++UWH51pJ1JBtwJ/zjwN3+LW86Zpd2D/tvRozCu5AzcGaZfd1R5rX3PmeGGb
 ZC1lugINclQjPexZErCRHnT38lxRkRLFKp3pO9SkUGMjS9xTTGCulXoh3GX0qbNARJuqqloCJsO
 LVVV0947dgvXlASfnDh8X9PQWAu56I8EeQ8KkxUrZVBH1ILh48OiCOy7FDQMCShqr86VEkyTxvd
 o/vV5gz4Q9eP4HILTSNmfTJhzCbG68T9pwfTIIo3udHd/TErYjc6SeZq0N2Tdr5lOFzSrN+SKss
 posfN7YuhUmXQF
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4ed15a23867mr9720701cf.0.1761686828551; 
 Tue, 28 Oct 2025 14:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxR98KH4P1HlcjcBcumSx72Dky53bKX5MRwlk/e4bOdqpkMOYKmt8VJoGyRxf3ikIXyDRIA==
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4ed15a23867mr9720451cf.0.1761686828124; 
 Tue, 28 Oct 2025 14:27:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41c3csm3332734e87.15.2025.10.28.14.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:27:07 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Message-ID: <jbf52sfh7vpefhla3vonerfu7jyvja3erlpf6qgq6pa4htxtrp@7qxlchr2phyc>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901352d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=kAP0dVoXV5zkFeC1rmcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: w_4kiGR4FMytmhxBxdnk0JlnmLQbOjhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfXxd8QShrk8gBN
 VQCRyHqtHf2evOW5amTfL7S0cMRegROgAI2vxYvk+S904L5b1EnoMgpwtBZifg99mveX5BBmNdd
 +23npH3a1eZhl19dMlfyWEmX0MndVztHPePWHqTyDDfDgk7gRpjZ+54PO/9aWwh6ACCYZVCiSMc
 tkQd0bfMcQbPCzUNqW8U0YtuTsa0yUWJNThkge46zBC1hrdiMh9W1oSJquVuI0bkCjzBFYChC+G
 xH1dvIZ0Y2A/wCBaVWaNhkCWhy+I7yXPheXxcApQoW/JHeeGyXpaFy+hDIiaaJo9N1HaDVLWIOh
 XnniBjeoMZKDTx8s9uTAEXrf75LaSgNmHJ7UIfk1zW9aHovDhp0eqYQRodpi+y/tT5wXNxJ2mKU
 cMzOX610yW0VxAlLgeRL4NBqCsNKKQ==
X-Proofpoint-GUID: w_4kiGR4FMytmhxBxdnk0JlnmLQbOjhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Sat, Oct 18, 2025 at 02:33:43PM +0000, Vladimir Lypak wrote:
> YUV formats on this hardware needs scaling for chroma planes. However it
> is not implemented for QSEED2 which breaks display pipeline if YUV format
> is used (causing partial and corrupted output with PPDONE timeouts).
> This patch temporarily disables YUV by switching affected sub-block to
> RGB only format list.
> 
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Does it apply to all QSEED2 platforms or just some of them?

-- 
With best wishes
Dmitry
