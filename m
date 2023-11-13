Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BF7E9C63
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4B910E36B;
	Mon, 13 Nov 2023 12:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC2810E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:48:48 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5a84204e7aeso50816457b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 04:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699879727; x=1700484527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NpcagooPlgB42zJ8lCFvRZKrafl2J7642p6A31Uxcs=;
 b=sTZ8j8TrXwXEDaLGAC28xy+wCE8KE/aozbN88NyxFh5kKHfA1n5/gKAARANeoBcWw7
 IcRcqArCL7JxPtQNs0p+QdODmouJQq0A0UDMyQO5Zs7Fte++8Hu/kdGyPOgxFS7YP4TM
 PwT5LyKbK1j+sFKwr7vjVJ7bdqydzC4k6L7gxjcwd1uhdyGlcorFZ8s3zM7ZZKGUErM2
 +9clry8M5mG9AdwdjX2L7MV0Q5vvZxIp5vlw9RY+9FcgI0tdS4Pr7hmTFR7he1rxiWq2
 X/JlfYaZc36AInbWVTouclkyWgHbYcKB6TLHOlk8PuKWKHAxWtzZrVQ+biW9hcTVhKMK
 Ikyw==
X-Gm-Message-State: AOJu0YyG+tI5pvoL491kvYbSO5yS+5gJEobXgI+AJ+DbpNUnM7uvxoCA
 qp+OScNshSdcQ3fCqyzH6CyKhKUaSb/hRw==
X-Google-Smtp-Source: AGHT+IG/sGwf4hL9Qi9eNsoM/533+PrqO8qI0J1GWoJBeNIFvcf393lxpS6zhrEi/gCFVGpsOqHTrw==
X-Received: by 2002:a25:6853:0:b0:daf:7704:3f60 with SMTP id
 d80-20020a256853000000b00daf77043f60mr4522222ybc.24.1699879727615; 
 Mon, 13 Nov 2023 04:48:47 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5b054b000000b00d8674371317sm1490889ybp.36.2023.11.13.04.48.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 04:48:46 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d9ca471cf3aso4420712276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 04:48:45 -0800 (PST)
X-Received: by 2002:a25:4409:0:b0:daf:6519:5e53 with SMTP id
 r9-20020a254409000000b00daf65195e53mr4012822yba.53.1699879725649; Mon, 13 Nov
 2023 04:48:45 -0800 (PST)
MIME-Version: 1.0
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
 <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
 <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
In-Reply-To: <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 13:48:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
Message-ID: <CAMuHMdU-8Fu55C2zu_XxmG8n5paOQYfqNA84JNvXo4c87D-kFw@mail.gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, kraxel@cs.tu-berlin.de,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, deller@gmx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Sun, Nov 12, 2023 at 3:23=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> On 07 November 2023 at 09:36 am, Christian Zigotzky wrote:
> > I have found out that fbdev no longer works with virtio-gpu-pci and
> > virtio-vga. It is not a problem with the penguin logos.
> >
> > Could you please check fbdev in QEMU virtual machines with
> > virtio-gpu-pci and virtio-vga graphics?
>
> > On 02 November 2023 at 03:45 pm, Christian Zigotzky wrote:
> >> There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The
> >> penguins are not displayed at boot time)
> >>
> >> Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR*
> >> fbdev: Failed to setup generic emulation (ret=3D-2)
> >>
> >> The kernel 6.6 final doesn't have this issue.
> >>
> >> Please check the fbdev changes in the drm updates
> >> 'drm-next-2023-10-31-1'.

Thanks for your report!

I can confirm there is no graphics output with m68k/virt, and
bisected this to my own commit 6ae2ff23aa43a0c4 ("drm/client: Convert
drm_client_buffer_addfb() to drm_mode_addfb2()"), ouch...

It turns out the old call to drm_mode_addfb() caused a translation
from a fourcc to a bpp/depth pair to a _different_ fourcc, due to the
quirk processing in drm_driver_legacy_fb_format().
I.e. on m68k/virt, the original requested format was XR24, which was
translated to BX24. The former doesn't work, the latter works.

The following (gmail-whitespace-damaged) patch fixed the issue for me:

--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -400,6 +400,16 @@ static int drm_client_buffer_addfb(struct
drm_client_buffer *buffer,

        fb_req.width =3D width;
        fb_req.height =3D height;
+       if (client->dev->mode_config.quirk_addfb_prefer_host_byte_order) {
+               if (format =3D=3D DRM_FORMAT_XRGB8888)
+                       format =3D DRM_FORMAT_HOST_XRGB8888;
+               if (format =3D=3D DRM_FORMAT_ARGB8888)
+                       format =3D DRM_FORMAT_HOST_ARGB8888;
+               if (format =3D=3D DRM_FORMAT_RGB565)
+                       format =3D DRM_FORMAT_HOST_RGB565;
+               if (format =3D=3D DRM_FORMAT_XRGB1555)
+                       format =3D DRM_FORMAT_HOST_XRGB1555;
+       }
        fb_req.pixel_format =3D format;
        fb_req.handles[0] =3D handle;
        fb_req.pitches[0] =3D buffer->pitch;

However, I don't think we want to sprinkle more of these
translations around... So perhaps we should (re)add a call to
drm_driver_legacy_fb_format() to drm_client_buffer_addfb()?

Second, as I doubt you are using a big-endian system, you are probably
running into a slightly different issue.

Oh wait, you did CC linuxppc-dev, so perhaps you are running on a
big-endian machine?

If not, please add

    pr_info("%s: format =3D %p4cc\n", __func__, &format);

to drivers/gpu/drm/drm_client.c:drm_client_buffer_addfb(), and,
after reverting commit 6ae2ff23aa43a0c4, add

    pr_info("%s: bpp %u/depth %u =3D> r.pixel_format =3D %p4cc\n",
__func__, or->bpp, or->depth, &r.pixel_format);

to drivers/gpu/drm/drm_framebuffer.c:drm_mode_addfb(), so we know the
translation in your case?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
