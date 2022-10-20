Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9360606369
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33010E22D;
	Thu, 20 Oct 2022 14:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A9C10E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:43:14 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-12c8312131fso24841683fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smqvS8edERBdXoNssJj7nOz3hos2ngGklMmChz3LiDA=;
 b=B7stGq06cVUMTjU4yS0CNoEtIk8uPB7kTBvFcZHHvDcghDopbkfbGHpCTCbaqJeB5x
 eh0hroOlstIDQd3CdbmD9YWrEzs/dbh2ivwdseW9pzAkDHyCFnrYZbgxhT7gy9dm2YRY
 WF6g/dhYEdgr1vyG9g/eSnCh7XDn+Sw0mh1Xn9FJS1Nk6vR6rWg3N8mspvJOIr2CohsE
 SLYak9NI9Cu7l/L1mMKbp+RCgDgeTFXavok54aiA8kPCXx8DzGb1FcD+NqGBDsrUSqOs
 CkiwCq+WTcAYwtDuuYd12OrhTSIvq3iHaTe0qNf87Y0D5W40vyhLTm+7fcGqh8WPh0Qn
 ti0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=smqvS8edERBdXoNssJj7nOz3hos2ngGklMmChz3LiDA=;
 b=prs73p8jcbIxGelUMhFEDIS8cr5VmZ++0lQaILuqeBNvUEzmARyHScBcaZq9eyFTYJ
 FKpnw3qidzsNCFX/PQQBTr5A3zPau4FrUfIheybxFDR0vLfbqlQWUB2DiYpb6y1cuevD
 vAZwfgJmFdysdlXPImI2oCRRoBPcIBnpFZmg2UWIx+b4AbbxOPc6ZzWeKbIutQmUnU62
 FLK2BAWBnq8hC1NmyKml9UDnDlmxaKfF7tmjKfX9pV0tUjQM+t+CEjbO9D7oqAlqPhZ9
 Gbrt5yeuF3i6rgZlj7Blc3Nkthw4JkWRzERHrkVRoh/HJPlSsQAyrAqLSfR5553Q3m8B
 HPyA==
X-Gm-Message-State: ACrzQf2XClob1THP85DWMBtp4bPq/yR4/8XLCuLPZIgT3wj44I7Idy9A
 G4r6oAvzXN5GYNLy4w4579yob90IirpSJJ71tVs=
X-Google-Smtp-Source: AMsMyM6M4RUwVGE08KoWFaWKLprXNDwsz60pGxBYFegIiptEY3Pp0sWMLbxfn71oqEs2HdISiys9npc7rI5zT9+nmbU=
X-Received: by 2002:a05:6870:4286:b0:132:756f:6b97 with SMTP id
 y6-20020a056870428600b00132756f6b97mr8438996oah.38.1666276993672; Thu, 20 Oct
 2022 07:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <20221020121316.3946-3-christian.koenig@amd.com>
In-Reply-To: <20221020121316.3946-3-christian.koenig@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Oct 2022 07:43:02 -0700
Message-ID: <CAF6AEGsw=J6Y5jd0A5_hVg1A5BF87hz00Ggmbi8OtTjPJKMDGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 5:13 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> When a device driver is snooping the CPU cache during access we assume
> that all importers need to be able to snoop the CPU cache as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 20e109a802ae..d5c70b6fe8a4 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -28,6 +28,7 @@
>
>  #include <linux/export.h>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
>  #include <linux/rbtree.h>
>  #include <linux/module.h>
>
> @@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_o=
bject *obj,
>                 .size =3D obj->size,
>                 .flags =3D flags,
>                 .priv =3D obj,
> +               .coherent =3D dev_is_dma_coherent(dev->dev),

To set the coherent flag correctly, I think I'd need a way to override
on a per buffer basis, since coherency is a property of the gpu
pgtables (which in the msm case is an immutable property of the gem
object).  We also have some awkwardness that drm->dev isn't actually
the GPU, thanks to the kernels device model seeing a collection of
other small devices shoehorned into a single drm device to fit
userspace's view of the world.  So relying on drm->dev isn't really
going to give sensible results.

I guess msm could just bury our heads in the sand and continue to do
things the way we have been (buffers that are mapped cached-coherent
are only self-shared) but would be nice to catch if userspace tried to
import one into (for ex) v4l2..

BR,
-R

>                 .resv =3D obj->resv,
>         };
>
> --
> 2.25.1
>
