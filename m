Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83F87A554
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 10:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC30310F136;
	Wed, 13 Mar 2024 09:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147CA10F136
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 09:56:36 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso4809661276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 02:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710323794; x=1710928594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ja4qsA1ccNr9rJs77hykqre5eHlisRncF9fzqjX4jIs=;
 b=nbBSleDZcggIaG7Z06BUkt5302O53OWWcA5/XDlK0qW3RP9vFg7FNT/Cx6Mc/+Bahd
 sRxoPZvparLi+ZoEaiwRx3XWSeel9svPELi1pSH/k1eMXyl4lOmb3tfBCvQyLQLBMloa
 Brs5EFlTX22AveoTJdimsulLSBMNKKBFCBTeF0YcGWKPev26mqyvTxsywyj3dbqMSFk2
 r6w0GzdQCJo4ZEQcvX99rQC4GYs8T4I2NLdXebCvbvzLKMrMaP7OKXyHrKW4NedO/rWr
 RVlIqpMVUPBYJGcbWObQW9UKtmEXedV8Rhx02RNG0ap4LR9bvGBKBMzyG4NOouSS7Nx9
 6Nsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu4XqgJVYcFzcIXo9p25GOwRPGPYc1Uz0kj2uT8EynbhJS51ayz0/g7NoEXB/hd5t64UO0QqtFWm7GmK5e78m/rBPjXxpuctrg5YLznb9J
X-Gm-Message-State: AOJu0YxJX0GUZqbcKQDupAjpttLluJ8U1Df1DJDeJl+873jK8UT1AVvT
 bBSfJ3J1TREbxMrCEL4pRAPJSOeSdMPe3zXhsnGqCVD3+2lUAvQH8aKIeC3GTWo=
X-Google-Smtp-Source: AGHT+IEckC6uyj1SAWhsLBfBDIf9J8jvaPaPRXdCXmM52LMXKCJmcDUE6g2EJLmRcVKpNhedpcffzA==
X-Received: by 2002:a05:6902:250d:b0:dcd:3a37:bdb1 with SMTP id
 dt13-20020a056902250d00b00dcd3a37bdb1mr2129853ybb.44.1710323794226; 
 Wed, 13 Mar 2024 02:56:34 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 d28-20020a25361c000000b00dcc7b9115fcsm2186220yba.3.2024.03.13.02.56.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 02:56:33 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso4824637276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 02:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCSKxPaY9ojkayP/Tbcg5Gqsuh8ElAnQ8wf9LSyBxi15l9AlRyGn19+nDaXLASvvnsbvnBtrso4016SV9CZWuYxFgkaAw9FzpLS7o/IoLX
X-Received: by 2002:a05:6902:240d:b0:dcc:54d0:85e2 with SMTP id
 dr13-20020a056902240d00b00dcc54d085e2mr2042139ybb.24.1710323793362; Wed, 13
 Mar 2024 02:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-9-tzimmermann@suse.de>
 <CAMuHMdVqWF=M=6aPRxZ0MBqPVM_wk2x+Oike6za754riHWusSA@mail.gmail.com>
 <ebea6554-835a-42d6-a226-f4f3480a8846@suse.de>
 <CAMuHMdU1wXhhhfaz9ew5xx2AVoKDdjUxqOGVVXwp4FSDmYFUYw@mail.gmail.com>
 <06f5d25f-87c4-4c81-9475-59470145914d@suse.de>
In-Reply-To: <06f5d25f-87c4-4c81-9475-59470145914d@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Mar 2024 10:56:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrHqnwSqnus15+0L-XJGm79YY4YbDt2-zeN=TGFsLL_A@mail.gmail.com>
Message-ID: <CAMuHMdXrHqnwSqnus15+0L-XJGm79YY4YbDt2-zeN=TGFsLL_A@mail.gmail.com>
Subject: Re: [PATCH 08/43] drm/fbdev: Add fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Hi Thomas,

On Wed, Mar 13, 2024 at 10:24=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 13.03.24 um 10:03 schrieb Geert Uytterhoeven:
> > On Wed, Mar 13, 2024 at 9:19=E2=80=AFAM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Am 12.03.24 um 17:14 schrieb Geert Uytterhoeven:
> >>> On Tue, Mar 12, 2024 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
> >>>> Add an fbdev emulation for SHMEM-based memory managers. The code is
> >>>> similar to fbdev-generic, but does not require an addition shadow
> >>>> buffer for mmap(). Fbdev-shmem operates directly on the buffer objec=
t's
> >>>> SHMEM pages. Fbdev's deferred-I/O mechanism updates the hardware sta=
te
> >>>> on write operations.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Thanks for your patch!
> >>>
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> >>>> +static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb=
_helper,
> >>>> +                                          struct drm_fb_helper_surf=
ace_size *sizes)
> >>>> +{
> >>>> +       struct drm_client_dev *client =3D &fb_helper->client;
> >>>> +       struct drm_device *dev =3D fb_helper->dev;
> >>>> +       struct drm_client_buffer *buffer;
> >>>> +       struct drm_gem_shmem_object *shmem;
> >>>> +       struct drm_framebuffer *fb;
> >>>> +       struct fb_info *info;
> >>>> +       u32 format;
> >>>> +       struct iosys_map map;
> >>>> +       int ret;
> >>>> +
> >>>> +       drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\=
n",
> >>>> +                   sizes->surface_width, sizes->surface_height,
> >>>> +                   sizes->surface_bpp);
> >>>> +
> >>>> +       format =3D drm_mode_legacy_fb_format(sizes->surface_bpp, siz=
es->surface_depth);
> >>> Oops, one more caller of the imprecise
> >>> let's-guess-the-format-from-bpp-and-depth machinery to get rid of...
> >> Right, that has been discussed in another thread. I'll change this cal=
l
> >> to the drm_driver_() function.
> > You mean drm_driver_legacy_fb_format()? That has the same issues.
>
> We have the video=3D parameter with its bpp argument. So we won't ever
> fully remove that function.

