Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F6ADED6B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EDA10E141;
	Wed, 18 Jun 2025 13:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpzzW+kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AFC10E823
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:07:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8x4bl002406
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pEB3IBW7SqwbHALnm+Lx2xPg
 ZbrkAM8vQD8no4c94Fw=; b=JpzzW+kkQNR0fR0arMeveU/sDhXQsfV581HTRMzV
 mLM1WtZudsBRSdUIZWCGv45SWcAfzVNdigRnJsYy4XwFMm4m73c/V1kA/QC7vhwz
 vqf03ZIuucfAXSPWYTG7O3hdDKwmu0zZth14mPTJzRIYd3sN4TLNfMLk3p7EgEXE
 bS7MvaUP28bhmnwZIlGVsWvRAUYF/MOaHKzMNAItg2ARAW7mrtFF4b6voNIYkV4a
 Opzl2BFa4ZYDwsqrYdKs+bAr4SVp2B36YBrZkK1MQtMCXYTv6N2nU7TvdsQgpXpL
 JbPmL2bscma82A0kQk5NGb+cstfNykXj9BpRoX2dz0JmnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7c5hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:07:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c791987cf6so169414685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750252033; x=1750856833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEB3IBW7SqwbHALnm+Lx2xPgZbrkAM8vQD8no4c94Fw=;
 b=pvoE8sE98sGnOeB7vT9WfwiZEFh3sJmiJfm3H+6XeeUZqM9UEzUWIHI/nHoV9LXyO2
 iIHfZoQSRlcthCMP9cTnYDFQb/piMgkc2mq3LiyELWzrWboZO4y14ZBlVx69/JK4puzK
 ErDxENTiOymoYbethTQDjg0QH+OGgXsirsTgiZkq42lOper6gUDxFgJe1Yo1Wk5DDBmf
 DfYaYd7KdPESMBng2e0ENznMCnt5gaGPq36ds2SZ1imBTdYo/qagb0CRkawfG4yXhzY4
 2+alcI2JHVQM3qyuAX4KKoM3WWCeTXFk9PrZZ+d0HnIJpNGzDG/CdEzFdtQHAetbd+g6
 TpRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkfKuAR2IrhRIp3f3DmEgk/M8xzB9riNwFlSNYVjIrirAygJNc1oP//iJVl9y6UY7+B2q4yB4NnU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCF4cjRSgyhfgKC+AXlivSknX45GigGygR+TGL/mI+GDseYwGg
 8upgrlpsicib3CzYD3fWzU1F76GMizUJdkJaaNe8B98fez4q3u+Jk7+qGIgpaKeS4n/doV8GgQS
 n1uFoSpqKEyYpXy/cyHruq9xGBSIlh9ZOWJgzjkQyfT6M/e2y+PU1tFl4ePHEZCzrpfomtlg=
X-Gm-Gg: ASbGncuBmmGSzXnK0Lv+7qtTFUZHQ6/+gPP20Om4rhmeuST5AeiWHl3b6BpgEeUJIi9
 X9v+Dm5qrZvbyYHTY2d79XBIQztjzSBNCFnFSGTtnG1Hd/J/JX3Vw1tj2A7W1Lm6osxWt+2d9QK
 k0VX27dwCvVNO/QKfT0w1RGguquWV6w/dbIQz5IIpqWGZBHjfN66o0tIT4Qbw6An13l+bJYswk2
 k4j7DKq0KjruTHIbT8r22hZB76/pFhug5a8UTC6gYQHFj1Hhmtm2aZC+ug5lvMdYra+S2qCvbhd
 a/jwIQevHUysnpvkUZQBNGSva6jHeQlNwhHAgv2Xym4W6iSuYa0L0QL1y6bwecSDc2xY6oHpZdA
 DW1Ku3un4boFDPfpQuUb4MovM0urNGb78j4g=
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id
 af79cd13be357-7d3c6b7b64bmr2416842985a.0.1750252033118; 
 Wed, 18 Jun 2025 06:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZYFBBGQhXUBuLVOvJiO43P1f2KVUStUccmAa1uQee7HeLw+oTe/UnhxWImacqUUL4x3Tnww==
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id
 af79cd13be357-7d3c6b7b64bmr2416838585a.0.1750252032534; 
 Wed, 18 Jun 2025 06:07:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553cdef7fdasm529978e87.245.2025.06.18.06.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 06:07:11 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:07:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
Message-ID: <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMSBTYWx0ZWRfX4acruKxK8W2C
 SksAT5AAzKX9kM00nq0YmHkayPYsEq5Yp8bo+58RhE7smo9U+iibaZlvJmSYImZJP62UHFpN6uJ
 itRAyyAgrD/2/t1KUJJzgiRZxs58slvHggr+6eFpGE3F9cAz8YCYzPxJLw0z6YqKr1tuvWcNUz4
 wJkLEZr+1NgE+wtEtooTAKyahepQD503ztY8sDeAFqhQGjktHFkF3kKPlZcjq/oI33hD3DMIWvl
 YHTK6j2rshCWB3pHyZsMp6dUiax07ZvHHQpXh9Tgft1zc/xCidWpddYTDXMKPXu5a/3nvLVkOL5
 yBz3QN+MpzqUnqJD1Y7H1xspRewAjAT2FyetaCeyMjTkd2AvKhVO1K/VmKQ8+228LzenmBXHWMb
 Sg1Knwc1stheY6JoAHlsBY/z0tIfDjC7kmZKnnHRsqKWbvWQCXHZC+AG0Vr0K2Btz3Am8fll
X-Proofpoint-GUID: q8HOIpDXDEA0BJle_LUtWHo0Es4xvgeC
X-Proofpoint-ORIG-GUID: q8HOIpDXDEA0BJle_LUtWHo0Es4xvgeC
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6852ba02 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=uvfCOV_WgLjuMeome0MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=753 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180111
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

On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
> > On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> >> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
> >>>>   
> >>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
> >>>>   
> >>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
> >>>>   {
> >>>> +	unsigned long flags;
> >>>>   	u32 data;
> >>>>   
> >>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> >>>> +	--pll->pll_enable_cnt;
> >>>> +	if (pll->pll_enable_cnt < 0) {
> >>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
> >>>> +					  "bug: imbalance in disabling PLL bias\n");
> >>>> +		return;
> >>>> +	} else if (pll->pll_enable_cnt > 0) {
> >>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>> +		return;
> >>>> +	} /* else: == 0 */
> >>>> +
> >>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> >>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> >>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> >>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> >>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>>   	ndelay(250);
> >>>
> >>> What is this ndelay protecting? Is is to let the hardware to wind down
> >>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
> >>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
> >>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
> >>> without any delay between them.
> >>>
> >>
> >> Great question, but why do you ask me? The code was there already and
> >> MSM DRM drivers are not something I know and could provide context about.
> > 
> > Because it's you who are changing the code as you've faced the issue 
> > with recalc_rate.
> > 
> Heh, the answer is then: I don't know. I think authors of the code could
> know.

The 10nm HPG documents a 250ns interval between enabling PLL bias and
and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
delay between disabling the PLL, disabling FIFO and remobing PLL bias.
Please adjust the code for 7nm and 10nm PHYs accordingly.


-- 
With best wishes
Dmitry
