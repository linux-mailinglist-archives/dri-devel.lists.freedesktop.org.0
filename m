Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A82672A92
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 22:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EAD10E843;
	Wed, 18 Jan 2023 21:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9A610E843
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 21:34:24 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id q141so14489421vkb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lVS/NpDaaL5u1HrOH58OmL5iaK3Ar8XB2wiyBVMcnhM=;
 b=lOBqJ+xmUB4+8ymAKDe/h/gitreW9zu3XVQVPwxBGccDmm35qm0ekH8pIVbQ/SSCY2
 599IakA7d7M/OrTGZk63miTsWCEMTVWvjpzkQkss8MvBjGQF0yKDz12O7uLkr2gOQn2m
 jAkZaqXlsGpbuQW6IMFzx90912tCY0IQvncT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVS/NpDaaL5u1HrOH58OmL5iaK3Ar8XB2wiyBVMcnhM=;
 b=CYLefL74JzFe8d8l2V2UhmUSdaZmBoIE0Dn9Oew3WKh0L85NUpzJHpVKUuOhh5efh6
 lkZ4wPI36QqzUbv4UzvTprmwbTbo3WfGBY9iT8FoOZrSHwZDbiVLxX3I1wjs/UcBu0aO
 +b+lCaNzb49YaUIQaURFvc5rj3VKw6gLiUW3Wx5QwagkMzCJNnnwrf10/ycCE2PDE5He
 jHcotjBkLjTu8WK++uzuj1dMAUZOQtx0uD5Nyap2I1kjKmmjkFPZhbPuUCA0lABJ2TkV
 peBLq4DbeKeWyhfO4/oFTylJZMAQnSabfupUBp7hfmh03cijQ+4ZUkRXN5Ss0Kn+cjcn
 P7TQ==
X-Gm-Message-State: AFqh2ko6sQQHlo4ay1LboBDALlBJH4hMDvFwinISjriCkT/L1XwJ+UxX
 8gN6iHpTb4iv+f+ZWXCxoaiVQ0UDD4nH7fUC
X-Google-Smtp-Source: AMrXdXuua/gdza11UKK6dIVVFr14UvubYctOdwaXVCuV4kl6KFktNJ+t1LXXqBBaV2RrO3I9Iwk8rg==
X-Received: by 2002:a05:6122:985:b0:3e1:5763:3c49 with SMTP id
 g5-20020a056122098500b003e157633c49mr9142636vkd.13.1674077663062; 
 Wed, 18 Jan 2023 13:34:23 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 p64-20020a1fa643000000b003e1753368e0sm869913vke.27.2023.01.18.13.34.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 13:34:20 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id i185so164527vsc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:34:19 -0800 (PST)
X-Received: by 2002:a67:e109:0:b0:3d0:dcbb:2004 with SMTP id
 d9-20020a67e109000000b003d0dcbb2004mr1126577vsl.43.1674077659353; Wed, 18 Jan
 2023 13:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20230106030108.2542081-1-swboyd@chromium.org>