For that to work with monochrome and greyscale displays, it should
fall back to DRM_FORMAT_Rx (or _Dx) if depth <=3D 8 and DRM_FORMAT_Cx
is not supported by the underlying primary plane or driver.

Hmm, perhaps I should indeed implement the fallback in
drm_driver_legacy_fb_format() instead of drm_fb_helper_find_format()
(like I did in [1]).

> >>>> +       buffer =3D drm_client_framebuffer_create(client, sizes->surf=
ace_width,
> >>>> +                                              sizes->surface_height=
, format);
> >>> [...]
> >>>
> >>>> +}
> >>>> +/**
> >>>> + * drm_fbdev_shmem_setup() - Setup fbdev emulation for GEM SHMEM he=
lpers
> >>>> + * @dev: DRM device
> >>>> + * @preferred_bpp: Preferred bits per pixel for the device.
> >>>> + *                 32 is used if this is zero.
> >>>> + *
> >>>> + * This function sets up fbdev emulation for GEM DMA drivers that s=
upport
> >>>> + * dumb buffers with a virtual address and that can be mmap'ed.
> >>>> + * drm_fbdev_shmem_setup() shall be called after the DRM driver reg=
istered
> >>>> + * the new DRM device with drm_dev_register().
> >>>> + *
> >>>> + * Restore, hotplug events and teardown are all taken care of. Driv=
ers that do
> >>>> + * suspend/resume need to call drm_fb_helper_set_suspend_unlocked()=
 themselves.
> >>>> + * Simple drivers might use drm_mode_config_helper_suspend().
> >>>> + *
> >>>> + * This function is safe to call even when there are no connectors =
present.
> >>>> + * Setup will be retried on the next hotplug event.
> >>>> + *
> >>>> + * The fbdev is destroyed by drm_dev_unregister().
> >>>> + */
> >>>> +void drm_fbdev_shmem_setup(struct drm_device *dev, unsigned int pre=
ferred_bpp)
> >>> As this is a completely new function, can we please get a
> >>> preferred_format parameter instead?
> >> An understandable question. But as it is, the patchset has a trivial
> >> change in each driver. And the preferred_bpp parameter has the same
> >> meaning as the bpp value in the video=3D parameter. So it's ok-ish for=
 now.
> > OK.
> >
> >> Using a format parameter here is really a much larger update and touch=
es
> >> the internals of the fbdev emulation. I'm not even sure that we should
> >> have a parameter at all. Since in-kernel clients should behave like
> >> userspace clients, we could try to figure out the format from the
> >> driver's primary planes. That's a patchset of its own.
> > How do you figure out "the" format from the driver's primary plane?
> > Isn't that a list of formats (always including XR24) , so the driver
> > still needs to specify a preferred format?
>
> The list of formats for each plane is roughly sorted by preference. We
> can go through it and pick the first format that is supported by the
> fbdev code. That's likely how userspace would do it.

OK.

> > A while ago, I had a look into replacing preferred_{depth,bpp} by
> > preferred_format, but I was held back by the inconsistencies in some
> > drivers (e.g. depth 24 vs. 32).  Perhaps an incremental approach
> > (use preferred_format if available, else fall back to legacy
> > preferred_{depth,bpp} handling) would be more suitable?
>
> I have initial patches to move format selection from the fb_probe
> helpers into the shared helpers. That allows to remove the surface_depth
> and surface_bpp fields. That is at least a step into the right direction.

Thanks, I am looking forward to that...

> > FTR, my main use-case is letting fbdev emulation distinguish between
> > DRM_FORMAT_Rx and DRM_FORMAT_Cx, which share the values of depth
> > and bpp.
>
> How are they used for the framebuffer console? Shouldn't it always be
> _Cx? _Rx is just monochrome AFAIU.

The fbdev console supports monochrome (including bold, underline, and
reverse video!) and grayscale text, too.  I proposed adding support
for monochrome to the DRM fbdev emulation in [2].  Javier will be able
to make use of grayscale for the Solomon SSD132x controllers to improve
console performance.

[1] "[PATCH 7/8] drm/fb-helper: Add support for DRM_FORMAT_R1"
    https://lore.kernel.org/r/ea0d68ef5630fe9748a11e50f6d79f79a768ebdb.1689=
252746.git.geert@linux-m68k.org/
[2] "PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1"
    https://lore.kernel.org/r/cover.1689252746.git.geert@linux-m68k.org/

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
