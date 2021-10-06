Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C263423BC9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 12:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444146ED95;
	Wed,  6 Oct 2021 10:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A15C6ED83;
 Wed,  6 Oct 2021 10:52:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50DF6610C7;
 Wed,  6 Oct 2021 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633517563;
 bh=V9qmdHUZA/980yayysl1P0r8HfySgR/QYHEMF/9Epok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuvRMNmIvEVDpKW6QLLfnJF3PSyj247P9OYMcxvJ7o24xfkR0FTG/m+/Z156P5S/A
 WBySWuKlyvcC8dapMxwOVLK8budbIjtoeTlGrKbf8zqntQ4EDqkbV/HvNAHZYVskrP
 RDczcxvE664yS2qx0IY2dAODGWEtZciySaEmpwCZ9tjjLW87ghsqWqVqE2hoZImqkk
 24T+4CisJX2mYKzoGDd128Yhh939ZqlUnC1g34hHA9VyYOoyWlXDqwplp5j9/7+Y/B
 754KPlCOgZ/pKMWKIWWnFq3Zw2q01m59+LSI2I7aT5yJyLKGqoV/jwYN2/76tbruHl
 ioFRi+1FALu/A==
Date: Wed, 6 Oct 2021 16:22:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 05/11] drm/msm/disp/dpu1: Add DSC for SDM845
 to hw_catalog
Message-ID: <YV1/94iEYzFc5C7t@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-6-vkoul@kernel.org>
 <fa65a19fb47f4066158a1aa2d7ab4626@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa65a19fb47f4066158a1aa2d7ab4626@codeaurora.org>
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

On 02-08-21, 16:29, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:51, Vinod Koul wrote:
> > This add SDM845 DSC blocks into hw_catalog
> /add --> adds
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > Changes since RFC:
> >  - use BIT values from MASK
> > 
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index b569030a0847..b45a08303c99 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -40,6 +40,8 @@
> > 
> >  #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
> > 
> > +#define DSC_SDM845_MASK BIT(1)
> agree with dmitry again :
> https://patchwork.freedesktop.org/patch/444072/?series=90413&rev=2
> this is unused. you can use .features = 0

Yes I have updated that

-- 
~Vinod
