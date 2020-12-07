Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556AB2D1AF2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 21:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838F6E8B4;
	Mon,  7 Dec 2020 20:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE196E8B4;
 Mon,  7 Dec 2020 20:47:49 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id l20so3533264oot.3;
 Mon, 07 Dec 2020 12:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8MHc0bkaqtEgfXzX9IcijUfPytzNuGviQ8Ld2feZE0=;
 b=M4EeiBVT5qO3N+RSm+RjkQqRnTwYMaqynM9CGNdvQCKEdeZBKAA0nri72d/1pAWseG
 xBBzs9W9YLZcz/eOx5KFEarqLQeUNt6UOQSr6Krq4rX3ccqCx1OAZr9D6jU8yKGwwPIH
 AIGd90FA92blZskIIJmQ99g5DxTCsM9iDGrOLyQ2RuQMUBUuTDJXv+FtaMFlN/Fd13YB
 rMJGRfv8zNK7ZoDyazGs4B19igxQZ+7Xddz0vzajTYAo8N/SmD4f6g8tPHBgn/DB0T5H
 EW6fBulqYoGPfvcthAaQjlGP0QE9Z1X2GtMQSCQbBMZgtP3EpeI2QQurCr0FEYy7L3I5
 pt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8MHc0bkaqtEgfXzX9IcijUfPytzNuGviQ8Ld2feZE0=;
 b=jUvxgE+OUS9nlAFx8IQe8eHVzDpK2ZkmwKW/T1NvE8uXx6TiFGO2ZS/ZefGy33IF1A
 nH9330HLNU/qlaLEn5KBd6FCWi81+HDomBRQsBTBadNWmbbQj/LS0UpHmyReD9l1FlVa
 pZD1ztqGO9lF+vZ36XMbb2/kx3LQKPYlc/yZZYIxWN7scQkvbrM2PvWeH9IiKEb5hBBO
 BK7WEsonal4zcH4VA6hxW71yGX2HYKY3HesUNaWoyO2OZFLflvZkmSR2LYFDQLfJ8TPU
 rqL5D0AGpR4Z9HoJ0uIJdBkEwWacbrR8kwv/kTDpciYxWfjr/1kpHi9zo8mZAZ0+uMiu
 0ong==
X-Gm-Message-State: AOAM530DlA50EqTY+xPbEtM1T8RgDAvUNAdhKS0J2yK9edMLHHf68qio
 6Kd0Nrn5mCWi+xG7hAywMdKrCeAgfsavorTFnpE=
X-Google-Smtp-Source: ABdhPJx2TaqdmeapmZM3GH6do6PsmIwz1wLX47b8zT/hxz2SuY+/nw9k/kcoAafnECFzdOYp6II6138ifAwMMcD6rnc=
X-Received: by 2002:a4a:330b:: with SMTP id q11mr7063370ooq.90.1607374068633; 
 Mon, 07 Dec 2020 12:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20201204081349.1182302-1-arnd@kernel.org>
In-Reply-To: <20201204081349.1182302-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Dec 2020 15:47:37 -0500
Message-ID: <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>, Alex Deucher <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 4, 2020 at 3:13 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> As the DRM_AMD_DC_DCN3_0 code was x86-only and fails to build on
> arm64, merging it into DRM_AMD_DC means that the top-level symbol
> is now x86-only as well.
>
> Compilation fails on arm64 with clang-12 with
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3641:6: error: stack frame size of 2416 bytes in function 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than=]
> void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>
> I tried to see if the stack usage can be reduced, but this is code
> that is described as "This file is gcc-parsable HW gospel, coming
> straight from HW engineers." and is written in a way that is inherently
> nonportable and not meant to be understood by humans.
>
> There are probably no non-x86 users of this code, so simplify
> the dependency list accordingly.

+ Daniel, Timothy

Others contributed code to enable this on PPC64 and ARM64.
Unfortunately, we don't have these platforms to test with within AMD.
Does PPC64 have the same stack limitations as ARM64?  Harry, Leo, can
you take a look at fixing the stack usage?

Thanks,

Alex

>
> Fixes: 20f2ffe50472 ("drm/amdgpu: fold CONFIG_DRM_AMD_DC_DCN3* into CONFIG_DRM_AMD_DC_DCN (v3)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 797b5d4b43e5..54aa50d4deba 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>         bool "AMD DC - Enable new display engine"
>         default y
>         select SND_HDA_COMPONENT if SND_HDA_CORE
> -       select DRM_AMD_DC_DCN if (X86 || PPC64 || (ARM64 && KERNEL_MODE_NEON)) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> +       select DRM_AMD_DC_DCN if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>         help
>           Choose this option if you want to use the new display engine
>           support for AMDGPU. This adds required support for Vega and
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
