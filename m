Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56191E4FB2
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 22:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD51C6E0FA;
	Wed, 27 May 2020 20:56:34 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 27 May 2020 20:56:30 UTC
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E176E0FA
 for <dri-devel@freedesktop.org>; Wed, 27 May 2020 20:56:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590612993; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=oQKoa8Cj84DPHKqtKgg0JYSKoT8dZrtpHgoZsTqyTeY=;
 b=GP7mrf6zawVzXpaaahDDvKvE9Rc5I7MjLCXtoDSzhlbJCX21V6UdnyxvoBCzAwWgSJeN8IzH
 G3/pQaSVmRtd1rTl9WSEGFG9WRzkkWzcisb49k87+wy5XAFiZ+hx+qfkvNyllbZThidyh2e/
 leUicu5vUsTZ8uvbBSQkN9LTb0o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5eced2cc2c549984752e4ee4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 20:51:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9A222C43395; Wed, 27 May 2020 20:51:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 556F4C433C6;
 Wed, 27 May 2020 20:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 556F4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 27 May 2020 14:51:19 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
Message-ID: <20200527205117.GA8479@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, saravanak@google.com,
 Sibi Sankar <sibis@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
 <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
 <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 08:38:47AM -0700, Rob Clark wrote:
> On Wed, May 27, 2020 at 1:47 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > + more folks
> >
> > On 5/18/2020 9:55 PM, Rob Clark wrote:
> > > On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> > >>> This patches replaces the previously used static DDR vote and uses
> > >>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> > >>> GPU frequency.
> > >>>
> > >>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > >>> ---
> > >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
> > >>>   1 file changed, 1 insertion(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>> index 2d8124b..79433d3 100644
> > >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > >>> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> > >>>
> > >>>        gmu->freq = gmu->gpu_freqs[perf_index];
> > >>>
> > >>> -     /*
> > >>> -      * Eventually we will want to scale the path vote with the frequency but
> > >>> -      * for now leave it at max so that the performance is nominal.
> > >>> -      */
> > >>> -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> > >>> +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> > >>>   }
> > >> This adds an implicit requirement that all targets need bandwidth settings
> > >> defined in the OPP or they won't get a bus vote at all. I would prefer that
> > >> there be an default escape valve but if not you'll need to add
> > >> bandwidth values for the sdm845 OPP that target doesn't regress.
> > >>
> > > it looks like we could maybe do something like:
> > >
> > >    ret = dev_pm_opp_set_bw(...);
> > >    if (ret) {
> > >        dev_warn_once(dev, "no bandwidth settings");
> > >        icc_set_bw(...);
> > >    }
> > >
> > > ?
> > >
> > > BR,
> > > -R
> >
> > There is a bit of an issue here - Looks like its not possible to two icc
> > handles to the same path.  Its causing double enumeration of the paths
> > in the icc core and messing up path votes. With [1] Since opp/core
> > already gets a handle to the icc path as part of table add,  drm/msm
> > could do either
> >
> > a) Conditionally enumerate gpu->icc_path handle only when pm/opp core
> > has not got the icc path handle. I could use something like [2] to
> > determine if should initialize gpu->icc_path*
> >
> > b) Add peak-opp-configs in 845 dt and mandate all future versions to use
> > this bindings. With this, I can remove gpu->icc_path from msm/drm
> > completely and only rely on opp/core for bw voting.
> 
> The main thing is that we want to make sure newer dtb always works on
> an older kernel without regression.. but, hmm..  I guess the
> interconnects/interconnects-names properties haven't landed yet in
> sdm845.dtsi?  Maybe that lets us go with the simpler approach (b).
> Looks like we haven't wired up interconnect for 8916 or 8996 either,
> so probably we can just mandate this for all of them?
> 
> If we have landed the interconnect dts hookup for gpu somewhere that
> I'm overlooking, I guess we would have to go with (a) and keep the
> existing interconnects/interconnects-names properties.

The main problem is that (on sdm845 at least) the path comes up with a very slow
default so even if we don't do scaling we had to set _something_.  Perhaps if we
solved that problem somewhere else (inerconnect, rpmh?) then we wouldn't need to
worry about it in the leaf driver unless the full opp tables are described.

Jordan

> BR,
> -R
> 
> > [1] - https://lore.kernel.org/patchwork/cover/1240687/
> >
> > [2] - https://patchwork.kernel.org/patch/11527573/
> >
> > Let me know your thoughts
> >
> > Sharat
> >
> > >
> > >> Jordan
> > >>
> > >>>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> > >>> --
> > >>> 2.7.4
> > >>>
> > >> --
> > >> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> > >> a Linux Foundation Collaborative Project
> > >> _______________________________________________
> > >> Freedreno mailing list
> > >> Freedreno@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
