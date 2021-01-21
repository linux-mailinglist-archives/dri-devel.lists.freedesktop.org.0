Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C72FE8A8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 12:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E506E52D;
	Thu, 21 Jan 2021 11:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA216E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 11:23:18 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id 34so1253550otd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 03:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b2rMzfq0UH/F+eLfm27e8RT4cWjxNkuh3W9X3FO/pmE=;
 b=BAG2wgYYSoqHd+DzOqnaf2XloG6h8bisgVdttJVNDSeHpO2T60TTr7oftDgacbG++z
 FWPFJ7hdHVj7asQbzl1FiKoOBR4iGZhMKOoPDtWwob5eImQXBXeKj3EvrZWVEkeJQQKj
 fuvuKpu9YR6biF7ybZJEkp7YQ/ov/XcCHaV6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b2rMzfq0UH/F+eLfm27e8RT4cWjxNkuh3W9X3FO/pmE=;
 b=gTvV3eOkXPhVvGhFMGBRuU7A5ffZyEf9aGvdFoUHSQ5vluohxMOhsD9jJ59PaX+p6O
 G2Im9brIMKe5pjLHfznGBlJiA86FWe+niSf9aUl9zipv9g6wg67jD+NTLD8KEOfmdpnH
 TOuYuHUtmsbTN+qQr6eHWWqUpR1saSuBayY1rSlpqiu110LWZMKR/g07HN+MqGfygxi1
 FECGbqzt/0Z2lAkgdNRyCecLZGPkfffc00bZeF0ZgIQzVFU9uZUGczqKPwGouf/itmvU
 Q5hboOeuu6YOe5QgMX/tZ48P6+vV11MRWcMcsNYPIkzY+cHnfp0amjPpuj8ZlA5fuSlx
 5Fxg==
X-Gm-Message-State: AOAM530z4zQX3XsK9ju+ttxqDNHva55WeH7itNtvQPBXI1Nb/teokFCH
 XfJsJq8K42KEol8J0ehtBUrexG+Tra/tyN9jpoRrHQ==
X-Google-Smtp-Source: ABdhPJwuTGzWQAuFKkuYSb3G3c5sxDjEUQ9z8aWWFLseIzCwQa2p+C86ONLqWh5bBBra+SI82M1uIeUTsaA8ArqC1t0=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr9879029otb.303.1611228197779; 
 Thu, 21 Jan 2021 03:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20210121030909.1126643-1-zhangzhijie@loongson.cn>
In-Reply-To: <20210121030909.1126643-1-zhangzhijie@loongson.cn>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 12:23:07 +0100
Message-ID: <CAKMK7uF=scYJ=gyS=xjYz25mdDzKA0QHSyPndfSBweE7vfDkWQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm: Improve the output_poll_changed description
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 4:09 AM ZhiJie.Zhang <zhangzhijie@loongson.cn> wrote:
>
> From: zhangzhijie <zhangzhijie@loongson.cn>
>
> this callback was used by drm_kms_helper_hotplug_event()
>
> V2: (Thanks for Daniel's suggestions)
> - remove the FIXME below.since with the drm_client
> - infrastructure and the generic fbdev emulation we've
> - resolved this all very neatly now.
>
> V3: Add comments that This hook is deprecated
> - new implementation methods instead of this hook
>
> Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
> ---
>  include/drm/drm_mode_config.h | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab424ddd7665..fbc0da25d7c5 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -103,14 +103,13 @@ struct drm_mode_config_funcs {
>          * Callback used by helpers to inform the driver of output configuration
>          * changes.
>          *
> -        * Drivers implementing fbdev emulation with the helpers can call
> -        * drm_fb_helper_hotplug_changed from this hook to inform the fbdev
> -        * helper of output changes.

Not sure why this isn't clear, but the above is important information
that we should keep. Maybe good to fix up the formatting to make it a
hyperlink, and your addition here is fine too, but the above is the
important part really.
-Daniel

> +        * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
> +        * to call this hook to inform the fbdev helper of output changes.
>          *
> -        * FIXME:
> -        *
> -        * Except that there's no vtable for device-level helper callbacks
> -        * there's no reason this is a core function.
> +        * This hook is deprecated, drivers should instead use
> +        * drm_fbdev_generic_setup() which takes care of any necessary
> +        * hotplug event forwarding already without further involvement by
> +        * the driver.
>          */
>         void (*output_poll_changed)(struct drm_device *dev);
>
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
