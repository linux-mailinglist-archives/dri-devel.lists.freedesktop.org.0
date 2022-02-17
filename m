Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97394B97A0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 05:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0969B10E7A8;
	Thu, 17 Feb 2022 04:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D4D10E796;
 Thu, 17 Feb 2022 04:20:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DBE861DA8;
 Thu, 17 Feb 2022 04:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15D7C340E9;
 Thu, 17 Feb 2022 04:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645071633;
 bh=aufa0nh+h9c3kdylk4TIafeWU4s1oDv8HmfjdC9MZeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OsiHFCKNC8FjTqTL2vhM1wRiRzIPkhab8+taGIvE+0q/yZXQVJtJ8QW1/yV2f/zqW
 xRQ2bM7zPM3nIOdV2lFz+K24nunsMUNoFMN0lPK1SjCbxLBqagyi6AxLaIwjlEew6I
 /rsjxd1uXZgtfYGg4WfsAa3K2J83xCnVvv4iTdRaoZBkGzWNsZhqYrleZP5ONZsXKJ
 d873EMaP0IqznWNgz7Y1GplT/Kh+uB7J/EEwIQkkg/qMwDeA9L7Hb4gTQHtaT/3GsL
 fTyI4a+gcVZ0UMWUXOI2a+k4ahuHDR+w8zALCwavXhD9JBtZhUk3uQhFqCyd3aZ2pU
 JEYRNG/olryMw==
Date: Thu, 17 Feb 2022 09:50:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [REPOST PATCH v4 03/13] drm/msm/disp/dpu1: Add support for DSC
Message-ID: <Yg3NDelctH5YP2jA@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-4-vkoul@kernel.org>
 <8de66b66-5f02-600e-aa4c-bf2dad37487f@quicinc.com>
 <a75893b8-f868-845b-2da2-1a2840a83caa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75893b8-f868-845b-2da2-1a2840a83caa@linaro.org>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-02-22, 22:46, Dmitry Baryshkov wrote:
> On 16/02/2022 21:57, Abhinav Kumar wrote:
> > 
> > 
> > On 2/10/2022 2:34 AM, Vinod Koul wrote:
> > > Display Stream Compression (DSC) is one of the hw blocks in dpu, so add
> > > support by adding hw blocks for DSC
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > 
> > Somehow second patch of this series is not showing up on patchwork in
> > your REPOST.
> > 
> > It jumps from 1 to 3.
> 
> patch 2: https://patchwork.freedesktop.org/patch/473356/?series=99959&rev=1

yeah it seems to be there.. As well os arm-msm and dri-devel on k.org
pw....Problem with QC delivery...?
-- 
~Vinod
