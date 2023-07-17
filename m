Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE7E7567B5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 17:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3603F10E26C;
	Mon, 17 Jul 2023 15:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0548610E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:22:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A96DF6113A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B59BC433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689607345;
 bh=s72Q/8XYhHQvzmI1VDsEoAqOtnrO5eU9UNP8CV8UKys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C0emZjBNCquR9Voe1+urrx1DBzBKr/jIAPVcl7u3QyWptIgTEaYmI2gncVVzCgAS5
 UsJ3cmZgP5/bjdGONrJUV/8N+Qg3CZcPU9NQ8I231bshDjHFaaq8IRPUKlOty/uLJq
 asTt8cRYh9EedkxLKjIOeHO6MkHuxL+gwcBMRVq66EArGgNGRm67cPUWwJJvCakvko
 VkdbEJ8bQWgSTaXdf7jKSuxVfcwLBmk+N8o3hvYCcSK44mUiRfpl0VyIosk4kYBuYA
 cVoo29w8Fc9X9JkzfvMXlZBP6bz6III07Lk8epOGDkmTQpyYYFGYa5VS408LD0Ocz6
 miuGXx/6g/rHg==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2b741cf99f8so69301641fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:22:25 -0700 (PDT)
X-Gm-Message-State: ABy/qLZFojC5w5V0GrW69/BVmr2prcud2+YckoPjRg20sv0wpAw7ZbYj
 DQ6zqPkMOTIknvZOL3eope5vyNCQqyusY5e1TQ==
X-Google-Smtp-Source: APBJJlFjUVuF8cT9Mjizg85yzlG3XoHjjgUIN2M6YkcqSURtLtAQSGtjkKNJqo2G7fj6obony0hWhkxkfR/W6HeRCjA=
X-Received: by 2002:a2e:9d84:0:b0:2b6:e76b:1e50 with SMTP id
 c4-20020a2e9d84000000b002b6e76b1e50mr9175045ljj.41.1689607343110; Mon, 17 Jul
 2023 08:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175035.4065508-1-robh@kernel.org>
 <317a9fd8-0ae9-daa0-012b-3908ca248b74@suse.de>
In-Reply-To: <317a9fd8-0ae9-daa0-012b-3908ca248b74@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 09:22:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2bkBU0WQG2jt755c_V4x4uR36Dvt2qEeXv52zCWeUmw@mail.gmail.com>
Message-ID: <CAL_JsqJ2bkBU0WQG2jt755c_V4x4uR36Dvt2qEeXv52zCWeUmw@mail.gmail.com>
Subject: Re: [PATCH] fb: Explicitly include correct DT includes
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 15, 2023 at 12:34=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 14.07.23 um 19:50 schrieb Rob Herring:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> [...]
> >
> > @@ -48,7 +48,7 @@ int sbusfb_mmap_helper(struct sbus_mmap_map *map,
> >       unsigned long map_offset =3D 0;
> >       unsigned long off;
> >       int i;
> > -
> > +
>
> The various whitespace fixes should rather go into a separate patch. You
> can add
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> to the whitespace fix and the include cleanup.

Indeed. I missed dropping the whitespace change.

Rob