In-Reply-To: <20230106030108.2542081-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Jan 2023 13:34:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
Message-ID: <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 5, 2023 at 7:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The unprepare sequence has started to fail after moving to panel bridge
> code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
>
>    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
>
> This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> to set the panel into sleep mode. Performing those writes in the
> unprepare phase of bridge ops is too late, because the link has already
> been torn down by the DSI controller in post_disable, i.e. the PHY has
> been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> on the DSI .
>
> Split the unprepare function into a disable part and an unprepare part.
> For now, just the DSI writes to enter sleep mode are put in the disable
> function. This fixes the panel off routine and keeps the panel happy.
>
> My Wormdingler has an integrated touchscreen that stops responding to
> touch if the panel is only half disabled too. This patch fixes it. And
> finally, this saves power when the screen is off because without this
> fix the regulators for the panel are left enabled when nothing is being
> displayed on the screen.
>
> Fixes: 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 857a2f0420d7..c924f1124ebc 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1193,14 +1193,11 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
>         return 0;
>  }
>
> -static int boe_panel_unprepare(struct drm_panel *panel)
> +static int boe_panel_disable(struct drm_panel *panel)
>  {
>         struct boe_panel *boe = to_boe_panel(panel);
>         int ret;
>
> -       if (!boe->prepared)
> -               return 0;
> -
>         ret = boe_panel_enter_sleep_mode(boe);
>         if (ret < 0) {
>                 dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> @@ -1209,6 +1206,16 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>
>         msleep(150);
>
> +       return 0;
> +}
> +
> +static int boe_panel_unprepare(struct drm_panel *panel)
> +{
> +       struct boe_panel *boe = to_boe_panel(panel);
> +
> +       if (!boe->prepared)
> +               return 0;
> +
>         if (boe->desc->discharge_on_disable) {
>                 regulator_disable(boe->avee);
>                 regulator_disable(boe->avdd);
> @@ -1528,6 +1535,7 @@ static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *pa
>  }
>
>  static const struct drm_panel_funcs boe_panel_funcs = {
> +       .disable = boe_panel_disable,
>         .unprepare = boe_panel_unprepare,
>         .prepare = boe_panel_prepare,
>         .enable = boe_panel_enable,

As mentioned by Stephen, my initial reaction was that this felt
asymmetric. We were moving some stuff from unprepare() to disable()
and it felt like that would mean we would also need to move something
from prepare() to enable. Initially I thought maybe that "something"
was all of boe_panel_init_dcs_cmd() but I guess that didn't work.

I don't truly have a reason that this _has_ to be symmetric. I was
initially worried that there might be some place where we call
pre_enable(), then never call enable() / disable(), and then call
post_disable(). That could have us in a bad state because we'd never
enter sleep mode / turn the display off. However (as I think I've
discovered before and just forgot), I don't think this is possible
because we always call pre-enable() and enable() together. Also, as
mentioned by Sam, we're about to fully shut the panel's power off so
(unless it's on a shared rail) it probably doesn't really matter.

Thus, I'd be OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm also happy to land this (adding Cc: stable) to drm-misc-fixes if
nobody has any objections (also happy if someone else wants to land
it). I guess the one worry I have is that somehow this could break
something for one of the other 8 panels that this driver supports (or
it could have bad interactions with the display controller used on a
board with one of these panels?). Maybe we should have "Cc: stable"
off just to give it extra bake time? ...and maybe even push to
drm-misc-next instead of -fixes again to give extra bake time?


In any case, I still wanted to look closer. I'll repeat my constant
refrain that I'm no expert here, so call me out if I say anything too
stupid.

As far as I can tell, boe_panel_enter_sleep_mode() does a bunch of
things that have no true opposite in the driver. Let me paste it here
for reference since Stephen's patch didn't touch it:

> static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
> {
>     struct mipi_dsi_device *dsi = boe->dsi;
>     int ret;
>
>     dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

The above line is particularly concerning. Since there's no opposite
anywhere, I'm going to assume that the panels in this file that use
"LPM" end up not using LPM after the first suspend/resume cycle.
Almost all other panel drivers that clear this flag only do so
temporarily. Seems like maybe this was an oversight in the initial
commit a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga
dsi video mode panel")? Nothing new, but maybe we should fix it?


>     ret = mipi_dsi_dcs_set_display_off(dsi);
>     if (ret < 0)
>         return ret;
>
>     ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>     if (ret < 0)
>         return ret;

The first of these two (set_display_off) seems quite safe and matches
well with the concept of "disable". We're basically blacking the
screen, I imagine. I then wondered: where do we turn the display on?
It seems like there should be a call to mipi_dsi_dcs_set_display_on(),
right?

Digging a little, there actually is, at least for 3 of the 9 panels
that this driver supports. It's hidden in the giant blob of "DCS"
commands. Specifically, this magic sequence:

_INIT_DELAY_CMD(...),
_INIT_DCS_CMD(0x11),
_INIT_DELAY_CMD(...),
_INIT_DCS_CMD(0x29),
_INIT_DELAY_CMD(...),

The 0x11 there is mipi_dsi_dcs_exit_sleep_mode() and the 0x29 there is
mipi_dsi_dcs_set_display_on()

Now, I'd have to ask why the other 6 of 9 panels _don't_ have those
commands and how the display gets turned on / pulled out of sleep
mode. Maybe they just come up that way? It does feel likely that we
could probably:

a) Parameterize the delays

b) Remove the hardcoded 0x11 and 0x29 from the dcs command blob and
add calls to mipi_dsi_dcs_exit_sleep_mode() /
mipi_dsi_dcs_set_display_on()

c) At least add the mipi_dsi_dcs_set_display_on() to the "enable" call
and then see if mipi_dsi_dcs_exit_sleep_mode() worked in enable() or
if that was important to keep in prepare().

Even if we eventually are able to revert Stephen's patch once we have
the power sequence ordering series, it still might be nice to make the
enable/exit of sleep mode explicit instead of hidden in the DCS
command blob.

-Doug
