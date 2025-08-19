Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D025FB2B5D2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9885510E1F7;
	Tue, 19 Aug 2025 01:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/kzRCcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1520210E09B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:19:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IFRwI5031360
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9mo6S+W1ZbtzbUVLiNIvtrNN
 MJa5g0uTnYQexkAo7Ho=; b=f/kzRCcO75xWfeaFiRPlRWmfQUAEpJIVw086Y3CC
 W2x41lmFSZB7dyP2CW7DD1IjEsVmoMNGBY9bSoFvpqVT0axSVOmqhyRzpm+BwE2G
 Y+dR6o5NsjWD39atESlkKLLQffT4W+g8HUESUBiiBrsr2WDH7D2TqQJWV+hnSHvJ
 +S31EW6xBQHs41GHzRSleNPIDWZVqizjFfynMvuoYk1G6s9DDOmt0em2W0dqI1+F
 /b9Kx3QH7uX8PlM1CUzWGr3RicoMMQLOtx7MMs5hQgPP4QM8Hq0raX+WbIrWMtun
 AiwjA+1KOs1ymZ/Jh59YgGfq6AH/bfSPa8gbn1GfE58cRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagxn9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:19:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f55836dso114129546d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755566372; x=1756171172;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mo6S+W1ZbtzbUVLiNIvtrNNMJa5g0uTnYQexkAo7Ho=;
 b=UMd+r/IYqXVKzVXvvHsuffSCTtO8ga9OvRdVfoynYc8y1bwhpQuq+BI40TwLbfAQUt
 Pa1F0402eww/LzrMiWDqDWE9ADItaTq09parRrQnjCd/pBVXyh6401B3d+DSam8p9bo9
 AJael0Ei5FE0LkYs/jiRLY0WixZSxI/WNA6OVc8vDMT8LEG5kix8VqLnIeQd1JCxEltH
 QKtY04de+MBBR7tsnfqygHatWb44TMBV9inL83uTSaNcNGeOSs0DaYXXI8Ob42Nj5qHI
 m3CqkzK4Aqmhd8q1oLh1Ltw5O8gxdJlDTuhVxpQAk17hnr61nWeQlFqi6y3TJru4i0gF
 RsPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCF0pDhyRx6SJC88ba1JrlndptbwNmRp5ikMgZTBGBB7LnaULfL+hZp3zDzDRxpvZoonugktKeepM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhDU83+HwTLadMtRSlhTWUj1gWHic5stfnprIiqbbBaw9ZR9Jt
 Fq7Tpg5ACsz4z6HO1YjSKG7KuugZD76soeYs2GCAFDxBBx1wr8C9qyRWopi54iRu9KFQKbkNLT8
 1qeQK8hAePArDIVy+1m/ykwgpQeIFhIwvJJ84WFMNkp1VZCQDzjgOV4sTR7NOiUcDCz1uTzg=
X-Gm-Gg: ASbGncuDLZFBuEq9v3SisxY486iXEiS9rWxKmGbInbjiW2HyvpmH2Q/8NIT5QMdnaiF
 dd+mdJrIKojSjxf3uFm27Ez/aiUlD6P30PcWAgUAyDDELMgqFkGYtcZbqZj95C0To7vL7sfVK9V
 R744HosvX59Mzh6LOk0mz5bPo7Gt3qYqCwX/Vb7Bi9FpiTDxLXTBbvc2RzOf0zc24cQsyVg0+G3
 60xuL4SsxiAVr7EhfzWX+ZjGf8JfpHsH3CkPL7KtCbMT3iu7IHr/r0zhYWtl7XHyb/Jy4yD8/YU
 Kvab6JJs2ZKN5EPjn8DYkWagWxCFbpwMlPPA8zB6x2pFYqh2H8k43v/NoS1AEIZ52utArQaJlrP
 yDxK5duWlS8lEsJbpD6mblePg5bX2ceHtHEEeDV0bccqh9DtPzI7I
X-Received: by 2002:a05:6214:c64:b0:709:d658:3bd2 with SMTP id
 6a1803df08f44-70c2b6d83f1mr9351376d6.1.1755566371894; 
 Mon, 18 Aug 2025 18:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbgcwzWN6MTXGrEh49U1TwD4iYqGH6iadaRLAjgRiH23RqYLnMlR6OKsQkMmX/hukB/vnG5A==
X-Received: by 2002:a05:6214:c64:b0:709:d658:3bd2 with SMTP id
 6a1803df08f44-70c2b6d83f1mr9351146d6.1.1755566371309; 
 Mon, 18 Aug 2025 18:19:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a6045dcsm20887861fa.44.2025.08.18.18.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:19:29 -0700 (PDT)
