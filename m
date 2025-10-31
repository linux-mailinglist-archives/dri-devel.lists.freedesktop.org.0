Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A557C230D8
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 03:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7DF10EA9D;
	Fri, 31 Oct 2025 02:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLMrBcDK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zz62mw2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A257310EAA3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:46:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V18COA1417238
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2NFGqDp1m2CdSv3QB44B0+at
 avVoajX3Ebv3PN+tFIE=; b=aLMrBcDKOkjo9SE8gzH3PyCwxvTqQ5WjlCsRsxeW
 iW3xYgoQk851uP+2iX+G41FV1D7cAI4gV9ETn8BGE/SaOUSdmL9/h0oeVrN4SwfG
 wJif2mVk1aWNplgPl2By+lnc/Xhl3dlxr5HRS4LZU9reWX8uD3GJAGfzbXEUFTpr
 RLR0jIHxLHt/sFREFKftMHn+kFGCcQNKu+q+KoFv6htWLPWgc4XPVKpZsJ0gB21R
 +YhrImjkAsXtJXjE3KXKS516VHt6mtAz9mdCvNDURHY9hNf4/JFo69UfJ343oH4i
 QdIYA9XeX+EoSZUZ/Qtkkuocb+UQ1SQiIDI1x/WmgIZ9bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69g72c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:46:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e892acc0b3so43843461cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761878790; x=1762483590;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2NFGqDp1m2CdSv3QB44B0+atavVoajX3Ebv3PN+tFIE=;
 b=Zz62mw2ks00Gi+Pe0W10OQqIrPcSj7KfU9yuG+gTvOz92qCe+nucRbxQxG/88sfAmF
 Gcth4HpQjtCCfRPnDxNZZdkAHPHHIXJxMNaijFjVKpnBOO0RUn/SuZvrpgRiS12iHNiZ
 Rx3bs3cxPbHKiUx4aYquRn5yrCWvZSSieHl+CFgK9tQJOutLHr+S8xSlhMIRO21jECz2
 SnzMxNlKAsp2hv4tngfKCiwOjx9rmdW3Fk8kEsQRS3G89zNM5tOAXiV/q4EkSVLJdCKG
 Oj1lJV5eqC+llNlWTPPOIP49QaWQNrbHVDYq/QoivpWTXen4dpEaK306mMZ9t1ACTusF
 z2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761878790; x=1762483590;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NFGqDp1m2CdSv3QB44B0+atavVoajX3Ebv3PN+tFIE=;
 b=eoTDXtF8PI1VeagAk0EJm08AbQp3spnfeJFlZBs5bfiq9tWIQJbjNTBrtosulJhTGq
 TQouXtSTmWwIwlB4WZY3I5/9wQGMm23/ckLY7XFEJ8GVHV1fLHZhzH7pfXq6oL7twaXL
 JZzmES9hjDzh4tRVdpx5ABse2Y+EtCjAixC7hfUgamFVE3bJgWVSNkAki8LDfAoAk6Oa
 LHmd+jY+q+BfLJYFMwyI571tuzXDcE7UkyfLbZzSc6sh3InDcqIpErP/BFeGNZLlkA5c
 2CaVYwCPOZc7mm6TQEe1HnAlfjL09AEdlUmaCGeqA+rkCPEETHyaBOCWgewvmT0k4W71
 JyZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvKDBOFLc3Qgs7i8qfXH2I32FHotZ05R4v4W427Z1cvGJzJPYmr3V/npLEI7DPIbVJ9jL3QYEJLPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAKlB+7/S88v7nHp/FSErhTiGHOvzsXkbLz05hyFdR6N/act45
 oKQy2HsrkHX4jDw3oKEDFtjEBlht6U1BZjQWNs/5ypgg/+5zx3LU8TajnRx9/aU/tZg7+veaoQ1
 psnOrINzeHzoAxYTQghlTY2BkKdzU0AFm3EjBhrUilm57J6BqkUnvDC0zY6TAFB3jBRR7kgo=
