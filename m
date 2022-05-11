Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E1524009
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 00:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2635210E885;
	Wed, 11 May 2022 22:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4079D10E87D;
 Wed, 11 May 2022 22:07:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so4043497wms.3; 
 Wed, 11 May 2022 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfZBJpcBKwzYlb0zHDiPNCx0eBqvHT03lQUdHD5aVVY=;
 b=n1cMNMAQ8Zb9JwAUxDKyG7Pj/gARe2P0nrj210PR2QUhgCo9mgyRtDxZkOM22EAA2G
 zV+08saZbiWtizTl6bqWjhiAMR94tL+YeiNPxVSKm38pOOureQtcf8yDbU2xJnmatCUi
 TjgjCVYPr4jCrGj7UvZCQiY92/YHiM/9Mi/vqJPJ6sZKKkTF5a7G2r1zW/tyPPxr20wv
 za03tj7WeH0MzBlVElobHNh9kPS7bQUEAuBOsduVQEMPHcaxCJY1sa5Aj5sgC6ueTW+I
 3OuFKglwgHqRz4Ootsdh6XRSHcNbIJ5x01B+GM46rZBwT0tHjsZATZTSnCjK3/GnLg6C
 rd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfZBJpcBKwzYlb0zHDiPNCx0eBqvHT03lQUdHD5aVVY=;
 b=PANwKUxrOFC1H/rd2sniXBu6DRhypXY/6VxCLZ37tB9dxr7iFss8RxWM2UTixE9AXS
 eUhNIIjBxfDIgJgz6S8tNpyIQJgNIokwCs0gDRSV0Y7EWHun1U3bKW8xleiEyZLaPdR0
 ZIts4qvNdSiq2kZh7RqBDclLn2XtoMaNyg/aczdJWG+yzYqr4Z86HJ6Mx1kYub3UyTPy
 X3zZQDopg8Qj0oIF0hq2EpnUnxjTE9Fwp+sIdiNqd8IW2YR0w3g5BYlXZG1tXAeAfQYG
 qmnT+Mndg5nor9vuLZZah4HWLamuTweP9jGd6Adx/UDWJp8R1uT8Yw+OlaY6jpyj1WZ6
 vPIQ==
X-Gm-Message-State: AOAM5310TbZ6oNuMB0iwbqTTUqCd47t4pu1e/ofYaefCuss1BWGbxJVf
 1kg860hXxN9r+Xg2PsEtuzMZJetK7jYFrSnacQY=
X-Google-Smtp-Source: ABdhPJwWomw4prnLDCs+S4DzNmAEc7VxbOCHvGXvax2SPGQmwUjAvcUMs3e3/H++RTrNg7BehTEQhGI4zNVY44m4Kko=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr6929365wmh.59.1652306836492; Wed, 11
 May 2022 15:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
 <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
 <15f9df0b-3228-af8f-f123-b5d10eb1bacb@linaro.org>
In-Reply-To: <15f9df0b-3228-af8f-f123-b5d10eb1bacb@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 15:07:07 -0700
Message-ID: <CAF6AEGuD05pLUELrc9Hzy_htrczKDtxe8dv6dp6uw9msGXkcGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 2:49 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 11/05/2022 23:06, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Dec 7, 2021 at 2:29 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> The DSI subsystem does not fully fall into the pre-enable/enable system
> >> of callbacks, since typically DSI device bridge drivers expect to be
> >> able to communicate with DSI devices at the pre-enable() callback. The
> >> reason is that for some DSI hosts enabling the video stream would
> >> prevent other drivers from sending DSI commands. For example see the
> >> panel-bridge driver, which does drm_panel_prepare() from the
> >> pre_enable() callback (which would be called before our pre_enable()
> >> callback, resulting in panel preparation failures as the link is not yet
> >> ready).
> >>
> >> Therewere several attempts to solve this issue, but currently the best
> >> approach is to power up the DSI link from the mode_set() callback,
> >> allowing next bridge/panel to use DSI transfers in the pre_enable()
> >> time. Follow this approach.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
> >>   1 file changed, 31 insertions(+), 12 deletions(-)
> >
> > I happened to be testing today on one of the sc7180-trogdor variants
> > that has a parade-ps8640 bridge chip in it and ran into problems. A
> > bisect pointed to this patch and, sure enough, reverting it fixes me
> > again.
> >
> > The Chromebook in question is able to power the screen on at bootup
> > but things don't work so well in other cases. Specifically, if I leave
> > the Chromebook idle then it will turn the screen off (but in this
> > case, not enter S3). Hitting a key should wake the screen up, but it
> > doesn't.
> >
> > None of the error prints in dsi_mgr_bridge_power_on() are hitting when
> > it fails and I even added extra error prints. It's not hitting any of
> > the early returns.
> >
> > I did a little bit more debugging and it appears that nothing funny is
> > going on. It's just the ordering difference that matters. With the
> > patch reverted, I see this and it all works:
> >
> > boot:
> > [    9.653801] DOUG: dsi_mgr_bridge_mode_set
> > [    9.658687] DOUG: ps8640_pre_enable
> > [    9.664194] DOUG: dsi_mgr_bridge_pre_enable
> >
> > screen turns off:
> > [   82.130038] DOUG: dsi_mgr_bridge_post_disable
> > [   82.166817] DOUG: ps8640_post_disable
> >
> > screen turns on:
> > [   92.611846] DOUG: dsi_mgr_bridge_mode_set
> > [   92.617875] DOUG: ps8640_pre_enable
> > [   92.920237] DOUG: dsi_mgr_bridge_pre_enable
> >
> > Without the patch reverted, I see this and it fails:
> >
> > boot:
> > [   10.817810] DOUG: dsi_mgr_bridge_mode_set
> > [   10.822128] DOUG: dsi_mgr_bridge_power_on
> > [   10.852131] DOUG: ps8640_pre_enable
> > [   10.857942] DOUG: dsi_mgr_bridge_pre_enable
> >
> > screen turns off:
> > [   34.819953] DOUG: dsi_mgr_bridge_post_disable
> > [   34.883777] DOUG: ps8640_post_disable
> >
> > screen should turn on, but doesn't:
> > [   46.193589] DOUG: dsi_mgr_bridge_mode_set
> > [   46.197951] DOUG: dsi_mgr_bridge_power_on
> > [   46.248438] DOUG: ps8640_pre_enable
> > [   46.541700] DOUG: dsi_mgr_bridge_pre_enable
> >
> > Unfortunately, ps8640 is a pretty big black box. The Linux kernel
> > driver does almost nothing at all and the parade bridge chip has a
> > bunch of magic firmware on it. Though I don't know for sure, I assume
> > that this magic firmware simply can't handle the fact that the MIPI
> > side is already setup / running when the bridge is powered on.
> >
> > Rather than this patch, maybe you can jump on Dave Stevenson's patch
> > series [1] which I believe would solve this problem in a more dynamic
> > way? Would you accept a revert of ${SUBJECT} patch to fix my problem?
>
> I'm fine with the revert, but it will depend on [1]. Otherwise other
> MIPI DSI bridges are broken (see the discussion at [2]).

heh, well the problem is that MIPI DSI bridges, or at least one of
them, is broken *without* the revert ;-)

[1] looks like a bit much for -fixes, so I'd be inclined to revert
this patch and at least go back to the broken/working state from
before for the time being..

BR,
-R

> > [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
>
> [2]
> https://lore.kernel.org/all/CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com/
>
>
> --
> With best wishes
> Dmitry
