Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465816EC736
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 09:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E358F10E3CF;
	Mon, 24 Apr 2023 07:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F82210E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 07:33:46 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-b8f5276baa3so2758353276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 00:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682321625; x=1684913625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaY5onaWw+pL1z9HGbzp+KYK0d+t+vOPMGHk+vaMImM=;
 b=g+XM+5tcVCuy57z/crW9gd+h4qdS54uwMLUPuQccBUNXbIzu49QIkT4mzxUbwiCre+
 Y9NHIaTctZq3UURs6r35X8GttL2FnldwOZTsQHYSlmcUElE0Zo0eCg7COWm0/vNF+VGT
 k+GCAcBONxHqPVKzHGD6IiBmMp1lTRrNoEev5xeixtG2fR3qp80T80DM/HLLRof2gXZC
 Fxdt1+PwnhoaXfwAbIOBEmY1zHl908zVwLMD1w49NTa6P2ry8dJQ5OxCqTdoTnew6v97
 YlGYoraeWmGArg/TSSc5H8hSAK1Jafkhe5HIW5zXusERYO8R1gg9dGqKaJ6/YahzzT53
 YuHA==
X-Gm-Message-State: AAQBX9d+27nCWvQsH+goEOlc71S3d7FBT+N5Ejw23i7v/UeecBaMZLOY
 DSmT3hSk9mV8fuiWJJpX3c6qpG6CwN+Kqw==
X-Google-Smtp-Source: AKy350ZZBh1pUxCMmn9QosU5RSHlLh5mtQge/1+zigHCTcj1qwwu2pbo5tHUss2+X3jjM6HLojy+cg==
X-Received: by 2002:a25:428b:0:b0:b92:52bb:9f5d with SMTP id
 p133-20020a25428b000000b00b9252bb9f5dmr8518982yba.23.1682321624938; 
 Mon, 24 Apr 2023 00:33:44 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5b0643000000b00b8f13ff2a8esm2721832ybq.61.2023.04.24.00.33.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 00:33:44 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-b994571219fso1798805276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 00:33:44 -0700 (PDT)
X-Received: by 2002:a25:2786:0:b0:b96:5262:ea40 with SMTP id
 n128-20020a252786000000b00b965262ea40mr7094245ybn.24.1682321624116; Mon, 24
 Apr 2023 00:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-3-cyril@debamax.com>
In-Reply-To: <20230412095509.2196162-3-cyril@debamax.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Apr 2023 09:33:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4rZn4p=gQZRWQQSEbQPmzZUd5eN+kP_Yr7bLgTHyvig@mail.gmail.com>
Message-ID: <CAMuHMdW4rZn4p=gQZRWQQSEbQPmzZUd5eN+kP_Yr7bLgTHyvig@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ofdrm: Update expected device name
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
> Given the code similarity it is likely to affect ofdrm in the same way.
>
> It might be better to iterate on all possible nodes, but updating the
> hardcoded device from "of-display" to "of-display.0" is likely to help
> as a first step.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217328
> Link: https://bugs.debian.org/1033058
> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> Cc: stable@vger.kernel.org # v6.2+
> Signed-off-by: Cyril Brulebois <cyril@debamax.com>

Thanks for your patch, which is now commit 3a9d8ea2539ebebd
("drm/ofdrm: Update expected device name") in fbdev/for-next.

> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -1390,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
>
>  static struct platform_driver ofdrm_platform_driver =3D {
>         .driver =3D {
> -               .name =3D "of-display",
> +               .name =3D "of-display.0",
>                 .of_match_table =3D ofdrm_of_match_display,
>         },
>         .probe =3D ofdrm_probe,

Same comment as for "[PATCH 1/2] fbdev/offb: Update expected device
name".

https://lore.kernel.org/r/CAMuHMdVGEeAsmb4tAuuqqGJ-4+BBETwEwYJA+M9NyJv0BJ_h=
Ng@mail.gmail.com

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
