Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF18BFDC0
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A889110FC7B;
	Wed,  8 May 2024 12:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fx3Fhfig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9406110FC75;
 Wed,  8 May 2024 12:53:23 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-61e0c2b5cd2so5670407b3.1; 
 Wed, 08 May 2024 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715172802; x=1715777602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCBcKrlbNzLt1WzgDDcQW4xeBMY9ss6FMqXvnMs5his=;
 b=Fx3FhfigT22U963eeClEUnZfi4eQBXdznIg2fbLZVjY64iaeclLBln/CBaMkGN9f4n
 4kbY8KnYpq1wlwbJYwP+dAc/ze4hoEYY4SRpH1WsWiO12/wZw+ABYbFd61wd0jpc1Km7
 JR0Rw71/h+uuC8XsGV7QLB+BBnwqUJpOcc1nPVkljL4cZUE/SdbHbIv3kXKdXrWE0qo9
 8/II07/pf+ChftrNpYWIzVIVoo+rCczUdzu7LaRrdGuc5nR/GQwBOVC47qN2NDUGiyOV
 1tWNoIFXwcKYXYPrnSs0rXIOCSir6VrSS+9wVH4doQVjt9tN/x+On9fuO8Q281CZzH28
 7p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715172802; x=1715777602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCBcKrlbNzLt1WzgDDcQW4xeBMY9ss6FMqXvnMs5his=;
 b=giOMdbLUqoZPiaTteiohT/oRxQxUBhMvJPyCSDMjG49gYLZ3CAFpElnr0yHoLshKcv
 LbgnYemZNh7+2T1Sqn2QQRhnN+7WuHB4aDHg1+zAoGD+AgY+Va4/K7ChdHjzZjUg4XDa
 vtP5LOepLy8RFhG2tn5n9L61IXY7hGv2Co1yVJEILGIxZSXw6uU1lTavD+gZrEo1nybC
 93IEgPe7b8sfdJmL70I9lHlAxMxR/1fFloqsXU1uRqnOiZyoE/uV96wOzwKLip/TaPFT
 wY5Vkv/1CsX91Hkcq3eUTKS8JVcbLWHLSQiobEIRiUdcG+wMF73SdGaDZb7fAvp5xq11
 V9wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtRxdPIK4vDJdRpIJ4pXIlyG76wXNL9z5/Q3QTqIzQl3kloA4gsYSWe+o3F/pAVsIU7JBVYlyUrh3wYQVYK0dZwzBXtDoA/aAHvW8xhepE++kiaPVY3fBA7pMUkBcYUdKnZ+Zqg22zOv7p6bqdbwy2HBm74tnotnq2yvSTpeC+pY2VMqA8d8i1knnDMkBK3g==
X-Gm-Message-State: AOJu0YwWURzU15uX6niGYS9VGRn0yr0lgbLMbie372tVdMevrLxJnhiF
 r/rd+120EhafgrpCbDAP0o2OtlRZfeZXM/xGCj5RRpjv4wOrQRf9o2U/eXXMvl8AoZTVbghxgPc
 eJN1PO8CEU0QdswJMhXdmRwWPLDs=
X-Google-Smtp-Source: AGHT+IHAUISTH36hY9CQIyGyJqqkQ7RpEhuXp4Rh25+WLsSPQT0gzb47uBEVhvQ9ssNyaZTqBMs9hTBMxtk5pp8eMrM=
X-Received: by 2002:a0d:d509:0:b0:618:498f:9dbe with SMTP id
 00721157ae682-62076576b06mr37310177b3.10.1715172802420; Wed, 08 May 2024
 05:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240507120422.25492-1-tzimmermann@suse.de>
 <20240507120422.25492-8-tzimmermann@suse.de>
In-Reply-To: <20240507120422.25492-8-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 8 May 2024 14:53:11 +0200
Message-ID: <CAMeQTsbsSS8xBPY83m0kAE=SLXFzxs49CnsngON6UnY55x9Lvg@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/gma500: Use fbdev client helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, linux@armlinux.org.uk, krzk@kernel.org, 
 alim.akhtar@samsung.com, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 7, 2024 at 2:04=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Implement struct drm_client_funcs with the respective helpers and
> remove the custom code from the emulation. The generic helpers are
> equivalent in functionality.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/fbdev.c | 58 ++--------------------------------
>  1 file changed, 3 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index 98b44974d42dd..8a6cb47e83f8f 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -8,7 +8,6 @@
>  #include <linux/fb.h>
>  #include <linux/pfn_t.h>
>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_framebuffer.h>
> @@ -252,63 +251,12 @@ static const struct drm_fb_helper_funcs psb_fbdev_f=
b_helper_funcs =3D {
>  };
>
>  /*
> - * struct drm_client_funcs and setup code
> + * struct drm_client_funcs
>   */
>
> -static void psb_fbdev_client_unregister(struct drm_client_dev *client)
> -{
> -       struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
> -
> -       if (fb_helper->info) {
> -               drm_fb_helper_unregister_info(fb_helper);
> -       } else {
> -               drm_fb_helper_unprepare(fb_helper);
> -               drm_client_release(&fb_helper->client);
> -               kfree(fb_helper);
> -       }
> -}
> -
> -static int psb_fbdev_client_restore(struct drm_client_dev *client)
> -{
> -       drm_fb_helper_lastclose(client->dev);
> -
> -       return 0;
> -}
> -
> -static int psb_fbdev_client_hotplug(struct drm_client_dev *client)
> -{
> -       struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
> -       struct drm_device *dev =3D client->dev;
> -       int ret;
> -
> -       if (dev->fb_helper)
> -               return drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -       ret =3D drm_fb_helper_init(dev, fb_helper);
> -       if (ret)
> -               goto err_drm_err;
> -
> -       if (!drm_drv_uses_atomic_modeset(dev))
> -               drm_helper_disable_unused_functions(dev);
> -
> -       ret =3D drm_fb_helper_initial_config(fb_helper);
> -       if (ret)
> -               goto err_drm_fb_helper_fini;
> -
> -       return 0;
> -
> -err_drm_fb_helper_fini:
> -       drm_fb_helper_fini(fb_helper);
> -err_drm_err:
> -       drm_err(dev, "Failed to setup gma500 fbdev emulation (ret=3D%d)\n=
", ret);
> -       return ret;
> -}
> -
>  static const struct drm_client_funcs psb_fbdev_client_funcs =3D {
> -       .owner          =3D THIS_MODULE,
> -       .unregister     =3D psb_fbdev_client_unregister,
> -       .restore        =3D psb_fbdev_client_restore,
> -       .hotplug        =3D psb_fbdev_client_hotplug,
> +       .owner =3D THIS_MODULE,
> +       DRM_FBDEV_HELPER_CLIENT_FUNCS,
>  };
>
>  void psb_fbdev_setup(struct drm_psb_private *dev_priv)
> --
> 2.44.0
>
