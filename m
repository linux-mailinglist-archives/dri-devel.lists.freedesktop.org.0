Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CAA26437
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 21:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D701710E562;
	Mon,  3 Feb 2025 20:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZ2sUCVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5066F10E55D;
 Mon,  3 Feb 2025 20:06:57 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2f2f5e91393so991005a91.0; 
 Mon, 03 Feb 2025 12:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738613217; x=1739218017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KlE2Pf5IIVTTj2bUHtbNPbqvQ4Q71CGMLbh1XWWKvI=;
 b=nZ2sUCVWLZpiXZTLBOrd0v1tKmvkqOC4R0S4kL2pGzXzJFyxVuWLhm1l+EYNv0kxCf
 rYs9lXRhqsieBcv8h3JNT4/3CDSZvaDsC7VQdXirV295yYURrJ0nWuYfTrJ/6JrO+9VF
 AfKP/iHPWViB6j4FbS48NiL24/5Gtk8Upom149eG+3zo54jICK7KF0FyZabEiTyXFzhd
 GFKJI59KHMNJoCCsB+pjfWJgLnxFHJnv+BXETtBxKpHuqsHiZwiSlYpYv1MFimoBcav8
 rHTqXz/THwPYKrp6QlnCtS/W0vJQW7mbwPWFPE0XmaNr8w/Lci8EGCIGPZca2vxWOjEj
 oVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738613217; x=1739218017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KlE2Pf5IIVTTj2bUHtbNPbqvQ4Q71CGMLbh1XWWKvI=;
 b=U+2Gm5AT8uuKjALxJ3VmTe6B7uXN4BENJigLuSqnhn8zojkenZdaBjrmSjWo6Vt0v6
 z1z0nMe0zAY/wPTNWyQZgSlc2pv+CC0SzT+og2e9OH0yxEI0tLi3+dj3DK3+FEwmCxEh
 2SilTw94/ECLO2/qZ9iElDBxzjFxf1Rpd7qrRPZueCgwCLxcN6CAHR5R7nS3YbiM5E/5
 sAclENnNdH62eba5CAwjEPlhQ7vALA/ss/dxnKeI/fv7Br2ZUyzjpnUA1qsdSjV78H52
 wcBVqgGbIRhYOYasd0k2IlARZ3rlaclOkvwcTXIuhdM9FFgDcZZRCD9jnKSZDpA0cLZl
 2Kkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKAowXnwVEUrQCezYFUR0QtuffOimlA93JuOpUBDp25AGDUDjC6JlnW0CbuoAsNfeOaXygGt5E@lists.freedesktop.org,
 AJvYcCVxqxFaENsayBYIk0HkI/HKAyhtwQiKKLDHmqjGBcB3yU9UuYNVWVIAv9sxpyz3R9ZeeuTmdGoYR7zW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8erYYhPcK0WdpVRIUJmpax4ILBjG8Z9I6wjW/prC5mQPJ3etj
 6uEOVBCrWpTQE++I/6twoH+H/VVRA61j6t39FFYi/NSvenxtiKiObCPwkz6+bKot9D8v0WJ6wtk
 5Vqi4PmvZ411o8h2IIRXnrkE+B0sejz+2re0=
X-Gm-Gg: ASbGncukFr39KnG2OSxnKwCqI3s9kJE7pF8BwOWWgDXckQUFMetX1LhL/rWol80TY4A
 DtaCsZbkVWrbAlMWQ2chfqYyPHVKMqO2Nf9FhJmEojFBxSENO2HfaGJvwNNgGg58Hl0TMcHY4
X-Google-Smtp-Source: AGHT+IGA2GSTAywDothE4aaZEQCG9KA2LcsMMkt66UMVbFpOJqEwBYBrQrWcw8DiefRUGMpJEudlEvmgH0uRPQ2DcTM=
X-Received: by 2002:a17:90b:5387:b0:2ee:f64b:9aab with SMTP id
 98e67ed59e1d1-2f9b8c8ad8cmr542706a91.6.1738613216698; Mon, 03 Feb 2025
 12:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20250131-amdgpu-respect-config_frame_warn-v1-1-68255384492b@kernel.org>
In-Reply-To: <20250131-amdgpu-respect-config_frame_warn-v1-1-68255384492b@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2025 15:06:45 -0500
X-Gm-Features: AWEUYZk0GtNqRLHvGXHBa-bqtGt-kcqPR_WVOrpAlU7nAcGYHuK4kkpV-uBxenE
Message-ID: <CADnq5_PGjwPKL5UXf9Ucf79PxWXO0s9W=eOwBnMQbQrdYT-Urg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Respect user's CONFIG_FRAME_WARN more
 for dml files
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Applied.  Thanks!

Alex

On Fri, Jan 31, 2025 at 5:38=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Currently, there are several files in drm/amd/display that aim to have a
> higher -Wframe-larger-than value to avoid instances of that warning with
> a lower value from the user's configuration. However, with the way that
> it is currently implemented, it does not respect the user's request via
> CONFIG_FRAME_WARN for a higher stack frame limit, which can cause pain
> when new instances of the warning appear and break the build due to
> CONFIG_WERROR.
>
> Adjust the logic to switch from a hard coded -Wframe-larger-than value
> to only using the value as a minimum clamp and deferring to the
> requested value from CONFIG_FRAME_WARN if it is higher.
>
> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Closes: https://lore.kernel.org/2025013003-audience-opposing-7f95@gregkh/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile  | 14 +++++++++-----
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile | 22 +++++++++++++---------
>  2 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index 46f9c05de16e8c9035f9e26c0b5c481c274d52ef..e1d500633dfad75e4f2265552=
be42a3e19dee6bf 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -29,11 +29,15 @@ dml_ccflags :=3D $(CC_FLAGS_FPU)
>  dml_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -frame_warn_flag :=3D -Wframe-larger-than=3D3072
> -else
> -frame_warn_flag :=3D -Wframe-larger-than=3D2048
> -endif
> +    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +        frame_warn_limit :=3D 3072
> +    else
> +        frame_warn_limit :=3D 2048
> +    endif
> +
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag :=3D -Wframe-larger-than=3D$(frame_warn_limit)
> +    endif
>  endif
>
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $(dml_ccflags)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/d=
rm/amd/display/dc/dml2/Makefile
> index 91c4f3b4bd5f46ac5c1c74f665b06dbe61081917..21fd466dba26ef3359196d0b2=
6bc29125bb1507a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -28,15 +28,19 @@ dml2_ccflags :=3D $(CC_FLAGS_FPU)
>  dml2_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> -frame_warn_flag :=3D -Wframe-larger-than=3D4096
> -else
> -frame_warn_flag :=3D -Wframe-larger-than=3D3072
> -endif
> -else
> -frame_warn_flag :=3D -Wframe-larger-than=3D2048
> -endif
> +    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> +            frame_warn_limit :=3D 4096
> +        else
> +            frame_warn_limit :=3D 3072
> +        endif
> +    else
> +        frame_warn_limit :=3D 2048
> +    endif
> +
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag :=3D -Wframe-larger-than=3D$(frame_warn_limit)
> +    endif
>  endif
>
>  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/dml2
>
> ---
> base-commit: 7f2b5237e313e39008a85b33ca94ab503a8fdff9
> change-id: 20250131-amdgpu-respect-config_frame_warn-739a9b24496e
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
