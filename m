Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6472513673
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 16:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDD610E504;
	Thu, 28 Apr 2022 14:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9180F10E198
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 14:10:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bv19so9830065ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QxSG4Sd3IymNaxaJ3Xg8F5gIsq3DmAwu7vuavbFZaMg=;
 b=ORkanYNmpnu63KyRsvxxOLwz3lEzdfjk90GGqWi2fdpTkH+SY86023v6itTIfBNiFY
 UnPmkw8FdwWvStglh97thBHInKzj4ERKVKILvh4iTgQadS9tlwO9v1wzg2lAsHXgVkF0
 UxE5fw9/KzXo6oB8ftj6OO1zvNqoioJF5ARnw1q+pA91LxYH15SL24NhTL6+UqiB5Zgb
 BBj8iXWujucD5ttip/Xeym2Sb+XlcNgUKcJZmHdTd9XoTexnB0bmQAvXdwbIDcnAg/Wy
 aogC+5ehQeMQHRpLby0fjso+iQf1IiiCdSsPcuZUqXxEAUIEDIFGgQD8RoIRNwfRw07a
 sk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QxSG4Sd3IymNaxaJ3Xg8F5gIsq3DmAwu7vuavbFZaMg=;
 b=Fd2hd+qhK4hfk/OCjMB9n/xvSGIMM8Cbz3KXmHrr0iAjyw6g4xPMe8MD5PAbccTo+3
 Slne8+RfAsGYHQis6SnMFsP+fjttBBdFzL4noWZollh+c+BuEWVpQ2QoZjZF0XPtFmvZ
 k9NAYb+0w2tzJLfZr5QnD97QB9PCHU/pfPLUp9uuh8g/vWM8p8PGw2l1UfxYNwfpbnJE
 iUO+5XFzoOWe7ngWeG5pWeYbhl3K911RK3KeiEX9hzFXj/L47nHPA6TVvwTM+kt5tP0p
 Va4TR3XQrSgQzz4Edd2YDP4+YuXxdmJPxHIUnetic85K4l0vhISgPh6hCboM20pxJavn
 gsCQ==
X-Gm-Message-State: AOAM5307u5BPJoTcO1r9gUvxJI08+k/FUdHU2nxDawf4zM4K+lCeCwRg
 7C4APmXoUCHI8ei+1gmdbPzCjzxGiQc=
X-Google-Smtp-Source: ABdhPJx3J4dvQuPuHjaTxcppg6VcxaE3of/lLOZlPfmcax4nJpfPyk7R5GsC8XD36BYzRS5MxmR5AA==
X-Received: by 2002:a17:907:7b9d:b0:6df:fb8f:fe82 with SMTP id
 ne29-20020a1709077b9d00b006dffb8ffe82mr31613789ejc.652.1651155054921; 
 Thu, 28 Apr 2022 07:10:54 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 t25-20020aa7db19000000b0042617ba63besm1655031eds.72.2022.04.28.07.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:10:53 -0700 (PDT)
Date: Thu, 28 Apr 2022 16:10:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Message-ID: <YmqgailZKIuY7zTZ@orome>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y1M+iRkITIfHNcm8"
Content-Disposition: inline
In-Reply-To: <20220426060808.78225-1-cai.huoqing@linux.dev>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y1M+iRkITIfHNcm8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> which is integrated into NVIDIA Jetson AGX Xavier,
> so add driver support for this accelerator."

Hi,

