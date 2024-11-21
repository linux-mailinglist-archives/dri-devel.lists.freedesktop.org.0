Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777449D554C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617C110E2F5;
	Thu, 21 Nov 2024 22:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oGFOQGfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECEA10E2EF;
 Thu, 21 Nov 2024 22:17:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC2EB5C5549;
 Thu, 21 Nov 2024 22:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEE8C4CED2;
 Thu, 21 Nov 2024 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732227447;
 bh=MLlq8+M+tw64hFOX9c9IBrDEY8JRJbyJBDIrXXaqd+k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oGFOQGfggCJy5L2K6kG9BCE2IChc89FYc/HSCB1upfT0yICiKWAW+pm4UZ+LJox6+
 vVZTsriZv4j1zYIBm0Or/lC1CZV+BI3ZWTAUDdzL0rqgrxyzwSHvPZEE/+LYYx48Bo
 ee6kjUyic+rqdCeAQbrwV0+dtmpORSs87xA0dgXbHgwgZAu9hNL/wXghccHbG8IjtN
 eHJ3e5SzGgjUK5MQkUSLotDpg1VH+CjeR8DGCD5l1iPuDY2aWlEn37V7b2VwOtmKqN
 g+yWDlskxerZYOg2dCSITNsVja2OhqLhY7hkX0Yf4KuQop4pTS2y9rFKwGX4nRvaA7
 aP47c1kzR5gFQ==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53d9ff92edaso1586264e87.1; 
 Thu, 21 Nov 2024 14:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/U2f8kpgv6aJJmJuZVXJVbW6wLcfqe1elSroww4h3lz+5zqBRiHyWsUH+iZEME7HMd70bhzLO4lk=@lists.freedesktop.org,
 AJvYcCXHmrIvroWq8UriMs156XaWSQeZa73t73bWqp3uiK48/FgbyX9EccyVsMrwKpaZ6Yp3bKYh2tjSt/fX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGPVfWUGpfA5Y+kmiP7VNa3XtyFXetM8OVM85LabiGsUqUILEo
 +x7sUvzin8nVv61drVau/gYbTEVtawWVAOc+6PzTWKbnirY4KIxXiecHR2HxgM8jBSUSLP41o0M
 QzLfXQmXFmAYJyvyhvmBAwZwDGeM=
X-Google-Smtp-Source: AGHT+IEDF/pd/Sz3sl47bUiAWd6bAMOR+fWYehca9LHB3zJLcbn10+vWnVIxV5UhcwMI+r07eJGD8MGL4Aptk38j+GA=
X-Received: by 2002:a05:6512:31ce:b0:53d:d125:c26b with SMTP id
 2adb3069b0e04-53dd35a55edmr201881e87.9.1732227446129; Thu, 21 Nov 2024
 14:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
In-Reply-To: <20241121011720.GA69389@pevik>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 22 Nov 2024 07:16:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
Message-ID: <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>
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

On Thu, Nov 21, 2024 at 10:17=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wro=
te:
>
> > > It will be used in the next commit for DRM_MSM.
>
> > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Changes v3->v4:
> > > * Move definition to the end of the file
>
>
> > I prefer to not check the tool.
>
> Ack.
>
> > Why don't you install python3?
>
> Everybody installs it when it's required, the question is how to inform a=
bout
> the dependency.
>
> There build environments are minimal environments:
> * chroot (e.g. cross compilation)
> * container
>
> These are used by both developers and distros.


Documentation/process/changes.rst
documents basic tools necessary for building the kernel.

Python3 is listed as "optional" because it is required
only for some CONFIG options.

If the exact dependency is unclear, it is better to install
all tools listed in that table.




> Kind regards,
> Petr
>
> > >  init/Kconfig | 3 +++
> > >  1 file changed, 3 insertions(+)
>
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index fbd0cb06a50a..c77e45484e81 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> > >  # <asm/syscall_wrapper.h>.
> > >  config ARCH_HAS_SYSCALL_WRAPPER
> > >         def_bool n
> > > +
> > > +config HAVE_PYTHON3
> > > +       def_bool $(success,$(PYTHON3) -V)
> > > --
> > > 2.45.2



--=20
Best Regards
Masahiro Yamada
