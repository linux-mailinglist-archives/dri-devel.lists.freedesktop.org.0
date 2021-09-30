Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE7E41E080
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 20:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE136EC43;
	Thu, 30 Sep 2021 18:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676C6EC43;
 Thu, 30 Sep 2021 18:01:08 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id s24so8347314oij.8;
 Thu, 30 Sep 2021 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZQ9+ptpmGZPeIgxp8JUYclciB8//BIrr9G2Q/xQRpI=;
 b=L5lkL0l6KtT5agnJdUQekOZPgWMZ0FQsY02b7YU0lwUgKl6cw6/Ib735DMgIFQrF+d
 P03cs2riMQ5Wr7yZHIIGQ4bPt2aSo38AE3EQiSb6k2/DJ6XJR5U5YDsSwM5lzUWTlpuM
 sT+wfKmv2UZu/6i0vfXH/JtiLZx+ZaonnIPjYD2rUKf7Gzq614FM9WFRVd/4KYQWZVaO
 OywtzTV969OrJBkpZWn/6FA4BOZczstYSv+KllGGnqPkK/bOOeB2pHqTbilUcBYPjezA
 neGf1eHNG03ig12fbBFc+YqIyBVfb9UvUUwu/bSb7efwyRIHMxw1kTn9itC/oCrgHDOH
 DLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZQ9+ptpmGZPeIgxp8JUYclciB8//BIrr9G2Q/xQRpI=;
 b=79Y3mn6F+dXetWGJD7KSh96G+171TiJaIDaSXCrM8+OZm+Yknnihav3wey9cJD1uWx
 gDBckOfkI0jBQ9Z7VQ2O7yvyYeAhKR79lDaHPTijWvVNQwhwbkUGXO2jd8dk7RF3Q8p6
 OMbXhuJJqxWsiuJsgqnzs2Zumx4VZEMfRmcMkfoELDHZYrmf5zlfOsD1zyb/lzwhJRcP
 Fz/WRiukd2huzM7IbrosKHUbXrezcZTTSHNrZQqSMM+1TOryyxTrmTUmfBpu5a5vwAws
 g6e/LwlIFIVQMqGvosaBEWhB8+BdClhFkwe1Adh9a0zUkXHOuAYA8Ps4kH1NmUCluF6r
 Pinw==
X-Gm-Message-State: AOAM5328CFbhYANf2qU4Bmvf3/mwg3qDNpUfKiLSvLcCQhkX7k95n3od
 2jDYvrR2CJ88kzbsiANQPqiHgCeQm6RpiuwPQd5KqT6h
X-Google-Smtp-Source: ABdhPJxzr0g8+mn8CixoZiIj4shBlN5EDztIQ6LzFMC+yNKVdi+qZtKnohF4pLFo6+pUFAfRnlf2DGEHzUu9maVUU5U=
X-Received: by 2002:a05:6808:1141:: with SMTP id
 u1mr444880oiu.123.1633024867391; 
 Thu, 30 Sep 2021 11:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210930160142.2301257-1-nathan@kernel.org>
In-Reply-To: <20210930160142.2301257-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 14:00:56 -0400
Message-ID: <CADnq5_P5eKwjeR4nKTsOFc-QRUYkSuiko91PO4L4Djtr=VU=ZA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Guard IS_OLD_GCC assignment with CONFIG_CC_IS_GCC
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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

On Thu, Sep 30, 2021 at 12:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> cc-ifversion only works for GCC, as clang pretends to be GCC 4.2.1 for
> glibc compatibility, which means IS_OLD_GCC will get set and unsupported
> flags will be passed to clang when building certain code within the DCN
> files:
>
> clang-14: error: unknown argument: '-mpreferred-stack-boundary=4'
> make[5]: *** [scripts/Makefile.build:277: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.o] Error 1
>
> Guard the call to cc-ifversion with CONFIG_CC_IS_GCC so that everything
> continues to work properly. See commit 00db297106e8 ("drm/amdgpu: fix stack
> alignment ABI mismatch for GCC 7.1+") for more context.
>
> Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1468
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Harry beat you to the punch by a little bit.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
> index d98d69705117..96cbd4ccd344 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
> @@ -14,9 +14,11 @@ ifdef CONFIG_PPC64
>  CFLAGS_$(AMDDALPATH)/dc/dcn201/dcn201_resource.o := -mhard-float -maltivec
>  endif
>
> +ifdef CONFIG_CC_IS_GCC
>  ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  IS_OLD_GCC = 1
>  endif
> +endif
>
>  ifdef CONFIG_X86
>  ifdef IS_OLD_GCC
>
> base-commit: b47b99e30cca8906753c83205e8c6179045dd725
> --
> 2.33.0.591.gddb1055343
>
