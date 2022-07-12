Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D2C572163
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 18:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6248695675;
	Tue, 12 Jul 2022 16:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CB395673
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 16:50:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r14so12040026wrg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gUq4aoUBvcByToPP+7UKCjXNaAh3FW4+50wwxtlcpGU=;
 b=JEJsrYrsJsr22QMN1yr81Aorvtq5Ct8d8HgnV/jPqm81K6bJ32bYeLFSODfJeqUX3Q
 4PwypjJzRNWcdo/pdUWwQc0MhCHufvduRJDkzXBQ19M/AZUclVle7bMxmlwOnOAr6Q66
 8s1RuD7cdiFMGtEc83MFecs4GyepKCmIwwooW6xEp+D0tmrJWiCv6SgdoAD5Qxrb7aFS
 Wy2StusuL6qBeDsuol606vvabAG0Xn7wXPP6HHwsy1aRYFaEuqyOXK4wSvq8yXSj0YtE
 mV02CRyZfJjCgIpIJh02WCSsPq9jYM6XncFxmXt2ndIqnRkD23NJ1a/opd68njNnCDrl
 upHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gUq4aoUBvcByToPP+7UKCjXNaAh3FW4+50wwxtlcpGU=;
 b=ZJa+GZ/1/wCGGEVmCtqzsFlhSvjDqM4VJzS/2zJ89QFXDU4SjkBAmRycUx39iNt+34
 dbdoAMZoqwNoJO5Lv0r4hIxcdcLdi53jOoUqERAnkIuFXODu9iy5iSlJfzR+YteafPoF
 C5uD/lLpfx2l5OCjjg9K0B9qQ2OBFUU6h0ncKp3NpwxApIZKiAQAu8gLbfiNTeNKjVcd
 TpIc/hAyNM/w8t6btYGb8MQ+eTPvebC1SX25HlWxZBqhTvDbkVTAbwyyOvaytW7t/POG
 zPJOc+zRLpd9Vu9REF1IVFwfhBDVikBZtK5LVLnlCfH6vQL3YJo3X6/XvsmiDvyRFhTr
 gU+A==
X-Gm-Message-State: AJIora+GQQGyfkGE/4RqK4vs6HaHBtyCXgZxGxnc3rwCQg3ro16dyDUH
 aGk992glpsGyizvn2xJPHwL9JtD7W3CeuF4egRak
X-Google-Smtp-Source: AGRyM1ss2apZFJS9xIlHo11FoTeRrFiKUVCgHVHsLGjP6oHcSPVWodn6AasEsHrm2u39Ss+yNO+vO0PyKEA7Gtd/Qh4=
X-Received: by 2002:adf:e804:0:b0:21d:6e85:7550 with SMTP id
 o4-20020adfe804000000b0021d6e857550mr24217908wrm.337.1657644656109; Tue, 12
 Jul 2022 09:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220712042258.293010-1-jstultz@google.com>
 <20220712042258.293010-2-jstultz@google.com>
 <6e490429-e34c-fa51-c6d9-3315c4639d9d@amd.com>
In-Reply-To: <6e490429-e34c-fa51-c6d9-3315c4639d9d@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 12 Jul 2022 09:50:44 -0700
Message-ID: <CANDhNCo1WAUC9DhGfT19Smq2Z5duruAAwOs6AWUWUvNAjZqgAg@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] drm: vgem: Enable SYNCOBJ and SYNCOBJ_TIMELINE
 on vgem driver
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 12:46 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 12.07.22 um 06:22 schrieb John Stultz:
> > Allows for basic SYNCOBJ api testing, in environments
> > like VMs where there may not be a supported drm driver.
> >
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Chunming Zhou <david1.zhou@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: John Stultz <jstultz@google.com>
> > ---
> >   drivers/gpu/drm/vgem/vgem_drv.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vge=
m_drv.c
> > index c5e3e5457737..e5427d7399da 100644
> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > @@ -109,7 +109,8 @@ static struct drm_gem_object *vgem_gem_create_objec=
t(struct drm_device *dev, siz
> >   }
> >
> >   static const struct drm_driver vgem_driver =3D {
> > -     .driver_features                =3D DRIVER_GEM | DRIVER_RENDER,
> > +     .driver_features                =3D DRIVER_GEM | DRIVER_RENDER |
> > +                                       DRIVER_SYNCOBJ | DRIVER_SYNCOBJ=
_TIMELINE,
>
> Well that's rather surprising. I'm not an export on VGEM, but AFAIK you
> need to adjust the CS interface to support that stuff as well.

Apologies, could you clarify a bit more what you mean here?  This was
just helpful to enable the generic userland ioctls for the example
test tool in this series.

Are you proposing to add interfaces so the vgem driver can
attach/signal syncobjs similar to the
DRM_IOCTL_VGEM_FENCE_ATTACH/DRM_IOCTL_VGEM_FENCE_SIGNAL calls?

thanks
-john
