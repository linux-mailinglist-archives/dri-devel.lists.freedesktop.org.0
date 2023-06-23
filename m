Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233D73BFA9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 22:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DFB10E6B3;
	Fri, 23 Jun 2023 20:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB8D10E6B3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 20:32:30 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3D4D13F6F7;
 Fri, 23 Jun 2023 22:32:28 +0200 (CEST)
Date: Fri, 23 Jun 2023 22:32:26 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: inline INTF_BLK and
 INTF_BLK_DSI_TE macros
Message-ID: <tonifmpxqvp56mzwf5tzwclwzu7evbmtmtje5uce5ikitj3pbt@m34soh22rhpp>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
 <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
 <227c2ba0-cfb2-cd88-6506-895e8735d221@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227c2ba0-cfb2-cd88-6506-895e8735d221@linaro.org>
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

On 2023-06-17 03:48:33, Dmitry Baryshkov wrote:
> On 17/06/2023 01:12, Marijn Suijten wrote:
> > On 2023-06-16 13:03:15, Dmitry Baryshkov wrote:
> >> To simplify making changes to the hardware block definitions, expand
> >> corresponding macros. This way making all the changes are more obvious
> >> and visible in the source files.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Looks good but I am not sure how much it is worth to review this (versus
> > checking your script and rerunning it to see if I get the same results),
> > considering that there are quite some conflicts with your interrupt
> > rework.  In what order to you intend to land that?
> 
> As I wrote, this series goes in first. Initially I designed them the 
> other way, but intr rework depends on DPU revision changes, while this 
> one doesn't have such dependencies.

Thanks, I'll drop the intr rework from my local "-next" then.  Have been
collecting and testing almost all patches that way thus far, but it's
becoming hairy with so many dependencies.

Will pick it up again once a v2 lands.  Is any review still needed on
the current v1 (or was it RFC)?

- Marijn
