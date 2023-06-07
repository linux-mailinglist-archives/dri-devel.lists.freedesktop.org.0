Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293FB726447
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4192B10E09B;
	Wed,  7 Jun 2023 15:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17C510E09B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:24:23 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-b9e6ec482b3so8653374276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 08:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686151462; x=1688743462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQN/vgm9QEjhz2CmAuEj3hHoQIOxHnpZb3XEwqj7JAE=;
 b=Z+3bYfNCIa/796uWYCkqLGRmWpShbWJA+cLHVHmcFKdxIYjIFl3g7Z4FK2SpowJybC
 GHndVPknGxz2tQM5l7Nl+6019Q9OEQUQf4pLAxOSvi+l06gn4xJme51DfNNEXN7QkTB0
 PzdyLZYaSeeGG87W0igPrknFl62UTgxMj/OYSYQDF6qbDXLT1pP5JnnjhpcxJ988aYDX
 uPbyiko9AuBeeXakiNHfbB+690XWOKtuBui06nfhAshKFdBwLvM9kuw7TIaukDY7DpjC
 fpVxV98Gq9XV7TjFCwTb21jFcVEFQEQ++VnltD0Aze7GzY28auNy5b2d9F6e96Ev0AqR
 a8Pw==
X-Gm-Message-State: AC+VfDz9A0oYHle8pIjAmj0f+m3HxP9KsGteq8DNnHrzQ9EJEaICLWbs
 0f3rylZONo5tKuwN3IpAkBy6J7i/SXKGdw==
X-Google-Smtp-Source: ACHHUZ7p6TGXcqZxOJ7XCkvY8S0fRWLM42vva9JVQkmRAQhEbw/0UBzRJCG+XdqdNwiBwjLP+IFlvQ==
X-Received: by 2002:a25:41d4:0:b0:bac:fdd2:18ac with SMTP id
 o203-20020a2541d4000000b00bacfdd218acmr6364832yba.58.1686151461896; 
 Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 b22-20020a25ae96000000b00bb138b444dcsm3899339ybj.36.2023.06.07.08.24.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-565cd2fc9acso84235997b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 08:24:21 -0700 (PDT)
X-Received: by 2002:a0d:d44b:0:b0:565:8c16:a0e1 with SMTP id
 w72-20020a0dd44b000000b005658c16a0e1mr8139475ywd.13.1686151460917; Wed, 07
 Jun 2023 08:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
In-Reply-To: <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jun 2023 17:24:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Message-ID: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jun 7, 2023 at 5:15=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
> > On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> --- a/drivers/video/fbdev/Kconfig
> >> +++ b/drivers/video/fbdev/Kconfig
> >> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
> >>            combination with certain motherboards and monitors are know=
n to
> >>            suffer from this problem.
> >>
> >> +config FB_DEVICE
> >> +        bool "Provide legacy /dev/fb* device"
> >
> > Perhaps "default y if !DRM", although that does not help for a
> > mixed drm/fbdev kernel build?
>
> We could simply set it to "default y".  But OTOH is it worth making it a
> default? Distributions will set it to the value they need/want. The very
> few people that build their own kernels to get certain fbdev drivers
> will certainly be able to enable the option by hand as well.

Defaulting to "n" (the default) means causing regressions when these
few people use an existing defconfig.

> > Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
> > to be selected by both FB and DRM_FBDEV_EMULATION?
> > Then FB_DEVICE can depend on FB_CORE, and default to y if FB.
>
> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
> enabled under certain conditions; merely for the kernel console. We'd
> have to enable CONFIG_FB, which would bring back the device.

"Default y" does not mean that you cannot disable FB_DEVICE, so
you are not forced to bring back the device?

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