X-Gm-Gg: ASbGnctyzeoTGOYSj/S0MhtKh/Ycude8JVqfHzXJewb9+MRwvaxbOKttX/UnywBcV7k
 6vTeP1PKOTqCKcjgg6jYj6hUnB1Au9dYgwHvhAhdTPk+XWrmXbOuvTQ/NH7feT1WH4LXf0CDvx3
 OAewR/LbA69JENV4ECaJZC+jx/zOKK2wkXsFOGYxEEs2omEswh/uxge9ijod9o0mvrSfHh5D3sL
 x0gKC0VBZc1uCU1cpbIV3CKQJrl2UD6xeUSZB5o9/+4O4IUMciJhC+riuahpzSnhG5U9SSR88rq
 bwW0fYvZlNlOY9oNFKZFtOqG/77FJhPTXInSrmNh2dvVtyEf1JsKvQ9Hr4lgbCwfGK8Xl2znvou
 zqU5Nf2boCzVxOaaGkECYq4tixwrWNjTU/bDqUD2DVXeu+v7HXJD3xZ+cCG5R
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id
 d75a77b69052e-4ed310a7896mr22748071cf.80.1761878789973; 
 Thu, 30 Oct 2025 19:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW+R7k4Z+WWJ9w992LN8TRCm5lm7xZV0CFcN/lZYH0/QcEjNEF7RkEkCbgI/lUUmwN9IKgHQ==
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id
 d75a77b69052e-4ed310a7896mr22747661cf.80.1761878789388; 
 Thu, 30 Oct 2025 19:46:29 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed352deaf3sm3405111cf.29.2025.10.30.19.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:46:28 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:46:16 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aQQi+KA7KfibvhBu@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
 <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMiBTYWx0ZWRfX8q2rYAwY4I3t
 qmEybEcY0qtqSPz7bsoKEhKB1ybN+RGruHa+8xf4rKrujmZsIwDGSQ2qC1subVWRplucxl429I3
 7ArQrcX6wXF9ZxvD9S4umtPDCC2ANyHGVT4tLHNrKqQOs4q70oYCK3/FMK+2m5H16cFpKCe2D8P
 lHFqM+MxqpoIUalRTTxdkjWZSahSDawYDRtDdG67AcRmQ6xrygE1uV/jyrzum3MHlgf323fa2yj
 c+QVrbbbOnKmxFbbou3K7mxrhAg9bKpKvY+3wWFf23ldrMM3TQqQCDY+8hmj875FfXqplp9BRs9
 cQ3/Time3t66A4Ht6aJ+LXc8AYVsje9TynxdJI7WqGKvUAaanRM+/Vq+QiT7CB3lye4Tay9lypn
 fLT6I4HC7SrNzqlKkvc0oOZJTXy1zg==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=69042306 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EkNEsoD3ZKdRnMbS8bYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: GrLv34tS4WOf6rbsYFoN4DVbqZXlKoFq
X-Proofpoint-ORIG-GUID: GrLv34tS4WOf6rbsYFoN4DVbqZXlKoFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310022
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

On Thu, Oct 30, 2025 at 08:01:10PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 11:19:36AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > > > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > > > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > > > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > > > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > >>>>>
> > > > >>>>> Add DSI PHY support for the Kaanapali platform.
> > > > >>>>>
> > > > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > >>>>> ---
> > > > >>>
> > > > >>> [...]
> > > > >>>
> > > > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > > >>>>
> > > > >>>> These two addresses are very strange. Would you care to explain? Other
> > > > >>>> than that there is no difference from SM8750 entry.
> > > > >>>
> > > > >>> They're correct.
> > > > >>> Although they correspond to DSI_0 and DSI_2..
> > > > >>>
> > > > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > > > >>> new features. Please provide some more context and how that impacts
> > > > >>> the hw description.
> > > > >>
> > > > >> Thanks for your reminder.
> > > > >>
> > > > >> Correct here:
> > > > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > > > >>
> > > > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > > > >> just some register address change.
> > > > > 
> > > > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > > > in the core and in the DSI / DSI PHY drivers.
> > > > 
> > > > DSI2 was introduced in 8750 already, but it was done without any
> > > > fanfare..
> > > > 
> > > > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > > > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > > > patch is potentially wrong and should ref DSI1_PHY instead?)
> > > 
> > Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> > addition of DSI2\DSI2_PHY compared to SM8650.
> > 
> > look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},
> 
> I see DSI0, DSI1, DSI2, but DSI0_PHY and DSI1_PHY.

1. From HPG MDSS 13.0.0 chapter 1.6 Architecture
I see DSI0 DSI1 DSI2, and only DSI0_PHY DSI1_PHY 

2. From ipcatalog memory map address:
I can see: 
DSI0: 0x09AC0000 DSI0_PHY: 0x09AC1000
DSI1: 0x09AC3000 DSI1_PHY: 0x09AC4000
DSI2: 0x09AC6000 DSI2_PHY: 0x09AC7000

Look like there are three DSI_PHY, but only DSI0_PHY DSI1_PHY work.  

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