nice to see this work going on. For subsequent revisions, can you please
also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well as
the Tegra platform maintainers (that's Jon Hunter and myself). This will
make sure that more people with an interest in this will see your work.
Not everyone follows dri-devel, linaro-mm-sig or linux-media.

Thanks,
Thierry

>=20
> v1->v2:
> *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdl=
a_drm.h,
>  move it to uapi.
>  comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8=
121645d8@amd.com/
> *Remove the  onexistent filename  in Makefile
>  comments link: https://lore.kernel.org/lkml/202204201512.pp20MXT5-lkp@in=
tel.com/
> *Sort file names alphabetically in Makefile.
> *Rearrange the error messages, and use drm_err/_dbg() instead of pr_err/_=
dbg().
> *Replace  "dla_" prefix with "nvdla_"
> *Check the iosys_map by iosys_map_is_null(), and check "ret" directly.
> *Using iosys_map_memcpy_to/_from() for iosys_map instead of memcpy()
> *Fix parameter error "dma_buf_vunmap(buf, ptr)", use "&map" instead of "p=
tr"
> *Use iosys_map instead of kvaddr and use "iosys_map_set_vaddr()" to initi=
alize iosys_map
> *Using "vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node)" to update =
vm_pgoff is cleaner
> *Remove the unused nvdla_drm_gem_mmap, register drm_gem_mmap to file_oper=
ations directly.
> *Use DEFINE_DRM_GEM_FOPS() to define nvdla_drm_fops.
> *Remove the unused nvdla_drm_gem_mmap_buf, register drm_gem_prime_mmap to=
 drm_driver directly.
>  comments link: https://lore.kernel.org/lkml/7fa19996-5830-af3d-ab24-08c7=
6e1d5604@suse.de/
> *Fix typo and some code style
> *Remove unused function nvdla_get_time_us()
>  comments link: https://lore.kernel.org/lkml/0fa9ab41-c18e-a569-e6fe-a0e9=
d965905e@stargateuniverse.net/
>=20
> Cai Huoqing (4):
>   MAINTAINERS: Add the driver info of the NVDLA
>   drm/nvdla: Add driver support for NVDLA
>   drm/nvdla: Add register head file of NVDLA
>   drm/nvdla/uapi: Add UAPI of NVDLA driver
>=20
>  MAINTAINERS                             |    7 +
>  drivers/gpu/drm/Kconfig                 |    2 +
>  drivers/gpu/drm/Makefile                |    1 +
>  drivers/gpu/drm/nvdla/Kconfig           |    8 +
>  drivers/gpu/drm/nvdla/Makefile          |   17 +
>  drivers/gpu/drm/nvdla/nvdla_bdma.c      |  198 +
>  drivers/gpu/drm/nvdla/nvdla_cache.c     |  202 +
>  drivers/gpu/drm/nvdla/nvdla_cdp.c       |  299 ++
>  drivers/gpu/drm/nvdla/nvdla_common.c    |  293 ++
>  drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
>  drivers/gpu/drm/nvdla/nvdla_conv.c      |  684 +++
>  drivers/gpu/drm/nvdla/nvdla_drv.c       |  694 +++
>  drivers/gpu/drm/nvdla/nvdla_drv.h       |  129 +
>  drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
>  drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
>  drivers/gpu/drm/nvdla/nvdla_gem.c       |  358 ++
>  drivers/gpu/drm/nvdla/nvdla_pdp.c       |  448 ++
>  drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
>  drivers/gpu/drm/nvdla/nvdla_rubik.c     |  214 +
>  drivers/gpu/drm/nvdla/nvdla_sched.h     |   37 +
>  drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1012 ++++
>  drivers/gpu/drm/nvdla/nvdla_sdp.c       |  723 +++
>  include/uapi/drm/nvdla_drm.h            |   99 +
>  23 files changed, 13176 insertions(+)
>  create mode 100644 drivers/gpu/drm/nvdla/Kconfig
>  create mode 100644 drivers/gpu/drm/nvdla/Makefile
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c
>  create mode 100644 include/uapi/drm/nvdla_drm.h
>=20
> --=20
> 2.25.1
>=20

--y1M+iRkITIfHNcm8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJqoGgACgkQ3SOs138+
s6HuyQ/7Bw5Z8vEp5nsysa1IpVH2TULmTaNHb13DzH8FPR82Hq1NShOY5bXc9u8J
KlwcdiJrqTc9dT5ihUzd02DWp1U60axkO4xxFK7XcX7HnAlsICz+hriTYS/tLiON
U0OAIgSvQox38C+FAVt11QMT7+4rTjG7tzhhgUjyWrLvadkGf9bhLgEVMMW6lEuG
kTGrFzUdmva3xC572zKf6GqlZ39WyLgVNh/FxXbcfquXPoiD2EQ+6IMchxGFAD4B
8Urjz47P6tzNFTUNnlB6Y4rnzauxNyT4cH0tJnbDWTWcm2wQNkVj2gMQw1nf3Nqr
RdVDklCSV7TKp8yoLskTyrg7nTLpnl5ImgaqJ4uXpGUkLGWnOIrc8MmiVUinr3fa
o1jQczamvTMxqbTtx8SsMMCQkDQ8CQW6LzaIzDE/eOJr7BOOcTWX5C1QdBkZ9nD1
+juHCXMAQciQB6gBqTjPdBy3mNrT5nPHMc/RF2oQzJT2vPTeBLfCtAYRrqkVmafN
kwPo0RsBy1Q+rFtuNWQKfJI7C4U3gA5uMHDkYax2AiyIccnZHNnuSJGW+tbNYIca
UOG/gXfRhpvQy+NHQ4EZKrlBIGWGGttjmhQABZy8V4zybKtFSFSOeFA2l+MQZNQU
iDkHquw3wmJ2nLAh7dQ65ygdA1I3frg4dnxt1N2S1Bcj85zmJpE=
=SRlt
-----END PGP SIGNATURE-----

--y1M+iRkITIfHNcm8--
