Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA86034E8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 23:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7FD10E95E;
	Tue, 18 Oct 2022 21:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91A10F018
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 21:28:36 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k2so35536108ejr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 14:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMqcto7q4Y02vhxVqpYib/gpRgMq96A3OL97M56Aao4=;
 b=WpO4iY1dA9puF/IaStcAWch5qKTRLozIaUxJXUmJrwW5HnWmKHN+bVKzyVOX0osEuN
 tcjlTsNepc4kyh8hcqqXqr5jYNMzexnDXf0k0m8rssH5YBnHsuZOpambwz+VUrlN9tDi
 hExOHdVS37FHjky9E+m7XBtxwIMI4D0KWYug8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMqcto7q4Y02vhxVqpYib/gpRgMq96A3OL97M56Aao4=;
 b=pOzGmd9dUf9qkdMJV/if/wyRSi5gyUtrX9vd4pmLMxzwO4AJ0m4gepfCHXpu6VwPz1
 RzOi/3pWX6W9tdXBZVC9RV96exzNJsMHOSTSiKEcWLWhA6rbJCzbj91kiqPAwdee5jZe
 DgFvWtK8AUFVzxwmiij0anjFx2B7ETvCxYI/9hWJY4v/NJvFjgv6G7Lz3tomhH/sH9yG
 PNkwLtvDUj6wROfLEJZDzBLp4kwR0mQYaAUTELZKk15Ob0BYccwIpyzY7qJPSDBXBsp8
 wJA+EkEbEb1SiCbVx+p3yBtPhO9RgmZOYJjpLJx3k7seakZ1pafRGveSQ6px9xf8nydf
 83DQ==
X-Gm-Message-State: ACrzQf0b1gR6YVIpPatQbOhSxknO7jdaPt4FDgvVyObz6k4Trrar9A6+
 m1wprzaDu+M3CApoh8hV3xzQLsMbQvTa9hzLOcNKdQ==
X-Google-Smtp-Source: AMsMyM6kMdc0KSJ2ed/MG+9WR+5ozoOFrFYW8ekGDznxwnOQtdfxzQGgP4vCb+iVI8/aQZfQmqL6Yy7v8bN+Uo9w7Gk=
X-Received: by 2002:a17:906:b08d:b0:782:d526:3e36 with SMTP id
 x13-20020a170906b08d00b00782d5263e36mr4115546ejy.358.1666128514819; Tue, 18
 Oct 2022 14:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
 <544c35c3-d87f-30e7-5f6b-a64ab7f894ec@tronnes.org>
In-Reply-To: <544c35c3-d87f-30e7-5f6b-a64ab7f894ec@tronnes.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 18 Oct 2022 23:28:23 +0200
Message-ID: <CAOf5uwnP+hc+hDKwQJq9HZ03hHXwwCWw3HE0-W16jF3WkKuHXA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/tiny: add support tft display based on ilitek,
 ili9488
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linuxfancy@googlegroups.com, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Maxime Ripard <maxime@cerno.tech>, kamlesh.gurudasani@gmail.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, Oct 18, 2022 at 9:06 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
>
>
>
> Den 18.10.2022 18.45, skrev Tommaso Merciai:
> > Hi All,
> > This series  support for ilitek,ili9488 based displays like
> > Waveshare-ResTouch-LCD-3.5 display. Tested on Waveshare-ResTouch-LCD-3.=
5
> > connected to px30-evb via SPI.
>
> There's a generic MIPI DBI SPI driver now that should work with all
> these panels: drivers/gpu/drm/tiny/panel-mipi-dbi.c
>
> More info: https://github.com/notro/panel-mipi-dbi/wiki
>

We have seen it but it does not apply to the color output and there is
no helper. I was a bit surprised
to have a generic panel for spi and not for standard mipi one.

Michael

> Noralf.
>
> > This series is based on work done by Kamlesh Gurudasani in 2020:
> >
> >  - "drm/tiny: add support for tft displays based on ilitek, ili9488"
> >
> > (Thanks Kamlesh for your starting point)
> >
> > Tests are done using the following tools coming from Yocto fs:
> >
> >  - modetest -M "ili9488" -s 31:320x480@RG16 -v
> >  - fb-test
> >  - fb-rect
> >
> > References:
> >  - https://patchwork.kernel.org/project/dri-devel/patch/00719f68aca488a=
6476b0dda634617606b592823.1592055494.git.kamlesh.gurudasani@gmail.com/
> >  - https://www.hpinfotech.ro/ILI9488.pdf
> >  - https://www.waveshare.com/wiki/Pico-ResTouch-LCD-3.5
> >
> > Regards,
> > Tommaso
> >
> > Tommaso Merciai (2):
> >   dt-bindings: add binding for tft displays based on ilitek,ili9488
> >   drm/tiny: add support for tft displays based on ilitek,ili9488
> >
> >  .../bindings/display/ilitek,ili9488.yaml      |  72 +++
> >  drivers/gpu/drm/tiny/Kconfig                  |  13 +
> >  drivers/gpu/drm/tiny/Makefile                 |   1 +
> >  drivers/gpu/drm/tiny/ili9488.c                | 440 ++++++++++++++++++
> >  4 files changed, 526 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/ilitek,il=
i9488.yaml
> >  create mode 100644 drivers/gpu/drm/tiny/ili9488.c
> >



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
