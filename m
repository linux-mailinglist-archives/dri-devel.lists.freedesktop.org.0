Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32FF681E1F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 23:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9293410E131;
	Mon, 30 Jan 2023 22:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061D10E131
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 22:31:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BB55D1F68E;
 Mon, 30 Jan 2023 23:31:11 +0100 (CET)
Date: Mon, 30 Jan 2023 23:31:10 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v1 10/14] drm/msm/disp/dpu: add supports of DSC encoder
 v1.2 engine
Message-ID: <20230130223110.abjh7k32fjs4kola@SoMainline.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
 <20230123201133.zzt2zbyaw3pfkzi6@SoMainline.org>
 <926021c1-d9d1-4449-f01b-f405b48f326a@quicinc.com>
 <20230130201654.vlr7p7id3a7vxc2b@SoMainline.org>
 <0a0c3a12-51e9-b0d0-9307-847023dbe1f7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a0c3a12-51e9-b0d0-9307-847023dbe1f7@quicinc.com>
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
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abhinav,

On 2023-01-30 13:22:03, Abhinav Kumar wrote:
> Hi Marijn
> 
> On 1/30/2023 12:16 PM, Marijn Suijten wrote:
> > On 2023-01-24 15:52:46, Kuogee Hsieh wrote:
> > 
> > <snip>
> > 
> > If only replying to a small chunk somewhere in the middle of a diff
> > and/or large review, please cut out unnecessary bits to make your reply
> > easier to find :)
> > 
> >>>> +	data = (dsc->flatness_min_qp & 0x1f);
> >>>> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;
> >>>> +	data |= (dsc_info->det_thresh_flatness & 0xff) << 10;
> >>> dpu_hw_dsc.c computes this on the fly.  After removing that, and
> >>> using initial_lines from the function parameters, only
> >>> dsc_info->num_active_ss_per_enc remains.  Do you really need that
> >>> msm_display_dsc_info struct here, do you need it at all?
> >>
> >> I ported these code from our down stream code base.
> >>
> >> I make it work first, then clean it up will follow.
> >>
> >> I submit it for review since it looks like you guy like to have code sooner.
> > 
> > Correct, I was looking forward to these patches albeit complete with the
> > promised DSI support from Jessica, which still seems to be pending.
> > 
> 
> DSI support is still being worked upon.
> 
> I dont think we promised DSC 1.2 will come with DSI together in the same 
> series. It was always going to be DSC 1.2 + DP followed by another 
> series from Jessica for DSI.
> 
> Lets set the expectations right.

Not saying that these patches were promised as part of this series (as
said, "which still seem to be pending"), just making clear that this
series if of no use to me (no hurry to get the code in my hands sooner)
until the DSI patches are also shared which I would have started working
on myself if I didn't know QUIC was picking it up to distract from the
current v1.1 broken-ness on SM8150 and SM8250.

To set my (and at least Neil's) expectations straight as well: DSC 1.2
HW support should come in a separate series without DP support.  Smaller
series (not to mention appropriately split-up patches) lead to a
decrease in scope, less dependencies and hopefully more efficient v2 -
for all involved.

- Marijn
