Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC66F7331
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 21:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6C710E2A2;
	Thu,  4 May 2023 19:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C4E10E2A2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 19:36:41 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A335320F83;
 Thu,  4 May 2023 21:36:35 +0200 (CEST)
Date: Thu, 4 May 2023 21:36:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v5 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into
 PP_BLK and PP_BLK_TE marcos
Message-ID: <6qg25ffuq6xcfz3vuqm5lguspihjospctjclxmwyu2ifau4p7b@txywjmir7lg5>
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
 <1683218805-23419-4-git-send-email-quic_khsieh@quicinc.com>
 <ljt5mp4ew5lcrrrdd7xyof3jv3friafbmr3im35ddwxjc42ekh@toez7xfdreg2>
 <CAA8EJpreM9i3DUp+93K7p14f_tNMy-m+C-WdyN5_drmmkGV66g@mail.gmail.com>
 <u7hlzltevx675gfg4w6emmeceo6nj76taqeecsor6iqsi3hmki@lg43y65m6chz>
 <11ef769a-5089-57d4-db87-4c5766d98206@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11ef769a-5089-57d4-db87-4c5766d98206@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-04 11:25:44, Abhinav Kumar wrote:
<snip>
> > Sure, if you really prefer a split I'd go for two patches:
> > 1. Add the flag to the enum and catalog;
> > 2. Add the ops guard (functional change).
> > 
> > Then don't forget to reword the commit message, following the guidelines
> > below and the suggestion for 2/7.
> > 
> > - Marijn
> 
> Plan sounds good to me.
> 
> Marijn, we will wait for a couple of days to post the next rev but would 
> be hard more than that as we need to pick up other things which are 
> pending on top of this. Hence would appreciate if you can finish reviews 
> by then.

It depends on how many more revisions are needed after that, and not all
patches in this series have an r-b just yet.  Given the amount of review
comments that are still trickling in (also on patches that already have
maintainer r-b) I don't think we're quite there to start thinging about
picking this up in drm-msm just yet.  I doubt anyone wants a repeat of
the original DSC series, which went through many review rounds yet still
required multiple series of bugfixes (some of which were pointed out and
ignored in review) to be brought to a working state.  But the split
across topics per series already makes this a lot less likely, many
thanks for that.

In other words, let's take it slow and do things properly this time. And
who knows, perhaps the rest of these patches are more straightforward.

- Marijn

<snip>
