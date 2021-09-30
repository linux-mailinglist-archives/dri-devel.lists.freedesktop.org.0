Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2B41E033
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA416EC37;
	Thu, 30 Sep 2021 17:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE46EC37
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 17:30:02 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x27so28017973lfa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ye/qqO0p8PKVzbuUoEwamPcpYGy0s9HnvVApER+R6kA=;
 b=ftI3Z0SVqMbhoWdnhg5bUeF+owpQShwFKiFCCXBcdn4RZHbJbc2J0o5nj5aw/QCKc0
 Vdv2kgukq9RGNxjvjCA3DkRkCBBBad79JhJxxgNrkccjH4TiJmRBW0i0ltEOb3yFMdev
 fFeMeE/vjhHmOt6rD9YvGkHtfgRxvfpXrATQ9+w5QnzKHBDo8urSjo0OMyTAAQJAH+zc
 EwvsOhDC+BRkFf8OyUTq4uGhLOTBNWDzgLni0BSbv5tf0eiZ2g1db+Bz2V5XwFVunwsL
 zbC/56A/1fmE7NB8Ti2l0dQyedYulC894HG+7anlAY/mFjb5fTXbiZUoIMQ/I8y6CLKy
 8uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ye/qqO0p8PKVzbuUoEwamPcpYGy0s9HnvVApER+R6kA=;
 b=mv0M2MulBUo4W3NqSor/uDkpQoaZJ7jjQonX95fSF1Qg8b/QvTUWTdZwIR8gZnsEXy
 93G+880NQGTY9XjgNQgUoruKZ1jrNuBWDWVw1aw8KF3RysaN5QTvPmDgwTXvbtqdaRIt
 Jr+gWorbRyzqT6bzKDbFTvNH3Y73zSJt/2RxCraK3R24joXbCnMJlZe8AA3weaNR91+5
 4RfsPsybEigDGjjLp22weC4Ueph91LC/4iOIDKoiWf8I2Y3ymC76F68kqPZsLsJ3qKUV
 jPmyqx5ix8z1UvvQfYc4xNT4OXfjBBamsGtkPk1M4S2RyoiIWa1cli5oGSlbvBRkIfFg
 zcWA==
X-Gm-Message-State: AOAM531mE6JBjvgRyeUeI31Eov31jAvWx/bm1Zi8LOSVrCFqiarlfVCf
 V5Y2syN/FNZNUS+lL3NMSFWdoMVhjNyWG4GCEpUnZg==
X-Google-Smtp-Source: ABdhPJyhCryWkdo+UwgKGKjWkIyiSDBhEOEx2SxpkNiPWf9uVV7dyEnhQqYnZexjKufQh9L+L+s2Toet+ZTQxKlAHrM=
X-Received: by 2002:a05:651c:b20:: with SMTP id
 b32mr7192491ljr.62.1633023000715; 
 Thu, 30 Sep 2021 10:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210930160142.2301257-1-nathan@kernel.org>
In-Reply-To: <20210930160142.2301257-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Sep 2021 10:29:49 -0700
Message-ID: <CAKwvOdkrD4WuZzUnBc2LeCjLVAumBCKXJdyr=k=dPDX1BsMhOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Guard IS_OLD_GCC assignment with CONFIG_CC_IS_GCC
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
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

On Thu, Sep 30, 2021 at 9:02 AM Nathan Chancellor <nathan@kernel.org> wrote:
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

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

$ grep -rn "ifdef IS_OLD_GCC" drivers/gpu/drm/amd/display/dc/ | wc -l
11

It's probably time to put this pattern in a Makefile under scripts/
and include it in all of these Makefiles.  Anything to minimize the
amount of code that has to be carried forward to new subdirs.

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


-- 
Thanks,
~Nick Desaulniers
