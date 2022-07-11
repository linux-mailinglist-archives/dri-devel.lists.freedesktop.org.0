Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D557071B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315188F0FB;
	Mon, 11 Jul 2022 15:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B01F8F0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:30:44 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 20so4082384qky.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 08:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UM8AMn9ISk4ityV+MIMKJjkXCfGRegVP9qh5S/PzT30=;
 b=yLRpQ2RPV4OqVKbxNHWVP4rQ4GqFlCni1Sw4XJG4Ev+4bCvKY99FebSdR//2bz/k0K
 UTMqsTxSch3w2gf25WrxrMeizLLdz7n8c7fQFnEbbaL8tOhjPlvIhCWlen8lUWtaE8sC
 tydj3/LkFicfaai4CQMYQIrwTRCpkJUTUK0cQyIqTjaqeUaT30c1mLSoHi1Qc2wfJqFU
 KKVXr/B91VPTIqpDuPiuVx4VIMmMqd4el5QE/dg0gvMGRGLZwneyt480hmlYd17Mzj4o
 L96U09ncnYI6wCNiUg7OOfbW4Gzlzhoi7jAOYtaTlAvPnJnF+KMGyK/ER2eaAm5pQrEi
 r5JQ==
X-Gm-Message-State: AJIora/qfBjuo2jpCcbNzscoR5o5AT7g4W2my4jwLTPEY4ppWQ7cLvNq
 bG0mjawUGXyu2/7esPsGvZsqLnyhZp/LUg==
X-Google-Smtp-Source: AGRyM1spf+137GVVS0nyWTXhTrAYrv8YyIlts91hK282R0hv9E/SiuifGKp9ZLzFQOz1mxcNtgTT2g==
X-Received: by 2002:a05:620a:24d0:b0:6af:5240:bfb8 with SMTP id
 m16-20020a05620a24d000b006af5240bfb8mr11896468qkn.488.1657553442569; 
 Mon, 11 Jul 2022 08:30:42 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 x26-20020a05620a0b5a00b006b57ef4dd92sm4135574qkg.54.2022.07.11.08.30.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 08:30:41 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id e69so9324117ybh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 08:30:41 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr17468803ybq.543.1657553441288; Mon, 11
 Jul 2022 08:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
In-Reply-To: <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jul 2022 17:30:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
Message-ID: <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

On Mon, Jul 11, 2022 at 5:23 PM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
> On 2022-07-08 20:21, Geert Uytterhoeven wrote:
> > As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
> > bigendian drivers"), drivers must set the
> > quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
> > compat code work correctly on big-endian machines.
> >
> > While that works fine for big-endian XRGB8888 and ARGB8888, which are
> > mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
> > does not work for big-endian XRGB1555 and RGB565, as the latter are not
> > listed in the format database.
> >
> > Fix this by adding the missing formats.  Limit this to big-endian
> > platforms, as there is currently no need to support these formats on
> > little-endian platforms.
> >
> > Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machi=
nes.")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Cirrus is the only driver setting quirk_addfb_prefer_host_byte_order
> > and supporting RGB565 or XRGB1555, but no one tried that on big-endian?
> > Cirrus does not support DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN
> > in cirrus_fb_create, so you cannot get a graphical text console.
> >
> > Do we need these definitions on little-endian platforms, too?
> > Would it be better to use "DRM_FORMAT_{XRGB1555,RGB565} |
> > DRM_FORMAT_BIG_ENDIAN" instead of "DRM_FORMAT_HOST_{XRGB1555,RGB565}" i=
n
> > formats[]?
>
> The intention of DRM_FORMAT_HOST_* is that they are macros in include/drm=
/drm_fourcc.h which just map to little endian formats defined in drivers/gp=
u/drm/drm_fourcc.c. Since this is not possible for big endian hosts for XRG=
B1555 or RGB565 (or any other format with non-8-bit components), this isn't=
 applicable here.

I read that as that you prefer to write
"DRM_FORMAT_{XRGB1555,RGB565} | DRM_FORMAT_BIG_ENDIAN" in formats[]?

> It's also doubtful that Cirrus hardware would access these formats as big=
 endian (drivers/gpu/drm/tiny/cirrus.c has no endianness references at all,=
 and the hardware was surely designed for x86 first and foremost).
>
> Instead, fbcon (and user space) needs to convert to little endian when us=
ing DRM_FORMAT_HOST_{XRGB1555,RGB565} with the cirrus driver on big endian =
hosts.

Yeah, probably the cirrus driver can use some fixes...

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
