Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC365EEA6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A023A10E73E;
	Thu,  5 Jan 2023 14:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E305910E111;
 Thu,  5 Jan 2023 14:21:29 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id i127so32091246oif.8;
 Thu, 05 Jan 2023 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VCmu3jJ7Nlxelagke1iSb8wxFg1JY+FjQQE47k7d8dM=;
 b=hKUgWT7YXESJh/RZM84Wvm5DUabxzj4moIqEVvGV85ai322jDXTsRN4ZFtRvOFcfDO
 UHHY/tMCAVFAt2hPtFpx3hZScq71/j10BeH0RyW79KBpTnJspIk5NGrX62r092+Kq/5A
 dVJPGdR0SanhJwco5SNaQofIgzpj16JS1jBURzOOv2qdCer+HhwmkestxSRfRe367QTv
 0sNPeSbIOV8qeeYdtXHnjGHgRuCdG0zQuwZTrqj0b3OQZBABoFF7820rl9m+f0qDjRNl
 Gv9ezaevDQtrufO3bwoqn52AR4d6uzpIR4jNuWEGa8ri4EvsbcA0vPvz6sPtsaVEnvd6
 7ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VCmu3jJ7Nlxelagke1iSb8wxFg1JY+FjQQE47k7d8dM=;
 b=Z6YdtIJ6qm0OVGSOll4L4QPE8bg8SqvLuHV5IO70DORsy9AFUby1+7CSEzKKzmkAyl
 ulFdPRjDnoH8sdzm2/r+eEl21gNvxuF/4Q4z0uqwurBfznSdODw16rcZBGshXoUatWRV
 McTU+QGS87+0ndZuMDVX17XUFxGMD+fM3LR2myBCukrSaKLrtj9dWc1/osd+xYq6NHWd
 ODH9ak70UbXA8gXQazYnoqWGE6l88Ifk5vArLIQj8hrrKzqHZ3d9u8fpyFFgOzWrtRpt
 7z8vvADoWynzrfPcL2ahK+FP9tvyX0RwBTsKOmXnCsZYi4x1VJYIMUjbWDmKPNKi/4w4
 jZQQ==
X-Gm-Message-State: AFqh2kqKSm2guoidZb+prZVu5hjx185Jtr/lLtEdtpJmUPJ1S1bpCb0u
 pi8jMqHmqv3twKeLBCwMjRtFXJlb6oLFyJydlQ8=
X-Google-Smtp-Source: AMrXdXss6pLzkv+6RMrSqTNpQ6Z+DzO3VSYyYkr56kXLuRqy482ixVPQh/8ymY3KcL5PQWbJRxdlPG42uLrpQJQn6zs=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr3417836oib.46.1672928489064; Thu, 05
 Jan 2023 06:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Jan 2023 09:21:17 -0500
Message-ID: <CADnq5_O6W2j7QKm-JHsf8FOeuRFu0V4w=Ac8AV8r0KFZTegPdw@mail.gmail.com>
Subject: Re: [PATCH 12/14] drm/amd/display: Do not add '-mhard-float' to
 dml_ccflags for clang
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
 linux-kbuild@vger.kernel.org, sunpeng.li@amd.com, trix@redhat.com,
 masahiroy@kernel.org, Xinhui.Pan@amd.com, ndesaulniers@google.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 nicolas@fjasle.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 2:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-mhard-float' [-Werror,-Wunused-command-line-argument]
>
> Similar to commit 84edc2eff827 ("selftest/fpu: avoid clang warning"),
> just add this flag to GCC builds. Commit 0f0727d971f6 ("drm/amd/display:
> readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP
> routines") added '-msse2' to prevent clang from emitting software
> floating point routines.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: harry.wentland@amd.com
> Cc: sunpeng.li@amd.com
> Cc: Rodrigo.Siqueira@amd.com
> Cc: alexander.deucher@amd.com
> Cc: christian.koenig@amd.com
> Cc: Xinhui.Pan@amd.com
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via whatever tree makes sense.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 0ecea87cf48f..9d0f79dff2e3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -26,7 +26,8 @@
>  # subcomponents.
>
>  ifdef CONFIG_X86
> -dml_ccflags := -mhard-float -msse
> +dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
> +dml_ccflags := $(dml_ccflags-y) -msse
>  endif
>
>  ifdef CONFIG_PPC64
>
> --
> 2.39.0
