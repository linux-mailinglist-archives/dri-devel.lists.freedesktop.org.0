Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9F73FB9B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 14:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51210E0C2;
	Tue, 27 Jun 2023 12:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC0A10E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 12:01:49 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5702415be17so35354387b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 05:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687867308; x=1690459308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaDvMAxfFXfyEZM4SJAuMBnx36vSWVo7HcR7XHEqTMs=;
 b=NWDgPUnIbBZYYxHz7CPl8xInnd09qjaMTa7fb3t2mI+7WCiSedqRPd3PrbIZ1b2fnx
 OQmjVD7ziC2xrQEu1jOvz08FztMDWNcl+Z53eKTZTdp3hN7mbhWYR8G51waiBkj5TJnV
 iPtWRgRMFKMp7cBtZdaJ0ljf+aus99dAQBx0PrnXxfBEveEKOHC1kalyDiqnRtUQWLPq
 mJJfVqi5Up2oz0PgQnr1MajmXOlriZVbjUrjy+98UFf6I8QrqT6S2zAus/FBR9sdhSIP
 5YlYmUmdUI4d/S/vIAqFs7h3GgfvnNsSuwHyXarT6PSkg+3krCspL8E2AOmdR814Zwap
 PGhA==
X-Gm-Message-State: AC+VfDwusHescVK24WTmmgmPtgnP5pPx3PVUQ9Nc/C0bQqCTrxYATNGl
 M+esLd/NjbrwPNxA6MV0NsRc4quICujtcBSJ
X-Google-Smtp-Source: ACHHUZ7n8QU1cwRblLLRqM2aQFrv/u8ZI2vPst0lyBjhv/Wod8xQggbpO97LcASXd6uZEq7Wf9VbFA==
X-Received: by 2002:a25:f802:0:b0:b9e:712f:4a17 with SMTP id
 u2-20020a25f802000000b00b9e712f4a17mr22534874ybd.6.1687867307921; 
 Tue, 27 Jun 2023 05:01:47 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 t4-20020a259ac4000000b00bb144da7d68sm1520103ybo.13.2023.06.27.05.01.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 05:01:46 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-bff89873d34so2970236276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 05:01:46 -0700 (PDT)
X-Received: by 2002:a25:f802:0:b0:b9e:712f:4a17 with SMTP id
 u2-20020a25f802000000b00b9e712f4a17mr22534779ybd.6.1687867306425; Tue, 27 Jun
 2023 05:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <20230416115237.798604-4-dmitry.osipenko@collabora.com>
 <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
 <0ca8034d-0377-26b9-51c8-8caff6c4174a@collabora.com>
 <CAMuHMdWfE=6xFsYFv=mCACpwZp45AiCzFxEB=suEFBhv9ry5aw@mail.gmail.com>
 <2f4d3e96-1e10-3662-bfc5-8c361a4c1366@collabora.com>
In-Reply-To: <2f4d3e96-1e10-3662-bfc5-8c361a4c1366@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jun 2023 14:01:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV924gJs1X1nMUbQ5LEbFe8hrrXgxxvgZ_dXf95O0bK5Q@mail.gmail.com>
Message-ID: <CAMuHMdV924gJs1X1nMUbQ5LEbFe8hrrXgxxvgZ_dXf95O0bK5Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/virtio: Support sync objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Mon, Jun 26, 2023 at 6:11=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> On 6/25/23 18:36, Geert Uytterhoeven wrote:
> > On Sun, Jun 25, 2023 at 2:41=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >> On 6/25/23 11:47, Geert Uytterhoeven wrote:
> >>> On Sun, Apr 16, 2023 at 1:55=E2=80=AFPM Dmitry Osipenko
> >>> <dmitry.osipenko@collabora.com> wrote:
> >>>> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
> >>>> support is needed by native context VirtIO-GPU Mesa drivers, it also=
 will
> >>>> be used by Venus and Virgl contexts.
> >>>>
> >>>> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
> >>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> >>>> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> >>>
> >>>> +static int
> >>>> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
> >>>> +{
> >>>> +       struct drm_virtgpu_execbuffer *exbuf =3D submit->exbuf;
> >>>> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
> >>>> +       size_t syncobj_stride =3D exbuf->syncobj_stride;
> >>>> +       u32 num_in_syncobjs =3D exbuf->num_in_syncobjs;
> >>>> +       struct drm_syncobj **syncobjs;
> >>>> +       int ret =3D 0, i;
> >>>> +
> >>>> +       if (!num_in_syncobjs)
> >>>> +               return 0;
> >>>> +
> >>>> +       /*
> >>>> +        * kvalloc at first tries to allocate memory using kmalloc a=
nd
> >>>> +        * falls back to vmalloc only on failure. It also uses GFP_N=
OWARN
> >>>
> >>> GFP_NOWARN does not exist.
> >>
> >> https://elixir.bootlin.com/linux/v6.4-rc7/source/include/linux/gfp_typ=
es.h#L38
> >
> > That line defines "__GFP_NOWARN", not "GFP_NOWARN".
> > C is case- and underscore-sensitive. as is "git grep -w" ;-)
>
> The removal of underscores was done intentionally for improving
> readability of the comment

Please don't do that, as IMHO it actually hampers readability:
  1. For some xxx, both GFP_xxx and __GFP_xxx are defined,
     so it does matter which one you are referring to,
  2. After dropping the underscores, "git grep -w" can no longer find
     the definition, nor its users.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
