Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAF7ECCED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 20:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E43A10E178;
	Wed, 15 Nov 2023 19:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3D10E178
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 19:33:18 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3b5aee410f2so13631b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700076797; x=1700681597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IlDh6BA25cklyVUGxLrq0BMBGhOE7EADMlj8E0gBvo=;
 b=IvS+svaofigNiHm4ZkQAxvv8/IXOXN7yzK3KaxlFf6Fbgm1e9mX4pDeWbqwl3F4846
 0FCyNtfoq9zgK/7NHbOqyU+2FPeipxK9JJ1qdkC878oLQ3bd3L8v9MqVra1glsmtHWeZ
 iVpskAQdrQryQ3jUT/vrC/6qeR6zfFuccg0aD7eD6lzsacziSytFz3P5/ZiSSj/rirPr
 cPm+1ExPq/n6mAYqxmiKY2hThPjvpq4WJqAdPfdSRJYTZo05diFYCy5/KdmnAhHcf3bz
 bt3jFYSQ7Z/TgYMr4wXBFT4iAeVEhPw6BMPNaAOlPluMZQp4GyV3WSvSbuW6fR3qYl2U
 0qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700076797; x=1700681597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/IlDh6BA25cklyVUGxLrq0BMBGhOE7EADMlj8E0gBvo=;
 b=cGpJyqBodnEVEMKmxrc4xbx4QufgNkpGgX+lIITiYrV7es6bQLcFDwmddWP0qCwhYS
 2JJTtQbYjkoEpBN58bHG7Iwb7iGqpL3QQcQ9W2gpjStl8OjCEjj8BA4+jKECdh1W+tv2
 ouAA5cdYFT43IyOZl4JYIqVOFNQfG5MwTXXXBEEsFVIshicmXWqf6vDe5b/0lyj0Uys9
 FO9i/mSXhOhN/2jTW44vsuorfAdBJlh7X49KZ0jnAn8mbxrTR0E/s8Yb3KoibbQQnuKm
 rRSib6nV4TnSB7D4XcvY1HMCuTeeGImEatSTgNZj61ekQZFeivghySRSJBeNyPt2TxSE
 MO7w==
X-Gm-Message-State: AOJu0YwTKgl2JBeCdXrDxcfaYUkj+kgkVDyr5+XESKQw168bpGG2ArJO
 AW6qPv2h9ej5KLHJ1UqpC7E2PU0viVq8DX4LwZbtjA==
X-Google-Smtp-Source: AGHT+IFMFDUkGUwWEvF5Saq4BbZXy0sqfAid4D3HEq1LQ7pFsGYsyZceAB4Tsza0BqyiFHT2wREERfNM4XOtta+XAmc=
X-Received: by 2002:a05:6358:9386:b0:169:9859:ccc3 with SMTP id
 h6-20020a056358938600b001699859ccc3mr6697212rwb.12.1700076797522; Wed, 15 Nov
 2023 11:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20231115141928.429688-1-dipamt1729@gmail.com>
 <CAA8EJprqnUGQxmj4Y=qttVuj0zJxdD9B6neHa6sPseLLETpk5A@mail.gmail.com>
 <CALHmwsoC5h7_w9OzpUS_-xM6x5WF5V-vFExLEf4y99b2eCcqGQ@mail.gmail.com>
In-Reply-To: <CALHmwsoC5h7_w9OzpUS_-xM6x5WF5V-vFExLEf4y99b2eCcqGQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 21:33:05 +0200
Message-ID: <CAA8EJpoyC=paF1ZuznXgJAkT1fne0RwYfqJh-cdz0WLt02i+bw@mail.gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementation in msm
 driver
To: Dipam Turkar <dipamt1729@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 20:46, Dipam Turkar <dipamt1729@gmail.com> wrote:
>
> They are not outdated, my bad. I went through the locks' code and saw tha=
t they have been updated. But they are probably not necessary here as most =
of the drivers do not use any form of locking in their implementations. The=
 generic implementations drm_gem_dumb_map_offset() and drm_gem_ttm_dumb_map=
_offset() do not have any locking mechanisms either.

Excuse me, but this doesn't sound right to me. There are different
drivers with different implementations. So either we'd need a good
explanation of why it is not necessary, or this patch is NAKed.

