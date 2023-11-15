Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC57EBE99
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 09:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEC110E515;
	Wed, 15 Nov 2023 08:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B9B10E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 08:33:42 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5a7dd65052aso76508467b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 00:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700037221; x=1700642021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loUWrR6eECAA+uv6HMt8OKh14KvU7DOewoh9g24/Sfw=;
 b=TNrAu7P/vWJwPnQfsSXvaDAlU7aLQWuZFh4le+e7Q3Rb+tCfyOljDrsbitLjevkKji
 IcHf771uCgedY5agiT8mr0CdFaBCibKaOyEWix/eBIAw68qvC6ZTDYzDsx1uVZw/IOYI
 dKoJWWyZz6YhCcEGDd0N0QCMswgBR0SciOc4fBB8nPNQ5FztUcesK7nxB5R5VFIj2EM5
 uO1Tp2tui0PnXirCF9qGX9JeA9EhmMgcTKS44mVw35/0xzcVQAE7oWMq02/0w9Gt0EwU
 HHSTmN54h291M3+q0jJePMIUVlGYgbzmwPVUGZWu9zWFCDdRTvsY1RqaKICyJ7BzFTh0
 8YKg==
X-Gm-Message-State: AOJu0YzykxffzBcKByhP8QfwvxTadJ+Kb5w5ocD8k+sXEx8laA1MKTrE
 QTK+Lo20RuFZgnV4YEjZL1rM1Px6gAsf4g==
X-Google-Smtp-Source: AGHT+IEXO3AoHW022/UiIJkdiYP/HJN/q58zp9TjLsBaN4An9wWxFK9HggyPH2utKV0jISilH8IimQ==
X-Received: by 2002:a0d:d307:0:b0:570:28a9:fe40 with SMTP id
 v7-20020a0dd307000000b0057028a9fe40mr12490458ywd.5.1700037221167; 
 Wed, 15 Nov 2023 00:33:41 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 w205-20020a0dd4d6000000b005af5ef0687fsm258371ywd.6.2023.11.15.00.33.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 00:33:40 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5a7c011e113so76327717b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 00:33:40 -0800 (PST)
X-Received: by 2002:a81:8408:0:b0:5a7:a81d:e410 with SMTP id
 u8-20020a818408000000b005a7a81de410mr13654199ywf.18.1700037220389; Wed, 15
 Nov 2023 00:33:40 -0800 (PST)
MIME-Version: 1.0
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
 <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
 <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
 <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de>
In-Reply-To: <fee4eb69-97ea-4b02-9e36-0962ebe3faa9@xenosoft.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2023 09:33:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
Message-ID: <CAMuHMdWu6Q3ew0m4xugjF_hgSt0RFFr+ccoBrSzt0FGLgtxJtA@mail.gmail.com>
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 virtualization@lists.linux.dev,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, mad skateman <madskateman@gmail.com>,
 deller@gmx.de, Christian Zigotzky <info@xenosoft.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

CC virtgpu

On Tue, Nov 14, 2023 at 10:45=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> On 13 November 2023 at 01:48 pm, Geert Uytterhoeven wrote:
> > I can confirm there is no graphics output with m68k/virt, and

Before the error message you reported:

    virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup
generic emulation (ret=3D-2)

it also prints:

    virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not support=
ed
    virtio-mmio virtio-mmio.125: [drm] No compatible format found

Upon closer look, it turns out virtgpu is special in that its main
plane supports only a single format: DRM_FORMAT_HOST_XRGB8888, which
is XR24 on little-endian, and BX24 on big-endian.  I.e. on big-endian,
virtgpu does not support XR24.  Isn't this a violation of the DRM
rule that every driver must implement support for XR24?

> > bisected this to my own commit 6ae2ff23aa43a0c4 ("drm/client: Convert
> > drm_client_buffer_addfb() to drm_mode_addfb2()"), ouch...
> >
> > It turns out the old call to drm_mode_addfb() caused a translation
> > from a fourcc to a bpp/depth pair to a _different_ fourcc, due to the
> > quirk processing in drm_driver_legacy_fb_format().
> > I.e. on m68k/virt, the original requested format was XR24, which was
> > translated to BX24. The former doesn't work, the latter works.
> >
> > The following (gmail-whitespace-damaged) patch fixed the issue for me:
> >
> > --- a/drivers/gpu/drm/drm_client.c
> > +++ b/drivers/gpu/drm/drm_client.c
> > @@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struct
> > drm_client_buffer *buffer,
> >
> >         fb_req.width =3D width;
> >         fb_req.height =3D height;
> > +       if (client->dev->mode_config.quirk_addfb_prefer_host_byte_order=
) {
> > +               if (format =3D=3D DRM_FORMAT_XRGB8888)
> > +                       format =3D DRM_FORMAT_HOST_XRGB8888;
> > +               if (format =3D=3D DRM_FORMAT_ARGB8888)
> > +                       format =3D DRM_FORMAT_HOST_ARGB8888;
> > +               if (format =3D=3D DRM_FORMAT_RGB565)
> > +                       format =3D DRM_FORMAT_HOST_RGB565;
> > +               if (format =3D=3D DRM_FORMAT_XRGB1555)
> > +                       format =3D DRM_FORMAT_HOST_XRGB1555;
> > +       }
> >         fb_req.pixel_format =3D format;
> >         fb_req.handles[0] =3D handle;
> >         fb_req.pitches[0] =3D buffer->pitch;
> >
> > However, I don't think we want to sprinkle more of these
> > translations around... So perhaps we should (re)add a call to
> > drm_driver_legacy_fb_format() to drm_client_buffer_addfb()?
> >
> > Second, as I doubt you are using a big-endian system, you are probably
> > running into a slightly different issue.
> >
> > Oh wait, you did CC linuxppc-dev, so perhaps you are running on a
> > big-endian machine?
>
> Your patch works! :-) Thanks a lot!
>
> I tested it with the virtio-vga and with the virtio-gpu-pci device in a v=
irtual ppce500 QEMU/KVM HV machine with an e5500 CPU today.
>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Thanks for testing!

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
