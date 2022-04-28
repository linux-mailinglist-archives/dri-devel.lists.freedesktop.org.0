Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 063BB5136ED
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 16:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C7210E172;
	Thu, 28 Apr 2022 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6DC10E172
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 14:31:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u3so7064205wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tD4ZnsNL95O06h7hL8VE5RqbrsySI03OuKEhpsr3NBY=;
 b=T+0wHxCSRyNbX5rV4CtSy8rx/AxW9OuTOoR+B8TOkzQDkyBO00HtWPeIdS0i/QQoQY
 fIOOa1kMzZHo6F3oa7uC6jQ0ftswxFXMMRDXjYRe/5G6cMR0cdzvurS6yCzzuL0zOW4R
 sRUOm+yBXzHomPvNlmik9KNG0ss9dhB/FJMBT5eETe9swWXH1w/J0Bm4lpnK/htqZk1d
 IbA8C5RxGwvzzexMidvpK3rtw5yXJ7m6JKRGGyGLO9hVS6TShXtrfwhOiPix+/RbkMY/
 TjIMGw5wiW2CRSMf4WuzZgFSykB+1wyg8udCjw7tQIi8gi6Bet16IGF7lTYPsEkHmR6d
 0NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tD4ZnsNL95O06h7hL8VE5RqbrsySI03OuKEhpsr3NBY=;
 b=OrXGSfY8w46DxHCS+k5V7gQP7oNE2WSUfXWWR5B/Lrb45r+2+AFGFAbeiZsipgTC5Z
 ouiQgtb4VnBnWaqmfjaGOlaT97hsU4k9YNGeO7J+Dl2T9z+povWyX2dGiwf3aPxSwRKl
 Jt/ms7HU29iewc75og7KoUmBwsDFqWyu6/ohhsGhB6t32GpeWFNVUxHNYomCEBBNlVhw
 YnXA6BCkigxS5Vu1pCSn2bGr4N6OYP1Xp6MEplaALDyfbTGFmi4lvDzeHdM3pdLBf8Uy
 qmc0UD3Pzj5+c/aM0XvlZiayZs/4oaWO+/B7u7S+qjhemNVgRumXO3xxgyUIm9eT3v2o
 bCiw==
X-Gm-Message-State: AOAM530OWOnwc1HbKOlwkHeCEcUPFhxVx6YvggbjsyV4YfCBREeLQHdi
 gZ+CHWXnmddj7cs4edwfXMIduAODD9g=
X-Google-Smtp-Source: ABdhPJy94FFHTeKN1GK8czEcKl+i8gHZfXgzH0KKXwxLGWfDljbzaXXWHbYxQGcmuRPZvQYQIodsRw==
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id
 t8-20020a5d42c8000000b0020ad91f87b5mr18368195wrr.301.1651156313725; 
 Thu, 28 Apr 2022 07:31:53 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0039411b2e96fsm1581283wms.30.2022.04.28.07.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:31:52 -0700 (PDT)
Date: Thu, 28 Apr 2022 16:31:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2 3/4] drm/nvdla: Add register head file of NVDLA
Message-ID: <YmqlVmYX3q74hMWT@orome>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-4-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xAWah0BCLTf7+aCW"
Content-Disposition: inline
In-Reply-To: <20220426060808.78225-4-cai.huoqing@linux.dev>
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xAWah0BCLTf7+aCW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 02:08:00PM +0800, Cai Huoqing wrote:
> The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> which is integrated into NVIDIA Jetson AGX Xavier,
> so add register head file of this accelerator.
>=20
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
>  drivers/gpu/drm/nvdla/nvdla_reg.h | 6411 +++++++++++++++++++++++++++++
>  1 file changed, 6411 insertions(+)
>  create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h

You probably want to change the ordering of the patches a little because
this new header file is already being used in patch 2. With the current
ordering you'll break the build between patches 2 and 3. The same will
likely happen with patch 4 because I'm assuming (haven't looked yet)
that the UAPI structures are getting used in the driver code as well.

Other than that, not much to say about this. One note perhaps, see
below.
>=20
> diff --git a/drivers/gpu/drm/nvdla/nvdla_reg.h b/drivers/gpu/drm/nvdla/nv=
dla_reg.h
> new file mode 100644
> index 000000000000..5ca2897405bc
> --- /dev/null
> +++ b/drivers/gpu/drm/nvdla/nvdla_reg.h
> @@ -0,0 +1,6411 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2017-2018 NVIDIA CORPORATION.
> + * Copyright (C) 2022 Cai Huoqing
> + */
> +
> +#ifndef __NVDLA_REG_H_
> +#define __NVDLA_REG_H_
> +
> +// Register NVDLA_CFGROM_CFGROM_HW_VERSION_0
> +#define NVDLA_CFGROM_CFGROM_HW_VERSION_0			_MK_ADDR_CONST(0x0)
> +#define NVDLA_CFGROM_CFGROM_HW_VERSION_0_HW_VERSION_SHIFT			_MK_SHIFT_CO=
NST(0)
> +#define NVDLA_CFGROM_CFGROM_HW_VERSION_0_HW_VERSION_FIELD			_MK_FIELD_CO=
NST(0xffffffff, NVDLA_CFGROM_CFGROM_HW_VERSION_0_HW_VERSION_SHIFT)

