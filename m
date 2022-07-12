Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880E5713CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC24992561;
	Tue, 12 Jul 2022 08:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ED292561
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:01:32 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d18so7669127qtw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f7/DBlyXRCka68EapZqh3ZBdGq51MlTs0yoakAMo94s=;
 b=Lt/bOnNZ8hszeN6qDksELDibD0QBmPsylJVCuBPuy+x9RPB2tBeQE0nfO0bUqcgpNO
 fu8q13F8kbrdcyEd3cRGfyZTMm8K3yKt7D2XCgZDSyQD3Qq73RRbi1tlOO/MgyPulGIu
 2YxIAQvJ0FnfVYicqnPC8+lOUVfEH5qHp8N7mxRvz7q++XjUkhNIHtgk7sW1scmM9s1D
 xBDhO9vIkx4qgXpCg1M9+u9Z234FOn7Hhcfr8nabN3cPkAAxt6bQO1l9BF4y/jo0ivTG
 GWL+Vt9kuU1Pfh+ri232MA8R9ttoxfmzvh/eydc+GW6mnj1Q4/pOAb5t270xpGZtc3nx
 eBVw==
X-Gm-Message-State: AJIora9/zn9YNFIRO4Wrcae3fzLjEthc9OqAfVDEKAo+eQy5NSX3nmHD
 JT6jZqKvk6ZMW4mUiR5EZN3B793sQUze6Q==
X-Google-Smtp-Source: AGRyM1s7sCLbhGRgEjX7oTd6ssDk0y2bD55gosGbugAHvbU24PssRqS+MBW5jYz+82asMmF1PReJBA==
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr17197958qtw.495.1657612890832; 
 Tue, 12 Jul 2022 01:01:30 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05622a041000b00304fe5247bfsm7323473qtx.36.2022.07.12.01.01.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:01:29 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id h62so10020330ybb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:01:27 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr20423916ybt.604.1657612887543; Tue, 12
 Jul 2022 01:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
 <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
In-Reply-To: <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 10:01:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
Message-ID: <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Tue, Jul 12, 2022 at 9:47 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> On Mon, Jul 11, 2022 at 05:30:30PM +0200, Geert Uytterhoeven wrote:
> > > > Cirrus is the only driver setting quirk_addfb_prefer_host_byte_order
> > > > and supporting RGB565 or XRGB1555, but no one tried that on big-endian?
> > > > Cirrus does not support DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN
> > > > in cirrus_fb_create, so you cannot get a graphical text console.
> > > >
> > > > Do we need these definitions on little-endian platforms, too?
> > > > Would it be better to use "DRM_FORMAT_{XRGB1555,RGB565} |
> > > > DRM_FORMAT_BIG_ENDIAN" instead of "DRM_FORMAT_HOST_{XRGB1555,RGB565}" in
> > > > formats[]?
> > >
> > > The intention of DRM_FORMAT_HOST_* is that they are macros in
> > > include/drm/drm_fourcc.h which just map to little endian formats
> > > defined in drivers/gpu/drm/drm_fourcc.c. Since this is not possible
> > > for big endian hosts for XRGB1555 or RGB565 (or any other format
> > > with non-8-bit components), this isn't applicable here.
>
> It IMHO is not applicable to any physical hardware.  It's used by
> virtio-gpu where the supported format depends on the byte order
> (it is argb8888 in native byte order).  Only virtual hardware can
> have that kind of behavior.
>
> And we can probably drop the DRM_FORMAT_HOST_* variants for 1555 and
> 565, they are not used anywhere.

Atari DRM supports (big-endian) RGB565, so it uses
DRM_FORMAT_HOST_RGB565.

The alternative is to drop the quirk_addfb_prefer_host_byte_order
requirement on big-endian, and always use a little-endian RGB565
shadow frame buffer, at the expense of never being able to get rid
of the copying and byteswapping.

[Cirrus discussion removed]

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
