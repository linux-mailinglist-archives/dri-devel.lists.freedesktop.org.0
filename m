Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1B28AD21
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 06:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7D36E413;
	Mon, 12 Oct 2020 04:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF5C6E413
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 04:39:09 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i22so396495qkn.9
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Oct 2020 21:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tpWfSYwTmxBzkXDi9ht7uL8LFxGO5JzEbAJnVgaiE+c=;
 b=nU7uQ0hR6wJjdWA+ED+sikls3Urhi/cl8eNleJbNfjGbqwKo7zCEkywRHTc7K3jBkz
 Hyf3gr+6FCDB2hatcKdnG8zwLPgj2qv/GT72VXlOzM35Lbr2YkQQYN3K0NBCOyAkn2CU
 vAGPm7dFAe5q1Nykt7UDg+llyzoNG3DVtOVFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tpWfSYwTmxBzkXDi9ht7uL8LFxGO5JzEbAJnVgaiE+c=;
 b=bPEedTK7fcwdw3M8T4OM7POJF0yRTtUk5c2Vmd9h7Ps8Pbh+1vSjrW6jslmU2gzCJv
 xHux93BrOe6FNmmwQNQavCaAVyRs3gaj+uQX5Fxex0aE1uclRL0c9/S7CUIbeD8Uu1GI
 vRqPnsT71qxqnDlVflH1DWS0dxzr+oMPL/rCtkCdozM1kPOCg1NXYRcOCMNQHQTdWUxU
 zcpf/KYpQPp9NOw5ezgIhNrjSAf1EsOlV/69+Iz14WHI8AORqjaN4a4wTf/wF1/0wBRD
 HULuIAoinJrvqjqlFrmOp/2K/BpDjnrSDgX8nEeihOwnDlQLVRj619KVuABkPhHD8j4Y
 a2qw==
X-Gm-Message-State: AOAM530zEMMaXmeZdY3JUY9Xt94ZE5CFvxude68Km5N62Ul2SgyUeK0l
 zvgtwtO61F4dnHaqftduIAASc6OhUyzgNbAhuic=
X-Google-Smtp-Source: ABdhPJxMnMaMZnf67NjzBaX5vchMC+7Xo+nOk0fNRJ58YDhTE2vwQffIxSTvvFe2bSZywyWdiFwrGtVmwtV88lyxzsE=
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr8376653qka.55.1602477548637; 
 Sun, 11 Oct 2020 21:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201011230131.4922-1-rdunlap@infradead.org>
In-Reply-To: <20201011230131.4922-1-rdunlap@infradead.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Oct 2020 04:38:56 +0000
Message-ID: <CACPK8Xej8SoJxrJBL2NB2PnGwjFQ8=oWsfALv2g2r7HxxP9xZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/aspeed: fix Kconfig warning & subsequent build
 errors
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Michal Simek <monstr@monstr.eu>, kernel test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 11 Oct 2020 at 23:01, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> kernel test robot reported build errors (undefined references)
> that didn't make much sense. After reproducing them, there is also
> a Kconfig warning that is the root cause of the build errors, so
> fix that Kconfig problem.
>
> Fixes this Kconfig warning:
> WARNING: unmet direct dependencies detected for CMA
>   Depends on [n]: MMU [=n]
>   Selected by [m]:
>   - DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=m] && OF [=y] && (COMPILE_TEST [=y] || ARCH_ASPEED) && HAVE_DMA_CONTIGUOUS [=y]
>
> and these dependent build errors:
> (.text+0x10c8c): undefined reference to `start_isolate_page_range'
> microblaze-linux-ld: (.text+0x10f14): undefined reference to `test_pages_isolated'
> microblaze-linux-ld: (.text+0x10fd0): undefined reference to `undo_isolate_page_range'
>
> Fixes: 76356a966e33 ("drm: aspeed: Clean up Kconfig options")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: linux-mm@kvack.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> ---
> First sent on 2020-09-07.
> Feel free to fix the Kconfig warning some other way...

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Randy. Sorry for missing it the first time around. I'll merge
this into drm-misc-next.

Cheers,

Joel



>
>  drivers/gpu/drm/aspeed/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20201009.orig/drivers/gpu/drm/aspeed/Kconfig
> +++ linux-next-20201009/drivers/gpu/drm/aspeed/Kconfig
> @@ -3,6 +3,7 @@ config DRM_ASPEED_GFX
>         tristate "ASPEED BMC Display Controller"
>         depends on DRM && OF
>         depends on (COMPILE_TEST || ARCH_ASPEED)
> +       depends on MMU
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
>         select DMA_CMA if HAVE_DMA_CONTIGUOUS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
