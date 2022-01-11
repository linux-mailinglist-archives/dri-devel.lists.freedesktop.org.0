Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238848AA6D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FD014A0D2;
	Tue, 11 Jan 2022 09:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33814A0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:24:27 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id g17so1851082ybq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cv3VWXBT1vzgw9fDSWsZVII7SUUK8DtKIhodYFlsIgk=;
 b=DVGodsGp+VSGl7PLbXH13orlTCsJpSeMcZG5duC7hgmBKdGMjygDHD2lgi2pgB0CEf
 C7fJUfCweIb1aY/Mb7vLCY9wjKClUB0MJ0Ijjfz4TPnUDX2eDCt4aeFTCTJGFYGKi8q/
 ISIDry3hXhQfA/SZnnW719Jloste+ehWznIrd5TISbbtj9uVVFwy2RJHNZgbOUbVX2hH
 y8vOMmbHaggPUUBcU+k7XULIxA5JuP7MzCUSJ3F3kvj549pNh0PAbkEwgjlisdYr/UTT
 +/2eybRR0P5mF1mA4pzNvBA3gj4gmmpUxdM7+BXG6FyF2nC9MiWyc+dbsSXZypM6PCxS
 6jQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cv3VWXBT1vzgw9fDSWsZVII7SUUK8DtKIhodYFlsIgk=;
 b=bzikGLpsYLsEaORHUgg7s4eArpfpG2lmDNLlMJvuH/3k9cjqTMAf9gI0MmqKJYcHJG
 itQ1hfvLMkH9wXWbNmRjESdSEx/HTAPGAgyfgEw4fjgjCGjoUQGlOp4xk2HZfaXHsaBK
 Ryj1tVCB8RKdDk1m0zOuJ2RZ2fNXHSNSXAt4tCFGc6Ci0Y/U+C2cJ8m2deq0sQrCiVgA
 +vHkxUre268LFe3Yz72Gpow15z49CyJ9AkXWcosZJZ0mXCRGj+QOb6nUaEs56T+xYaww
 sS9s6Gimu8iKBDC8YHsxCWPxcoZ/pRGgqK8dN0aR1NgZvVK9PCSG9/p/vK2kdF3Y8IJV
 K5nw==
X-Gm-Message-State: AOAM530NSe/BTsBoToR0hAEemiJRV2WIF0VeOfP0iHilmavaO9Pk+uia
 d9sIaMCs2LOBp7LRz+ZSdsKT2bu6BxU6VHt36OA=
X-Google-Smtp-Source: ABdhPJyJDd8TkgoLs5BNf/NvRNq5BIDjYbteoC9S6P4Tzqyj4XtaIIoEpJ8yq8xa7iX3muDvh7OWB7MhJjZG8rvt+h0=
X-Received: by 2002:a25:2cd0:: with SMTP id s199mr4858451ybs.234.1641893066617; 
 Tue, 11 Jan 2022 01:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-2-kevin3.tang@gmail.com>
In-Reply-To: <20211224141213.27612-2-kevin3.tang@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 11 Jan 2022 10:24:21 +0100
Message-ID: <CAKXUXMyXYcdWOTMMdUxXMYvBKiRor4LMtK-JgACo+iA8ogvqmw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/sprd: remove the selected DRM_KMS_CMA_HELPER
 in kconfig
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, pony1.wu@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 zou_wei@huawei.com, sean@poorly.run, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 24, 2021 at 3:12 PM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> On linux-next, commit 43531edd53f0 ("drm/sprd: add Unisoc's drm kms master") adds the config DRM_SPRD,
> which selects DRM_KMS_CMA_HELPER.
>

That this commit is _currently_ on linux-next is just a matter of the
current state. The commit message that goes into the project's history
should probably not state "on linux-next";
this information is probably outdated or of no interest to any further
future reader at the time of reading.

So, just drop "On linux-next". The commit 43531edd53f0 ("drm/sprd: add
Unisoc's drm kms master") will exist until the end of time.

> However, commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option") just removed the
> DRM_KMS_CMA_HELPER. So, the select DRM_KMS_CMA_HELPER refers to a non-existing kconfig symbol.
>

I would be happy about acknowledging my work of reporting with a
Reported-by tag, although I accidently send the report only to you
without cc-ing the mailing lists.

Please add:
Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

That said you may also add a Reviewed-by tag now:
Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Lukas

> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  drivers/gpu/drm/sprd/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
> index 3edeaeca0..9a9c7ebfc 100644
> --- a/drivers/gpu/drm/sprd/Kconfig
> +++ b/drivers/gpu/drm/sprd/Kconfig
> @@ -3,7 +3,6 @@ config DRM_SPRD
>         depends on ARCH_SPRD || COMPILE_TEST
>         depends on DRM && OF
>         select DRM_GEM_CMA_HELPER
> -       select DRM_KMS_CMA_HELPER
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select VIDEOMODE_HELPERS
> --
> 2.29.0
>