I know that people have in the past expressed reluctance about the way
that these fields are defined. I personally don't like these very much
because they are very redundant (e.g. that CFGROM_ is duplicated for no
obvious reason). I also think those _MK_* macros are very difficult to
understand because they can be found nowhere else in the Linux sources
so people aren't used to the format. And in fact the Linux kernel has
its own set of macros to define fields.

I also realize that this would probably be a pain to change. Let me see
if I can find out how exactly those get generated, so perhaps there's a
way to get them generated into a format that more closely matches the
idioms used in Linux.

> +//
> +// ADDRESS SPACES
> +//
> +
> +#define BASE_ADDRESS_NVDLA_CFGROM	0x0
> +#define BASE_ADDRESS_NVDLA_GLB	0x1000
> +#define BASE_ADDRESS_NVDLA_MCIF	0x2000
> +#define BASE_ADDRESS_NVDLA_CDMA	0x3000
> +#define BASE_ADDRESS_NVDLA_CSC	0x4000
> +#define BASE_ADDRESS_NVDLA_CMAC_A	0x5000
> +#define BASE_ADDRESS_NVDLA_CMAC_B	0x6000
> +#define BASE_ADDRESS_NVDLA_CACC	0x7000
> +#define BASE_ADDRESS_NVDLA_SDP_RDMA	0x8000
> +#define BASE_ADDRESS_NVDLA_SDP	0x9000
> +#define BASE_ADDRESS_NVDLA_PDP_RDMA	0xa000
> +#define BASE_ADDRESS_NVDLA_PDP	0xb000
> +#define BASE_ADDRESS_NVDLA_CDP_RDMA	0xc000
> +#define BASE_ADDRESS_NVDLA_CDP	0xd000
> +#define BASE_ADDRESS_NVDLA_GEC	0xe000
> +#define BASE_ADDRESS_NVDLA_CVIF	0xf000
> +#define BASE_ADDRESS_NVDLA_BDMA	0x10000
> +#define BASE_ADDRESS_NVDLA_RBK	0x11000

I'm wondering if it might make sense to turn these into separate reg
entries in the device tree, though it might not be worth it. The one
concern I have is that these might change internally in a newer
revision, which might then make it a pain to adapt the driver to the
differing offsets.

That said, I'm not an expert on DLA, so I don't know how this has
evolved in newer chip. I'll try to track down our local experts so that
they can clarify a few things for us.

Thierry

--xAWah0BCLTf7+aCW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJqpVMACgkQ3SOs138+
s6GRSRAAuXAm9LihLpfQ1BQOnd52lgMlO8jTO5IqOlkdP3akExLaPCPBoEmc1JSR
UMgKddQ86r4PsPF26Z6o/qzPUQL1OSG7TyDYVt10Vq7OYC0FvBfamHYVQE8RW5Yo
zXMjvoWM/P0PPtFz2474Ngq4/AztVLSUHYCtDDKOM40YW1pedUWcOfbIqbutQpD+
kQf2GOM9tWT1jRVBpS9coH6guSU4HJEFXZFDZ710OtUN1ay/ZSECOYGIjRj8lGeS
XME2ppdv5t3JpA5rfgGuzUjQu0e5kB/JNJx/nVnsLlpEyWnNpXcPhSJFo7ZjBAGj
0nHtosK9pLOKiWDg35QUjUTIF7klWc9+R8Sg8W6HqyNiGg/NRlC48tj/1HR/Zjqe
ZLZa3nlEnuwaEIrnQImIkWGjWv3qaiHIC0bskYooN2dzhVZGnTXwYB58CuhoJSpo
gcwu7MKMFRZB/Mu088vwaMt/MmYsLM4lvwu8tLC3JUH0x987jNiRKjCjyOG+OPOp
0HyAOjCAmtWSEnP6rYbFeNF6JCBAS6POHV2T2pY0Q+I98dYRvRsNr+RkaDQ1S78J
xSTYE2vG83jqxcB5aYBvQMdNxkGhOVtOSz5rhrcGjcw4volYhcqWdDgjBjk5Ftgc
6RMp3F2ff71qyNjYc85qexHoksZdqIcwX6sENHTjjvd2IToNbuI=
=vU1Q
-----END PGP SIGNATURE-----

--xAWah0BCLTf7+aCW--
