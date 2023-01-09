Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56CB6629F8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 16:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D25A10E216;
	Mon,  9 Jan 2023 15:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CEE8992E;
 Mon,  9 Jan 2023 15:31:58 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id d127so7381947oif.12;
 Mon, 09 Jan 2023 07:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSj1ImBpfWFDW3cU7IFuLTY62PwZ9qO6qQWnn7Zl6DY=;
 b=hWP8hM4dROto+ZhOqzfT9xbYOUklKiidZQlHUnzIB6IT/OkD9BpCYlPr50B+Ra1vWu
 ysSBzKRNFUftTrgGJqB4v2K84vFoiQkDclq98jW/p/lbdF01fhXWaf0na4mmhXbE4V2W
 jX5Zk6rPU5Wb65yR4HVI0W3FB60k8gw8GjI0o8DRsbD6BQOHnpM5NbILlja3SdFqj8C7
 nv0Dy0PPfosrtDkE1wE2Lpt04EG6gmdsb9NHP9srMbQa1lVqn7j/JQ2CMM1QCOaiQINY
 is4AdbWDxA86km/PXFU+BHOrmtu9LuqhG8FArzsDd65JFVoQ+iDT/c4+t8bJgLzB8a3Y
 7ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSj1ImBpfWFDW3cU7IFuLTY62PwZ9qO6qQWnn7Zl6DY=;
 b=lIo3Bcc9hyeGTyg5KBl++TvFSZKN6ZllLH1guazdnJFu660/o9BlAf3DCSk0B0cWXf
 lsZkHqeAb1B/IGcJyV8yZ2CKUAghNEX/joFqUGjvcGpKr178nMwhz/Y+n9AxhlCQ48U6
 7krzzG9wFOQa/Mx9wiym3I3QOo2csRdD3BHMR9SUHkEr/dG4l4mrFL4DVG4trz5lG/OI
 WSuupk2D7IPKAqC0jnF9LfbEB+tMUjZYh+wsg+ALBUv7WxrSfH0FGbAyBqrVB+PPAaCc
 O9OoDjItDzM880XHBVNYoU30/EmdTGsdybKAj8BAJxtgnXWv6HBlJMeYJa2bHKCJvCFZ
 Wujw==
X-Gm-Message-State: AFqh2kqk7YgeArcQAdY/a8FBEHMHoxNkQ2flLfh301viSQdWsDlJ/+TF
 e68xt1H/es9Pdivg7ywlugcoNz48hPMOqNxDd2s=
X-Google-Smtp-Source: AMrXdXuYtrzy1i081zm+KGN4wJ9CN766/NxMAA4CIrdmuZ5IllsgiwQaYYn73qCiRAbCun9Kcs1kaEEJb6ghtAp5vAw=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr4466010oib.46.1673278317391; Mon, 09
 Jan 2023 07:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20230109140557.8381-1-tzimmermann@suse.de>
 <CADnq5_NhjXkLUhVAJ-E=_wNGGqD2zk+cU1a5DZaYbP03T_56uw@mail.gmail.com>
 <75b24833-859e-4a92-9cca-1dd24871b5ff@suse.de>
In-Reply-To: <75b24833-859e-4a92-9cca-1dd24871b5ff@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Jan 2023 10:31:45 -0500
Message-ID: <CADnq5_NSDGQB=twwmVeiMYr7QHUPNrqYy+3cDE=gdjq0Pccg7A@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Remove file nouveau_fbcon.c
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
Cc: kherbst@redhat.com, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 10:27 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 09.01.23 um 15:15 schrieb Alex Deucher:
> > On Mon, Jan 9, 2023 at 9:06 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> >>
> >> Commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> >> converted nouveau to generic fbdev emulation. Also remove the internal
> >> implementation from the driver. No functional changes.
> >
> > Looking at 4a16dd9d18a0, it appears to have removed this file already.
> > I guess it somehow got re-added?
>
> OK, I tihnk I found it in the merge of drm-misc-next-2022-11-10-1 into
> drm-next. See
>
>    https://cgit.freedesktop.org/drm/drm/commit/?id=3D4e291f2f5853
>
> There was a conflict between the removal and my rework of the some fbdev
> helpers.
>
> Do we use Fixes tags with merge commits?