Date: Tue, 19 Aug 2025 04:19:26 +0300
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
Message-ID: <2hzzc3fd52kb54s2pr6fxfnd4svi7x3zt7dyvenja3suhieidb@hrlggbqocqa7>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
 <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
 <aJ3Y1XhvTPB7J6az@linaro.org>
 <ddp77rvwe6brwyvkzbkouguigd5tjg2qqfxomlhd2hb2x7w7uf@2uyl2q47bpei>
 <aKL1NPuZWWxsAavx@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKL1NPuZWWxsAavx@linaro.org>
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a3d124 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=zG9IxgxdLrqNAntcejEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: HB49htrEXT79i7SH-0gUmZ6Z-xCpEL0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX6Wb8fCw6IaZy
 6797KsAR20wu/lSC1ITCibQhyz5qbyVQHDTEX1nZFRLcexa4G6M20EOEgTxgspSKTWJZC/SXsFM
 i4RNNTF13ILVBo26xgHWbS8QxkY9B6lP732dtBnWYiU/3+V6zsOu/v9BJOlOy0D+SZGdRctpsBd
 ClNo8Expj72XCSqo/6Oe+VkTHqSvgW9NBX9/O/ZERb+/B0ZS+Dnl5y8XN5nVjevt27d3j2I7bwF
 ApW++UWm58XsCOxmtTlltqvl8LUynkImMFZaZa138GfMwA0xPaijI0cqdAfOm7AWyNjSSyyReDC
 1YoSrK4jMExcYiRhN/6emp/MmFgi+4bJVo0GrVm5CzwjDb793/vaGCeTJMRfFM7/5VbKC2MUbET
 AWfTbqNW
X-Proofpoint-GUID: HB49htrEXT79i7SH-0gUmZ6Z-xCpEL0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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

