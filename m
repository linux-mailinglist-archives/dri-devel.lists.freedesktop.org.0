Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691BE513735
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 16:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEA310E675;
	Thu, 28 Apr 2022 14:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F5110E6AB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 14:45:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id e23so5789017eda.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lv2duw3IIeVX1b8IEr37Tr3lQPeyRB3nQsBT2DP1dxU=;
 b=qgFg4NOb3DubEa66BxDu83qOkViXD7KCZyg+pLDgQA1HJaQFXV5LWQWioQp6cNcjda
 O9eWcuAUZOYPpCmsFYDaA4pV1lDzVvBESNfhsPSYPr0pY4RztYjgRn6hilZsnosNt679
 bzGN0BV1jQRqPIkwMM0xM0STqY5iqG+hpbW31NKdrFluk7uf4JLLjbVDYlJa/sg8uv5J
 5bnBJXSFaz5lsundwDh5BY1P3VpWeHqmvXrT1+RZHdcuJfcPp/4H6Qe47w7kE0Lv89LU
 qRii9RBpZ5HmdmHjJJUYSgCb56tHiFnsHxWIvRQe847HZ0p55tCUVTALiuxISgmgTDmK
 844g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lv2duw3IIeVX1b8IEr37Tr3lQPeyRB3nQsBT2DP1dxU=;
 b=wiGAmDu9J+c6cCpIrqmFiXju6AAza5Mnm9gCMlHAvu8HBj19HMCuftms/vInHDdEuF
 96QLSl4pnFQ5Lpisitv1meqbkOr1UNdz+aRo76xj7rIdvlvmC+cdr7FAqZp8ukb/hgfj
 REkWTg5G+vQLlK8Qn2lFqeRJevCOtHYwmJ/rzCI3Qc15oMbj0yVokyxXQYs+HS7RgzBZ
 TuNSucS63iLHxq/FEX0FeGNEH8SXzzdNELccl06ZYYDIuXlTwSsCAy9n2iS79cT/t9n0
 3OK4NkoM02AXKjTwJ9TKbumldS4aUaH0K+AFY4xKAZqIC6cAmoPA7eIrfiPpnGLkTNVc
 5Hiw==
X-Gm-Message-State: AOAM533chHi6OrIM12fLAeHTM5XrYxpAN2/8UKHcCEAC2Cr2qQx9uC6A
 Th/lbyp1HlfSN8pnsdoFick=
X-Google-Smtp-Source: ABdhPJyCqUCV6a5tWFtjWpg+trPw/EG8ROBgOGlmNeyMdjucftYi4OftoaNJp/LdaAe3xmMQLHO9+A==
X-Received: by 2002:a05:6402:335:b0:425:e3e0:5a90 with SMTP id
 q21-20020a056402033500b00425e3e05a90mr23331731edw.14.1651157109414; 
 Thu, 28 Apr 2022 07:45:09 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 g15-20020a170906520f00b006cd07ba40absm51401ejm.160.2022.04.28.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:45:08 -0700 (PDT)
Date: Thu, 28 Apr 2022 16:45:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Message-ID: <YmqocpCdc7cuYJm7@orome>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
 <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
 <20220426082341.GA83596@chq-T47>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QmawCEVHNWQ0o1ne"
Content-Disposition: inline
In-Reply-To: <20220426082341.GA83596@chq-T47>
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


