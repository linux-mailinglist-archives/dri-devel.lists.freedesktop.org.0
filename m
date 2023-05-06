Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803416F8E36
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 05:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136710E5EC;
	Sat,  6 May 2023 03:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3312810E5EC
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 03:09:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78A0B641C7
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 03:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F23C433A8
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 03:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683342556;
 bh=94DSp8k+H3J+AqmROh/Y6LXMjAfEDuNgrjATTUqIGf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oi4A+bM3GJYMILFGv9WW2BLv73UjF4glWlr9rNrPlG4q2hxKa1PVStT77yBASYe+i
 mRna95Xpo0cXMDq+kLuwMf7YEJd6s+Ng82m+AjTtDUd1+w2ueB0UKGaWBYNCRKNlQ5
 aSaTyJZQM9yaEZpWQl9gPn0u4wMa2vYSTp7d7g5+6rxZJY63VNcMGC1FMdM6WINudX
 wNRi2C/MSuxHjKRZzXJqB3NBk2yFCyEl0qS5KCRY/6yfzVvL1zvzwI3NCFtUfPv6bI
 eAw026lpC2qCHucsoZiYoJ++/CDr6gePHHdCxIPrAd2eKs0CRe6YEq9wcaXlYYcX7n
 xt1eDaqzRv14g==
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-965fc25f009so147410566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 20:09:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDyXKjSWkcokifLpLwPEAer9x5gWm/hEaTKfrv8TCcwxsGieQHD2
 8LcT+fo8mnCEeupE17KOcgTxiEIwZSYt5zdWgtU=
X-Google-Smtp-Source: ACHHUZ5q66Rt3kuFcvOCHyf5q3SCTx0oegflyWNX/hW3kcg5FLjFyT6/1CH0s9pr7aacP/qFhtu3dHWdoaSL+Fp2GWY=
X-Received: by 2002:a17:907:720f:b0:933:1134:be1e with SMTP id
 dr15-20020a170907720f00b009331134be1emr2995754ejc.53.1683342554618; Fri, 05
 May 2023 20:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230504080406.1213623-1-suijingfeng@loongson.cn>
 <20230504080406.1213623-2-suijingfeng@loongson.cn>
In-Reply-To: <20230504080406.1213623-2-suijingfeng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 May 2023 11:09:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4zKGkd2JUyYTDKBEGFEO5V+oRz8iuzF9w+ivz0t6+CFw@mail.gmail.com>
Message-ID: <CAAhV-H4zKGkd2JUyYTDKBEGFEO5V+oRz8iuzF9w+ivz0t6+CFw@mail.gmail.com>
Subject: Re: [PATCH v12 1/2] MAINTAINERS: add maintainers for DRM LOONGSON
 driver
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, nathan@kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jingfeng,

I think you should exchange the order of these two patches.


Huacai

On Thu, May 4, 2023 at 4:04=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.c=
n> wrote:
>
>  This patch add myself as maintainer to drm loongson driver
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 73b3298b7232..1f5aa8756d87 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6922,6 +6922,13 @@ T:       git git://anongit.freedesktop.org/drm/drm=
-misc
>  F:     drivers/gpu/drm/lima/
>  F:     include/uapi/drm/lima_drm.h
>
> +DRM DRIVERS FOR LOONGSON
> +M:     Sui Jingfeng <suijingfeng@loongson.cn>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Supported
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     drivers/gpu/drm/loongson/
> +
>  DRM DRIVERS FOR MEDIATEK
>  M:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
>  M:     Philipp Zabel <p.zabel@pengutronix.de>
> --
> 2.25.1
>
