Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5D358D2A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 21:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CABE6E30D;
	Thu,  8 Apr 2021 19:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2E86E30D;
 Thu,  8 Apr 2021 19:01:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so3459121wmy.5; 
 Thu, 08 Apr 2021 12:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NnWJUfUTIh3u8nCF0Cg0RNwJAmxoBSfV+wR+N8grRfo=;
 b=gTNG+oUxfB1lBWblc+1iGXKmk8VmCmuOH+3Uo0cG6t+Heun3HuPfTvlLfpDxo8XOMa
 E4qsgUxu1LqcuAL22yyGc6CDeVxiIwkIyomG7tDCHUMMTMiOel94LNcT80UV2OtRI4n/
 WZJ3jItW/sJeFyif+4E6M0Ww3H4eLNUoBRtEx3n97YMTfcDvCdpOW0IBPhLZh4RTm46K
 tJErmbrFJYa4ucx8cvpO7BszlaKED375GDf47CycUqDAh0Rt+3iCl87wtynxBZtlJQBs
 lcpd58IuxGefRbnhsxUSdusaGabeOfFipuqM+3+YwHaal3LKCqBQ3Z5SXhFMoYBD09Uz
 8ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NnWJUfUTIh3u8nCF0Cg0RNwJAmxoBSfV+wR+N8grRfo=;
 b=i4vl0vy2KG6AuHzybDaHG8416kLJ87gcG28WJR/h3ZPGkGGk39JEYUuC8GxbNg2Ame
 BaT4JpE5+eMc+6G7UihqJuZWDyZCVYsUxPnPBp7+3Ic93wGei8BP1t1zvQuDVil/cCgH
 PNw7cKTU9Y+76AIj2C1qLAx6IcCckL7DbJ/S9v9thCZqIZUcL6oehtBRohjqxlor+LrY
 a6JpNhwq3xYy4Q5xr43Uk2YVlheO48hK7MWPl8mrVZUuI04lUaMwGsCEzvmc+4qxGFY1
 lfxo0o/y9TwMADnNCq77RHY93EqB6XIL8W9tfHMtTUnDe7JuD71I7UPnATEiqWkWL7rI
 I5KQ==
X-Gm-Message-State: AOAM5328gamj+VbFRzztuKg96llq1Lgj0A2Q8bFlTJeAHGNdxk3R+IRK
 PaWZiXLg77zNa9NoWDJNcbAEYNXJDl+cBgn4S8FZZmCW5hQ=
X-Google-Smtp-Source: ABdhPJxzohFyh4w2rfcJerLxwyjcjUnXYdLKatqyj01doNPYuzMekUXFYWQWCFIER5N1pkvQFTNp+IWSSEXSPFTXttQ=
X-Received: by 2002:a7b:c012:: with SMTP id c18mr8141515wmb.94.1617908494935; 
 Thu, 08 Apr 2021 12:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
 <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
 <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
In-Reply-To: <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 Apr 2021 12:05:02 -0700
Message-ID: <CAF6AEGuoLgBSZOou1TSb-d2o6tHS-L-E7AQLS5RM4aOogvRG7Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Martin Botka <martin.botka@somainline.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 7, 2021 at 12:11 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 07/04/21 20:19, abhinavk@codeaurora.org ha scritto:
> > Hi Marijn
> >
> > On 2021-04-06 14:47, Marijn Suijten wrote:
> >> Leaving this at a close-to-maximum register value 0xFFF0 means it takes
> >> very long for the MDSS to generate a software vsync interrupt when the
> >> hardware TE interrupt doesn't arrive.  Configuring this to double the
> >> vtotal (like some downstream kernels) leads to a frame to take at most
> >> twice before the vsync signal, until hardware TE comes up.
> >>
> >> In this case the hardware interrupt responsible for providing this
> >> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic at
> >> all.  This solves severe panel update issues observed on at least the
> >> Xperia Loire and Tone series, until said gpio is properly hooked up to
> >> an irq.
> >
> > The reason the CONFIG_HEIGHT was at such a high value is to make sure that
> > we always get the TE only from the panel vsync and not false positives
> > coming
> > from the tear check logic itself.
> >
> > When you say that disp-te gpio is not hooked up, is it something
> > incorrect with
> > the schematic OR panel is not generating the TE correctly?
> >
>
> Sometimes, some panels aren't getting correctly configured by the
> OEM/ODM in the first place: especially when porting devices from
> downstream to upstream, developers often get in a situation in which
> their TE line is either misconfigured or the DriverIC is not configured
> to raise V-Sync interrupts.
> Please remember: some DDICs need a "commands sequence" to enable
> generating the TE interrupts, sometimes this is not standard, and
> sometimes OEMs/ODMs are not even doing that in their downstream code
> (but instead they work around it in creative ways "for reasons", even
> though their DDIC supports indeed sending TE events).
>
> This mostly happens when bringing up devices that have autorefresh
> enabled from the bootloader (when the bootloader sets up the splash
> screen) by using simple-panel as a (hopefully) temporary solution to get
> through the initial stages of porting.
>
> We are not trying to cover cases related to incorrect schematics or
> hardware mistakes here, as the fix for that - as you know - is to just
> fix your hardware.
> What we're trying to do here is to stop freezes and, in some cases,
> lockups, other than false positives making the developer go offroad when
> the platform shows that something is wrong during early porting.
>
> Also, sometimes, some DDICs will not generate TE interrupts when
> expected... in these cases we get a PP timeout and a MDP5 recovery: this
> is totally avoidable if we rely on the 2*vtotal, as we wouldn't get
> through the very time consuming task of recovering the entire MDP.
>
> Of course, if something is wrong in the MDP and the block really needs
> recovery, this "trick" won't save anyone and the recovery will anyway be
> triggered, as the PP-done will anyway timeout.

So, is this (mostly) a workaround due to TE not wired up?  In which
case I think it is ok, but maybe should have a comment about the
interaction with TE?

Currently I have this patch in msm-next-staging but I guess we need to
decide in the next day or so whether to drop it or smash in a comment?

BR,
-R

> >>
> >> Suggested-by: AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@somainline.org>
> >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Reviewed-by: AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@somainline.org>
> >> ---
> >>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> >> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> >> index ff2c1d583c79..2d5ac03dbc17 100644
> >> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> >> @@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct
> >> drm_encoder *encoder,
> >>
> >>      mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CONFIG_VSYNC(pp_id), cfg);
> >>      mdp5_write(mdp5_kms,
> >> -        REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), 0xfff0);
> >> +        REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), (2 * mode->vtotal));
> >>      mdp5_write(mdp5_kms,
> >>          REG_MDP5_PP_VSYNC_INIT_VAL(pp_id), mode->vdisplay);
> >>      mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_IRQ(pp_id),
> >> mode->vdisplay + 1);
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