>
> Thanks and regards
> Dipam Turkar
>
> On Wed, Nov 15, 2023 at 8:37=E2=80=AFPM Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:
>>
>> On Wed, 15 Nov 2023 at 16:30, Dipam Turkar <dipamt1729@gmail.com> wrote:
>> >
>> > Make msm use drm_gem_create_map_offset() instead of its custom
>> > implementation for associating GEM object with a fake offset. Since,
>> > we already have this generic implementation, we don't need the custom
>> > implementation and it is better to standardize the code for GEM based
>> > drivers. This also removes the outdated locking leftovers.
>>
>> Why are they outdated?
>>
>> >
>> > Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
>> > ---
>> >  drivers/gpu/drm/msm/msm_drv.c |  2 +-
>> >  drivers/gpu/drm/msm/msm_gem.c | 21 ---------------------
>> >  drivers/gpu/drm/msm/msm_gem.h |  2 --
>> >  3 files changed, 1 insertion(+), 24 deletions(-)
>> >
>> > Changes in v2:
>> > Modify commit message to include the absence of internal locking lefto=
vers
>> > around allocating a fake offset in msm_gem_mmap_offset() in the generi=
c
>> > implementation drm_gem_create_map_offset().
>> >
>> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_d=
rv.c
>> > index a428951ee539..86a15992c717 100644
>> > --- a/drivers/gpu/drm/msm/msm_drv.c
>> > +++ b/drivers/gpu/drm/msm/msm_drv.c
>> > @@ -1085,7 +1085,7 @@ static const struct drm_driver msm_driver =3D {
>> >         .open               =3D msm_open,
>> >         .postclose          =3D msm_postclose,
>> >         .dumb_create        =3D msm_gem_dumb_create,
>> > -       .dumb_map_offset    =3D msm_gem_dumb_map_offset,
>> > +       .dumb_map_offset    =3D drm_gem_dumb_map_offset,
>> >         .gem_prime_import_sg_table =3D msm_gem_prime_import_sg_table,
>> >  #ifdef CONFIG_DEBUG_FS
>> >         .debugfs_init       =3D msm_debugfs_init,
>> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_g=
em.c
>> > index db1e748daa75..489694ef79cb 100644
>> > --- a/drivers/gpu/drm/msm/msm_gem.c
>> > +++ b/drivers/gpu/drm/msm/msm_gem.c
>> > @@ -671,27 +671,6 @@ int msm_gem_dumb_create(struct drm_file *file, st=
ruct drm_device *dev,
>> >                         MSM_BO_SCANOUT | MSM_BO_WC, &args->handle, "du=
mb");
>> >  }
>> >
>> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device =
*dev,
>> > -               uint32_t handle, uint64_t *offset)
>> > -{
>> > -       struct drm_gem_object *obj;
>> > -       int ret =3D 0;
>> > -
>> > -       /* GEM does all our handle to object mapping */
>> > -       obj =3D drm_gem_object_lookup(file, handle);
>> > -       if (obj =3D=3D NULL) {
>> > -               ret =3D -ENOENT;
>> > -               goto fail;
>> > -       }
>> > -
>> > -       *offset =3D msm_gem_mmap_offset(obj);
>> > -
>> > -       drm_gem_object_put(obj);
>> > -
>> > -fail:
>> > -       return ret;
>> > -}
>> > -
>> >  static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>> >  {
>> >         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
>> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_g=
em.h
>> > index 8ddef5443140..dc74a0ef865d 100644
>> > --- a/drivers/gpu/drm/msm/msm_gem.h
>> > +++ b/drivers/gpu/drm/msm/msm_gem.h
>> > @@ -139,8 +139,6 @@ struct page **msm_gem_pin_pages(struct drm_gem_obj=
ect *obj);
>> >  void msm_gem_unpin_pages(struct drm_gem_object *obj);
>> >  int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev=
,
>> >                 struct drm_mode_create_dumb *args);
>> > -int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device =
*dev,
>> > -               uint32_t handle, uint64_t *offset);
>> >  void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj);
>> >  void *msm_gem_get_vaddr(struct drm_gem_object *obj);
>> >  void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
>> > --
>> > 2.34.1
>> >
>>
>>
>> --
>> With best wishes
>> Dmitry



--=20
With best wishes
Dmitry
