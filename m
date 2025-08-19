Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692EB2BF5E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3920C10E084;
	Tue, 19 Aug 2025 10:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfBeKcWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14FB10E084
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:52:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90iJu007348
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=meTAWZ002tWP1iMId64JmPQL
 fiMSJlabjueQPGjB4T4=; b=TfBeKcWhD2yRfIk38oz9ShgSEu1KkrMFo1TbZK8+
 zgcGSxVDJTFS5BKffpapOoDeFHTUrQn3QeIuyPm4xd7LH3pxWwnE4c0DwmOcp3eO
 vJV+FOL0/cgD1JOQ2PI4EkgCnx7B8aoOhn88Zo7h5TKF6aBgNCxsJNz2E0bEYODL
 NjkwBpphEmNcmPx1idl4Mmhr81AlIjUsOXngpf0/Xm0fXX2s3kulQXrNqXIoWj3h
 uIZQAJulvydpDFQP0AmfH0ufIvxZAFqsFDa0xIgEksTxsckAi0D4wgzWhaGkCHTG
 78MITdhl/YcS5obifMi5za4UcYdXcC8Y0Ec4ToxUxDyO4g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj7488x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:52:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88daeb18so113978826d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755600745; x=1756205545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meTAWZ002tWP1iMId64JmPQLfiMSJlabjueQPGjB4T4=;
 b=tSPr9DKgD08kkoiKQ9EilVmEVU0SSRScGZ9ObIA57Lgl5cw5kiHzHCLzeLWGLz7JwS
 Vp/QqnSFhhq2qKeVWqHAKcN/e63Eq9zYHYcF5dGtORED23HKV030XD1wOCHevnMsiyK6
 KJ/p8wWRyzOty8Htw4k2ybW9LgfKu5Zff/x0FKJsimjanew3ByP79OviBA2Ys3pNN2SP
 ggpR6ZS/s6swa6NAMULWc5ir97XAnBL+2mp/juXRZPVdRdawswZ985y2Gn7XN/QRzNPY
 usHNEy2biQCzRfMpJiKPPGhEzopzf8MoY7KhpoEdYg4Al6Gi+WvgtqdFvTmo1WQhdUQu
 yCCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOZxMc2fUTP1SS9DskyaWP4WQqxcQolqRpubalItwnwtYOJzYZyhRqvHV90l5wIpGdoZEA51d8NS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2TbHy1DGrw/aSQ8ubJ1dXxzp3GJqFGlcdv7wIqpzJbfOexzrM
 fdE5jiNt02iWKlBKhlJHo6l7o9PRNGNqq8jhYTRk6KtYBJB94JKwv0tJhfNZO3GG6Ur7h8fuqaA
 huEp5y/JQB/Cl0gbk3xBF2mLPrIk2RV1ng8Iqjx/eePmP2pZUuBnIllwqZxKpJuIqaUWRNFY=
X-Gm-Gg: ASbGncv0GU68sGaxOR8Jr2HEAwGn0Ddg3mmCd+fTBSD5nv7p2k4c6sBO1xh1uR70aVu
 YgauKTXKfYhHHytg20O5qDmU9vHTqDfOa71XCe+HnZrrCMP5E2+Bm2WUbLHNBCbZLTFK6C5hwjO
 Eu7cIBud2xBgi4USip3utcNEA/qaEg4ZxU/TBhX8/ql/wu1aFucxIwFuXzGyQqOvTz82Pd7Eivn
 fU3X+aFeRIC4pLzlz+Nw0mp/6L3cBcF6mJvOVkxKmteFne1X3yso+fVslcl99nqD4DgpvsrXGqM
 /NaWJNIHfGgOqOgxy00Sl2Gao0ipYJ6lHEw7IW8G/RBsj9LE5sizJD3/kj5le3Bexr7OfhlsRMx
 VqcojW7iowlw9UlT95NG6IZofp25uUHXThFKVsHBOPUTlgAWcesfE
X-Received: by 2002:a05:6214:2526:b0:707:a430:e01b with SMTP id
 6a1803df08f44-70c2b6db728mr18561566d6.3.1755600744719; 
 Tue, 19 Aug 2025 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWTcLFhjUM0I8L2qtkE5KEq6YT6QkQ/QixKqZj3wqbRnQCQfoRKDE05BN8SvkpHUbQsGPT0w==
