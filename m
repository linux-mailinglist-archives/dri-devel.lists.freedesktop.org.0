Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB513B0C2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 18:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161C66E42C;
	Tue, 14 Jan 2020 17:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66BF6E42C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 17:23:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579022606; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ExKH6Qx5NOKiFzMpvDrIYdTOxCKfXj+v5nlEnciqC7E=;
 b=h5/Oix5kXgzBgoOSVCCoqPbINu0qVnKjQ1E2UCSTrvVVpKI6u4bTdfcAlyENrLjPwxyH2MSw
 NKf9xRER765lbi34SzlqOWZGmMPI1Alah5AO0l8cAsYlTKUnwLOqbv7dNUHnrvGgx7gEPw2y
 2LQW8h8D5ZfQ1OIzucUFxDFayxE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1df90d.7f4000961b90-smtp-out-n02;
 Tue, 14 Jan 2020 17:23:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1F890C447A3; Tue, 14 Jan 2020 17:23:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87268C433CB;
 Tue, 14 Jan 2020 17:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87268C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 14 Jan 2020 10:23:19 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Message-ID: <20200114172319.GA2371@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@chromium.org>,
 Brian Ho <brian@brkho.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 Sean Paul <sean@poorly.run>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
 <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx6AVwA73eN+Rs=GAvBPD1Leq=WKG9w_2hohpzmecK_C_A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Sean Paul <sean@poorly.run>, Brian Ho <brian@brkho.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 08:52:43AM -0800, Rob Clark wrote:
> On Mon, Jan 13, 2020 at 9:51 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> > > +
> > > +     vaddr = base_vaddr + args->offset;
> > > +
> > > +     /* Assumes WC mapping */
> > > +     ret = wait_event_interruptible_timeout(
> > > +                     gpu->event, *vaddr >= args->value, remaining_jiffies);
> >
> > I feel like a barrier might be needed before checking *vaddr just in case you
> > get the interrupt and wake up the queue before the write posts from the
> > hardware.
> >
> 
> if the gpu is doing posted (or cached) writes, I don't think there is
> even a CPU side barrier primitive that could wait for that?  I think
> we rely on the GPU not interrupting the CPU until the write is posted

Once the GPU puts the write on the bus then it is up to the whims of the CPU
architecture. If the writes are being done out of order you run a chance of
firing the interrupt and making it all the way to your handler before the writes
catch up.

Since you are scheduling and doing a bunch of things in between you probably
don't need to worry but if you start missing events and you don't know why then
this could be why. A rmb() would give you piece of mind at the cost of being
Yet Another Barrier (TM).

Jordan

> BR,
> -R
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
