Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65832C219F0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4FC10E31A;
	Thu, 30 Oct 2025 18:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6mN25O1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUO+QVJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC8210E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:01:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UG5qVY1693744
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cXV5bK5NXAnWN8bRl9mITOxX
 zPOm4995onAokhRKwyM=; b=m6mN25O19Y4bcqLCtKcVEF0B/y1gxRwia7ULE0fq
 qYPXfgHrA1nctu1RYAFFx5yrQNs1wM304UEcfyB0cZLP7H1HBTTBecQ+afqCWy0F
 CQPWRKpivCGuX5490S5PjipEM8H0yzqLUns/rYD0f7igFBfUecFUlq/7VbE3cgr9
 VvTC82IB7llKV6mX+EyUnXbBeMajf9O9sc8MzYq7O8ok7IL+OXOAVyZtbqOE6LO1
 cu3ybhDOR8s2uacfCdPvKSB1OKP2E+q1gYKmNt7EOvTFwjwwSv5yM/0PB/e4NHRR
 6ziRF0kQ3Ebah6qHgtIv3ap2ryn8BrZDSLVP0q9lqUqpYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv37eh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:01:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e899262975so37713011cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847275; x=1762452075;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cXV5bK5NXAnWN8bRl9mITOxXzPOm4995onAokhRKwyM=;
 b=WUO+QVJireIWJBYjPIhtjzaVPpZpQhse3TtbsMvzm242s2Gjos4ESThNvQy1zFNi9o
 VvTfFqpCTFrRB5yH3lSImFuUiTwcGTCy4QcHF/0iRnLCS/QWwaldReVA6UYTBG+S/xoE
 RKVagrdyK1M+56J7KLdiDOhicFQCfSU9uXXv/LgfnN3F9eNhlBUBxfEaX2KcT1Z9iaZq
 c58rV7ftx5is4l/T9BQAejmtLV7xF/c9AALF8Sj3DHlQRKXa1KWJP1CJ7BAhM7ByWmaT
 X26+rxU6WAkRJUzFGR6PnGgoP0AopBMNAPglCGIOEMwXeerwZhx66YM2iAyU1LHDjVWK
 vKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847276; x=1762452076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXV5bK5NXAnWN8bRl9mITOxXzPOm4995onAokhRKwyM=;
 b=ksaReh0WYXTfabkdWjLzJDnJ1L0cDTTECl2NOrE+VwnNapN+dmCPC+ugSAYuludfSF
 bKmqUhcvHL5k5tleA+1KZcTml5Kq9h7ipxmAJKGMkEQ0gQT8j3ItBXBRT4YyhKELzCEc
 +r+/OvcAlzfvSJ1jCx1JN5yrdFcMcjNTRqK7/Q1aWhN8kZlUL8vxLA5gPbSKbaccnDgn
 D1me6z96PB+4Nj32hgjRuklth7wFXBwjS8dGMyc3eTV0or2AY6k0zI9GxpdYe+RrC65f
 I8KzhgI4CiL4Ibcq5TveClDns9qDuUSwHFuubLs007QX05SJI0DMA80CmKJkQgv8pZAB
 43Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/P7yLJAt2sQyZZmP4LAwBkLnTsD/rVqf/OiJTkKsUteYGFzpyU0L0fC+0nBpLAqetZDX6JxVyFYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIgi4Kbidbg1D54F8shI0Bu3gFz97ebjpz1/eRep2SvlNYZ6C+
 ICgCBoOst3+dz8UwP+87xcp79r/pKj3mnRLcYU15yfX4ZTO6tON4OiaEomvo2tBzk1SVMN3Iofo
 E0oDi5WiPcUyKt1m62nTpTgnADePCnDKb2GG/ByaCSqzV3/s7MvwztM3QFA76+vweLrX9VLs=
