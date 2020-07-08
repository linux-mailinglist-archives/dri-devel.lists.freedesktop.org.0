Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5741B21927F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 23:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239C26E939;
	Wed,  8 Jul 2020 21:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBF46E932;
 Wed,  8 Jul 2020 21:26:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l17so4721043wmj.0;
 Wed, 08 Jul 2020 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qs1xLfihy/FIc+IVG5SddHfJ1rcCZWUdNVY3LWJeZRU=;
 b=ORZIZAG1x7S6uF4K8Vfj60P3GDcpJM4asOrtUR9/AorjQ/UTT/oq4cH0/i5fmoOU02
 NfzyTIaGIfvvddHOpJEyr0x5znKU31x6dm9Zvw9X/zuyH4xFlcTIF/6PruNb2f4AFA11
 0PqkPRI8JnNFTvogwCPuPnstc/1OsbiLXN+Qp6E2zideXWPvbkLhFo/jY89aNHolFblX
 wdOIPWDEZ5l356gD+J2oHWrQi6xWqsy2nRBOOfjXtzt4QGyno7sjsvcoeEGfBIYOQkij
 DvfGtQmYc/YwjU8pKF8Fg2l/ls8waKTvj4MrmIJ7pbmoRiM9bZkKubHCJLVdJiFrBG3N
 kF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qs1xLfihy/FIc+IVG5SddHfJ1rcCZWUdNVY3LWJeZRU=;
 b=lZJ/dxOT7QLGtTAKctgiZsRoNLNijqp9bzEJDdh+QR4QnUmSP3WoGrnmEbdx/RMNhS
 Ll+CR1RoKC1bNyL+LJESTSlnqlKtQXCGrgKro3UBqJipAsOrWqWeVfVDxyZt8Q8DEd8p
 w1ZzGRa3i2USzBvQXqfBttvicfeOLIjgb9Bb7ce6rF4R25W6DDeE3Iz5D0yPnnEGlerV
 ZQdxhS3UWBNZIqmrbo6RnlvSfPNBSL7oo9M7Xz/2FGv6QBs8RE4fXlwhg0yeLhbmLn5p
 s2Z8o9lfN1y/bb1kcA6iZR+5Ojl93mUJfRyAa31ZJ45vCdeoKu+FTOdy1WA/Zo13dw7Y
 E/eg==
X-Gm-Message-State: AOAM5329u1mKLkDVzp7Lj5b2wUJygalkvzVUoetXjN6b9NPjWadRzrpr
 m4aOyMfbn5eedSM+uVAku+pODGqfnndEfDQ3PCY=
X-Google-Smtp-Source: ABdhPJxlRhk4Jlddk/ERDdjB0lo8SEEDKueLvjKWQXTS9B1Ra2Lomd6RyFpmddAxb9S5huyidcoLH+NKPczAltiEtg4=
X-Received: by 2002:a1c:3954:: with SMTP id g81mr11037143wma.73.1594243600056; 
 Wed, 08 Jul 2020 14:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200708164335.25097-1-hdegoede@redhat.com>
 <20200708164335.25097-2-hdegoede@redhat.com>
In-Reply-To: <20200708164335.25097-2-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jul 2020 17:26:29 -0400
Message-ID: <CADnq5_OKbv8kK_EOUd0b+SJ6e6LhwL7B_uX49YpNJ7A1828pZg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/connector: Fix kerneldoc warning
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sebastien Bacher <seb128@ubuntu.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 8, 2020 at 12:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Fix the following kerneldoc warning:
>
> drivers/gpu/drm/drm_connector.c:2189:
> warning: missing initial short description on line
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d877ddc6dc57..543086533850 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2130,8 +2130,8 @@ int drm_connector_set_panel_orientation(
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>
>  /**
> - * drm_connector_set_panel_orientation_with_quirk -
> - *     set the connecter's panel_orientation after checking for quirks
> + * drm_connector_set_panel_orientation_with_quirk - set the connecter's
> + *    panel_orientation after checking for quirks
>   * @connector: connector for which to init the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
