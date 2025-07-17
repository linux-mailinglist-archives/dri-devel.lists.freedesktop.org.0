Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3FB0923D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DB310E850;
	Thu, 17 Jul 2025 16:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Z6XhLtkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1433010E850
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:51:53 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23508d30142so14607355ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752771112; x=1753375912;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6G290XDUkNk/Jux66myc1/yoqaFjAzP1D+BTC8pjZM=;
 b=Z6XhLtkEK1LA1rTPvcGFIomeUvBkE+0McvdRtd8iQnHvZJYVQdVFnSnrckuvxsmzXN
 Ry4SwSNZlfrRI5zXWQpYsEH6tOi9EGX5fkxBHeIPkpYMz9Fh2xQQF8RJ+0bXtybwtylJ
 VtCGrGhbVoJXNR7KT7tQ/urxZghAkVXIP6qn8JyDhqgCu2ElTgZxq+QpLOY9HfYPlRnu
 318auoH6lohv4PqkmMPxbVCz2qLn7NFZCKEvv6eLgq89NJ8x8xCnwi4eLRRqxvBH/a3e
 SJw71LYDtNYODBhVDmwGJn59ZyFBHVsuIGEkAaAisJKeUb9NvpHQVagXDaluuFWB45cU
 bPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752771112; x=1753375912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6G290XDUkNk/Jux66myc1/yoqaFjAzP1D+BTC8pjZM=;
 b=dWd58fWn5CNlHy/usYFvFiIoKIXHrdqGq/xsGA/HTkFnpPP9VAwvezqcBAy+OOjkcg
 d/aj3vSYmHDiZdGsc/MCxflxg6abkosOUe8HBhlQ2oexah36G5pKQshz24oYMyA30ubu
 vGtKaQWkcjZN4TIrCO94TKSNGnasU8C4FhwgzbX5aJb6bjFNdq0y5mdDSBuS1FEwsIZH
 nwpdyM/qK4txToWAiSO7gvEZbSoMw9hjlFghOpJ+Wyn95IGeyDQWIA0cxtPsMXqRz24s
 2GeZNkwkDHJ3wWErrbBgIGsEWzSGPmn2ZrF7FLgsOpWt5KkexgELR8QlZSZ/pdznxlwi
 96gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkGyrkY4SfiZYDuGCQOiVqBwfD22QjECosZBuuKZy0Cfim2IwEfRUHRBAnxfbKblhiLIBw0OwNZPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuOpHItaEETp4KxG04fyQgLc0t1lONsaa6UiosZUOkYnmON2qG
 CyPv0Sd7VIeLrX4sSUMX+qh4PgolT/E4I2Frc0WqORUamA6XXc03JGf+YxzcDboORcfFxr1lO5C
 AeEwb1xtTREYknslx+qHCK/mB3zQM+xg0E0tuj24y
X-Gm-Gg: ASbGncs7AaGYgjw6Yrs9rFCp40QYiAXMFNXFzg6M3Yo7QcN0bvhf6fFekAw2A69VD6c
 MdVTY0931u98aN8iK/U517hgcICG5m4P8eA+SgeNEGs48guZCA09ZM+LNgz54wHjk4GriTWUf90
 fLRAIA2gqc8x7MWdMYNWW0ylXn1t6TizyFk44W7KZdAjUjfChBAjNbD5AiZCVabthvUbgt97IuQ
 2ff7VedA4V1kMVOR2lN02V9d4ngWtWRvUqsqQ==
X-Google-Smtp-Source: AGHT+IFyz6yR0nS3sH8qQsAvcaEM466C4kperDwmL6IahuwqW8e2AlpYA/IyM/pS/RGSHIr0qg9qPSoxRAQDsUfO20g=
X-Received: by 2002:a17:90b:1848:b0:31c:bfac:9e25 with SMTP id
 98e67ed59e1d1-31cbfac9ebdmr1141164a91.14.1752771112395; Thu, 17 Jul 2025
 09:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
 <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
In-Reply-To: <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 17 Jul 2025 12:51:39 -0400
X-Gm-Features: Ac12FXw9Naiqo1SXwbcsWzZsrtdE-lVZ-TVzRwHv65lGAu-rCKSRjEti2UrIOI8
Message-ID: <CAC0gqY6_6F+PFkgHm2-iMbCSxKc++DipObVK709eJrJcV7SQNQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] drm/vkms: Add configfs support
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 tzimmermann@suse.de, mripard@kernel.org, simona@ffwll.ch, 
 sebastian.wick@redhat.com, victoria@system76.com, xaver.hugl@kde.org, 
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Merged into Android tree:
https://android-review.git.corp.google.com/c/kernel/common-modules/virtual-=
device/+/3661920
I'm able to use configfs as expected.

Tested-by: Mark Yacoub <markyacoub@google.com>


