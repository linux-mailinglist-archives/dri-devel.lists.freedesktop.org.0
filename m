Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9895401F0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 16:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1784510E635;
	Tue,  7 Jun 2022 14:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C587810E5A9;
 Tue,  7 Jun 2022 14:58:34 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s1so1450411wra.9;
 Tue, 07 Jun 2022 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w/x0GYJIyglYGzsLMtcs2N+UdxoGHu5iQjLjq7gDOa8=;
 b=mnolo5fLNDdBuBMvlwaCPryzz8RBix8JR7j5txmuj3HpmexQIJcKZ0WRj2TDLOGlKV
 eYi7+7ZJHGeQve1+oBuw+oLFq7T9Yr+xLFozhFvuSZar1J0XmxxdFE5aozzgXRt3P06K
 Y2sq5jwvUjX6GibC1NrppLGFBqwd2rXJYZ3XqJGbNXxvgsrR2sWENE1FYtj0ajqZ9MMR
 bfyL9nr4gBdbp4Vq4N5lVOffSCj0v+rbe8am4yZYbkvuBfvwtorzMCXREQkALIJ5+6Tb
 FnnWBEbeTqOOWnNdVWaaWKsWZbdpeuN/wJ15uIQBpt6yQh9S0tU0fPdBqwh43ZFLKx3h
 h1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w/x0GYJIyglYGzsLMtcs2N+UdxoGHu5iQjLjq7gDOa8=;
 b=xGlTqC7wvHiaxo7Ue/GkjETeQvmfX1gAU8qOiCMj1nxjXg0qEwTTO/vgeqfEL36lY0
 n+cglx8eWf3gEcHI6sfET+FxzK6IbiFY9R+3uPfTTgrgVGPHBMiSLy7nryNX4PgqCTq1
 ZwRZEypGP5Ol+7GLRYmOXud9O832xvCC9kxX87dlH6Af+HlZifBeadCAV2KfkDMtgF52
 A1QSCgYmdRFIkRSe81+zEYkpDaxAKs+I0Yno/bLcGmZdLvCqiiW8k6DAyW55Q3YsCzr0
 P8Tjeow3/UlLW1sfe+gmOn2n/gSYj68XaE/SEX07u2YdlbiGwkO9IO+nE63+1cpMyonp
 wLoQ==
X-Gm-Message-State: AOAM531HQDXs/bPq0NVaNm+ACOhQ5mq9WZly1DiSFRQaik9zTcfaDJFw
 9exw3t9QNTYwR8JojZ5k9ZTFQPE02W/FdMPXL60=
X-Google-Smtp-Source: ABdhPJwRNN4z4XBKhcVm2933w90dY8yGBFVxOqV2cYUSjdAP95m0E38O7iji7hfuIr68iVFLPD1tEZKwD7DNfMrpJnk=
X-Received: by 2002:adf:fb0d:0:b0:20d:97e:17ce with SMTP id
 c13-20020adffb0d000000b0020d097e17cemr28428199wrr.585.1654613913189; Tue, 07
 Jun 2022 07:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220606195432.1888346-1-robdclark@gmail.com>
 <34aacfa3-9eb9-d3d5-07b7-805fd1408bb7@suse.de>
In-Reply-To: <34aacfa3-9eb9-d3d5-07b7-805fd1408bb7@suse.de>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jun 2022 07:58:36 -0700
Message-ID: <CAF6AEGuikc8Qh2ixEvJoeN0hQ+VLJNk_jBQm8fqYQAJ=ihpo1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add DRM_GEM_FOPS
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 6, 2022 at 11:56 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 06.06.22 um 21:54 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
> > provide additional file ops, like show_fdinfo().
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   include/drm/drm_gem.h | 26 ++++++++++++++++++--------
> >   1 file changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 9d7c61a122dc..dc88d4a2cdf6 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -314,6 +314,23 @@ struct drm_gem_object {
> >       const struct drm_gem_object_funcs *funcs;
> >   };
> >
> > +/**
> > + * DRM_GEM_FOPS - Default drm GEM file operations
> > + *
> > + * This macro provides a shorthand for setting the GEM file ops in the
> > + * &file_operations structure.
>
> I would appreciate a reference to DEFINE_DRM_GEM_FOPS. Something along
> the lines of 'if all you need are the default ops, use DEFINE_DRM_GEM_FOP=
S'.
>
> > + */
> > +#define DRM_GEM_FOPS \
> > +     .open           =3D drm_open,\
> > +     .release        =3D drm_release,\
> > +     .unlocked_ioctl =3D drm_ioctl,\
> > +     .compat_ioctl   =3D drm_compat_ioctl,\
> > +     .poll           =3D drm_poll,\
> > +     .read           =3D drm_read,\
> > +     .llseek         =3D noop_llseek,\
> > +     .mmap           =3D drm_gem_mmap
> > +
> > +
>
> Only one empty line please.
>
> >   /**
> >    * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM =
drivers
> >    * @name: name for the generated structure
> > @@ -330,14 +347,7 @@ struct drm_gem_object {
> >   #define DEFINE_DRM_GEM_FOPS(name) \
> >       static const struct file_operations name =3D {\
> >               .owner          =3D THIS_MODULE,\
>
> Is there a specific reason why .owner is still set here? I suspect that
> DRM_GEM_FOPS is strictly for callback functions?

I was on the fence about that one, but it seemed better to not mix
"magic" and the callbacks.. but I could be convinced in either
direction

> In any case
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

thx, I'll fixup the other nits in v3.

>
> Best regards
> Thomas
>
> > -             .open           =3D drm_open,\
> > -             .release        =3D drm_release,\
> > -             .unlocked_ioctl =3D drm_ioctl,\
> > -             .compat_ioctl   =3D drm_compat_ioctl,\
> > -             .poll           =3D drm_poll,\
> > -             .read           =3D drm_read,\
> > -             .llseek         =3D noop_llseek,\
> > -             .mmap           =3D drm_gem_mmap,\
> > +             DRM_GEM_FOPS,\
> >       }
> >
> >   void drm_gem_object_release(struct drm_gem_object *obj);
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
