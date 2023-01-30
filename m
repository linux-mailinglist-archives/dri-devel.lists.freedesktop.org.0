Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A9681B30
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 21:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCA610E105;
	Mon, 30 Jan 2023 20:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DB610E105;
 Mon, 30 Jan 2023 20:16:59 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1546A1F6D9;
 Mon, 30 Jan 2023 21:16:56 +0100 (CET)
Date: Mon, 30 Jan 2023 21:16:54 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1 10/14] drm/msm/disp/dpu: add supports of DSC encoder
 v1.2 engine
Message-ID: <20230130201654.vlr7p7id3a7vxc2b@SoMainline.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
 <20230123201133.zzt2zbyaw3pfkzi6@SoMainline.org>
 <926021c1-d9d1-4449-f01b-f405b48f326a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <926021c1-d9d1-4449-f01b-f405b48f326a@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-24 15:52:46, Kuogee Hsieh wrote:

<snip>

If only replying to a small chunk somewhere in the middle of a diff
and/or large review, please cut out unnecessary bits to make your reply
easier to find :)

> >> +	data = (dsc->flatness_min_qp & 0x1f);
> >> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;
> >> +	data |= (dsc_info->det_thresh_flatness & 0xff) << 10;
> > dpu_hw_dsc.c computes this on the fly.  After removing that, and
> > using initial_lines from the function parameters, only
> > dsc_info->num_active_ss_per_enc remains.  Do you really need that
> > msm_display_dsc_info struct here, do you need it at all?
> 
> I ported these code from our down stream code base.
> 
> I make it work first, then clean it up will follow.
> 
> I submit it for review since it looks like you guy like to have code sooner.

Correct, I was looking forward to these patches albeit complete with the
promised DSI support from Jessica, which still seems to be pending.

When sending patches to that extent, with the intent of getting quick
turnaround but knowing that they are not ready for prime time yet (or
were they, based on your "submit it for review" mention? Don't you mean
testing?), please annotate the series with an RFC tag accompanied with a
description what still needs to be done and why.  That would have saved
a great deal of comments and review.

> yes, eliminate msm_display_dsc_info is my next target and hope it can be 
> done.

Thank you.  Again, if that was the intent from the get-go, that's
perfect material to put in an RFC series' cover letter.

- Marijn
