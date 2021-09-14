Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB840B2CF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924A6E504;
	Tue, 14 Sep 2021 15:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E0C6E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:17:49 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id f2so24587825ljn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ASAhUY+G41HZqeopdHM7aTSiw9njl3EyKHtj3rFVhDs=;
 b=ak1UeKaRxOfiClhnXWFlc5Tj5KPMuwNRFkYKCr7CwkblbA9Paw3cSpCmNNjhx8WlAR
 mQVYneNQpWpRsZWGMZ81ZIH34dZdZtDMUoN3cV1bET1XUla44MYMFwHm0OhiEQ8yDSmx
 qIaoPgDcted70DTDgGFCvmz8jNdMD5pdByWJCotfqt94eCEE9xwH05GjiwEKYbRedWR4
 30qkyVGox3STWReT2o7u8OHwQAuOXe+zFCSrKHiFssbja0kfMIeSsjW2Sr2fq8/kTIQF
 +/vCVb4lldH/n0uweX+WPK3fJki6M57mqQNhADYjgGtODprzhcTxJXAhbuz6QZRBBdd7
 OpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ASAhUY+G41HZqeopdHM7aTSiw9njl3EyKHtj3rFVhDs=;
 b=2bntTinBc4mIyHbQ962oBrbivMC48SmJP6ebgjNm0OWCuDSmTSanD+QISaWrx/hBg5
 Q0FzTCAFIoREOXQ43wdIlA6kiReuOkDde6+1wi9QdcCgAw4JQzEmCy0vnwQUKjlqePcv
 CgZDG/vEafSG/vw/zVHMfud8dVgtRSPj1LWtCrVmOOaPTypsDWxKNh9weLFDe/w+mguC
 ubitIplXeN3CsK4anYtHS9EVyiNKWE7puINJQS3XfM4rnE8kOPFTr/FE2hXlS6PTXhvE
 M1Py7I6d1nncjG+zQNbGpOfTk1Kor+3qcewTGeXc6VhBaUewRI5Io3ESMTNrMgSTRg2e
 6g6Q==
X-Gm-Message-State: AOAM532IN30cP2EtSjJyTruHw/g7sL7LAHTw+xUihm/Uwd8JABxguPRx
 djXRrNMfYmtmZDPM1L7FVG+Ebdy2/Dc1Uafg5dgvCA==
X-Google-Smtp-Source: ABdhPJxrwrgQsvLdH3TFcygl7m8RHug7EOm+c31xSSPd1GollBX37JTf9f8IkkS/AT1bBnL51Z4Z9YyVU7EsQK1Cxs0=
X-Received: by 2002:a2e:99da:: with SMTP id l26mr15293313ljj.339.1631632667834; 
 Tue, 14 Sep 2021 08:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210824225427.2065517-1-nathan@kernel.org>
 <20210824225427.2065517-4-nathan@kernel.org>
In-Reply-To: <20210824225427.2065517-4-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 08:17:36 -0700
Message-ID: <CAKwvOdmASG7XM5Lkv5aVttwQZkaLjm2jo+-BxBkG97h3hZ_Pew@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/i915: Enable -Wsometimes-uninitialized
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Ekstrand <jason@jlekstrand.net>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, 
 llvm@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 24, 2021 at 3:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This warning helps catch uninitialized variables. It should have been
> enabled at the same time as commit b2423184ac33 ("drm/i915: Enable
> -Wuninitialized") but I did not realize they were disabled separately.
> Enable it now that i915 is clean so that it stays that way.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the series!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/i915/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 642a5b5a1b81..335ba9f43d8f 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -19,7 +19,6 @@ subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
>  subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
>  # clang warnings
>  subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
> -subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
>  subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>  subdir-ccflags-y += $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
