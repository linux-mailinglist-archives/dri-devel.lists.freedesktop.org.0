Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A738BB56F92
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 07:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1360110E2AE;
	Mon, 15 Sep 2025 05:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PeCwHCRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9D10E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:01:57 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-54a2beaa29fso442575e0c.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 22:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757912516; x=1758517316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SP8MR8Zyb+M1j23tZdMs2golC/4gwmlwntbTcjSvyqs=;
 b=PeCwHCRhfGDjh7Eq5vrMpIrUeoCm1aTYvHfn9hm5cpZNv9b6EjGAbw/VCPiJDfgf3r
 klvaHQVrlA533bf+yBq7GMKTOqj4mZmwQGL6oNICE47/OKMwohZqe0mINaOd4wW1bAvJ
 0C2xJ5+Mb995KJAS2Ivlr1m2Rlpu6HLVEhC/Db7vBnV/akhcgb81QNrQWB3i8VA9HT2I
 Ek2lxUhWFcrG+n+3nW/DJN+eXHJ7AQS8Dcoeo5xdLxwzro1YTxjK622dW+yG+5QjxS5e
 InpezZaOlWloFKZravvn70PMUYxDNCjYV8KlPU/184x8k4gYwdmUZlZppcRfMZb9ayhK
 2lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757912516; x=1758517316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SP8MR8Zyb+M1j23tZdMs2golC/4gwmlwntbTcjSvyqs=;
 b=KyZMOGfo+3IO48+cKQGzBY9adWGUMem/Ie+veSo/EUgX+UvVy+MYq4t8T/0OzP3jga
 0ZC6+TWaV59FunXv8FUx+aUrjuZIWO2KS/4RJldWkCxUZIcuEhcWl5emluSoOR8Z/RaC
 PLPXFu/+tdghL3/B8NaDzS1O3+NDv9CuKxGB+C1cV9imfpat4mzebAAP6R+2Bsz4Ieov
 JSKGCOqJ/aRI7K2IkB/c/Lh/wHgDuLkRnQ47TmY1HPsJ9Gl3Zzl70WM9R0uiMDpecRNd
 jsMr3xwHq5apxciJZCNMJovQixk8HaOUDIuXfJd5sinJ0IWVqsScIiCu4lm6qwfu30ok
 YZ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlDRKsVAbUtStYpDsuHqW1TukD7cOLyZ4unWuQAk5yTIfRdgteXzYpkznfxngloE6BfmyL2eM9WoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6ZXsj5STROeyA4N9vPYBVLnyVL9yDfu1vrbyePM1LzyQBwWN+
 MC8XB6/KwBQXBFymhXoWwEnBw9H/9Zh0NwAnl7QpC1rf8dMypOqTKapHk3/sa+QQ30rNT/sm4gu
 0SfcqQrtDr1OBvi4bKVN28MaO9CbtsF0=
X-Gm-Gg: ASbGncuNY9VDaCSjz2rn5k5L4McDFos4B6LyIHP1FulrZNZrSvQ8MjODS3bXRhuP3Ak
 4hfQ43htunZtn7HQp5EFeI7BjRI92yKqCkhDykqEingkvv9JklUBYWbNmFBWL1sqCAuBswHgOpv
 39F0pjZG5uXUa6z7vRwDi0GgXUa/SuL61HpF9ZfAGMD3yiaYDz2/eAeJdYwpPZH06ctE84zw/Jn
 7d1N//DTkKfhZcExdUz1P/TIrqSgTxsnDvqBlX7Gx9lcYs4INM=
X-Google-Smtp-Source: AGHT+IE3jn62oKcgXSavOgunVi8XJshWJWhwQ/NqLWYGRV5pjEp2g/3sg3TnOmQhafFEN8gAAnv9ZuPZTgxOKs6YhQw=
X-Received: by 2002:a05:6102:d86:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-55610cc5eb5mr3946090137.32.1757912515692; Sun, 14 Sep 2025
 22:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250914031522.33155-1-inki.dae@samsung.com>
 <CAPM=9txNEQXDU6rKHxTVXej7fxgrbbd_X+emHejwA4a7s9aoaw@mail.gmail.com>
In-Reply-To: <CAPM=9txNEQXDU6rKHxTVXej7fxgrbbd_X+emHejwA4a7s9aoaw@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 15 Sep 2025 14:01:18 +0900
X-Gm-Features: AS18NWA8kCkHBSD9xTpctn9ue13u7QfKbO5ABJGpcQFwup3LnmL09HsH5sVhYxY
Message-ID: <CAAQKjZNcAXOLovpsYwhzKh1V-SGhiWTh3xt1aQorQFY9tTBv_Q@mail.gmail.com>
Subject: Re: [GIT PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <dev@lankhorst.se>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-samsung-soc@vger.kernel.org
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

Hi Dave,

Sorry for this. While rebasing onto drm-misc-next, I overlooked that
some unrelated patches were unintentionally included. Since the pull
requests for exynos-drm-misc-next and exynos-drm-next are
interdependent, I will rebase onto drm-next and submit the two pull
requests again today.

Thanks,
Inki Dae

2025=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 12:42, =
Dave Airlie <airlied@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Inki,
>
> I've already gotten the last drm-misc-next pull for 6.18 in my tree,
> there are some patches being pulled in that might be for 6.19? or do
> we want to get another drm-misc-next pull into 6.18?
>
> Dave.
>
> On Sun, 14 Sept 2025 at 13:15, Inki Dae <inki.dae@samsung.com> wrote:
> >
> > Hi Dave and Daniel,
> >
> >    Add DSIM bridge drvier support for Exynos7870 SoC.
> >
> > Please kindly let me know if there is any problem.
> >
> > Thanks,
> > Inki Dae
> >
> > The following changes since commit c08c931060c7e44452e635e115913dd88214=
848c:
> >
> >   drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_fre=
e() (2025-09-12 19:04:37 -0400)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags=
/exynos-drm-misc-next-for-v6.18
> >
> > for you to fetch changes up to 17308ab685acba947fb35e52fada2b97f346b8cd=
:
> >
> >   drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM brid=
ge (2025-09-14 11:53:09 +0900)
> >
> > ----------------------------------------------------------------
> > New feature
> > Add DSIM bridge driver support for Exynos7870
> > . Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridg=
e driver.
> > Document Exynos7870 DSIM compatible in dt-bindings
> > . Adds exynos7870 compatible string and required clocks in device tree =
schema.
> >
> > ----------------------------------------------------------------
> > Kaustabh Chakraborty (12):
> >       drm/bridge: samsung-dsim: support separate LINK and DPHY status r=
egisters
> >       drm/bridge: samsung-dsim: add SFRCTRL register
> >       drm/bridge: samsung-dsim: add flag to control header FIFO wait
> >       drm/bridge: samsung-dsim: allow configuring bits and offsets of C=
LKCTRL register
> >       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
> >       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
> >       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offse=
ts
> >       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
> >       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
> >       drm/bridge: samsung-dsim: add ability to define clock names for e=
very variant
> >       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatib=
le
> >       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM =
bridge
> >
> >  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
> >  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 +++++++++++++=
+++-----
> >  include/drm/bridge/samsung-dsim.h                  |  16 +-
> >  3 files changed, 308 insertions(+), 88 deletions(-)
>
