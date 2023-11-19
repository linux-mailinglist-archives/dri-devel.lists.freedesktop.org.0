Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B677F0856
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 19:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8182110E01F;
	Sun, 19 Nov 2023 18:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB3D10E01F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 18:33:16 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5a7dd65052aso41545437b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700418794; x=1701023594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Sgxs19g9ItwMLXCwSaFSmWY+3YFGqlRFFiHfPCTZTc=;
 b=T4uG2fWqsfbmERfo9SQ3g1hcH2iSEmQ1+bUIQXzErilGeoAXXqb8Bzxk9Cc6dsOtGF
 kyIvl5gZNXHQwLY7nvxr17w45NbMRVBkOGRI5eYXeAiorkMDu+/PYuExeqHMqse5pjI1
 +z3Z7x0YIFbJ1wvUY1a3UYL3Xlr3RNOUkqHkFLKeTsxf79AMRk91ziS6gklvK11oaawL
 pgb2SE6+PnFBfthqajWSTa2EJSHBw0XPYbEjtwH811Bc4HiWjjtwu2lH4vlhVvWsXYQC
 H9hUVcP4kkALPD527TFzX0MPuiaFmpFHyiieQLiybFM8pexQ85oj0BvHZx9RGaSj7L9i
 9O9Q==
X-Gm-Message-State: AOJu0YxjBzI/jfqGd3HbhlPu6kuXjr9rZdrmHG/x/4WBWCqCSvUTSNIU
 5AodfnW4eJhxgIys6zjHA7iVDOZL4UTo8Q==
X-Google-Smtp-Source: AGHT+IGrr0uwK7/ekiHACByOu3Xtk3yZOTEljDlU7I5/H/4nFGktNSVM4y+WlShnTU7UnpuLg1PHDg==
X-Received: by 2002:a0d:e7c2:0:b0:5a7:b481:4dd2 with SMTP id
 q185-20020a0de7c2000000b005a7b4814dd2mr6566994ywe.47.1700418794568; 
 Sun, 19 Nov 2023 10:33:14 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 s184-20020a0de9c1000000b00565271801b6sm1860990ywe.59.2023.11.19.10.33.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Nov 2023 10:33:13 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5a7dd65052aso41545377b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:33:13 -0800 (PST)
X-Received: by 2002:a81:cb01:0:b0:5ca:9ca4:f412 with SMTP id
 q1-20020a81cb01000000b005ca9ca4f412mr97776ywi.43.1700418793512; Sun, 19 Nov
 2023 10:33:13 -0800 (PST)
MIME-Version: 1.0
References: <47a81d2e0e47b1715718779b6978a8b595cc7c5d.1700140609.git.geert@linux-m68k.org>
 <77c6gkquzq4sdtmrlko3lkxvcnipm2zfjem3kvhgslcellkefh@man7pbbzud47>
 <a9ade305-f90e-4250-a795-49ef4e29e0ac@xenosoft.de>
In-Reply-To: <a9ade305-f90e-4250-a795-49ef4e29e0ac@xenosoft.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 Nov 2023 19:33:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtUYJmEharJhBXx7D=fA3mQxg6uMP2=4Qgi==2a+kVQw@mail.gmail.com>
Message-ID: <CAMuHMdXtUYJmEharJhBXx7D=fA3mQxg6uMP2=4Qgi==2a+kVQw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Add suppport for non-native buffer formats
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
Cc: Laurent Vivier <lvivier@redhat.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>, linux-kernel@vger.kernel.org,
 mad skateman <madskateman@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, linux-m68k@lists.linux-m68k.org,
 Darren Stevens <darren@stevens-zone.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Sun, Nov 19, 2023 at 5:28=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> On 16 November 2023 at 03:44 pm, Gerd Hoffmann wrote:
> > On Thu, Nov 16, 2023 at 02:16:54PM +0100, Geert Uytterhoeven wrote:
> >> When using virtgpu on a big-endian machine, e.g. powerpc QEMU:
> >>
> >>      virtio-pci 0000:00:02.0: [drm] *ERROR* fbdev: Failed to setup gen=
eric emulation (ret=3D-2)
> >>
> >> or m68k/virt:
> >>
> >>      virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup=
 generic emulation (ret=3D-2)
> >>
> >> and the graphical display fails to come up.
> >>
> >> Before, the call to drm_mode_addfb() caused a translation from a fourc=
c
> >> format (XR24) to a bpp/depth pair (32/24) to a potentially different f=
ourcc
> >> format (BX24 on big-endian), due to the quirk processing in
> >> drm_driver_legacy_fb_format().  After, the original fourcc format (XR2=
4)
> >> is passed unmodified.
> >>
> >> However, the virtgpu DRM driver supports only a single format for its
> >> main plane: DRM_FORMAT_HOST_XRGB8888, which is XR24 on little-endian,
> >> and BX24 on big-endian.  I.e. on big-endian, virtgpu does not support
> >> XR24, which is the default DRM format, and must be supported by all
> >> drivers.  Before, this was reported, but didn't lead to a failure:
> >>
> >>      virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not s=
upported
> >>      virtio-mmio virtio-mmio.125: [drm] No compatible format found
> >>
> >> As the core virtgpu driver and device support both XR24 and BX24 on bo=
th
> >> little-endian and big-endian just fine, fix this extending the list of
> >> supported formats for main plane and cursor plane to XR24/BX24 resp.
> >> AR24/BA24.
> >>
> >> Fixes: 6ae2ff23aa43a0c4 ("drm/client: Convert drm_client_buffer_addfb(=
) to drm_mode_addfb2()")
> >> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> >> Closes: https://lore.kernel.org/r/c47fba21-3ae9-4021-9f4a-09c2670ebdbc=
@xenosoft.de
> >> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>
> The new patch works but I don't see the virtio-mouse-pci pointer
> anymore. I see the pointer with -device usb-tablet. Please check the
> second patch. I will use the first patch for the RC2 of kernel 6.7.

That's probably partially explained by commit 99748ab64fcc8578 ("drm:
virtio: fix virtio_gpu_cursor_formats"), which forced BA24 for the
cursor plane on big-endian, but unfortunately linked thread doesn't
contain the full picture.

Where is the default cursor format defined?
I see virtio_gpu_mode_dumb_create() still defaults to
DRM_FORMAT_HOST_XRGB8888.  However, that can't be the cause, as the
cursor formats require an alpha channel.

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