On Mon, Aug 18, 2025 at 11:41:16AM +0200, Stephan Gerhold wrote:
> On Sat, Aug 16, 2025 at 04:55:00PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 14, 2025 at 02:38:45PM +0200, Stephan Gerhold wrote:
> > > On Thu, Aug 14, 2025 at 02:55:44PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> > > > > Currently, the platform driver core always calls of_clk_set_defaults()
> > > > > before calling the driver probe() function. This will apply any
> > > > > "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> > > > > tree. However, in some situations, these defaults cannot be safely applied
> > > > > before the driver has performed some early initialization. Otherwise, the
> > > > > clock operations might fail or the device could malfunction.
> > > > > 
> > > > > This is the case for the DP/DSI controller on some Qualcomm platforms. We
> > > > > use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> > > > > but this fails if the PHY is not already powered on. We often bypass this
> > > > > problem because the boot firmware already sets up the correct clock parent,
> > > > > but this is not always the case.
> > > > 
> > > > So, the issue is that our abstraction is loose and we register a clock
> > > > before it becomes usable. Would it be better to delay registering a
> > > > clock until it's actually useable? (and then maybe to unregister on the
> > > > link shutdown)
> > > > 
> > > > > 
> > > > > Michael had a somewhat related problem in the PVR driver recently [1],
> > > > > where of_clk_set_defaults() needs to be called a second time from the PVR
> > > > > driver (after the GPU has been powered on) to make the assigned-clock-rates
> > > > > work correctly.
> > > > > 
> > > > > I propose adding a simple flag to the platform_driver struct that skips the
> > > > > call to of_clk_set_defaults(). The platform driver can then call it later
> > > > > after the necessary initialization was performed (in my case: after the PHY
> > > > > was fully enabled for the first time).
> > > > > 
> > > > > There are also alternative solutions that I considered, but so far
> > > > > I discarded them in favor of this simple one:
> > > > > 
> > > > >  - Avoid use of assigned-clock-parents: We could move the clocks from
> > > > >    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
> > > > >    from the driver. This is what we did for DSI on SM8750 (see commit
> > > > >    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> > > > > 
> > > > >    This is the most realistic alternative, but it has a few disadvantages:
> > > > > 
> > > > >     - We need additional boilerplate in the driver to assign all the clock
> > > > >       parents, that would be normally hidden by of_clk_set_defaults().
> > > > > 
> > > > >     - We need to change the existing DT bindings for a number of platforms
> > > > >       just to workaround this limitation in the Linux driver stack. The DT
> > > > >       does not specify when to apply the assigned-clock-parents, so there
> > > > >       is nothing wrong with the current hardware description.
> > > > > 
> > > > >  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
> > > > >    enable the new parent before we try to reparent to it. It does not work
> > > > >    in this situation, because the clock subsystem does not have enough
> > > > >    information to power on the PHY. Only the DP/DSI driver has.
> > > > > 
> > > > Another possible option would be to introduce the 'not useable' state /
> > > > flag to the CCF, pointing out that the clock is registered, but should
> > > > not be considered for parenting operations.
> > > > 
> > > > >  - Cache the new parent in the clock driver: We could try to workaround
> > > > >    this problem in the clock driver, by delaying application of the new
> > > > >    clock parent until the parent actually gets enabled. From the
> > > > >    perspective of the clock subsystem, the clock would be already
> > > > >    reparented. This would create an inconsistent state: What if the clock
> > > > >    is already running off some other parent and we get a clk_set_rate()
> > > > >    before the parent clock gets enabled? It would operate on the new
> > > > >    parent, but the actual rate is still being derived from the old parent.
> > > > > 
> > > > 
> > > > But... Generally it feels that we should be able to bring up the clocks
> > > > in some 'safe' configuration, so that the set_parent / set_rate calls
> > > > can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
> > > > until we actually need to switch it to a proper rate. I see that
> > > > e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
> > > > sources for no reason (PHY clock rates can not be set through CCF, they
> > > > are controlled through PHY ops).
> > > > 
> > > 
> > > I don't think there is any problem with the 'safe' configuration you
> > > mention. I have not tried, but we should be able to use that. However,
> > > my understanding is that reparenting does not fail because the clock
> > > itself is in an "unusable" state, but because the new parent is in an
> > > "unusable" state. We can run the clock from XO, but that wouldn't solve
> > > the problem of reparenting to the PHY (until the PHY is fully
> > > configured).
> > 
> > 
> > How would the CCF react if we return -ENA from the enable() method of
> > the PHY clock if it's not available yet?
> > 
> 
> With the current setup it wouldn't change anything, because the failing
> operation is just the clk_set_parent() that happens from the driver core
> before the clock will be enabled. It wouldn't reach the enable() method.
> 
> With CLK_OPS_PARENT_ENABLE, I would expect clk_set_parent() to fail,
> which also doesn't get us any further. :-)

Ack

> 
> > > 
> > > (It would help a lot if you can find someone from the hardware team at
> > >  Qualcomm to confirm that. Everything I write is just based on
> > >  experiments I have done.)
> > > 
> > > So, assume that DISP_CC_MDSS_DPTX0_LINK_CLK_SRC is already running from
> > > XO, but the PHY is powered off. Now of_clk_set_defaults() gets called
> > > and we get the call to clk_set_parent() while the PHY is off. How do we
> > > deal with that? Returning 0 without actually changing the parent would
> > > result in inconsistent state, as I described above. clk_get_parent()
> > > would return the new parent, but actually it's still running from XO.
> > 
> > For RCG2 we already have a lot of tricks like that.
> > 
> 
> That is true, although e.g. the clk_rcg2_shared_ops apply the tricks
> (the caching of clock ops) only while the clock is off. When the clock
> is off, it doesn't matter what we return about the freq/parents from the
> clk ops. The problematic case I mentioned above would occur if the clock
> is (for whatever reason) already running sourced from XO during boot.
> 
> In other words, I could imagine that implementing something like the
> clk_rcg2_shared_ops for the DP clocks could fix the error I'm trying to
> solve in this patch series. However, it would only work if the clock is
> really off during boot and not already running sourced from XO.

link_clk_src clocks are clk_byte2_ops, so they don't have separate
enable/disable ops. You might implement something close to
clk_regmap_phy_mux_ops: turn XO parent into "disabled" state.

> 
> > > 
> > > With my changes in this series the clock state is always consistent with
> > > the state returned by the clk APIs. We just delay the call to
> > > clk_set_parent() until we know that it can succeed.
> > 
> > I know. But what happens when we power down the PHY? The clock is
> > assumed to have the PHY clock as a parent, but it's supposedly not
> > clocking.
> > 
> 
> I don't think this is a big problem in practice, given that these clocks
> are only consumed by a single driver that manages both PHY and clocks
> anyway. The clock should always get disabled before the PHY is powered
> down.
> 
> > Another option would be to introduce a safe config for the PHYs and make
> > sure that the PHY is brought up every time we need it to be up (e.g. via
> > pm_runtime).
> 
> I considered that as well, but what exactly would I use as "safe"
> configuration? There are lots of PHY configuration registers that are
> set based on the rate or other parameters of the panel/display
> connected.
> 
> Implementing something like clk_rcg2_shared_ops could presumably work,
> with the limitation that it will only work if the clock is really off
> during boot and not already running from XO. Otherwise, I think the
> simple approach of delaying the clk_set_parent() implemented in this
> series is still the most straightforward way to solve this issue.

I know that it works, but it feels a bit clumsy to me.

> 
> Thanks,
> Stephan

-- 
With best wishes
Dmitry