Seems fine to me, but either way:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Alex


>
> Best regards
> Thomas
>
> >
> > Alex
> >
> >
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> >> Cc: Ben Skeggs <bskeggs@redhat.com>
> >> Cc: Karol Herbst <kherbst@redhat.com>
> >> Cc: Lyude Paul <lyude@redhat.com>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Javier Martinez Canillas <javierm@redhat.com>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >> Cc: Dave Airlie <airlied@redhat.com>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: nouveau@lists.freedesktop.org
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_fbcon.c | 613 ----------------------=
--
> >>   1 file changed, 613 deletions(-)
> >>   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_fbcon.c
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm=
/nouveau/nouveau_fbcon.c
> >> deleted file mode 100644
> >> index e87de7906f78..000000000000
> >> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> >> +++ /dev/null
> >> @@ -1,613 +0,0 @@
> >> -/*
> >> - * Copyright =C2=A9 2007 David Airlie
> >> - *
> >> - * Permission is hereby granted, free of charge, to any person obtain=
ing a
> >> - * copy of this software and associated documentation files (the "Sof=
tware"),
> >> - * to deal in the Software without restriction, including without lim=
itation
> >> - * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,
> >> - * and/or sell copies of the Software, and to permit persons to whom =
the
> >> - * Software is furnished to do so, subject to the following condition=
s:
> >> - *
> >> - * The above copyright notice and this permission notice (including t=
he next
> >> - * paragraph) shall be included in all copies or substantial portions=
 of the
> >> - * Software.
> >> - *
> >> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> >> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> >> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT=
 SHALL
> >> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER
> >> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING
> >> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R
> >> - * DEALINGS IN THE SOFTWARE.
> >> - *
> >> - * Authors:
> >> - *     David Airlie
> >> - */
> >> -
> >> -#include <linux/module.h>
> >> -#include <linux/kernel.h>
> >> -#include <linux/errno.h>
> >> -#include <linux/string.h>
> >> -#include <linux/mm.h>
> >> -#include <linux/tty.h>
> >> -#include <linux/sysrq.h>
> >> -#include <linux/delay.h>
> >> -#include <linux/init.h>
> >> -#include <linux/screen_info.h>
> >> -#include <linux/vga_switcheroo.h>
> >> -#include <linux/console.h>
> >> -
> >> -#include <drm/drm_crtc.h>
> >> -#include <drm/drm_crtc_helper.h>
> >> -#include <drm/drm_probe_helper.h>
> >> -#include <drm/drm_fb_helper.h>
> >> -#include <drm/drm_fourcc.h>
> >> -#include <drm/drm_atomic.h>
> >> -
> >> -#include "nouveau_drv.h"
> >> -#include "nouveau_gem.h"
> >> -#include "nouveau_bo.h"
> >> -#include "nouveau_fbcon.h"
> >> -#include "nouveau_chan.h"
> >> -#include "nouveau_vmm.h"
> >> -
> >> -#include "nouveau_crtc.h"
> >> -
> >> -MODULE_PARM_DESC(nofbaccel, "Disable fbcon acceleration");
> >> -int nouveau_nofbaccel =3D 0;
> >> -module_param_named(nofbaccel, nouveau_nofbaccel, int, 0400);
> >> -
> >> -MODULE_PARM_DESC(fbcon_bpp, "fbcon bits-per-pixel (default: auto)");
> >> -static int nouveau_fbcon_bpp;
> >> -module_param_named(fbcon_bpp, nouveau_fbcon_bpp, int, 0400);
> >> -
> >> -static void
> >> -nouveau_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect=
 *rect)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -       struct nvif_device *device =3D &drm->client.device;
