Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE462AB2F3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757389711;
	Mon,  9 Nov 2020 08:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260B089711
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:56:52 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d17so7918189lfq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 00:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCs0GumYLUJmi3+YRzoFTl3BvEfFf+h3il0lKWf4/0g=;
 b=svmlKyA5wX7yhhfj8FRug1w2cKoEms+5uQXSIllJsrH5ruyX+Gmcw9puh7f3Xr8VLq
 Xkimx0uKpvjG3htFAlVLONE4Pz3oclRKmJwDWa0Aqg2AUAQXzcYaNgLbsmEaUNIebVgx
 O9VjptBR8faPyN9xq841WMvK6CzpMeWBlcfmZLT++l3soD9qGVkEc3WVMgBtUYYxwiT5
 3KnR9/pSoYHPKCpeJV4HtJXXI24ZahyyZy8meCpJMX1tlW8e6vEgoP0RhgKi++xMhmZ3
 jVV+uxzFrMDLGS/czgk8MD1GOVj3XkBAB1uPmVj7P0moDV2vZhEowbBLOvZPSSx1gSkt
 u/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCs0GumYLUJmi3+YRzoFTl3BvEfFf+h3il0lKWf4/0g=;
 b=rx6jYC4UqVqljRspPyEPiBW4wkCzk3AZashET6jz9fzDfug/KB76OR6oHYv+pnfws+
 ezywyrXPHlJl3LHb3tyLxJaCi08Vmv7127VahqmkEWWmJNPN9t6Hp50O2EeKmQupiqil
 8KINlp9U/uLbvdXTl2Ie6sF5g+sawmWmavv0GzEkah4yxzyoMGdB253WJ5dIGFMKVSla
 XaRFBgDwMqu9Z5uL5k72zHnWaOxOMifiC40GVziZJtSKT5DXTsTXVtoa9fvO60pHhahV
 /8qkIx416KenVAXwFVeod63aT50PGNbRNbRFH+PoYJ6eS+KtgUvvw4OlSG5pV3cfjvlt
 sEOQ==
X-Gm-Message-State: AOAM532OTQNC9/oHoWZgURKeqeSW4VISHE8dvxL+yikFnY8cHT1ayjqv
 GG7Rmlctr8dd57k5iWG6helsTINu0veNmy5IFPQ=
X-Google-Smtp-Source: ABdhPJzneczS70K6E6XMsA7qi76Ex1NlwZSH0fpmHbfRDSlLYui/AHoa2G51b0eI2Vj6jYwyAgv9FEhxBUpvlpoJeZw=
X-Received: by 2002:a19:6916:: with SMTP id e22mr5129636lfc.45.1604912210507; 
 Mon, 09 Nov 2020 00:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20201106124224.21201-1-tzimmermann@suse.de>
In-Reply-To: <20201106124224.21201-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 9 Nov 2020 09:56:39 +0100
Message-ID: <CAMeQTsbYmxN5PEGf=5cK=eYP+2PoP8iYJ0LaG1yaN-rPTrQsaA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove unused function psb_gem_get_aperture()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 6, 2020 at 1:42 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Apparently, the function was never used at all.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks Thomas,

As agreed, please apply to drm-misc-next

-Patrik

> ---
>  drivers/gpu/drm/gma500/gem.c     | 6 ------
>  drivers/gpu/drm/gma500/psb_drv.h | 2 --
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 8f07de83b6fb..db827e591403 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -32,12 +32,6 @@ static void psb_gem_free_object(struct drm_gem_object *obj)
>         psb_gtt_free_range(obj->dev, gtt);
>  }
>
> -int psb_gem_get_aperture(struct drm_device *dev, void *data,
> -                               struct drm_file *file)
> -{
> -       return -EINVAL;
> -}
> -
>  static const struct vm_operations_struct psb_gem_vm_ops = {
>         .fault = psb_gem_fault,
>         .open = drm_gem_vm_open,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index c71a5a4e912c..ce6aae4b1bb2 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -735,8 +735,6 @@ extern const struct drm_connector_helper_funcs
>  extern const struct drm_connector_funcs psb_intel_lvds_connector_funcs;
>
>  /* gem.c */
> -extern int psb_gem_get_aperture(struct drm_device *dev, void *data,
> -                       struct drm_file *file);
>  extern int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                         struct drm_mode_create_dumb *args);
>
> --
> 2.29.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
