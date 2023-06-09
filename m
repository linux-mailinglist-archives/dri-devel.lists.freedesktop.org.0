Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C581372A43D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 22:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24110E6DE;
	Fri,  9 Jun 2023 20:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3610E6DC;
 Fri,  9 Jun 2023 20:17:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2F6865BC1;
 Fri,  9 Jun 2023 20:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC34C433A4;
 Fri,  9 Jun 2023 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686341856;
 bh=2AytHjJpiLx9uJpuLA/dLSMZ6eIK/qLJJjC/k8GtoD4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M0oh0i0ZlwciNbgUrzrX6EVwi8yqcNMMPWzMOfbtb1vCUsgg6/O4YE4TeiOfpy7H6
 A0my2TmbXYEN0zXdbFSI4+4pXxnIoDDh0tWR0/HVrSEQx0hnAihKjPlfmrGU7DQQV3
 O4q0v/1exyBWMpRXsFcakR8pQn+NLDgJHQogOwvQE5CCnBEXdRvqYkldzKNQwl+yHQ
 6OWkhttssmFoK5aiUTjFHMpE5dd2/LqLG1HxXoCARSXrPkGMaVzEhbelKAmx3sll/Y
 4UeyybThmPlG0YO6UGFlkuWKUbI/cNwP0rM5BOEujV6L1LmsmBxfG4PjlWluyAGwZA
 ccOtKqMs6UXdA==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f63ea7bfb6so2673163e87.3; 
 Fri, 09 Jun 2023 13:17:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDxCI/3AucNXJ8nsnhyAuvzoyS6dn0NYssPRDtRR1g5CLo89KVEe
 rv6V3qocJ1tIsTrJoMIwwXy17vwyuuPHJw2H1w==
X-Google-Smtp-Source: ACHHUZ7I16ey/UB+RHcYPsq+ueUfC+xN7ewj0Gfr9rzp8seo+MFfIT6+6NreRfxW9wdkBIyhdhnCZxfxL7JFnV6mFoE=
X-Received: by 2002:a05:6512:521:b0:4f4:c6ab:f11b with SMTP id
 o1-20020a056512052100b004f4c6abf11bmr1744227lfc.39.1686341853975; Fri, 09 Jun
 2023 13:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230410232647.1561308-1-robh@kernel.org>
In-Reply-To: <20230410232647.1561308-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Jun 2023 14:17:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLeAvEVa8h3qywqESkqGG1O+9QWqA7fc1EJeDGkmAV7Fw@mail.gmail.com>
Message-ID: <CAL_JsqLeAvEVa8h3qywqESkqGG1O+9QWqA7fc1EJeDGkmAV7Fw@mail.gmail.com>
Subject: Re: [PATCH] drm: etnaviv: Replace of_platform.h with explicit includes
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 5:26=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Etnaviv doesn't use anything from of_platform.h, but depends on
> of.h, of_device.h, and platform_device.h which are all implicitly
> included, but that is going to be removed soon.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Ping!

>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 44ca803237a5..c68e83ed5a23 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -6,7 +6,9 @@
>  #include <linux/component.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>
>  #include <drm/drm_debugfs.h>
> --
> 2.39.2
>
