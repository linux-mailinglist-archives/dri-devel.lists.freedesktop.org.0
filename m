Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8489A74AFE4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 13:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69FD10E564;
	Fri,  7 Jul 2023 11:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569E10E563
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 11:33:37 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-c6833e6e326so1954195276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 04:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688729617; x=1691321617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMDmR1AyUqqSLlrR4dAl1mTPWPJqJms7W4GVYjDPIGA=;
 b=xiiQaYZq3bDHw91HWI3fRO9UDkLX7hyAFNYDmTVBWHFjkvIZjxGpJ9Ucr1pqYcfkCy
 mZ8qVZI4gHIQAjBqmvS/E0Lu5McUUZMuarBruPYB3Z5vRsXtxYrhontrBigkgUOWMcTh
 AcX/Q+4iYvqSQQhP4CqYV5lOm749u86MZwzKYr+PWH5I2o2upjOC8iQKoaLsHS4ZmX9i
 wduX5j7NLHNyM6waY5iUjI7MOSAgIh63hRMWL+VCYtcrsbS3S8OPN70xEFgGPBQFGdi1
 qUGifkUwapGATJFhAkRv9er8DG50uEop5Wi7WKN1Ync5B+2EBdQZ+fNxjctFco+oSLIX
 sYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688729617; x=1691321617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMDmR1AyUqqSLlrR4dAl1mTPWPJqJms7W4GVYjDPIGA=;
 b=AOEci0GLrYd3lMrloJ99u/Z2PM2SQ3kzhK0+UwSml3cMYyTLzKSN57fTxU87351DuY
 QxQPNYsW5Q/k/QaoiH71x1X9f10OYGskD4qxNQrv/qAWsSb6BBB0v1b1ZXZ8adyETXrw
 Sup2l1IpwH7gZdcLus0Kz1Sge/3rSrRIBm5oZZn2gyEPTEEoHFqxyLrxE8fvdq0MScjm
 1PFsq4TsgDHwxn2sI9zCra6eEOV6xYSB1a55NeVeWpd8ZG7OfW2aEpTerjHgvHDukJGd
 XVfyoD62329S7cfSg0i9a1F0hYhK/o8l95s9dtHSQO595rfBjtmeWtUWzjUmtf1HH3W2
 GaGA==
X-Gm-Message-State: ABy/qLYV1ncZS1G4R7SEWOygjoGtIzGBkKy8TLD8xu3Rgx3vhFHdjavl
 Ku1OTRZ0Kovf2kDwfEoBs98UrASr4Ghpc2HU1hHFFw==
X-Google-Smtp-Source: APBJJlEQSj9eXj+7lnzyovN+ytLh/4DHueGCx30NZ+9pdKgvYoJ0FyPX7RpPM7SVjIqI/EaQCzqVM+GieMin6C25zn0=
X-Received: by 2002:a25:604:0:b0:c5f:d493:c91f with SMTP id
 4-20020a250604000000b00c5fd493c91fmr3740950ybg.61.1688729616893; Fri, 07 Jul
 2023 04:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-3-arnd@kernel.org>
In-Reply-To: <20230707095415.1449376-3-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jul 2023 13:33:24 +0200
Message-ID: <CACRpkdbiDUomH8HLkk_jyJZYc+mEmRaFL8-JasDmd=ooSB62Qw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dummycon: limit Arm console size hack to footbridge
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 11:56=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The dummycon default console size used to be determined by architecture,
> but now this is a Kconfig setting on everything except ARM. Tracing this
> back in the historic git trees, this was used to match the size of VGA
> console or VGA framebuffer on early machines, but nowadays that code is
> no longer used, except probably on the old footbridge/netwinder since
> that is the only one that supports vgacon.
>
> On machines with a framebuffer, booting with DT so far results in always
> using the hardcoded 80x30 size in dummycon, while on ATAGS the setting
> can come from a bootloader specific override. Both seem to be worse
> choices than the Kconfig setting, since the actual text size for fbcon
> also depends on the selected font.
>
> Make this work the same way as everywhere else and use the normal
> Kconfig setting, except for the footbridge with vgacon, which keeps
> using the traditional code. If vgacon is disabled, footbridge can
> also ignore the setting. This means the screen_info only has to be
> provided when either vgacon or EFI are enabled now.
>
> To limit the amount of surprises on Arm, change the Kconfig default
> to the previously used 80x30 setting instead of the usual 80x25.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested this before and after patch and it looks the same on the NetWinder.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

The legacy in the cyber2000 FB driver supports pseudocolor which
makes it a bit hard to rewrite into a simple DRM driver, which is something
I could otherwise look into, it's not a very big or complex driver
after all.

Yours,
Linus Walleij
