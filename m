Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E55ABECF
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 13:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0F510E9C4;
	Sat,  3 Sep 2022 11:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B312B10E9C6;
 Sat,  3 Sep 2022 11:49:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bj12so8408673ejb.13;
 Sat, 03 Sep 2022 04:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=L8JWmYeP0agCpr9gIt+kO7e8db1QuH2XavYHuRMz30Q=;
 b=igh//5aXAX+Ch7DrPPlG9WnX/J/xNGm1LAX3JBvrnZIDCYolQGEKRHg5MdKVH99uo4
 qm8WKgaJ+U8MPn6mbjJiPcAc68qE0k08ic5QG/G7YtfrNRgLe78Fe3B9EOl0J9SrGn3l
 QEHSb9Y1pBqdMEvgblC8poaBRw/glw2+rbO+CDzLOoQH8ox/ANZyvFILkrpfgYy72M+G
 gojxYpBv+bM8qgr1ENrercMbSPBC4W3sQvK+jiBs+CHCMDLMbNKC9l1jqN7FsoiZf+eg
 1xhGL2cEbnd4VGx3pLKMm/19gEMYsH9Hm3ueN/KcQo/N04dmrQ7KGPI4okYwTzU70Xcx
 PRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=L8JWmYeP0agCpr9gIt+kO7e8db1QuH2XavYHuRMz30Q=;
 b=YBCQd/vHLOKNdRVtCglq/PBMBzTxddLShRPZdI3e4MxOLcfL1CJUE93CkF7U3Xoy9E
 JFwxGc9rkm74/bWDwkNeAL2dWh8LDq4QdDoBAPGJ3MjEd5xh+tkiR/pQmXAUAxpCm0UL
 0Ek/+c5Z9gdY9jtwsrpIFaf+HR9dYuGN57iQbC4udMq9p9P/fbrDChVS1KSmxGtQEYVs
 PW2nT/x9jXud8nmy5Pr/5yUImzizznsaKm4nI7LrNEZEIfZ6HpriBejpsgh+N5eGl+p3
 /lnpBXYRNC4NbmPosjnlzYr70fEfBv/p3gsjEh005s9oBC2LxzFveNdvu/FUEjuuaE6f
 PJwQ==
X-Gm-Message-State: ACgBeo1xiDvoUnuNQLs5789RT4/qpQpec+A+1cYc9OHIGQqHrEzcdxMw
 BwGHPzluXnw+FBn8G0V1wDb1SixAJlUvlYf08aQ=
X-Google-Smtp-Source: AA6agR7GYJ/I5l+kgtKwTwt3iUA39s259v5yv7yQkzOlhgsnSf7YLw0wuCuapIsGmnkcWrbQTMCzzBHUd+/18ahdEo0=
X-Received: by 2002:a17:906:8462:b0:741:6003:71e4 with SMTP id
 hx2-20020a170906846200b00741600371e4mr22282285ejc.170.1662205777277; Sat, 03
 Sep 2022 04:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903060558.55167-1-doug@schmorgal.com>
 <20220903060558.55167-3-doug@schmorgal.com>
In-Reply-To: <20220903060558.55167-3-doug@schmorgal.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 3 Sep 2022 13:49:26 +0200
Message-ID: <CAH9NwWd1Q6iGUZoB7j3zAd-Pj_vq4WueguyfhKeWdWo6SPJ+PQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/etnaviv: fix power register offset on GC300
To: Doug Brown <doug@schmorgal.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

>
> Older GC300 revisions have their power registers at an offset of 0x200
> rather than 0x100.
>
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 85eddd492774..b375612df862 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -10,6 +10,8 @@
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
>  #include "etnaviv_drv.h"
> +#include "common.xml.h"
> +#include "state_hi.xml.h"
>
>  struct etnaviv_gem_submit;
>  struct etnaviv_vram_mapping;
> @@ -149,14 +151,24 @@ struct etnaviv_gpu {
>         unsigned long base_rate_shader;
>  };
>
> +static inline u32 gpu_fix_reg_address(struct etnaviv_gpu *gpu, u32 reg)
> +{
> +       /* Power registers in GC300 < 2.0 are offset by 0x100 */
> +       if (reg >= VIVS_PM_POWER_CONTROLS && reg <= VIVS_PM_PULSE_EATER &&
> +           gpu->identity.model == chipModel_GC300 &&
> +           gpu->identity.revision < 0x2000)
> +               reg += 0x100;
> +       return reg;
> +}
> +
>  static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
>  {
> -       writel(data, gpu->mmio + reg);
> +       writel(data, gpu->mmio + gpu_fix_reg_address(gpu, reg));
>  }
>
>  static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
>  {
> -       return readl(gpu->mmio + reg);
> +       return readl(gpu->mmio + gpu_fix_reg_address(gpu, reg));
>  }
>

I had a quick look at what vivantes kernel driver did. It uses a per
gpu instance variable powerBaseAddress
that gets set accordingly. I am not sure if I really like the
gpu_fix_reg_address(..) idea, as it gets called on every
register read and write. For me I see two other possible solutions:

1) Add two seperate helpers ala gpu_read_power() and gpu_write_power()
where we do the if beast.
2) Add a power register offset variable to etnaviv_gpu and explicitly
use it on for reads and writes - like the Vivante driver does.

But that's just my personal opinion. Can't wait to hear what Lucas thinks.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
