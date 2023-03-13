Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C856B8CDB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BC10E72C;
	Tue, 14 Mar 2023 08:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782D10E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 16:26:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id v10so5232549iox.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thegoodpenguin-co-uk.20210112.gappssmtp.com; s=20210112; t=1678724778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PHhWDKcc/4g7LbFUk2ZV/5DJVxQFs5FBp78FrEVEsg0=;
 b=Hr6Cw4ytYKUJTWvSxg1U7nAlsjp6167Nqxz9JuxIeryG9tD3O5+eNmxw1YXaqIOf/1
 nv4lDqlQuvLZV6JPZqOdmU4YRnLX2MvapiDNc2HvxcRoELDO+97WNlBA5179UyGfs1Pn
 bryQyJIOSYm5DWUNq/ygb7dDA+NbHUild9XN1MAo4122HyAmIWd93mFqpMfT8+9RHvyB
 ie5nP7PF0udge2NPlXf6YgjPoQ3EBzhTWyZ2Ky+9jutFG5P5EhcfGdDi2y+g83H1QbX5
 mKKLgkaVlxyUQgr/8xNmV8y5g2LKpGao3dptVtfUJU06+Vdm/vO1/fMx3FCcDrCYa7dg
 tfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678724778;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PHhWDKcc/4g7LbFUk2ZV/5DJVxQFs5FBp78FrEVEsg0=;
 b=cilGJeFLKPe5lbNm+2XR6cSLOHH1S1Kk+iCYVY9StL9iD/hc17YFHQHhTuIYu9FYxg
 CALLyNbW5Ad+Ki2Xeh0MqcJoYD+xEdbjEzGEeGQUHCfpZsay/pqUabZkf0aZIgVH6Nfa
 wr/RgjUEOE1qtwZnJrxoB+/ISfAx3RM8ZnMqkzNUQ+vG5Y8u3O5+iKM6ltLsct5lqLh5
 96tWc6yw7CsirnksM2WX71rc2ozemz0vuTg/KhzLfrPHKbXPtoNaeFs52JdCOHUbZ3G3
 uYiRU0AH3VlyNEWzm08jT0d50625Aptv2aR/cuoC+X3pg9MqZ+SzJPjMjt+iEIyBcKlh
 PJKw==
X-Gm-Message-State: AO0yUKUx3d+Rhjm4jUTto1d7P/l6iWpYIdk8m1ViRRlRxGNA9n1MaXRW
 vlhSk0CvtJFS/wjIvAxdbacs5zd/0Vj6Opvb2wf/Tw==
X-Google-Smtp-Source: AK7set9r6POQt9xI8LF3BfWVBC/5HKrTlIiPnbHSLmfFxHVLNfgnFo/GmxoyliLXeg2DaRWJ54blhdPG9QlplXNCbT4=
X-Received: by 2002:a6b:5b07:0:b0:745:44bb:ac22 with SMTP id
 v7-20020a6b5b07000000b0074544bbac22mr16106407ioh.1.1678724778250; Mon, 13 Mar
 2023 09:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230310170535.2971809-1-pzalewski@thegoodpenguin.co.uk>
In-Reply-To: <20230310170535.2971809-1-pzalewski@thegoodpenguin.co.uk>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 13 Mar 2023 16:26:07 +0000
Message-ID: <CALqELGxai7_54G8MPPwUcaDA2nt4U1ZZk8ATpk=O1Xa8-MVHLg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: add support for innolux at070tn83
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Mar 2023 08:16:08 +0000
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
Cc: thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023 at 17:06, Pawel Zalewski
<pzalewski@thegoodpenguin.co.uk> wrote:
>
> Add config for innolux at070tn83 [1] which is a 152x91 display.
> Tested on a stm32mp1 based platform.
>
> [1] https://elinux.org/images/0/07/AT070TN83.pdf
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 065f378bba9d..ad84e9b21299 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2120,6 +2120,31 @@ static const struct panel_desc innolux_at043tn24 = {
>         .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  };
>
> +static const struct drm_display_mode innolux_at070tn83_mode = {
> +       .clock = 40000,
> +       .hdisplay = 800,
> +       .hsync_start = 800 + 210,
> +       .hsync_end = 800 + 210 + 1,
> +       .htotal = 800 + 210 + 1 + 45,
> +       .vdisplay = 480,
> +       .vsync_start = 480 + 132,
> +       .vsync_end = 480 + 132 + 1,
> +       .vtotal = 480 + 132 + 1 + 22,
> +};
> +
> +static const struct panel_desc innolux_at070tn83 = {
> +       .modes = &innolux_at070tn83_mode,
> +       .num_modes = 1,
> +       .bpc = 6,
> +       .size = {
> +               .width = 152,
> +               .height = 91,
> +       },
> +       .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +       .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +       .connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>  static const struct drm_display_mode innolux_at070tn92_mode = {
>         .clock = 33333,
>         .hdisplay = 800,
> @@ -4095,6 +4120,9 @@ static const struct of_device_id platform_of_match[] = {
>         }, {
>                 .compatible = "innolux,at043tn24",
>                 .data = &innolux_at043tn24,
> +       }, {
> +               .compatible = "innolux,at070tn83",
> +               .data = &innolux_at070tn83,
>         }, {
>                 .compatible = "innolux,at070tn92",
>                 .data = &innolux_at070tn92,
> --
> 2.34.1
>
