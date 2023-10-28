Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09017DA7DB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 17:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED4710E0CB;
	Sat, 28 Oct 2023 15:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A320210E08F;
 Sat, 28 Oct 2023 15:36:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507be298d2aso4410343e87.1; 
 Sat, 28 Oct 2023 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698507367; x=1699112167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGm+qcGB+Xm4blqDbAn9Zm2yDdqPOOMI/WPadBuch+0=;
 b=iYPKsJTICc/aA7yAnIEi/YKglLnOmrNg5hwSSAHvzyiyqRqHY3LwjpLmlrmdG4+jsi
 NONjEGNVMev1UAJng/TgMeGkErygxW4GYisgZLR3Mjnodzgjr2I+IXzlGo6BNgr1HGcJ
 Db1luiuvCsVhDI3J+UINeAruUDqAgXeNVIgVGPuGNlyIo4aD0UTxdYdrzuO4qxyebcs6
 BOH9DLPsZ+Ir57X0bDjQnemJUmXX60Xwo5sBkPpraI95WX6T5cBcCy73PQPOs4M+CKT0
 zsob+Nb5g7W4MS8lrAo0cRqkGtRgns+guQ30DOYOZ0FUVS7v6gabpelIqRHz8GWxgH1H
 UAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698507367; x=1699112167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGm+qcGB+Xm4blqDbAn9Zm2yDdqPOOMI/WPadBuch+0=;
 b=HZkT7k4UlUCj+tDprOmxza2oP9KII5JjjO57o4T4ElPAJ9Wo9U4QI3Pk2SlcGUSJaw
 XPc0X+rKGGKrtFZ5Fm8Nat8aKKpfiLPx8pMcI4IlIbpqliUnThDXF74Xtqd9yS+ga8GD
 ho1sAQPVP2uKY6IeutTTMtKF67YH19fCDEWsc5VEdvRF1PI1q7Cf5kDvpD/oxvmHbi7O
 XRS3KTaoNV4yAEUd4FZkdXWLxzYo6rkn+gTZbTg8L+OJPgAM4dL30fotl7hSuLych0XY
 3vubVZ1Ua+UG+g+Gu4FCTajkbeoD4oiw33/eRAGv1Ge+HrPEJoQttGy0YbH7p55OKGJY
 Rwhg==
X-Gm-Message-State: AOJu0Yxg+R+8Ok7nHjlSK7xzR0ytZ2gC5egvshqEdFUB4yEtDjvNM/A1
 4agPgiC0XELTBhW/vbh3GME0qZR7RTXwtVOGQJ8=
X-Google-Smtp-Source: AGHT+IHQgItP0b5ilHHA7W6Z07YFMcKvidUjBJcCPnXmUAh7gMGJhUEBQB/FZHeZEUDQclQPTMUEsjAwnD65+2eQa7s=
X-Received: by 2002:a05:6512:34c6:b0:507:9683:519f with SMTP id
 w6-20020a05651234c600b005079683519fmr3728630lfr.37.1698507366486; Sat, 28 Oct
 2023 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194537.408922-1-robdclark@gmail.com>
 <CAA8EJpoOHqzQBESqjxCh4DHztJrsBQ5gKtkj++jYTAYEds9Ocg@mail.gmail.com>
In-Reply-To: <CAA8EJpoOHqzQBESqjxCh4DHztJrsBQ5gKtkj++jYTAYEds9Ocg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 28 Oct 2023 08:35:54 -0700
Message-ID: <CAF6AEGswNUH6e8HNHMquyv__6kM9Xz39SaZ9n5c4ydrxJz_sig@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gem: Add metadata
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 6:16=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 27 Oct 2023 at 22:45, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The EXT_external_objects extension is a bit awkward as it doesn't pass
> > explicit modifiers, leaving the importer to guess with incomplete
> > information.  In the case of vk (turnip) exporting and gl (freedreno)
> > importing, the "OPTIMAL_TILING_EXT" layout depends on VkImageCreateInfo
> > flags (among other things), which the importer does not know.  Which
> > unfortunately leaves us with the need for a metadata back-channel.
> >
> > The contents of the metadata are defined by userspace.  The
> > EXT_external_objects extension is only required to work between
> > compatible versions of gl and vk drivers, as defined by device and
> > driver UUIDs.

