Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098491E47B6
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FCE6E32D;
	Wed, 27 May 2020 15:38:28 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0626E32C
 for <dri-devel@freedesktop.org>; Wed, 27 May 2020 15:38:26 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id k11so3407186ejr.9
 for <dri-devel@freedesktop.org>; Wed, 27 May 2020 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHpRs2AUHpe17qwh7iL/x8H/hAHv0wAfBL5DthJkWTw=;
 b=rT8qTnfL3/jcMB6h3w2l7UplpetRvKoD2TqE0eX6Dn3cnZ7ucOmmOgH172nGwzsYaR
 hsfQF3xHXrxS9Dtj/WzvsK8SDzevpvfZD51pS4UsCoDq5EnaDpsOrSwj4bS0ghP/dyXS
 k7RrVYt+dNmyzjoFLXeLgE4WbL4OOA4Qa9MgDlKAKqfuXm7mUA2Xo8/yO1h522Bo9sME
 zhnk5k7t5cvsyox80lt8+/ZtrZfuROazg+poa9xbYPOmyHE1YycaLQ37bScVupgJ9VRB
 pRndDUApjfbYkN+Kyy3w6+hL+904TiceP02wqT578C97cfrC/piW0qZkGcZLo6N26K87
 uasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHpRs2AUHpe17qwh7iL/x8H/hAHv0wAfBL5DthJkWTw=;
 b=M6gqdLjcqqy52rM3sZLA3t7042tQI80qAPAehAKvZ8vXQv2w2YLsJghsTZv8Bzqys4
 Zu0SSG4PmuHpvrGtzFDg5QEgrFlnYaTr5JEaREIzTQHFWCSuPL2jn3XY/U69FyRelaao
 MqIFY6ksmMZ9bk42Em+0bUNTlV5AEdJHSAKcIOImRFxecyxZ1jfQ+1Qfq2R/MtX8fGYw
 7ClShvouO1qAJ8LAo59O80x9j7bkyBUriLM/FpVTUU5QJag0J0CYOphu5J30I5tHWdSe
 xc43tHYR6t9ud/gXI9J+gsQTQgUgfnMbfW7daNIDEpXvhc9WsJRRd40LrEpuYYoIzzdF
 rV8A==
X-Gm-Message-State: AOAM531KnyDl1V28UkhpkY9yr0ponyZ/ID6wrYJFq1CZQiWfHAO3rzyH
 wqdEcmy5iFRDN0xiQeTaC8PO69ew+mkOg2Qhsx8=
X-Google-Smtp-Source: ABdhPJxDI/cYoTIPZsWwBMhyWTJOxrs8pYM1GI3cfUxwIP9KVzt0QzHkZ25t94IJFGU7ZcJZSnLpK8yF9yMH1JHEXCU=
X-Received: by 2002:a17:906:1088:: with SMTP id
 u8mr6940291eju.428.1590593905372; 
 Wed, 27 May 2020 08:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
 <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGtoNwUGX-r7QytGn5hSU-VD4RJZyhcb3WdgAgAFR5BK4A@mail.gmail.com>
 <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
In-Reply-To: <c8a514c9-5e48-b561-4b45-47cde3bdfb34@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 27 May 2020 08:38:47 -0700
Message-ID: <CAF6AEGvOtgpHMuiw01QgRYGEBB2rp5QOdVMpkTMsi0c-QSSv1Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to
 set DDR bandwidth
To: Sharat Masetty <smasetty@codeaurora.org>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 1:47 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> + more folks
>
> On 5/18/2020 9:55 PM, Rob Clark wrote:
> > On Mon, May 18, 2020 at 7:23 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >> On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> >>> This patches replaces the previously used static DDR vote and uses
> >>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> >>> GPU frequency.
> >>>
> >>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
> >>>   1 file changed, 1 insertion(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> index 2d8124b..79433d3 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>>
> >>>        gmu->freq = gmu->gpu_freqs[perf_index];
> >>>
> >>> -     /*
> >>> -      * Eventually we will want to scale the path vote with the frequency but
> >>> -      * for now leave it at max so that the performance is nominal.
> >>> -      */
> >>> -     icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> >>> +     dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> >>>   }
> >> This adds an implicit requirement that all targets need bandwidth settings
> >> defined in the OPP or they won't get a bus vote at all. I would prefer that
> >> there be an default escape valve but if not you'll need to add
> >> bandwidth values for the sdm845 OPP that target doesn't regress.
> >>
> > it looks like we could maybe do something like:
> >
> >    ret = dev_pm_opp_set_bw(...);
> >    if (ret) {
> >        dev_warn_once(dev, "no bandwidth settings");
> >        icc_set_bw(...);
> >    }
> >
> > ?
> >
> > BR,
> > -R
>
> There is a bit of an issue here - Looks like its not possible to two icc
> handles to the same path.  Its causing double enumeration of the paths
> in the icc core and messing up path votes. With [1] Since opp/core
> already gets a handle to the icc path as part of table add,  drm/msm
> could do either
>
> a) Conditionally enumerate gpu->icc_path handle only when pm/opp core
> has not got the icc path handle. I could use something like [2] to
> determine if should initialize gpu->icc_path*
>
> b) Add peak-opp-configs in 845 dt and mandate all future versions to use
> this bindings. With this, I can remove gpu->icc_path from msm/drm
> completely and only rely on opp/core for bw voting.

The main thing is that we want to make sure newer dtb always works on
an older kernel without regression.. but, hmm..  I guess the
interconnects/interconnects-names properties haven't landed yet in
sdm845.dtsi?  Maybe that lets us go with the simpler approach (b).
Looks like we haven't wired up interconnect for 8916 or 8996 either,
so probably we can just mandate this for all of them?

If we have landed the interconnect dts hookup for gpu somewhere that
I'm overlooking, I guess we would have to go with (a) and keep the
existing interconnects/interconnects-names properties.

BR,
-R

> [1] - https://lore.kernel.org/patchwork/cover/1240687/
>
> [2] - https://patchwork.kernel.org/patch/11527573/
>
> Let me know your thoughts
>
> Sharat
>
> >
> >> Jordan
> >>
> >>>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> >>> --
> >>> 2.7.4
> >>>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >> _______________________________________________
> >> Freedreno mailing list
> >> Freedreno@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
