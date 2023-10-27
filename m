Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA687D90BB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 10:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C010E058;
	Fri, 27 Oct 2023 08:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410CA10E058
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 08:09:55 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-7b9c8706fc1so734685241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 01:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698394194; x=1698998994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YXz17VD25GWoAf0H7NxnM2SjBWk5BeAkDDQxS4QDQmU=;
 b=brb++rGNvpT+xs2wt2FrIzNpx/2FZAZq4g390gpwyTCjOPLaS9ZL3ijGpNHvQ8TCAo
 KRzUCAQTh71mlJn7JJyULsDc78/rq8+dXaM8dG5lp/zkRh3rwyKdFr5JlNh3XMd4c9Lp
 vCHrBVZb+7XdUgCkNYVHu/GLjn9LnF5ZW1MDQpjp+Mk8QNtW02WzLTRWRgCzxzFQuHt9
 8MY3Yzo5yBkf0+rQHqMmlWVzFVWCRSRueOCJWUGdQwU86l+o/1UzQxm1+0vhWToph+Oq
 UaNTO1qIfjMwWeygRV8mH3UD+QHHLpuzSKLnhURdIJbnspccYLZjD8WsUlUlz+OrlfmN
 8j8Q==
X-Gm-Message-State: AOJu0YwzKxzB8hFKpSmCwRQTndJ161jciQmhKH0NQzSLUiWrE7hbE2ik
 1EAdjNSljT/3693/oAeOwvQdBSLBImZ7CQ==
X-Google-Smtp-Source: AGHT+IEJoQlAQIOWTd892PrazF2RnaNhDX28B5Gl0KfqvN8JM6y8ZVH9FEpha29wELsQUk342bczIA==
X-Received: by 2002:a1f:a787:0:b0:49d:c216:8736 with SMTP id
 q129-20020a1fa787000000b0049dc2168736mr2308168vke.3.1698394193926; 
 Fri, 27 Oct 2023 01:09:53 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175]) by smtp.gmail.com with ESMTPSA id
 m9-20020ac5cac9000000b0049d4f588b1asm118653vkl.49.2023.10.27.01.09.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:09:52 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-4a19dac27c4so798508e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 01:09:52 -0700 (PDT)
X-Received: by 2002:a1f:178c:0:b0:49e:2145:1654 with SMTP id
 134-20020a1f178c000000b0049e21451654mr2148085vkx.7.1698394192303; Fri, 27 Oct
 2023 01:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694767208.git.geert+renesas@glider.be>
 <CAMuHMdWfBTKdXvZutg4LvWqBjuz-X=ZjzX0LKPqD=JxYuLoPRw@mail.gmail.com>
 <CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com>
 <CAMuHMdXTpMYqdFzro3kX-3wXYC8N6z2abiMTiXXpV9xn1ohj0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXTpMYqdFzro3kX-3wXYC8N6z2abiMTiXXpV9xn1ohj0Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Oct 2023 10:09:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdRCzy7_RnBh7bqpURxx8qeWaC6ARMt7XWsbRv8FYnjw@mail.gmail.com>
Message-ID: <CAMuHMdWdRCzy7_RnBh7bqpURxx8qeWaC6ARMt7XWsbRv8FYnjw@mail.gmail.com>
Subject: Re: [GIT PULL v2] drm: renesas: shmobile: Atomic conversion + DT
 support (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion
 + DT support)
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David, Daniel,

On Tue, Oct 24, 2023 at 12:08=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Oct 16, 2023 at 11:59=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > The following changes since commit 389af786f92ecdff35883551d54bf4e507ff=
cccb:
> >
> >   Merge tag 'drm-intel-next-2023-09-29' of
> > git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-10-04
> > 13:55:19 +1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it
> > tags/shmob-drm-atomic-dt-tag2
> >
> > for you to fetch changes up to 1399ebacbf590dfbac4fbba181dd1595b2fa10ba=
:
> >
> >   drm: renesas: shmobile: Add DT support (2023-10-16 11:47:48 +0200)
> >
> > ----------------------------------------------------------------
> > drm: renesas: shmobile: Atomic conversion + DT support
> >
> > Currently, there are two drivers for the LCD controller on Renesas
> > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> >   1. sh_mobile_lcdcfb, using the fbdev framework,
> >   2. shmob_drm, using the DRM framework.
> > However, only the former driver is used, as all platform support
> > integrates the former.  None of these drivers support DT-based systems.
> >
> > Convert the SH-Mobile DRM driver to atomic modesetting, and add DT
> > support, complemented by the customary set of fixes and improvements.
> >
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Link: https://lore.kernel.org/r/cover.1694767208.git.geert+renesas@glid=
er.be/
> >
> > Changes compared to v1:
> >   - Rebase to drm-next,
> >   - Add Acked-by.
> >
> > Thanks for pulling!
>
> Ping?
> Thanks!

Please note that this is a hard dependency for adding shmobile-lcdc
device nodes to DTS files, which is in turn a hard dependency for
removing drivers/staging/board/, and for removing legacy clkdev
registration from various clock drivers.

Thanks for pulling!

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