jfyi, userspace side of this at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25945

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 59 +++++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/msm/msm_gem.h |  4 +++
> >  include/uapi/drm/msm_drm.h    |  2 ++
> >  3 files changed, 63 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index b61ccea05327..8fe2677ea37a 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -37,9 +37,10 @@
> >   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
> >   * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
> >   * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
> > + * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
> >   */
> >  #define MSM_VERSION_MAJOR      1
> > -#define MSM_VERSION_MINOR      10
> > +#define MSM_VERSION_MINOR      12
> >  #define MSM_VERSION_PATCHLEVEL 0
> >
> >  static void msm_deinit_vram(struct drm_device *ddev);
> > @@ -566,6 +567,8 @@ static int msm_ioctl_gem_info(struct drm_device *de=
v, void *data,
> >                 break;
> >         case MSM_INFO_SET_NAME:
> >         case MSM_INFO_GET_NAME:
> > +       case MSM_INFO_SET_METADATA:
> > +       case MSM_INFO_GET_METADATA:
> >                 break;
> >         default:
> >                 return -EINVAL;
> > @@ -618,7 +621,7 @@ static int msm_ioctl_gem_info(struct drm_device *de=
v, void *data,
> >                 break;
> >         case MSM_INFO_GET_NAME:
> >                 if (args->value && (args->len < strlen(msm_obj->name)))=
 {
> > -                       ret =3D -EINVAL;
> > +                       ret =3D -ETOOSMALL;
>
> This is unrelated and it also slightly changes user interface, so it
> IMO should come as a separate commit/

fair, although it was changed for consistency with GET_METADATA

> >                         break;
> >                 }
> >                 args->len =3D strlen(msm_obj->name);
> > @@ -627,6 +630,58 @@ static int msm_ioctl_gem_info(struct drm_device *d=
ev, void *data,
> >                                          msm_obj->name, args->len))
> >                                 ret =3D -EFAULT;
> >                 }
> > +               break;
> > +       case MSM_INFO_SET_METADATA:
> > +               /* Impose a moderate upper bound on metadata size: */
> > +               if (args->len > 128) {
> > +                       ret =3D -EOVERFLOW;
> > +                       break;
> > +               }
> > +
> > +               ret =3D msm_gem_lock_interruptible(obj);
> > +               if (ret)
> > +                       break;
> > +
> > +               msm_obj->metadata =3D
> > +                       krealloc(msm_obj->metadata, args->len, GFP_KERN=
EL);
> > +               msm_obj->metadata_size =3D args->len;
> > +
> > +               if (copy_from_user(msm_obj->metadata, u64_to_user_ptr(a=
rgs->value),
> > +                                  args->len)) {
> > +                       msm_obj->metadata_size =3D 0;
> > +                       ret =3D -EFAULT;
> > +               }
> > +
> > +               msm_gem_unlock(obj);
> > +
> > +               break;
> > +       case MSM_INFO_GET_METADATA:
> > +               if (!args->value) {
> > +                       /*
> > +                        * Querying the size is inherently racey, but
> > +                        * EXT_external_objects expects the app to conf=
irm
> > +                        * via device and driver UUIDs that the exporte=
r and
> > +                        * importer versions match.  All we can do from=
 the
> > +                        * kernel side is check the length under obj lo=
ck
> > +                        * when userspace tries to retrieve the metadat=
a
> > +                        */
> > +                       args->len =3D msm_obj->metadata_size;
> > +                       break;
> > +               }
> > +
> > +               ret =3D msm_gem_lock_interruptible(obj);
> > +               if (ret)
> > +                       break;
> > +
> > +               if (args->len < msm_obj->metadata_size) {
> > +                       ret =3D -ETOOSMALL;
> > +               } else if (copy_to_user(u64_to_user_ptr(args->value),
> > +                                       msm_obj->metadata, args->len)) =
{
> > +                       ret =3D -EFAULT;
> > +               }
>
> Doesn't checkpwatch warn here about extra curly brackets?

It might.. it is one of the many checkpatch warnings that I dutifully ignor=
e ;-)

BR,
-R

> > +
> > +               msm_gem_unlock(obj);
> > +
> >                 break;
> >         }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index 7f34263048a3..8d414b072c29 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -109,6 +109,10 @@ struct msm_gem_object {
> >
> >         char name[32]; /* Identifier to print for the debugfs files */
> >
> > +       /* userspace metadata backchannel */
> > +       void *metadata;
> > +       u32 metadata_size;
> > +
> >         /**
> >          * pin_count: Number of times the pages are pinned
> >          *
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 6c34272a13fd..6f2a7ad04aa4 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -139,6 +139,8 @@ struct drm_msm_gem_new {
> >  #define MSM_INFO_GET_NAME      0x03   /* get debug name, returned by p=
ointer */
> >  #define MSM_INFO_SET_IOVA      0x04   /* set the iova, passed by value=
 */
> >  #define MSM_INFO_GET_FLAGS     0x05   /* get the MSM_BO_x flags */
> > +#define MSM_INFO_SET_METADATA  0x06   /* set userspace metadata */
> > +#define MSM_INFO_GET_METADATA  0x07   /* get userspace metadata */
> >
> >  struct drm_msm_gem_info {
> >         __u32 handle;         /* in */
> > --
> > 2.41.0
> >
>
>
> --
> With best wishes
> Dmitry
