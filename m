Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D017827DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19E10E233;
	Mon, 21 Aug 2023 11:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642FD10E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 11:26:54 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-79b4d2c0621so661353241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1692617213; x=1693222013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQweSB9p5x5zw2Ntwmkzw5TwR7FXShxzU1EdWKawLYM=;
 b=mUkhrVmKi5g6KT8AQIPzesSpQcOlIKn7deqxTPTvuhA/LlTysRMOHnunvMFHKQIUqj
 nM4Emmc2akecQe0OG5LJ2F8SVLInSz8VZ6NP5Iz1lxG0XrBlBGZaeQqwyKFLYTg8I8cA
 BuGtuCIWZkysBAkdV8U2+GPPZ+jSDockvpQXe1SKGrfDlc/u/F8VepkKrv+RnP+PVF0/
 kwaSX5/jYjHclHmo2HWdRF5RkpspusAHhXiHluxXdV2uNlHTAbU3LuzqEXEuFQdfWp0u
 I77CqQFpnVF1XAWXQVvhQDfGHIrENi9XH1DlD4DmtGb57EuaJM5pGhhuhbUcItBlNxxa
 eRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692617213; x=1693222013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQweSB9p5x5zw2Ntwmkzw5TwR7FXShxzU1EdWKawLYM=;
 b=Zz5Nkoq4W6lfp5LtnMkKs0cOBGT2k7d72x4xgEhDA9kLNgqvrMRmeinfpMvGrpnjBE
 XTGG+p06/HqNvckU09pkiflGOwFdex9cSMoZJxlbQCYrW0Wpofjydm2UbR5YHe5qTiG/
 J22pmtDSwXAxJsek/RjMRN3O52Ww6iR9oLb59dU4Yur3zxv16W+9r9vCjWV3wDEkacFB
 RN67bwn/+3PxklMVgEq9gtg1eqMbYw9pf8BZd40OgKKu6xsnNt+Io3Kgzx4CrJMukBMc
 Il6j4nd1yytaLQfd8P8YcuOy8euezMQywaS9CSb00sAHlUIVEYwuMauFvrrWfhbFyXyE
 yIVg==
X-Gm-Message-State: AOJu0YwNKqxDkTqu0IeCVKEFnM0K0OH106a6KoFZG1cBZxADJr3nGTD9
 T4PC9UfoRVgSBukL3trTrneod4mm3DCyxXmBH4a6vQ==
X-Google-Smtp-Source: AGHT+IH1WohFwbV87N0flbmQLLGc0pmH1ostods2crtfhYOlROCT28GQIIHF0NrkZU7PH7ZKQtocXHJunhNN1gAHGFo=
X-Received: by 2002:a67:e25a:0:b0:447:ba75:9c81 with SMTP id
 w26-20020a67e25a000000b00447ba759c81mr2408427vse.28.1692617213324; Mon, 21
 Aug 2023 04:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
 <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
 <118d00df-131b-4ea6-98eb-bb39424ffb72@linaro.org>
