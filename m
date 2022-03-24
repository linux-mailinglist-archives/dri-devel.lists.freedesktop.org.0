Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6674E6412
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 14:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D8810E94F;
	Thu, 24 Mar 2022 13:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DFB10E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:27:52 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id gb19so4731274pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35DPDgwgR7o28S5QkagymkokXPJZP06Ii37nZqLEji8=;
 b=TVmJKgB/OzleOMpj1pIVXCTYSugZonqt1iUBoppqzRKjaqxEB1Z4oZpJ1y3TllNPxL
 ZlpC4VhRzwN6c44GQ/VJ0PJWp0h8KnNkDtiLIkrO5nK6qC09V7qpMKQo70feblyeZO/B
 kQt3XHgxv80rA6j4naLrW7VHjmAO/FUbWfNTHF46w+WzVx8y7mkh9LnnXpfwVdEj6k7r
 8bFQqq2wXr9+Z7t3qcQSw+WEJve5WbedHcwQeMbztO0em9qplQPr4vZUTb8Tv0qSvDdT
 gT7NZwSf/C8KzyY64NkxnzHIydjlC0EsTyMo1gs1PgqLY3NJkSEzr/DAmz8BQIgk5Gop
 DU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35DPDgwgR7o28S5QkagymkokXPJZP06Ii37nZqLEji8=;
 b=Z1r3y0H3Nz7j7ySuVygb7dmoMss+CYlQPWNb935HC0tlse9RfymMD9Xwk5IjSeS6ga
 3YoVtGJb4pk6hnjZwheZhhCYg5UJLmONCIY75F+K4wm+BMV4zjABcT3JuSonL7LcyzFJ
 TUKTP6BxAsS8b/9Zw2Mudi+ijHCWPavKFL4nrBffHEgqhDtCVq7XFis1iP70Wp7qwwTN
 BRyqRPrT8zBls7hTYN6q7Sw2E/yb8XPwlB3jOY1+XIao2ofudAf4yfXd18sFWYEEqIhF
 TsnQ8XoRfjPuM5TT0MdSuUXcZIu8ACeo73UITnZxxKXri9Wlet7t1F5lcH8KkC39trEf
 3Ssg==
X-Gm-Message-State: AOAM532xA9qK4/q2My5fqhjjGM219Y5YmGYdEVG7x5NvY3Z2Oc1ElyFL
 yY5/u7jZOtrTsenoAZ2mRj8BbFz1RH/Qn9yOP30=
X-Google-Smtp-Source: ABdhPJxeqBu7n+Zf/rPdKKKFm/6W80UtX3/8NZoJ6RYIq0AE4XmWppWuTad4TO8fH+1z2oKV+zytXS6quAtYCAL+X68=
X-Received: by 2002:a17:902:70c1:b0:154:667f:e361 with SMTP id
 l1-20020a17090270c100b00154667fe361mr6041346plt.148.1648128471988; Thu, 24
 Mar 2022 06:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <1648112848-29052-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1648112848-29052-1-git-send-email-baihaowen@meizu.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 24 Mar 2022 14:27:40 +0100
Message-ID: <CAMeQTsZ3bxs=3o0-WvXa8RYY83BVn9X-m9TSkqmxTpHxpYS1_g@mail.gmail.com>
Subject: Re: [PATCH] drm: gma500: clean up some style problems reported by
 checkpatch.pl
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 10:16 AM Haowen Bai <baihaowen@meizu.com> wrote:
>
> WARNING: Statements should start on a tabstop
>
> WARNING: Missing a blank line after declarations
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Hi, thanks for the patch.

> ---
>  drivers/gpu/drm/gma500/mid_bios.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
> index 7e76790..71942c2 100644
> --- a/drivers/gpu/drm/gma500/mid_bios.c
> +++ b/drivers/gpu/drm/gma500/mid_bios.c
> @@ -50,8 +50,8 @@ static void mid_get_fuse_settings(struct drm_device *dev)
>         DRM_INFO("internal display is %s\n",
>                  dev_priv->iLVDS_enable ? "LVDS display" : "MIPI display");
>
> -        /* Prevent runtime suspend at start*/
> -        if (dev_priv->iLVDS_enable) {
> +       /* Prevent runtime suspend at start*/

There should also be a space between "start" and "*/" at the end of the line

-Patrik

> +       if (dev_priv->iLVDS_enable) {
>                 dev_priv->is_lvds_on = true;
>                 dev_priv->is_mipi_on = false;
>         } else {
> @@ -325,6 +325,7 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
>  int mid_chip_setup(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +
>         mid_get_fuse_settings(dev);
>         mid_get_vbt_data(dev_priv);
>         mid_get_pci_revID(dev_priv);
> --
> 2.7.4
>
