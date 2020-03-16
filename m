Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53115186CCB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 15:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC07B89DBC;
	Mon, 16 Mar 2020 14:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9188089DBC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:06:58 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id m25so2505190vsa.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXOWCWLqtFCVKm8T29AUGnK+LdVTc7cjmCmyGtG7UZA=;
 b=FlNHH7nq6b4OLyA48uH3sswqJ2zJWYBYCjJMGXoyMT9NG5Up2JIy4I4cxLEJUyrbhb
 WJU/ju7P1KpKLuewVhO+GN7XW9dt7fwb0QdkZ+TiucvDNNlbQY5nWeydB+/N6udU3HmQ
 BqCh5hCWwnAlXDehMRgYr0SrvhSLPsIRe1Z0R8sPIVW9Z3AoxtVl8aPJKC7+K5SAq8c6
 NQDMs+HdB5aQyqwj3aAxa6QRE6FX+ROFs8uLj+niByGRBqMu8vdg3FumiKlBsoLCIMyv
 k+JaqfNhv3ZDMapmzoncmQRNpCyr0WnKGJtPJMssL7nsxmEQDykpdHfXU0I15+a1wkpi
 PD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXOWCWLqtFCVKm8T29AUGnK+LdVTc7cjmCmyGtG7UZA=;
 b=exx2atD7LOSHPA3kU0hA12YsUSXTxLStrR/b2irCTA3+IXyqyZNWkiPE2QJhuZ0MdR
 uAErhdMYg8tTZzxry3xI0R9WJdygmbYaaVn6bUCfyc/Sahl0EpwcP+XoxtVe5IaB37fx
 e59Dbm8XQw/qXBpo9tn0QB6XV96cxnKuRzOXbYaUUyIjhli09rbUm5lxGaB3eWgVYKMw
 h7dXIMB8FaHknTcorBs1BudkmFlvvJVnCeh6iRrqVaF/7LgqFHa9bLDvCU/83gc2rh9H
 mPykz3jP145DJCrINl0oK5n9Ij1yzVmZlHnkamncwdvzmgHppclzQxu/2hkuPE9tHdfH
 Z3ow==
X-Gm-Message-State: ANhLgQ3j27ieEGK1/fKVjdKJLfPC+ArzT/zUTkJfEymA1eRZwfj1l1yB
 wGfLlAB1pNNZ6u1szAnnU7GQlDxDgk5dQC0kDeE=
X-Google-Smtp-Source: ADFU+vtL02ERDg+wpXty5bp0pal+jwf52FS+sdxkfI6Qw9xhCi0+xaQPZPz0xtE4Sc0ERzJc7Tr/k4bT2C+x2/YZxxo=
X-Received: by 2002:a67:cb84:: with SMTP id h4mr17540463vsl.85.1584367617602; 
 Mon, 16 Mar 2020 07:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-5-andrzej.p@collabora.com>
In-Reply-To: <20200311145541.29186-5-andrzej.p@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 16 Mar 2020 14:05:59 +0000
Message-ID: <CACvgo50F99aG3WwRbiqPz5CrWVmLbCmvB-UT3Tzar00sPYe52A@mail.gmail.com>
Subject: Re: [PATCHv7 4/6] drm/arm/malidp: Allocate an afbc-specific
 drm_framebuffer
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Mar 2020 at 14:56, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Prepare for using generic afbc helpers.
>
> Use an existing helper which allows allocating a struct drm_framebuffer
> in the driver.
>
> afbc-specific checks should go after drm_gem_fb_init_with_funcs().
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 50 +++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index cafbd81e4c1e..b9715b19af94 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -269,13 +269,36 @@ static const struct drm_mode_config_helper_funcs malidp_mode_config_helpers = {
>         .atomic_commit_tail = malidp_atomic_commit_tail,
>  };
>
> +static const struct drm_framebuffer_funcs malidp_fb_funcs = {
> +       .destroy        = drm_gem_fb_destroy,
> +       .create_handle  = drm_gem_fb_create_handle,
> +};
> +
>  static struct drm_framebuffer *
>  malidp_fb_create(struct drm_device *dev, struct drm_file *file,
>                  const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> +       struct drm_afbc_framebuffer *afbc_fb;
> +       const struct drm_format_info *info;
> +       int ret, i;
> +
> +       info = drm_get_format_info(dev, mode_cmd);
> +       if (!info)
> +               return ERR_PTR(-ENOMEM);
> +
The underlying implementation in drm_get_format_info() will throw a
WARN_ON() if we return NULL.
Returning ENOMEM here is misleading and EINVAL sounds better IMHO.

Regardless, of the above 1-5 are:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

I don't know much about Rockchip HW to review 6/6.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
