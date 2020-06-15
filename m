Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5811FA313
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC456E53E;
	Mon, 15 Jun 2020 21:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51696E54C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 21:51:18 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id o15so507695vsp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgketSwNHBH9JjKBViUJC5dtablUpG9gaeko3bA7e1g=;
 b=kF+GOarzfpIuy/JohE32cXP4Vd2JnpxHM6h0pYme+S7/RWHhC/TmS14r6nlHzUA7+H
 s338WjKce/rQdZZlsDASW3HB7VCWcETvbyXs5Ia+aeWjOfo2+BUJGG2Fxb36GrbjhXrp
 jSuaGAHywJk+9Yvu636+61kzkxBZNPZywBqUJLXOBQfAwAhROHIsoXp6Du9Z6Mtqxc96
 AmJxrsalGzepTrvbjQHDzP3eAh6alhDAJx2EhVaWiQWYgykER/4i2ofnR1OF7vVHz4q/
 +pBMozwuGP4nTI9vBVOIcndY/I2eL2OkLca321sNh+qPYUJM6wM03a2MSLl/2VkmBCmS
 /DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgketSwNHBH9JjKBViUJC5dtablUpG9gaeko3bA7e1g=;
 b=lg72gJK/ptUqoNHVXJziCerkQ0H0oQ3NMBZRYX4LCxcsLonlXB9eHjC6skApVWHXaG
 hzaF+z0IIgoa/c81o8a0K4IOdMI/GABGH4LYZnWzb8oRXSsaStkkgN7X1fU8T03L8SHr
 To1mwOD4RRq4H4pezBoxErglreXr1pTL7aB2g10e5600zKgz/wxVT+qtZp5TCHMMGEwR
 sC3IxJYD+LTeNpjQlYfiYDhJW3EaNSVvtW9OGw2KBw8A3VFirKLfVhV7TbWrxdt6koM4
 Vs0aUoNhSiuIR7iAJ2oysFir3dJG0bL7i19JNmABSqkDVlqN53Ql5FnZUwEXvzQwlx9T
 i6gw==
X-Gm-Message-State: AOAM530jhY2ZNq4x+/637HOBOzGw96R+vqyBDnBnc3UaXRN3IKp15Q2v
 pFwBOTULNeTZEZjl/EVe/lg3kgO+dVGWShc+bws=
X-Google-Smtp-Source: ABdhPJzv/Bc7NGZajPShdorVicz6OHnHErN3ywjEZYsKSV3VG3JL4TYVkoKlW2KXsaRy+3TOPCaluY8wxU3XWXFdMS4=
X-Received: by 2002:a67:b149:: with SMTP id z9mr20210130vsl.85.1592257878077; 
 Mon, 15 Jun 2020 14:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com>
In-Reply-To: <20200614200121.14147-6-digetx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 22:47:37 +0100
Message-ID: <CACvgo50P5i2jX6ZrMD=UuGr_bA=8MbFhYBWBNvkMcdCyJKS5xg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_5=2F5=5D_drm=2Ftegra=3A_plane=3A_Support_180=C2=B0_r?=
 =?UTF-8?Q?otation?=
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Perhaps a silly question:

On Mon, 15 Jun 2020 at 08:28, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Combining horizontal and vertical reflections gives us 180 degrees of
> rotation.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index f31bca27cde4..ddd9b88f8fce 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c

> +       if (rotation & DRM_MODE_ROTATE_180) {
> +               plane_state->reflect_x = !plane_state->reflect_x;
> +               plane_state->reflect_y = !plane_state->reflect_y;
> +       }
> +
As mentioned by Ville the above is already handled by
drm_rotation_simplify() ... although it makes me wonder:


>         err = drm_plane_create_rotation_property(&plane->base,
>                                                  DRM_MODE_ROTATE_0,
>                                                  DRM_MODE_ROTATE_0 |
> +                                                DRM_MODE_ROTATE_180 |
>                                                  DRM_MODE_REFLECT_X |
>                                                  DRM_MODE_REFLECT_Y);

Would it make sense for drm_plane_create_rotation_property() itself,
to add DRM_MODE_ROTATE_180, when both reflections are supported?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