X-Received: by 2002:a05:6214:2526:b0:707:a430:e01b with SMTP id
 6a1803df08f44-70c2b6db728mr18561056d6.3.1755600744021; 
 Tue, 19 Aug 2025 03:52:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35fb15sm2032674e87.52.2025.08.19.03.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 03:52:23 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <veuco4na2bnisn7qoi7fhdf553alr6omdzdrtnz5p2x4ywtmzh@2smifabnvnbd>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
 <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
 <aKL1NPuZWWxsAavx@linaro.org>
 <2hzzc3fd52kb54s2pr6fxfnd4svi7x3zt7dyvenja3suhieidb@hrlggbqocqa7>
 <aKRUvCVpz8y47TPs@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKRUvCVpz8y47TPs@linaro.org>
X-Proofpoint-GUID: c-J2gBrXVwnIgzadUz8tO9HI9URdilt1
X-Proofpoint-ORIG-GUID: c-J2gBrXVwnIgzadUz8tO9HI9URdilt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX6aMr7uQU8y7G
 qC/NxtUHNZCAe7DWDYiwpWlpZs5yHPgQTypFB32yQ3HLNGHx/QcoXkeVnFAfTEUHc2nW3LJl/bm
 2UzqiQ9rxPA45wJOa/woNvPRjyRdBMJQi3XClmjtetpM5yUXd4wpQfeTSrmzrS4BLiBDcCvKrN+
 ZLM2opK9x/Arg8nX+tAJXnqE3lpszonSqBkeqEgJDW3YCvOLLWDzeB78V9uVAmrDS9JRXjiTE01
 GC8/PytKfEKg505V39j0RRCdk33zD5idxdS3nS1zAYwGY7x3mCB+wXFS2m0xr5gzgUTW7UMQKwu
 3Yb3NTbLcFYWlAi2LNIJebNvFdfYoIB/ZXq5Jol3ha81r2sTN3NU7/N4glbB8JHOaqfAlQrtRDL
 PFxC+IUG
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4576a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=aFVlKXMpKZbDbpKwxIQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
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

On Tue, Aug 19, 2025 at 12:41:00PM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 04:19:26AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Aug 18, 2025 at 11:41:16AM +0200, Stephan Gerhold wrote:
> > > On Sat, Aug 16, 2025 at 04:55:00PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> > > > > On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > > > With my changes in this series the clock state is always consistent with
> > > > > the state returned by the clk APIs. We just delay the call to
> > > > > clk_set_parent() until we know that it can succeed.
> > > > 
> > > > I know. But what happens when we power down the PHY? The clock is
> > > > assumed to have the PHY clock as a parent, but it's supposedly not
> > > > clocking.
> > > > 
> > > 
> > > I don't think this is a big problem in practice, given that these clocks
> > > are only consumed by a single driver that manages both PHY and clocks
> > > anyway. The clock should always get disabled before the PHY is powered
> > > down.
> > > 
> > > > Another option would be to introduce a safe config for the PHYs and make
> > > > sure that the PHY is brought up every time we need it to be up (e.g. via
> > > > pm_runtime).
> > > 
> > > I considered that as well, but what exactly would I use as "safe"
> > > configuration? There are lots of PHY configuration registers that are
> > > set based on the rate or other parameters of the panel/display
> > > connected.
> > > 
> > > Implementing something like clk_rcg2_shared_ops could presumably work,
> > > with the limitation that it will only work if the clock is really off
> > > during boot and not already running from XO. Otherwise, I think the
> > > simple approach of delaying the clk_set_parent() implemented in this
> > > series is still the most straightforward way to solve this issue.
> > 
> > I know that it works, but it feels a bit clumsy to me.
> > 
> 
> I realize that adding a field to the platform_driver struct feels a bit
> weird, but I think in general requiring more control about when exactly
> assigned-clock-parents/rates are applied is a valid use case. The reason
> we haven't seen more of these issues is likely mainly because people
> just avoid using assigned-clock-parents/rates in these use cases, even
> if it would be the right way to describe the hardware.
> 
> I'm happy to try implementing the workaround in the Qualcomm clock
> drivers, but hearing more opinions about the more general approach of
> this patch series would also be good.

I completely agree here.

-- 
With best wishes
Dmitry