--QmawCEVHNWQ0o1ne
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:23:41PM +0800, Cai Huoqing wrote:
> On 26 4=E6=9C=88 22 08:31:05, Christian K=C3=B6nig wrote:
> > Am 26.04.22 um 08:08 schrieb Cai Huoqing:
> > > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > > which is integrated into NVIDIA Jetson AGX Xavier,
> > > so add UAPI of this driver.
> > >=20
> > > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> > > ---
> > > v1->v2:
> > > *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to =
nvdla_drm.h,
> > >   move it to uapi.
> > >   comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4=
-83a8121645d8@amd.com/
> > >=20
> > >   include/uapi/drm/nvdla_drm.h | 99 +++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 99 insertions(+)
> > >   create mode 100644 include/uapi/drm/nvdla_drm.h
> > >=20
> > > diff --git a/include/uapi/drm/nvdla_drm.h b/include/uapi/drm/nvdla_dr=
m.h
> > > new file mode 100644
> > > index 000000000000..984635285525
> > > --- /dev/null
> > > +++ b/include/uapi/drm/nvdla_drm.h
> > > @@ -0,0 +1,99 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> > > +/*
> > > + * Copyright (C) 2017-2018 NVIDIA CORPORATION.
> > > + * Copyright (C) 2022 Cai Huoqing
> > > + */
> > > +
> > > +#ifndef __LINUX_NVDLA_IOCTL_H
> > > +#define __LINUX_NVDLA_IOCTL_H
> > > +
> > > +#include <linux/ioctl.h>
> > > +#include <linux/types.h>
> > > +
> > > +#if !defined(__KERNEL__)
> > > +#define __user
> > > +#endif
> > > +
> > > +/**
> > > + * struct nvdla_mem_handle structure for memory handles
> > > + *
> > > + * @handle		handle to DMA buffer allocated in userspace
> > > + * @reserved		Reserved for padding
> > > + * @offset		offset in bytes from start address of buffer
> > > + *
> > > + */
> > > +struct nvdla_mem_handle {
> > > +	__u32 handle;
> > > +	__u32 reserved;
> > > +	__u64 offset;
> > > +};
> > > +
> > > +/**
> > > + * struct nvdla_ioctl_submit_task structure for single task informat=
ion
> > > + *
> > > + * @num_addresses		total number of entries in address_list
> > > + * @reserved			Reserved for padding
> > > + * @address_list		pointer to array of struct nvdla_mem_handle
> > > + *
> > > + */
> > > +struct nvdla_ioctl_submit_task {
> > > +#define NVDLA_MAX_BUFFERS_PER_TASK (6144)
> > > +	__u32 num_addresses;
> > > +#define NVDLA_NO_TIMEOUT    (0xffffffff)
> > > +	__u32 timeout;
> >=20
> > What format does that timeout value have?
> >=20
> > In general it is best practice to have absolute 64bit nanosecond timeou=
ts
> > (to be used with ktime inside the kernel) so that restarting interrupted
> > IOCTLs works smooth.
> >=20
> > > +	__u64 address_list;
> >=20
> > Maybe make the comments inline, cause I just wanted to write that you s=
hould
> > note that this is pointing to an nvdla_mem_handle array until I saw the
> > comment above.
> >=20
> > > +};
> > > +
> > > +/**
> > > + * struct nvdla_submit_args structure for task submit
> > > + *
> > > + * @tasks		pointer to array of struct nvdla_ioctl_submit_task
> > > + * @num_tasks		number of entries in tasks
> > > + * @flags		flags for task submit, no flags defined yet
> > > + * @version		version of task structure
> > > + *
> > > + */
> > > +struct nvdla_submit_args {
> > > +	__u64 tasks;
> > > +	__u16 num_tasks;
> > > +#define NVDLA_MAX_TASKS_PER_SUBMIT	24
> > > +#define NVDLA_SUBMIT_FLAGS_ATOMIC	(1 << 0)
> >=20
> > Well that "no flags defined yet" from the comment above is probably out=
dated
> > :)
> >=20
> > A comment what this flag means would also be nice to have.
> >=20
> > Apart from all those nit picks that looks pretty solid to me. Just one =
core
> > functionality we usually have seems to be missing here: How is completi=
on
> > signaling implemented?
> Hi,thank for your reply.
>=20
> Do you mean fence signal? In this driver, IOCTL_SUBMIT is a synchronous c=
all
> which do task submission & wait for done completion. This accerletor deal
> with massive compute operator (Pooling, Conv...), that is different to
> GPU. It's unnecessary to expose fence API to UMD for reducing such less t=
ime.

Are you saying that using fences won't be a big benefit because the DLA
can't effectively process tasks from multiple sources in parallel? That
is only part of where some sort of signalling would be useful. Another
reason why it would be good to have is to make it easier to write user-
space that can hand off a set of tasks to the DLA, then go off and do
something else and get notified about the completion somehow. If not a
full-blown fence API, then perhaps FD polling would be a simple
mechanism to allow some degree of asynchronicity.

Thierry

--QmawCEVHNWQ0o1ne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJqqHIACgkQ3SOs138+
s6EUfBAAlYT7jUBfxNlt8lC8nihq708469RyXAJ9W+7RKqXZJk0F1UHYyciqCvht
A0jiVclvaTL3ZgTOoBNx3/m2gXsqJTMA95uaeN+c8hFA6sjPcCzY3lUNUEGk5R0b
Pn2g+qn21nndHHAVC0cxCfuBMZc9JKJUur6xwyu57KIXp0sWFf7w9qFKoIZvSrMN
uauK94A0W39TpEWxYmXNqGUS5qWdTS+a+qVIeGqpJV50INSstgbwDP4An31sKWYK
mMmfsf3IGGMZjQL4Gt9rP75kEd8Iv2VQT8hk2pkvwtTqOe3Pj82vLLOwMjMtzfmN
+J1VVtgU1R5Sg6CtS4NKz3/mXP8Ifrvfpl2Mjzh1QbmHBlCPJ0//Nu1kfww5dTQc
LcfYLis44iVBWYUoe14hQf3382RwIG3hUSvCjDnwy5smzsskZStm2j5av+RO2NYm
WxGTniqsmZSAn08e6v7Qs1DlQTs8/n91vqyEM8eiBw6UrGW2+SMv/5t3Kl+CP0v8
hLtXRhKovg5YaJNx1HSCOumZP+lbAJd31tBrZs351R93h5VnVRPgyTNRvRSMNZZi
p7LxFl1Ad/akm0f27cg2SER0L8r0ujgkELfpFoxLlBAL81PMnUxwoAUgYWvOlgi3
dF7+ZokG7eP2vFoN9GBbA6B5DcijRzuPgLn0tlGvrSDBViULn0U=
=DSCc
-----END PGP SIGNATURE-----

--QmawCEVHNWQ0o1ne--
