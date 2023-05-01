Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DB6F3A6B
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9971C10E344;
	Mon,  1 May 2023 22:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3E710E344;
 Mon,  1 May 2023 22:26:25 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 12DEA40E5C;
 Tue,  2 May 2023 00:26:24 +0200 (CEST)
Date: Tue, 2 May 2023 00:26:22 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Message-ID: <lsa7gmhanmh67nyjsidqcw3zulfohwjzfbiv573a2lqhmdioif@xnzaka44jcxb>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
 <vciwnimlyzezirun3pnyqtyro3x7n5gb46egisyzbouejjas7b@ssbgx2oabw7o>
 <26774a3d-5a4a-727c-0a63-2550eeea4c71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26774a3d-5a4a-727c-0a63-2550eeea4c71@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-02 01:15:24, Dmitry Baryshkov wrote:
> On 02/05/2023 01:13, Marijn Suijten wrote:
> > On 2023-04-30 23:35:54, Dmitry Baryshkov wrote:
> >> dpu_rm_init() contains checks for block->id values. These were logical
> >> in the vendor driver, when one can not be sure which values were passed
> >> from DT. In the upstream driver this is not necessary: the catalog is a
> >> part of the driver, we control specified IDs.
> >>
> >> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I was going to send this on top of [1] to prevent conflicts, but it
> > seems you beat me to it and also based it on top of that series, though
> > without mentioning the dependency in the cover letter.
> 
> I hoped that you'd include such a change into the mentioned series. But 
> after waiting for some time I went and sent this out, as I was not sure 
> about your intentions and time budget.

I intended to send it as a separate series to not clobber the others,
but it does result in yet another dependency that becomes harder and
harder to keep track of as all those series get amended and resent
repeatedly.  The linked series' v3 wasn't a week old yet :)

- Marijn

> 
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20230418-dpu-drop-useless-for-lookup-v3-3-e8d869eea455@somainline.org/
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