> >> -       int ret;
> >> -
> >> -       if (info->state !=3D FBINFO_STATE_RUNNING)
> >> -               return;
> >> -
> >> -       ret =3D -ENODEV;
> >> -       if (!in_interrupt() && !(info->flags & FBINFO_HWACCEL_DISABLED=
) &&
> >> -           mutex_trylock(&drm->client.mutex)) {
> >> -               if (device->info.family < NV_DEVICE_INFO_V0_TESLA)
> >> -                       ret =3D nv04_fbcon_fillrect(info, rect);
> >> -               else
> >> -               if (device->info.family < NV_DEVICE_INFO_V0_FERMI)
> >> -                       ret =3D nv50_fbcon_fillrect(info, rect);
> >> -               else
> >> -                       ret =3D nvc0_fbcon_fillrect(info, rect);
> >> -               mutex_unlock(&drm->client.mutex);
> >> -       }
> >> -
> >> -       if (ret =3D=3D 0)
> >> -               return;
> >> -
> >> -       if (ret !=3D -ENODEV)
> >> -               nouveau_fbcon_gpu_lockup(info);
> >> -       drm_fb_helper_cfb_fillrect(info, rect);
> >> -}
> >> -
> >> -static void
> >> -nouveau_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea=
 *image)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -       struct nvif_device *device =3D &drm->client.device;