X-Gm-Gg: ASbGncupqepjVv6aq1s4ug8tKjuE1Wni9vvlCJOvHXRAy2MNMzn7Mh0aImA0b/W30me
 UedGS0YwE7t/tg5vx4J/6LShOL7NAA1i5FW33NTVIiguMT65Ng/YQAEhGmXtH0m9neRnmCPY11h
 SK8w3MJzP+pkJeiuxqakxu4Apwtembq2kmXzkIu2DgbzK70zClZIbw8fVyRVSgJXq1qpacYZpY7
 92tJCNAI/bk+/ox7AvLKhc3MpmSgST5zJa3LDF6LEBoyoTUrmQhVrpQSxGAezQ9fNYUTVqOaWTw
 vTAWxhUgpv0jGNJ5fguIgtM1tfyEXfIv8BOTVdfMoihtRvi+GNyZjJYZnpMDDywKtpuEFHINEtL
 s+8GPE3i8hcRXTc9w1/gIpvf6j/iqvFtQIXcRY+ne7QV7IvU8lu6rIC1MOOc5UnjZaUjG01lQ70
 aL/1gQ05/h4eVp
X-Received: by 2002:a05:622a:40f:b0:4e8:a269:ceab with SMTP id
 d75a77b69052e-4ed30d4ecfamr6635541cf.5.1761847275176; 
 Thu, 30 Oct 2025 11:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBsOQjcOvRjMP4pTZJOPkX1Iw2AZufQNpkNP01OrVkZ+/BT71YfbXhtRUq9boF7rgtxSZZrQ==
X-Received: by 2002:a05:622a:40f:b0:4e8:a269:ceab with SMTP id
 d75a77b69052e-4ed30d4ecfamr6634351cf.5.1761847274420; 
 Thu, 30 Oct 2025 11:01:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a1614e1edsm3259121fa.22.2025.10.30.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:01:13 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:01:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <mlhohop2uifsdo3qxxzmuxbkjo735hdw6xcosvkmsx4eskfufz@5otklefey5k7>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: 7s9BwoGfkd1vq1LUhL5DQQM9Sw6cXBfu
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6903a7ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dW72lhU0GKDYo0j8srIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7s9BwoGfkd1vq1LUhL5DQQM9Sw6cXBfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0OCBTYWx0ZWRfX+LNEuEjhRCed
 Vvr/6+7ae++S6L0FbaFiUyNqeYiI3fnCnWs/5Y2le15pLOMVQEj1/UZij0ezL0FoRfYcDPwymJg
 F9ZSyxA0rbkDEiSAMxrFghVEg/USUGdk5LkoXgMTdvQ96Fe4MWHRp/WJPlPG7xJ68dOebichC/c
 p1TDT+9YeEuWQbgU5Y9GldlCWGF8go9wHmGwQxBIP/QrA3/bqeuJxIHbnYiL4bx7wsreKWV/tWC
 W7x2EO+0TprmnUSBhgO3EaHfsQ9F9zMdAg/TSFfFiB56ecFabesranH9csoDtRoPtYikZJqCXfN
 hq8tSmL1Rh4oAZ/fXEXWRnsQqHS7v4TwPPTIpclVyCL3H+J6jMsD53ftArCFZb3gzaHYDpwzHVO
 lGiU70waWS8NU/12/BwnueUR1N7V1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300148
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

On Wed, Oct 29, 2025 at 11:19:36AM +0800, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >>>>>
> > > >>>>> Add DSI PHY support for the Kaanapali platform.
> > > >>>>>
> > > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >>>>> ---
> > > >>>
> > > >>> [...]
> > > >>>
> > > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > >>>>
> > > >>>> These two addresses are very strange. Would you care to explain? Other
> > > >>>> than that there is no difference from SM8750 entry.
> > > >>>
> > > >>> They're correct.
> > > >>> Although they correspond to DSI_0 and DSI_2..
> > > >>>
> > > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > > >>> new features. Please provide some more context and how that impacts
> > > >>> the hw description.
> > > >>
> > > >> Thanks for your reminder.
> > > >>
> > > >> Correct here:
> > > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > > >>
> > > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > > >> just some register address change.
> > > > 
> > > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > > in the core and in the DSI / DSI PHY drivers.
> > > 
> > > DSI2 was introduced in 8750 already, but it was done without any
> > > fanfare..
> > > 
> > > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > > patch is potentially wrong and should ref DSI1_PHY instead?)
> > 
> Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> addition of DSI2\DSI2_PHY compared to SM8650.
> 
> look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},

I see DSI0, DSI1, DSI2, but DSI0_PHY and DSI1_PHY.

-- 
With best wishes
Dmitry
