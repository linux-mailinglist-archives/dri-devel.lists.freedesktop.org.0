Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B05D516C4C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 10:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5B310EABC;
	Mon,  2 May 2022 08:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C10A10EABC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 08:43:26 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EAF663EC9D;
 Mon,  2 May 2022 10:43:23 +0200 (CEST)
Date: Mon, 2 May 2022 10:43:22 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Message-ID: <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
 <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-02 01:44:20, Dmitry Baryshkov wrote:
> [sni[
> > In any case, given that you've already sent this patch and another three
> > patches [2] fixing/cleaning up the series tells me it's far from ready.
> > Most of this should just be handled - or have been handled - in review
> > and amended?
> 
> During the review time we agreed that [2] would come as a separate 
> change It is an API change that would make using panel-bridge easier, 
> but isn't otherwise required.
> 
> I have been working towards more logical drm_bridge/drm_bridge_connector 
> chains employing panel-bridge and display-connector where required, [2] 
> is a part of that effort (as well as few other patches that hit 
> dri-devel in the last few days).

I understand what is going on now.  Since the DSC patches have already
been queued up in the 5.19 pull I won't hurry to review them; rather
will go over them when time allows me to play with the many phones here
that require DSC for the screen to work.  I've been told the series
didn't result in positive screen output way back in its infancy, but
I'll re-evaluate and send fixes or improvements if/when necessary.

- Marijn
