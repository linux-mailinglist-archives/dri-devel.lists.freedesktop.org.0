Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564B143C480
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E316F6E4C5;
	Wed, 27 Oct 2021 07:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F646E4C5;
 Wed, 27 Oct 2021 07:58:16 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id v17so1688784qtp.1;
 Wed, 27 Oct 2021 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NNrS9UYwkNatVEniQF4CD9D1YAlh4UirUZc4uxXB9PI=;
 b=EM4GwJ48uIdloOuG1lEUPsZXneT+efz3wH81OkAaRACZIz7/l/H4HP7M/aBBbWFbjE
 acVKfoG8kmuOQ0AzwpvSSCcNxCPrQ2EHzqq2ziWfYalhk75lZbk+864W0GuAbDZNGVCU
 UbZyR+7kAzU5YO1+yAi40pbakQ0Q8z88zHtYateH0VJGQ9uJXgxysMO4GKgcvsmWFosL
 GWo13IQhH111fojNgdI7aXUCahOeekd7h2GVxvEZBWPNv/zCngJkzULBsqnqAB3rnH7u
 la5GQ11vhIct53EEit0FdjGza6nMTqk7KvtfKzaLsTy2F+ekCbqJzPt308+ix8XSzeVM
 YNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NNrS9UYwkNatVEniQF4CD9D1YAlh4UirUZc4uxXB9PI=;
 b=VqKXoRDu+FdYI7rb3XtR77l82n6LpZrrovXqQ5p3SSrUkK9CJeu8u0UgvkCHfGZtK1
 IeYsopgNALklV/iDDZY5go0MgdrFOfkVCWEINz5TGuhbB8/BTy3kPtv/1LD1G1FDKjUA
 kIfx4uerqt6xsFSqPxlcQ7PId/9eXqENmFbyyVLczwmFtqNfU9FS8g5r9A2+e5u62wUc
 bmj08ZHV6AycAkgW/INhdwBAyav14cjY54VlYrRPQmTyhzeBcPFwaJ87BdO72eRYVGWN
 0tlSz56E+ofDhwa0TPgWx5hVzRBee5xYRXTvzVFoi45foTQ2xH1FrorOr9HKaXnsiBbK
 /sbQ==
X-Gm-Message-State: AOAM532Gg8GxcPQEHLr+dZHWf9rf8TaemQSacbayZYpIVOA1vdclXRNt
 qaA+djh1j/DjeRthb/HmWiYRBL3ZiI+xu6xTxwo=
X-Google-Smtp-Source: ABdhPJwcYSOaPSKjNSyijDo690gCUGfINPJ0l73mQcjZMPBciFhkgZHpMRSafwmmdUXoLEzndryqoH7LugNFdlb6LZI=
X-Received: by 2002:ac8:5f91:: with SMTP id j17mr30583897qta.138.1635321495537; 
 Wed, 27 Oct 2021 00:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211021125332.2455288-1-matthew.auld@intel.com>
In-Reply-To: <20211021125332.2455288-1-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 27 Oct 2021 08:57:48 +0100
Message-ID: <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/dmabuf: fix broken build
To: Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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

On Thu, 21 Oct 2021 at 13:54, Matthew Auld <matthew.auld@intel.com> wrote:
>
> wbinvd_on_all_cpus() is only defined on x86 it seems, plus we need to
> include asm/smp.h here.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Jani, would it make sense to cherry-pick this to -fixes? The offending
commit is in drm-next, and there have been a few reports around this.

Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm=
/i915/gem/i915_gem_dmabuf.c
> index 1adcd8e02d29..a45d0ec2c5b6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -12,6 +12,13 @@
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
>
> +#if defined(CONFIG_X86)
> +#include <asm/smp.h>
> +#else
> +#define wbinvd_on_all_cpus() \
> +       pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
> +#endif
> +
>  I915_SELFTEST_DECLARE(static bool force_different_devices;)
>
>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
> --
> 2.26.3
>
