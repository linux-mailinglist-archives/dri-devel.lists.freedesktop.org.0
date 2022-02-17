Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D534B9D94
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C8B10EBCB;
	Thu, 17 Feb 2022 10:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F194010EBBF;
 Thu, 17 Feb 2022 10:51:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A4BD61DFF;
 Thu, 17 Feb 2022 10:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8392BC340E8;
 Thu, 17 Feb 2022 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645095100;
 bh=cBpyatwdFGvOfC6HlRDqaMPvmaC9LzMnO4rFf5lGpwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XCgHma6Qc2q/bG0IQaHPXUfhaCrXd6Z9p4kXNM4saS+TvkwbBevv1mdEI2GHPw9B+
 Ke5rn1yIrWk5IXJK3z9OokRkCPhbpn74QVX3pCPNtVK5hXVbhwkxDnl2sZEg5PkXrG
 T5Afg9Y2oDd0mjCs/4Eal+5iAGm+f0zZQbjB9RDG1zNdXJLw2SZDp+qxnkvtdjKgsw
 /cJVuAp7HNe4RhdahVNSnHpTS1kicI/V8YttEY0KNZn2AQy7jpUG6FzP1V6jewchcI
 nLMoYv9HzFkKLoSWJHdAdi9/9zChOA5aVOyEtgFWOT6dX8wbbeTJs0DpqCTJ6BjAII
 cQYHgGbb+Mu5w==
Date: Thu, 17 Feb 2022 16:21:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [Freedreno] [REPOST PATCH v4 13/13] drm/msm/dsi: Add support for
 DSC configuration
Message-ID: <Yg4otzVk3HlA8rlE@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-14-vkoul@kernel.org>
 <20220217092707.2bfzga74xyicl4kb@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217092707.2bfzga74xyicl4kb@SoMainline.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn,

On 17-02-22, 10:27, Marijn Suijten wrote:
> Vinod,
> 
> On 2022-02-10 16:04:23, Vinod Koul wrote:
> > When DSC is enabled, we need to configure DSI registers accordingly and
> > configure the respective stream compression registers.
> > 
> > Add support to calculate the register setting based on DSC params and
> > timing information and configure these registers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> I supplied a rather extensive - yet merely scratching the surface -
> review of this patch in:
> 
>     https://lore.kernel.org/linux-arm-msm/20211211000315.pavmcc7cc73ilb6l@SoMainline.org/

Sorry somehow I seem to have overlooked this one.
> 
> It seems none of those points have been addressed, bar creating a mesa
> MR to update dsi.xml with a subpar description of the registers (offsets
> only).

Mesa MR was planned as we get more closer to having reviews.

> For every point that is intentionally ignored, please at least supply a
> justification of why you think this is the right thing to do.

Ofcourse, i will reply to these now and address as required.

-- 
~Vinod
