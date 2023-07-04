Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F7746AC5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E052F10E002;
	Tue,  4 Jul 2023 07:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FE510E002
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:37:23 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-57012b2973eso66013107b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688456242; x=1691048242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ttaFFJ0r0f9jhzySfvd5lZ1LEwbKcvVHje2Xigt05e4=;
 b=iN2a5gmWqJ3utEhPcl1onVwrOy8TaNvidc0YnGflxe8paJm3/OoKMV8MFelh6Zk17c
 VnnPmWREU5lqEPzTseZ9YhSqNsKpIsf6rzkd0y27jLJVGdSk39kahd7+MEfxnIOuOlJi
 /6M9/lSBTKcxdAEBDXuGP+SZi40b8ls9/Qa/r7oByKyCr0K4eNI9xrzgpIUsZijIg9z8
 LGS/F6InLlb7fMdrqIh3OuItN16KEwyfDnuT5DQnmx1nqiXwpOg7/I7PB2yCceygXFKv
 wdSzTelplrXh1aV72ZNewxpiN4GWl3zwDLP1hTqLX4n3hJKXZPpP+j7nv85YrqhmZRKi
 3jeA==
X-Gm-Message-State: ABy/qLaYkS3MdTRC+XUa+3+mar/k4In4jJl8VJB6NUShMZt5Bgvu3dqO
 e0nIRz3SVUZ58fxGoMDgpkg2Lo5ozW3PLg==
X-Google-Smtp-Source: APBJJlHNiaUD7BFC7fwZqqCKAcga0RJgwfjcA5TWnXKe/5NYkP5tkbGKMgAFoPOawgeZHF6QzofIAw==
X-Received: by 2002:a81:4f17:0:b0:56c:e2c1:6695 with SMTP id
 d23-20020a814f17000000b0056ce2c16695mr10913650ywb.50.1688456242086; 
 Tue, 04 Jul 2023 00:37:22 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 m11-20020a0dca0b000000b0055aafcef659sm5488960ywd.5.2023.07.04.00.37.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 00:37:21 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-c2cf29195f8so6083600276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:37:21 -0700 (PDT)
X-Received: by 2002:a5b:412:0:b0:ba8:7122:2917 with SMTP id
 m18-20020a5b0412000000b00ba871222917mr12316676ybp.0.1688456241685; Tue, 04
 Jul 2023 00:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-2-javierm@redhat.com>
In-Reply-To: <20230703230534.997525-2-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jul 2023 09:37:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
Message-ID: <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] video: Add auxiliary display drivers to Graphics
 support menu
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jul 4, 2023 at 1:05=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The drivers in this subsystem are for character-based LCD displays, which
> can fall into the same category of the DRM/KMS and fbdev drivers that are
> located under the "Graphics support" menu. Add auxdisplay there as well.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -30,6 +30,8 @@ if HAS_IOMEM
>  config HAVE_FB_ATMEL
>         bool
>
> +source "drivers/auxdisplay/Kconfig"

This is inside the "if HAS_IOMEM" section, while there was no
such limitation before.

> +
>  source "drivers/char/agp/Kconfig"
>
>  source "drivers/gpu/vga/Kconfig"

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