> >> -       int ret;
> >> -
> >> -       if (info->state !=3D FBINFO_STATE_RUNNING)
> >> -               return;
> >> -
> >> -       ret =3D -ENODEV;
> >> -       if (!in_interrupt() && !(info->flags & FBINFO_HWACCEL_DISABLED=
) &&
> >> -           mutex_trylock(&drm->client.mutex)) {
> >> -               if (device->info.family < NV_DEVICE_INFO_V0_TESLA)
> >> -                       ret =3D nv04_fbcon_copyarea(info, image);
> >> -               else
> >> -               if (device->info.family < NV_DEVICE_INFO_V0_FERMI)
> >> -                       ret =3D nv50_fbcon_copyarea(info, image);
> >> -               else
> >> -                       ret =3D nvc0_fbcon_copyarea(info, image);
> >> -               mutex_unlock(&drm->client.mutex);
> >> -       }
> >> -
> >> -       if (ret =3D=3D 0)
> >> -               return;
> >> -
> >> -       if (ret !=3D -ENODEV)
> >> -               nouveau_fbcon_gpu_lockup(info);
> >> -       drm_fb_helper_cfb_copyarea(info, image);
> >> -}
> >> -
> >> -static void
> >> -nouveau_fbcon_imageblit(struct fb_info *info, const struct fb_image *=
image)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -       struct nvif_device *device =3D &drm->client.device;
> >> -       int ret;
> >> -
> >> -       if (info->state !=3D FBINFO_STATE_RUNNING)
> >> -               return;
> >> -
> >> -       ret =3D -ENODEV;
> >> -       if (!in_interrupt() && !(info->flags & FBINFO_HWACCEL_DISABLED=
) &&
> >> -           mutex_trylock(&drm->client.mutex)) {
> >> -               if (device->info.family < NV_DEVICE_INFO_V0_TESLA)
> >> -                       ret =3D nv04_fbcon_imageblit(info, image);
> >> -               else
> >> -               if (device->info.family < NV_DEVICE_INFO_V0_FERMI)
> >> -                       ret =3D nv50_fbcon_imageblit(info, image);
> >> -               else
> >> -                       ret =3D nvc0_fbcon_imageblit(info, image);
> >> -               mutex_unlock(&drm->client.mutex);
> >> -       }
> >> -
> >> -       if (ret =3D=3D 0)
> >> -               return;
> >> -
> >> -       if (ret !=3D -ENODEV)
> >> -               nouveau_fbcon_gpu_lockup(info);
> >> -       drm_fb_helper_cfb_imageblit(info, image);
> >> -}
> >> -
> >> -static int
> >> -nouveau_fbcon_sync(struct fb_info *info)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -       struct nouveau_channel *chan =3D drm->channel;
> >> -       int ret;
> >> -
> >> -       if (!chan || !chan->accel_done || in_interrupt() ||
> >> -           info->state !=3D FBINFO_STATE_RUNNING ||
> >> -           info->flags & FBINFO_HWACCEL_DISABLED)
> >> -               return 0;
> >> -
> >> -       if (!mutex_trylock(&drm->client.mutex))
> >> -               return 0;
> >> -
> >> -       ret =3D nouveau_channel_idle(chan);
> >> -       mutex_unlock(&drm->client.mutex);
> >> -       if (ret) {
> >> -               nouveau_fbcon_gpu_lockup(info);
> >> -               return 0;
> >> -       }
> >> -
> >> -       chan->accel_done =3D false;
> >> -       return 0;
> >> -}
> >> -
> >> -static int
> >> -nouveau_fbcon_open(struct fb_info *info, int user)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -       int ret =3D pm_runtime_get_sync(drm->dev->dev);
> >> -       if (ret < 0 && ret !=3D -EACCES) {
> >> -               pm_runtime_put(drm->dev->dev);
> >> -               return ret;
> >> -       }
> >> -       return 0;
> >> -}
> >> -
> >> -static int
> >> -nouveau_fbcon_release(struct fb_info *info, int user)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -       pm_runtime_put(drm->dev->dev);
> >> -       return 0;
> >> -}
> >> -
> >> -static const struct fb_ops nouveau_fbcon_ops =3D {
> >> -       .owner =3D THIS_MODULE,
> >> -       DRM_FB_HELPER_DEFAULT_OPS,
> >> -       .fb_open =3D nouveau_fbcon_open,
> >> -       .fb_release =3D nouveau_fbcon_release,
> >> -       .fb_fillrect =3D nouveau_fbcon_fillrect,
> >> -       .fb_copyarea =3D nouveau_fbcon_copyarea,
> >> -       .fb_imageblit =3D nouveau_fbcon_imageblit,
> >> -       .fb_sync =3D nouveau_fbcon_sync,
> >> -};
> >> -
> >> -static const struct fb_ops nouveau_fbcon_sw_ops =3D {
> >> -       .owner =3D THIS_MODULE,
> >> -       DRM_FB_HELPER_DEFAULT_OPS,
> >> -       .fb_open =3D nouveau_fbcon_open,
> >> -       .fb_release =3D nouveau_fbcon_release,
> >> -       .fb_fillrect =3D drm_fb_helper_cfb_fillrect,
> >> -       .fb_copyarea =3D drm_fb_helper_cfb_copyarea,
> >> -       .fb_imageblit =3D drm_fb_helper_cfb_imageblit,
> >> -};
> >> -
> >> -void
> >> -nouveau_fbcon_accel_save_disable(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       if (drm->fbcon && drm->fbcon->helper.info) {
> >> -               drm->fbcon->saved_flags =3D drm->fbcon->helper.info->f=
lags;
> >> -               drm->fbcon->helper.info->flags |=3D FBINFO_HWACCEL_DIS=
ABLED;
> >> -       }
> >> -}
> >> -
> >> -void
> >> -nouveau_fbcon_accel_restore(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       if (drm->fbcon && drm->fbcon->helper.info)
> >> -               drm->fbcon->helper.info->flags =3D drm->fbcon->saved_f=
lags;
> >> -}
> >> -
> >> -static void
> >> -nouveau_fbcon_accel_fini(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       struct nouveau_fbdev *fbcon =3D drm->fbcon;
> >> -       if (fbcon && drm->channel) {
> >> -               console_lock();
> >> -               if (fbcon->helper.info)
> >> -                       fbcon->helper.info->flags |=3D FBINFO_HWACCEL_=
DISABLED;
> >> -               console_unlock();
> >> -               nouveau_channel_idle(drm->channel);
> >> -               nvif_object_dtor(&fbcon->twod);
> >> -               nvif_object_dtor(&fbcon->blit);
> >> -               nvif_object_dtor(&fbcon->gdi);
> >> -               nvif_object_dtor(&fbcon->patt);
> >> -               nvif_object_dtor(&fbcon->rop);
> >> -               nvif_object_dtor(&fbcon->clip);
> >> -               nvif_object_dtor(&fbcon->surf2d);
> >> -       }
> >> -}
> >> -
> >> -static void
> >> -nouveau_fbcon_accel_init(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       struct nouveau_fbdev *fbcon =3D drm->fbcon;
> >> -       struct fb_info *info =3D fbcon->helper.info;
> >> -       int ret;
> >> -
> >> -       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA)
> >> -               ret =3D nv04_fbcon_accel_init(info);
> >> -       else
> >> -       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
> >> -               ret =3D nv50_fbcon_accel_init(info);
> >> -       else
> >> -               ret =3D nvc0_fbcon_accel_init(info);
> >> -
> >> -       if (ret =3D=3D 0)
> >> -               info->fbops =3D &nouveau_fbcon_ops;
> >> -}
> >> -
> >> -static void
> >> -nouveau_fbcon_zfill(struct drm_device *dev, struct nouveau_fbdev *fbc=
on)
> >> -{
> >> -       struct fb_info *info =3D fbcon->helper.info;
> >> -       struct fb_fillrect rect;
> >> -
> >> -       /* Clear the entire fbcon.  The drm will program every connect=
or
> >> -        * with it's preferred mode.  If the sizes differ, one display=
 will
> >> -        * quite likely have garbage around the console.
> >> -        */
> >> -       rect.dx =3D rect.dy =3D 0;
> >> -       rect.width =3D info->var.xres_virtual;
> >> -       rect.height =3D info->var.yres_virtual;
> >> -       rect.color =3D 0;
> >> -       rect.rop =3D ROP_COPY;
> >> -       info->fbops->fb_fillrect(info, &rect);
> >> -}
> >> -
> >> -static int
> >> -nouveau_fbcon_create(struct drm_fb_helper *helper,
> >> -                    struct drm_fb_helper_surface_size *sizes)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D
> >> -               container_of(helper, struct nouveau_fbdev, helper);
> >> -       struct drm_device *dev =3D fbcon->helper.dev;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       struct nvif_device *device =3D &drm->client.device;
> >> -       struct fb_info *info;
> >> -       struct drm_framebuffer *fb;
> >> -       struct nouveau_channel *chan;
> >> -       struct nouveau_bo *nvbo;
> >> -       struct drm_mode_fb_cmd2 mode_cmd =3D {};
> >> -       int ret;
> >> -
> >> -       mode_cmd.width =3D sizes->surface_width;
> >> -       mode_cmd.height =3D sizes->surface_height;
> >> -
> >> -       mode_cmd.pitches[0] =3D mode_cmd.width * (sizes->surface_bpp >=
> 3);
> >> -       mode_cmd.pitches[0] =3D roundup(mode_cmd.pitches[0], 256);
> >> -
> >> -       mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(sizes->sur=
face_bpp,
> >> -                                                         sizes->surfa=
ce_depth);
> >> -
> >> -       ret =3D nouveau_gem_new(&drm->client, mode_cmd.pitches[0] *
> >> -                             mode_cmd.height, 0, NOUVEAU_GEM_DOMAIN_V=
RAM,
> >> -                             0, 0x0000, &nvbo);
> >> -       if (ret) {
> >> -               NV_ERROR(drm, "failed to allocate framebuffer\n");
> >> -               goto out;
> >> -       }
> >> -
> >> -       ret =3D nouveau_framebuffer_new(dev, &mode_cmd, &nvbo->bo.base=
, &fb);
> >> -       if (ret)
> >> -               goto out_unref;
> >> -
> >> -       ret =3D nouveau_bo_pin(nvbo, NOUVEAU_GEM_DOMAIN_VRAM, false);
> >> -       if (ret) {
> >> -               NV_ERROR(drm, "failed to pin fb: %d\n", ret);
> >> -               goto out_unref;
> >> -       }
> >> -
> >> -       ret =3D nouveau_bo_map(nvbo);
> >> -       if (ret) {
> >> -               NV_ERROR(drm, "failed to map fb: %d\n", ret);
> >> -               goto out_unpin;
> >> -       }
> >> -
> >> -       chan =3D nouveau_nofbaccel ? NULL : drm->channel;
> >> -       if (chan && device->info.family >=3D NV_DEVICE_INFO_V0_TESLA) =
{
> >> -               ret =3D nouveau_vma_new(nvbo, chan->vmm, &fbcon->vma);
> >> -               if (ret) {
> >> -                       NV_ERROR(drm, "failed to map fb into chan: %d\=
n", ret);
> >> -                       chan =3D NULL;
> >> -               }
> >> -       }
> >> -
> >> -       info =3D drm_fb_helper_alloc_info(helper);
> >> -       if (IS_ERR(info)) {
> >> -               ret =3D PTR_ERR(info);
> >> -               goto out_unlock;
> >> -       }
> >> -
> >> -       /* setup helper */
> >> -       fbcon->helper.fb =3D fb;
> >> -
> >> -       if (!chan)
> >> -               info->flags =3D FBINFO_HWACCEL_DISABLED;
> >> -       else
> >> -               info->flags =3D FBINFO_HWACCEL_COPYAREA |
> >> -                             FBINFO_HWACCEL_FILLRECT |
> >> -                             FBINFO_HWACCEL_IMAGEBLIT;
> >> -       info->fbops =3D &nouveau_fbcon_sw_ops;
> >> -       info->fix.smem_start =3D nvbo->bo.resource->bus.offset;
> >> -       info->fix.smem_len =3D nvbo->bo.base.size;
> >> -
> >> -       info->screen_base =3D nvbo_kmap_obj_iovirtual(nvbo);
> >> -       info->screen_size =3D nvbo->bo.base.size;
> >> -
> >> -       drm_fb_helper_fill_info(info, &fbcon->helper, sizes);
> >> -
> >> -       /* Use default scratch pixmap (info->pixmap.flags =3D FB_PIXMA=
P_SYSTEM) */
> >> -
> >> -       if (chan)
> >> -               nouveau_fbcon_accel_init(dev);
> >> -       nouveau_fbcon_zfill(dev, fbcon);
> >> -
> >> -       /* To allow resizeing without swapping buffers */
> >> -       NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
> >> -               fb->width, fb->height, nvbo->offset, nvbo);
> >> -
> >> -       if (dev_is_pci(dev->dev))
> >> -               vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), inf=
o);
> >> -
> >> -       return 0;
> >> -
> >> -out_unlock:
> >> -       if (chan)
> >> -               nouveau_vma_del(&fbcon->vma);
> >> -       nouveau_bo_unmap(nvbo);
> >> -out_unpin:
> >> -       nouveau_bo_unpin(nvbo);
> >> -out_unref:
> >> -       nouveau_bo_ref(NULL, &nvbo);
> >> -out:
> >> -       return ret;
> >> -}
> >> -
> >> -static int
> >> -nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *f=
bcon)
> >> -{
> >> -       struct drm_framebuffer *fb =3D fbcon->helper.fb;
> >> -       struct nouveau_bo *nvbo;
> >> -
> >> -       drm_fb_helper_unregister_info(&fbcon->helper);
> >> -       drm_fb_helper_fini(&fbcon->helper);
> >> -
> >> -       if (fb && fb->obj[0]) {
> >> -               nvbo =3D nouveau_gem_object(fb->obj[0]);
> >> -               nouveau_vma_del(&fbcon->vma);
> >> -               nouveau_bo_unmap(nvbo);
> >> -               nouveau_bo_unpin(nvbo);
> >> -               drm_framebuffer_put(fb);
> >> -       }
> >> -
> >> -       return 0;
> >> -}
> >> -
> >> -void nouveau_fbcon_gpu_lockup(struct fb_info *info)
> >> -{
> >> -       struct nouveau_fbdev *fbcon =3D info->par;
> >> -       struct nouveau_drm *drm =3D nouveau_drm(fbcon->helper.dev);
> >> -
> >> -       NV_ERROR(drm, "GPU lockup - switching to software fbcon\n");
> >> -       info->flags |=3D FBINFO_HWACCEL_DISABLED;
> >> -}
> >> -
> >> -static const struct drm_fb_helper_funcs nouveau_fbcon_helper_funcs =
=3D {
> >> -       .fb_probe =3D nouveau_fbcon_create,
> >> -};
> >> -
> >> -static void
> >> -nouveau_fbcon_set_suspend_work(struct work_struct *work)
> >> -{
> >> -       struct nouveau_drm *drm =3D container_of(work, typeof(*drm), f=
bcon_work);
> >> -       int state =3D READ_ONCE(drm->fbcon_new_state);
> >> -
> >> -       if (state =3D=3D FBINFO_STATE_RUNNING)
> >> -               pm_runtime_get_sync(drm->dev->dev);
> >> -
> >> -       console_lock();
> >> -       if (state =3D=3D FBINFO_STATE_RUNNING)
> >> -               nouveau_fbcon_accel_restore(drm->dev);
> >> -       drm_fb_helper_set_suspend(&drm->fbcon->helper, state);
> >> -       if (state !=3D FBINFO_STATE_RUNNING)
> >> -               nouveau_fbcon_accel_save_disable(drm->dev);
> >> -       console_unlock();
> >> -
> >> -       if (state =3D=3D FBINFO_STATE_RUNNING) {
> >> -               nouveau_fbcon_hotplug_resume(drm->fbcon);
> >> -               pm_runtime_mark_last_busy(drm->dev->dev);
> >> -               pm_runtime_put_autosuspend(drm->dev->dev);
> >> -       }
> >> -}
> >> -
> >> -void
> >> -nouveau_fbcon_set_suspend(struct drm_device *dev, int state)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -
> >> -       if (!drm->fbcon)
> >> -               return;
> >> -
> >> -       drm->fbcon_new_state =3D state;
> >> -       /* Since runtime resume can happen as a result of a sysfs oper=
ation,
> >> -        * it's possible we already have the console locked. So handle=
 fbcon
> >> -        * init/deinit from a seperate work thread
> >> -        */
> >> -       schedule_work(&drm->fbcon_work);
> >> -}
> >> -
> >> -void
> >> -nouveau_fbcon_output_poll_changed(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       struct nouveau_fbdev *fbcon =3D drm->fbcon;
> >> -       int ret;
> >> -
> >> -       if (!fbcon)
> >> -               return;
> >> -
> >> -       mutex_lock(&fbcon->hotplug_lock);
> >> -
> >> -       ret =3D pm_runtime_get(dev->dev);
> >> -       if (ret =3D=3D 1 || ret =3D=3D -EACCES) {
> >> -               drm_fb_helper_hotplug_event(&fbcon->helper);
> >> -
> >> -               pm_runtime_mark_last_busy(dev->dev);
> >> -               pm_runtime_put_autosuspend(dev->dev);
> >> -       } else if (ret =3D=3D 0) {
> >> -               /* If the GPU was already in the process of suspending=
 before
> >> -                * this event happened, then we can't block here as we=
'll
> >> -                * deadlock the runtime pmops since they wait for us t=
o
> >> -                * finish. So, just defer this event for when we runti=
me
> >> -                * resume again. It will be handled by fbcon_work.
> >> -                */
> >> -               NV_DEBUG(drm, "fbcon HPD event deferred until runtime =
resume\n");
> >> -               fbcon->hotplug_waiting =3D true;
> >> -               pm_runtime_put_noidle(drm->dev->dev);
> >> -       } else {
> >> -               DRM_WARN("fbcon HPD event lost due to RPM failure: %d\=
n",
> >> -                        ret);
> >> -       }
> >> -
> >> -       mutex_unlock(&fbcon->hotplug_lock);
> >> -}
> >> -
> >> -void
> >> -nouveau_fbcon_hotplug_resume(struct nouveau_fbdev *fbcon)
> >> -{
> >> -       struct nouveau_drm *drm;
> >> -
> >> -       if (!fbcon)
> >> -               return;
> >> -       drm =3D nouveau_drm(fbcon->helper.dev);
> >> -
> >> -       mutex_lock(&fbcon->hotplug_lock);
> >> -       if (fbcon->hotplug_waiting) {
> >> -               fbcon->hotplug_waiting =3D false;
> >> -
> >> -               NV_DEBUG(drm, "Handling deferred fbcon HPD events\n");
> >> -               drm_fb_helper_hotplug_event(&fbcon->helper);
> >> -       }
> >> -       mutex_unlock(&fbcon->hotplug_lock);
> >> -}
> >> -
> >> -int
> >> -nouveau_fbcon_init(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -       struct nouveau_fbdev *fbcon;
> >> -       int preferred_bpp =3D nouveau_fbcon_bpp;
> >> -       int ret;
> >> -
> >> -       if (!dev->mode_config.num_crtc ||
> >> -           (to_pci_dev(dev->dev)->class >> 8) !=3D PCI_CLASS_DISPLAY_=
VGA)
> >> -               return 0;
> >> -
> >> -       fbcon =3D kzalloc(sizeof(struct nouveau_fbdev), GFP_KERNEL);
> >> -       if (!fbcon)
> >> -               return -ENOMEM;
> >> -
> >> -       drm->fbcon =3D fbcon;
> >> -       INIT_WORK(&drm->fbcon_work, nouveau_fbcon_set_suspend_work);
> >> -       mutex_init(&fbcon->hotplug_lock);
> >> -
> >> -       drm_fb_helper_prepare(dev, &fbcon->helper, &nouveau_fbcon_help=
er_funcs);
> >> -
> >> -       ret =3D drm_fb_helper_init(dev, &fbcon->helper);
> >> -       if (ret)
> >> -               goto free;
> >> -
> >> -       if (preferred_bpp !=3D 8 && preferred_bpp !=3D 16 && preferred=
_bpp !=3D 32) {
> >> -               if (drm->client.device.info.ram_size <=3D 32 * 1024 * =
1024)
> >> -                       preferred_bpp =3D 8;
> >> -               else
> >> -               if (drm->client.device.info.ram_size <=3D 64 * 1024 * =
1024)
> >> -                       preferred_bpp =3D 16;
> >> -               else
> >> -                       preferred_bpp =3D 32;
> >> -       }
> >> -
> >> -       /* disable all the possible outputs/crtcs before entering KMS =
mode */
> >> -       if (!drm_drv_uses_atomic_modeset(dev))
> >> -               drm_helper_disable_unused_functions(dev);
> >> -
> >> -       ret =3D drm_fb_helper_initial_config(&fbcon->helper, preferred=
_bpp);
> >> -       if (ret)
> >> -               goto fini;
> >> -
> >> -       if (fbcon->helper.info)
> >> -               fbcon->helper.info->pixmap.buf_align =3D 4;
> >> -       return 0;
> >> -
> >> -fini:
> >> -       drm_fb_helper_fini(&fbcon->helper);
> >> -free:
> >> -       kfree(fbcon);
> >> -       drm->fbcon =3D NULL;
> >> -       return ret;
> >> -}
> >> -
> >> -void
> >> -nouveau_fbcon_fini(struct drm_device *dev)
> >> -{
> >> -       struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> -
> >> -       if (!drm->fbcon)
> >> -               return;
> >> -
> >> -       drm_kms_helper_poll_fini(dev);
> >> -       nouveau_fbcon_accel_fini(dev);
> >> -       nouveau_fbcon_destroy(dev, drm->fbcon);
> >> -       kfree(drm->fbcon);
> >> -       drm->fbcon =3D NULL;
> >> -}
> >>
> >> base-commit: ac04152253dccfb02dcedfa0c57443122cf79314
> >> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> >> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> >> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
> >> prerequisite-patch-id: 853c830f6fc7694a35722e80a62e44d747cea28b
> >> prerequisite-patch-id: 7e8f220a3d7008e1f00ce45284bfb720dc991c26
> >> prerequisite-patch-id: 2ec9ce71b48b092a8b4094cc41ea209d5fa3a5ef
> >> prerequisite-patch-id: b25270a955163dc801769f67ca44e919fdc305a4
> >> prerequisite-patch-id: 6286587475991a8439059864345a15d0fc3fb407
> >> prerequisite-patch-id: 2f651e5282003e965f50ebd199cdfe5dddcd054e
> >> prerequisite-patch-id: ef995de38db489d09c3561d563db75d432ffc897
> >> prerequisite-patch-id: 386b9eb148e01ab8fbb146b1a9c7fe0f28bc13dd
> >> prerequisite-patch-id: 4071f4e268f7800381a5db5689ac0ac0f0a61f60
> >> prerequisite-patch-id: b40e35fb7a292f72f5c31a3eebc26e187486b540
> >> prerequisite-patch-id: 7e4a8f25e697b7a3ea03994bbd392eca6241eb11
> >> prerequisite-patch-id: cbcd466b8a65ceebbac5b021e39b0ea81777c245
> >> --
> >> 2.39.0
> >>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