On Thu, Jul 17, 2025 at 12:37=E2=80=AFPM Louis Chauvet
<louis.chauvet@bootlin.com> wrote:
>
> +CC: Mark (Google), Sebastian (Mutter), Xaver (KWin), Victoria (Cosmic)
>
> Hi everyone,
>
> Last week, I presented this work at the Display Next Hackfest, and the
> feedback from compositors was very positive. At least KWin, Mutter, and
> Cosmic are interested in integrating it into their tests, so it would be
> great if someone could review it.
>
> Sebastian quickly tested this work (using [2] for full features) with
> their existing VKMS tests [1], and it worked. From what I understand,
> the tests are quite basic =E2=80=94just sanity checks=E2=80=94 but we wer=
e able to
> reproduce the default vkms device using ConfigFS.
>
> If another compositor wants to test the ConfigFS interface (I will try
> to keep [2] updated), that would be amazing. Feel free to send feedback!
>
> A small note: This series has a minor conflict since the conversion to
> the faux device, but it can be applied using `b4 am -3 ... && git am -3
> ...`.
> @jos=C3=A9, if you send a new iteration, can you add markyacoub@google.co=
m in
> copy, and maybe Sebastian, Xaver, Victoria if they want to follow the
> upstreaming?
>
> Thank you,
> Louis Chauvet
>
> [1]:https://gitlab.gnome.org/swick/mutter/-/commit/88a7354942d9728dae06fb=
83cc4f2d2c7b08b694
> [2]:https://github.com/Fomys/linux/tree/configfs-everything
>
>
>
> Le 07/05/2025 =C3=A0 15:54, Jos=C3=A9 Exp=C3=B3sito a =C3=A9crit :
> > Hi everyone,
> >
> > This series allow to configure one or more VKMS instances without havin=
g
> > to reload the driver using configfs.
> >
> > The series is structured in 3 blocks:
> >
> >    - Patches 1..11: Basic device configuration. For simplicity, I kept =
the
> >      available options as minimal as possible.
> >
> >    - Patches 12 and 13: New option to skip the default device creation =
and to-do
> >      cleanup.
> >
> >    - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. Th=
is is not
> >      part of the minimal set of options, but I included in this series =
so it can
> >      be used as a template/example of how new configurations can be add=
ed.
> >
> > The process of configuring a VKMS device is documented in "vkms.rst".
> >
> > Finally, the code is thoroughly tested by a collection of IGT tests [1]=
.
> >
> > Best wishes,
> > Jos=C3=A9 Exp=C3=B3sito
> >
> > [1] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071=
.html
> >
> > Changes in v5:
> >
> >    - Added Reviewed-by tags, thanks Louis!
> >    - Rebased on top of drm-misc-next
> >    - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-=
1-jose.exposito89@gmail.com/
> >
> > Changes in v4:
> >
> >    - Since Louis and I worked on this together, set him as the author o=
f some of
> >      the patches and me as co-developed-by to reflect this joint effort=
.
> >    - Rebased on top of drm-misc-next
> >    - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose=
.exposito89@gmail.com/
> >
> > Changes in v3:
> >
> >    - Applied review comments by Louis Chauvet: (thanks!!)
> >      - Use scoped_guard() instead of guard(mutex)(...)
> >      - Fix a use-after-free error in the connector hot-plug code
> >    - Rebased on top of drm-misc-next
> >    - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose=
.exposito89@gmail.com/
> >
> > Changes in v2:
> >
> >    - Applied review comments by Louis Chauvet:
> >      - Use guard(mutex)(...) instead of lock/unlock
> >      - Return -EBUSY when trying to modify a enabled device
> >      - Move the connector hot-plug related patches to the end
> >    - Rebased on top of drm-misc-next
> >    - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-=
1-jose.exposito89@gmail.com/T/
> >
> > Jos=C3=A9 Exp=C3=B3sito (6):
> >    drm/vkms: Expose device creation and destruction
> >    drm/vkms: Allow to configure the default device creation
> >    drm/vkms: Remove completed task from the TODO list
> >    drm/vkms: Allow to configure connector status
> >    drm/vkms: Allow to update the connector status
> >    drm/vkms: Allow to configure connector status via configfs
> >
> > Louis Chauvet (10):
> >    drm/vkms: Add and remove VKMS instances via configfs
> >    drm/vkms: Allow to configure multiple planes via configfs
> >    drm/vkms: Allow to configure the plane type via configfs
> >    drm/vkms: Allow to configure multiple CRTCs via configfs
> >    drm/vkms: Allow to configure CRTC writeback support via configfs
> >    drm/vkms: Allow to attach planes and CRTCs via configfs
> >    drm/vkms: Allow to configure multiple encoders via configfs
> >    drm/vkms: Allow to attach encoders and CRTCs via configfs
> >    drm/vkms: Allow to configure multiple connectors via configfs
> >    drm/vkms: Allow to attach connectors and encoders via configfs
> >
> >   Documentation/gpu/vkms.rst                    | 100 ++-
> >   drivers/gpu/drm/vkms/Kconfig                  |   1 +
> >   drivers/gpu/drm/vkms/Makefile                 |   3 +-
> >   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
> >   drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
> >   drivers/gpu/drm/vkms/vkms_config.h            |  26 +
> >   drivers/gpu/drm/vkms/vkms_configfs.c          | 833 +++++++++++++++++=
+
> >   drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
> >   drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
> >   drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
> >   drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
> >   drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
> >   12 files changed, 1072 insertions(+), 13 deletions(-)
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> >
> >
> > base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