In-Reply-To: <118d00df-131b-4ea6-98eb-bb39424ffb72@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 21 Aug 2023 12:26:38 +0100
Message-ID: <CAPY8ntC2Zf=dYw45r9a8R9CJpS5AbiOdyi7HWr6tX5MMbKLinA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 quic_parellan@quicinc.com, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On Fri, 18 Aug 2023 at 11:27, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 18/08/2023 11:25, neil.armstrong@linaro.org wrote:
> > Hi Dmitry,
> >
> > On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> >> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> >>> Hi Abhinav,
> >>>
> >>> On 14/08/2023 20:02, Abhinav Kumar wrote:
> >
> > <snip>
> >
> >>>
> >>> Sending HS commands will always work on any controller, it's all
> >>> about LP commands.
> >>> The Samsung panels you listed only send HS commands so they can use
> >>> prepare_prev_first
> >>> and work on any controllers.
> >>
> >> I think there is some misunderstanding there, supported by the
> >> description of the flag.
> >>
> >> If I remember correctly, some hosts (sunxi) can not send DCS commands
> >> after enabling video stream and switching to HS mode, see [1]. Thus,
> >> as you know, most of the drivers have all DSI panel setup commands in
> >> drm_panel_funcs::prepare() / drm_bridge_funcs::pre_enable() callbacks,
> >> not paying attention whether these commands are to be sent in LP or in
> >> HS mode.
> >>
> >> Previously DSI source drivers could power on the DSI link either in
> >> mode_set() or in pre_enable() callbacks, with mode_set() being the
> >> hack to make panel/bridge drivers to be able to send commands from
> >> their prepare() / pre_enable() callbacks.
> >>
> >> With the prev_first flags being introduced, we have established that
> >> DSI link should be enabled in DSI host's pre_enable() callback and
> >> switched to HS mode (be it command or video) in the enable() callback.
> >>
> >> So far so good.
> >
> > It seems coherent, I would like first to have a state of all DSI host
> > drivers and make this would actually work first before adding the
> > prev_first flag to all the required panels.
> >
> >>
> >> Unfortunately this change is not fully backwards-compatible. This
> >> requires that all DSI panels sending commands from prepare() should
> >> have the prepare_prev_first flag. In some sense, all such patches
> >> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first
> >> flag to drm_panel").
> >
> > This kind of migration should be done *before* any possible regression,
> > not the other way round.
> >
> > If all panels sending commands from prepare() should have the
> > prepare_prev_first flag, then it should be first, check for regressions
> > then continue.
> >
> > <snip>
> >
> >>>
> >>> I understand, but this patch doesn't qualify as a fix for
> >>> 9e15123eca79 and is too late to be merged in drm-misc-next for v6.6,
> >>> and since 9e15123eca79 actually breaks some support it should be
> >>> reverted (+ deps) since we are late in the rc cycles.
> >>
> >> If we go this way, we can never reapply these patches. There will be
> >> no guarantee that all panel drivers are completely converted. We
> >> already have a story without an observable end -
> >> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >
> > I don't understand this point, who would block re-applying the patches =
?
>
> Consider us reverting 9e15123eca79 now and then reapplying it next
> cycle. Then another panel / bridge that was not converted to use
> pre_enable_prev_first pops up. And suddently we have to revert them again=
.
>
> > The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over multiple
> > Linux version and went smoothly because we reverted
> > regressing patches and restarted when needed, I don't understand why we
> > can't do this here aswell.
>
> With DRM_BRIDGE_ATTACH_NO_CONNECTOR both host and peripheral drivers
> were involved. This way they share knowledge about the migration state.
>
> With prev_first we do not have such shared knowledge. Host assumes that
> it can work according to the documentation: turn DSI link to LP-11 in
> pre_enable(), switch to HS in enable(). It can not check whether the
> next bridge did not set pre_enable_prev_first because of it not being
> required (like for the Parade bridge) or because next bridge is not
> converted yet (and thus DSI host should power up the link in
> atomic_mode_set).
>
> Granted that there is no way for the DSI host driver to attune itself to
> the DSI peripheral driver requirements, I can only consider
> corresponding (requiring prev_first) panel drivers broken since
> 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel") and
> all bridge drivers with this issue broken since 4fb912e5e190
> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order"=
).

Can I point out that even prior to 5ea6b1702781 the docs stated [1]

"Also note that those callbacks can be called no matter the state the
host is in. Drivers that need the underlying device to be powered to
perform these operations will first need to make sure it=E2=80=99s been
properly enabled."

added in bacbab58f09dc. So your DSI host driver isn't working in the
documented manner prior to 5ea6b1702781, therefore 5ea6b1702781
doesn't cause a regression in itself, and there was no direct
requirement for 5ea6b1702781 to add the flag to all panels.

Looking at JDI LT070ME05000 [2], the backlight is controlled via DCS
commands, therefore transfer can be called at any time to change or
read the backlight intensity, not just between pre_enable and
post_disable.


5ea6b1702781 and 4fb912e5e190 were largely trying to address the
requirements of devices such as TI's SN65DSI83 that require the DSI
data lanes to be in LP-11 before the bridge is brought out of reset
otherwise they malfunction. Being able to add better definition over
when the DSI host needs to be powered up/down is a bonus, but it
doesn't trump the requirement for transfer to be callable at any time.

  Dave

[1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#c.mipi_=
dsi_host_ops
[2] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/panel/pan=
el-jdi-lt070me05000.c


> >
> >>
> >> I'd consider that the DSI driver is correct here and it is about the
> >> panel drivers that require fixes patches. If you care about the
> >> particular Fixes tag, I have provided one several lines above.
> >
> > Unfortunately it should be done in the other way round, prepare for
> > migration, then migrate,
> >
> > I mean if it's a required migration, then it should be done and I'll
> > support it from both bridge and panel PoV.
> >
> > So, first this patch has the wrong Fixes tag, and I would like a better
> > explanation on the commit message in any case.
> > Then I would like to have an ack from some drm-misc maintainers before
> > applying it because it fixes a patch that
> > was sent via the msm tree thus per the drm-misc rules I cannot apply it
> > via the drm-misc-next-fixes tree.
> >
> > Neil
> >
> > <snip>
> >
>
> --
> With best wishes
> Dmitry
>
