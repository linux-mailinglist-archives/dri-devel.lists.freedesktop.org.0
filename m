Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BC1181F6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52CD6E827;
	Tue, 10 Dec 2019 08:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161D86E827;
 Tue, 10 Dec 2019 08:15:43 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id g23so12402012vsr.7;
 Tue, 10 Dec 2019 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DSBHJGZv/Ck/e1RdMtefgHGkJsjc54RUFKjHrEKkQpE=;
 b=cTrWOtCDqZLsnRwsF+oyUucWl/NqFzTEN+GkbazPxvRb4KzvkxK7NARNiIMb58kjbQ
 aIa9Ufv/Q5LpT+Ey8xqB50Oev4fi2PbJAKgPT+k5RR1zzjm9Rh207vXyYGgDVVcvH6AO
 deo3rX4CjtNnh1SDquyG9ULJucc6DbjvPuPy2rXW7BIrGhpKqJwtAC+RASAHvnyL+dsA
 IFAJQfOFM6GebBf01orH/S6Qk4nC34atXHXpJwbeksQDz7saKXzSC6vdJp/vhZjXg+1M
 7ZzoJcMoWTHzUB5p0RJmjdRAPs91dKqDQx/0W51i7hVPIRj0tqUEZLy6YP7/8Ubbo8Is
 sRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DSBHJGZv/Ck/e1RdMtefgHGkJsjc54RUFKjHrEKkQpE=;
 b=biuX2haY4/WzHMQVlKoe+hH/NKQtYrY/a/tMYIUj7HDSGEtV3Omji5E+95hYXj+p5P
 DXTaPcLfWl/V5YoimOzffdLQzOkXiC8mV+X54yYYKrU2XayTPJR3knIx0AkpVfGxJDYQ
 Z/VD6ZSkyhMPAk7WXCrs/xmOwzGW5x2OvcouQOyzAAloxIbQsoAJtPtGUNgQU777jAO/
 csC6I02NrH7AtGTlXf/BwDt8mNA4nK/OsYHGkgrAIzzeRcACeV1fBPdxfK9RiQtVZlYr
 mUDBVasVN+RWQTClHV+JAOVbTTLKYS6qFlhVdufDrpo3g7mNfcd3OmO6tB21QmI1OH8o
 W6/g==
X-Gm-Message-State: APjAAAW1SUsBcZkNyn0frpBRz2nXRGk8DU4S3rEXE219hPvz/hI3tL3V
 h1j9sWVbYyGVAsxbp3E+qoc6QHLe9fjzhax3nU0=
X-Google-Smtp-Source: APXvYqxLYqHDrZ6EowjFsDR8K0gK+VBe4GrEnGBexmziQ3qWTw85y0mfg8VgkTirFewxsRMIRD4r3H/tTR9Kh9KdHbs=
X-Received: by 2002:a67:6345:: with SMTP id x66mr22693510vsb.132.1575965741983; 
 Tue, 10 Dec 2019 00:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 10 Dec 2019 18:15:30 +1000
Message-ID: <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Dec 2019 at 22:00, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi Ben,
>
> here's a revised subset of the patches I had sent out a couple of weeks
> ago. I've reworked the BAR2 accesses in the way that you had suggested,
> which at least for GP10B turned out to be fairly trivial to do. I have
> not looked in detail at this for GV11B yet, but a cursory look showed
> that BAR2 is accessed in more places, so the equivalent for GV11B might
> be a bit more involved.
>
> Other than that, not a lot has changed since then. I've added a couple
> of precursory patches to add IOMMU helper dummies for the case where
> IOMMU is disabled (as suggested by Ben Dooks).
>
> Joerg has given an Acked-by on the first two patches, so I think it'd be
> easiest if you picked those up into the Nouveau tree because of the
> build dependency of subsequent patches on them.
I've merged all the patches in my tree, after fixing a small build
issue on !TEGRA in the WPR config readout patch.

Thanks Thierry!
Ben.

>
> Thierry
>
> Thierry Reding (9):
>   iommu: Document iommu_fwspec::flags field
>   iommu: Add dummy dev_iommu_fwspec_get() helper
>   drm/nouveau: fault: Add support for GP10B
>   drm/nouveau: tegra: Do not try to disable PCI device
>   drm/nouveau: tegra: Avoid pulsing reset twice
>   drm/nouveau: tegra: Set clock rate if not set
>   drm/nouveau: secboot: Read WPR configuration from GPU registers
>   drm/nouveau: gp10b: Add custom L2 cache implementation
>   drm/nouveau: gp10b: Use correct copy engine
>
>  .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c |  6 +-
>  .../drm/nouveau/nvkm/engine/device/tegra.c    | 24 ++++--
>  .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++--
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 +++
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
>  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
>  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
>  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
>  include/linux/iommu.h                         | 47 ++++++-----
>  18 files changed, 249 insertions(+), 72 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
>
> --
> 2.23.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
