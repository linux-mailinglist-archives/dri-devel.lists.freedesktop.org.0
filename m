Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EE46EC728
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 09:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09E210E31A;
	Mon, 24 Apr 2023 07:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6693510E2FC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 07:31:37 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-54fb8a8a597so47517607b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 00:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682321496; x=1684913496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVjrUBePw3Nq2ZtrxyHKPMRQvOHRrO/KkUf1wauFdNw=;
 b=HRSnS30MGH0iV8kuKnmMyapP/8OoTDDur5dV0tUGxtaZqWBgpLzMEfAPetr/KBW8Iz
 sUdswn2MeLFBDNFTLjyE4SHUgLE20oflKOxX6f1eN5lVdUrHPOWsh0JBXNab9bP1oemc
 dy8R0B2TyAQ19enkYxOrCw+cR4t3vCpkoOPfKmBuZ1/ROvdQMyDIowp/9Cnmky4wRHYv
 71IT4VNms7lT3tYy1sDVLPwykUOyMIQgmCbb9e18s4e3NnEFk1dZG7xawOaWET9qvurd
 WWh0xPqg42M4mpMrIfQImRKRuHBRXOtVIVfYtgrVnBjWBPsFwQHpqcURln0JiOSoD3ia
 DtWg==
X-Gm-Message-State: AAQBX9cGO9HxEbP/iNmxZ9NBYpDLzcPy+9OYgYUc3slt6E5xYggaNNoH
 Z24Ogx5p0ds9CZ3/EKUALw1id7xrqoascA==
X-Google-Smtp-Source: AKy350ZMZWcbIHdn8Q9cVpOzF7W+LSBzRsSKFl3F4R4eAdS72eQySfoayamWgWjPDt4wH/B7c6peiA==
X-Received: by 2002:a0d:f545:0:b0:556:1cea:5bf8 with SMTP id
 e66-20020a0df545000000b005561cea5bf8mr6625931ywf.22.1682321496052; 
 Mon, 24 Apr 2023 00:31:36 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 d69-20020a0ddb48000000b00545a0818494sm2820599ywe.36.2023.04.24.00.31.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 00:31:35 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-54f9d6eccf3so47456947b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 00:31:35 -0700 (PDT)
X-Received: by 2002:a81:6d93:0:b0:54f:e2ae:21e1 with SMTP id
 i141-20020a816d93000000b0054fe2ae21e1mr6851865ywc.36.1682321494895; Mon, 24
 Apr 2023 00:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
In-Reply-To: <20230412095509.2196162-2-cyril@debamax.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2023 09:31:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGEeAsmb4tAuuqqGJ-4+BBETwEwYJA+M9NyJv0BJ_hNg@mail.gmail.com>
Message-ID: <CAMuHMdVGEeAsmb4tAuuqqGJ-4+BBETwEwYJA+M9NyJv0BJ_hNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
To: Cyril Brulebois <cyril@debamax.com>
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
Cc: linux-fbdev@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cyril,

CC DT

On Wed, Apr 12, 2023 at 12:05=E2=80=AFPM Cyril Brulebois <cyril@debamax.com=
> wrote:
> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique")=
,
> as spotted by Fr=C3=A9d=C3=A9ric Bonnard, the historical "of-display" dev=
ice is
> gone: the updated logic creates "of-display.0" instead, then as many
> "of-display.N" as required.
>
> This means that offb no longer finds the expected device, which prevents
> the Debian Installer from setting up its interface, at least on ppc64el.
>
> It might be better to iterate on all possible nodes, but updating the
> hardcoded device from "of-display" to "of-display.0" is confirmed to fix
> the Debian Installer at the very least.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217328
> Link: https://bugs.debian.org/1033058
> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cyril Brulebois <cyril@debamax.com>

Thanks for your patch, which is now commit 27c74ea74be805cc
("fbdev/offb: Update expected device name") in fbdev/for-next

> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -698,7 +698,7 @@ MODULE_DEVICE_TABLE(of, offb_of_match_display);
>
>  static struct platform_driver offb_driver_display =3D {
>         .driver =3D {
> -               .name =3D "of-display",
> +               .name =3D "of-display.0",
>                 .of_match_table =3D offb_of_match_display,
>         },
>         .probe =3D offb_probe_display,

This looks like the wrong fix for me: platform drivers' names must
not contain the device index, and DT-based devices are probed using
the compatible value (which is "display") instead of the node name.

I think the problem is with the of_platform_default_populate_init()
function, which should create proper name@unit-address device nodes,
with unique unit addresses, and with the correct compatible value.

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
