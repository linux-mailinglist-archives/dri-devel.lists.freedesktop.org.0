Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C291DA9F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 10:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B710E360;
	Mon,  1 Jul 2024 08:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFB010E360
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 08:54:43 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-64f4fd64773so930497b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 01:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719824082; x=1720428882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRJ/sPxYk0gpST/B9ghvIkC+M8aByXNTXzLiqxdF79M=;
 b=CJFg11v9aZplGxx86R1oMMh3pf+wqud1nHoi/Wk417MzOpoJaF5iRYtlu8SDED0FlG
 l98JM6PckkSIdTml6isj4f/n3/0+0mtzblsxNOqyCIiCJsoyKedrIlpTYiW89lHs34AC
 WtpeldqQ451n6QwbwARam/ahgVqnVTtJpDXuc+rWc2OPMmAgM4MLSbFq3oTRpMTlwjB0
 u3RQa8yv7JmfUPgZHBN2QOkFVPq6q0cXxEcFnQ3AoUi+dqPSdnIwk6sBtopCx6V8v8UJ
 wyVeSjFgOc4kejg4C7Nad5n/f3OBIbhVoMcuUr2Tg28IpF5sN1HbkQmmffwHK48cwAgz
 yEOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqadY1VnLH/xoAsV0sMLldhGgDUE0mdGzODpzvj+Ba06T7ZgIKRsEYpEpL4bj/QmTBhNBnjFZbyU7Ge5ldUowmk1B0smitMQUsxNrQqcPC
X-Gm-Message-State: AOJu0Yz5nAIl7sZEz4Sw4pPcmUGt0n4QrUtBYSHmqNHXou/X0Q+7TLu2
 b6kAqri72PlTc/flz1GXEtYx6rWiQUODzvVoKmSIq73CDYIMbosMSCSZKMlu
X-Google-Smtp-Source: AGHT+IGuID66zoe3tL7goAMXqteKCvafKzye1NM7gsi4YpCBV1D1vSTESl7Z7BT4gxRHFZrm+ZUWFQ==
X-Received: by 2002:a81:83d1:0:b0:61a:d30f:a9c4 with SMTP id
 00721157ae682-64c71144078mr64221547b3.8.1719824081644; 
 Mon, 01 Jul 2024 01:54:41 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-64a99c7197asm12850207b3.6.2024.07.01.01.54.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:54:41 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dfab4779d95so2632678276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 01:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtKtuFQE7PatX0CsBnHlZZmgMnT8/0BYelwRae0PJ+MP9vRXmn/V94Gqd3Ocl0+gSXknMwTSIbpMgOe1rQv4Jy2oirVp3vjCVlUvH15yjO
X-Received: by 2002:a81:440b:0:b0:627:972f:baba with SMTP id
 00721157ae682-64c71fc2105mr59079497b3.31.1719824081315; Mon, 01 Jul 2024
 01:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240627173530.460615-1-thuth@redhat.com>
 <571556ed-17d2-4bcc-bb1f-fd4f827829c6@suse.de>
 <2108ac92-e241-4507-a759-c23de90d041e@redhat.com>
In-Reply-To: <2108ac92-e241-4507-a759-c23de90d041e@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jul 2024 10:54:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWf3bE5UdFHoer_iVXeMwfqMpFeAFppo0dzyzL0zeU55A@mail.gmail.com>
Message-ID: <CAMuHMdWf3bE5UdFHoer_iVXeMwfqMpFeAFppo0dzyzL0zeU55A@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-generic: Fix framebuffer on big endian devices
To: Thomas Huth <thuth@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
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

On Mon, Jul 1, 2024 at 10:42=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrot=
e:
> On 28/06/2024 08.07, Thomas Zimmermann wrote:
> > Am 27.06.24 um 19:35 schrieb Thomas Huth:
> >> Starting with kernel 6.7, the framebuffer text console is not working
> >> anymore with the virtio-gpu device on s390x hosts. Such big endian fb
> >> devices are usinga different pixel ordering than little endian devices=
,
> >> e.g. DRM_FORMAT_BGRX8888 instead of DRM_FORMAT_XRGB8888.
> >>
> >> This used to work fine as long as drm_client_buffer_addfb() was still
> >> calling drm_mode_addfb() which called drm_driver_legacy_fb_format()
> >> internally to get the right format. But drm_client_buffer_addfb() has
> >> recently been reworked to call drm_mode_addfb2() instead with the
> >> format value that has been passed to it as a parameter (see commit
> >> 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to
> >> drm_mode_addfb2()").
> >>
> >> That format parameter is determined in drm_fbdev_generic_helper_fb_pro=
be()
> >> via the drm_mode_legacy_fb_format() function - which only generates
> >> formats suitable for little endian devices. So to fix this issue
> >> switch to drm_driver_legacy_fb_format() here instead to take the
> >> device endianness into consideration.
> >>
> >> Fixes: 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to
> >> drm_mode_addfb2()")
> >> Closes: https://issues.redhat.com/browse/RHEL-45158
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> >
> >> ---
> >>   drivers/gpu/drm/drm_fbdev_generic.c | 3 ++-
> >
> > This file is now called drm_fbdev_ttm.c in drm-misc-next.
>
> Oh, ok, shall I send a v2 that is adjusted to that change, or can it be
> fixed while applying my patch?

As this is a regression in mainline, which needs to be backported,
too, it's best to apply your fix to v6.10-rc6, which does not have
drm_fbdev_ttm.c yet.

> > And a similar patch might be necessary for drm_fbdev_dma.c.
>
> Looks similar, indeed. Shall I send a patch for that one, too? ... I
> currently don't have a setup for testing that, though...

Obviously these need to be fixed, too.

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
