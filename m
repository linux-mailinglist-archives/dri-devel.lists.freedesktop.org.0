Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259FA02F1E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 18:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EA410E9A6;
	Mon,  6 Jan 2025 17:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aq89hEEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB7110E212;
 Mon,  6 Jan 2025 17:36:39 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5f33d67e584so1099134eaf.1; 
 Mon, 06 Jan 2025 09:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736184938; x=1736789738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBoNhSu6q49cqdqVQhKrU93NZBtBZPk5jCQdSRfDNk8=;
 b=Aq89hEEyiOKij1qNzT9f11WB1s4CCTg+Y7xPiSCxrW65PkOFTzZ2+Ex+mWufreU16P
 LOMb2eV0vzlZkiX+9uK3kzK8VGNvH9EzKRtai2Lj6dMnbDPY2ZlAjGm4ygV6FHu/7haD
 s7aEw/HBGu9jK/GA2scWinxD4wrXGxZ8ffZM9XSGHNb3TTWJIJdzusx7OoGu9FxeXld1
 fTgm973a6K1IaFbNLkma1+N8SATZ+vkHbCjnmlWLk1frYd8lVeIccP5USqduSVZxRfuo
 wOj+C2XGn7OzQIlIahVO+5bW/tn8/0QH2FQQTdHZh8MeTfjxlQOkHBIwpDa5DTdm+Vcn
 O7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736184938; x=1736789738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBoNhSu6q49cqdqVQhKrU93NZBtBZPk5jCQdSRfDNk8=;
 b=WqeW9Z9926NUxs3fa0EJfRQCrrnvGFXjd12TmOVJtcSCmPjbGw4IqiHed/kxZ3D4VR
 0zA4NZAHH5KsZ3AKcvpSTKEL0nq1k80XvwSvPiJFkUzy5O1QC+g9GNv0k8qjQpXcd/Rx
 eJ90rXfKXhWlYOb/pronB65eAj1SZPS60XzOZJ9fPoql18rerMWkERuwDUaEcH+9oVqI
 MCE6scGt5JxcNNwY7nvFJ/QVpc6Mukol5PLJFZUuXJ5ugFko+/+grEgisKMMWYfUoF44
 SCDCecZpZE1FQfsNrfYOXf09rGprU168ttEQvsrd4Kp6QLaWgeBtsqktOnU26u5Nq66F
 vpQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNfwBKndDBz5DOZwVHj5uzh8PTzfU59LWKOfjwhuUuXGV5w3K6p4ZueQ+AwveO0IhaDKaQA9Fy@lists.freedesktop.org,
 AJvYcCXy/DmNJggXKllEbaIUtscVychaB9chFnwXlz9Kn5hRQjhyBSlmhsOoo7WkcyJgDOi97L+HIPWB+no4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4gD6VDeCxzekyBTSRlLH5x3iivK1Ywbf5WCiqyuyLaANQhbkk
 wpskKyI5/Qwkml9OfVAjmLrNJMsTbfJuN/racrJYWsHQeJpz6I85Cn7F5G2ZcY8iu9lGqKltTCg
 xqsVSl0WXn6mJF79xMDsc3tohPQMPzA==
X-Gm-Gg: ASbGnct+gXXNWoOSPVvOA4Rvv9l0pZRrXzRBHO0ZOrtE+CFg0x+lWoB7tKgOrS3m0gP
 ONIFRFjf2P46diHqg4YXP2ihnnzGovWksymIE9A==
X-Google-Smtp-Source: AGHT+IHCcADNAqOOaN+ufllc9x/Tbyw4zJm26vrtFwMVXoU/ZabvIUGlzJgCdr6YqtB+H/RX0NBzjQqvbNL5EVjm2+0=
X-Received: by 2002:a17:90b:2b8f:b0:2ea:853a:99e0 with SMTP id
 98e67ed59e1d1-2f452ec6f12mr33610613a91.5.1736184584899; Mon, 06 Jan 2025
 09:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig-v1-1-8c53a644d486@kernel.org>
In-Reply-To: <20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig-v1-1-8c53a644d486@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Jan 2025 12:29:32 -0500
Message-ID: <CADnq5_Pun+zN1=B0eFMw1w8k_oD3fw626SdaEug24YRg8aOLKw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Increase sanitizer frame larger than
 limit when compile testing with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
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

On Thu, Dec 19, 2024 at 6:46=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Commit 24909d9ec7c3 ("drm/amd/display: Overwriting dualDPP UBF values
> before usage") added a new warning in dml2/display_mode_core.c when
> building allmodconfig with clang:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6268:=
13: error: stack frame size (3128) exceeds limit (3072) in 'dml_prefetch_ch=
eck' [-Werror,-Wframe-larger-than]
>    6268 | static void dml_prefetch_check(struct display_mode_lib_st *mode=
_lib)
>         |             ^
>
> Commit be4e3509314a ("drm/amd/display: DML21 Reintegration For Various
> Fixes") introduced one in dml2_core/dml2_core_dcn4_calcs.c with the same
> configuration:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_=
core_dcn4_calcs.c:7236:13: error: stack frame size (3256) exceeds limit (30=
72) in 'dml_core_mode_support' [-Werror,-Wframe-larger-than]
>    7236 | static bool dml_core_mode_support(struct dml2_core_calcs_mode_s=
upport_ex *in_out_params)
>         |             ^
>
> In the case of the first warning, the stack usage was already at the
> limit at the parent change, so the offending change was rather
> innocuous. In the case of the second warning, there was a rather
> dramatic increase in stack usage compared to the parent:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_=
core_dcn4_calcs.c:7032:13: error: stack frame size (2696) exceeds limit (20=
48) in 'dml_core_mode_support' [-Werror,-Wframe-larger-than]
>    7032 | static bool dml_core_mode_support(struct dml2_core_calcs_mode_s=
upport_ex *in_out_params)
>         |             ^
>
> This is an unfortunate interaction between an issue with stack slot
> reuse in LLVM that gets exacerbated by sanitization (which gets enabled
> with all{mod,yes}config) and function calls using a much higher number
> of parameters than is typical in the kernel, necessitating passing most
> of these values on the stack.
>
> While it is possible that there should be source code changes to address
> these warnings, this code is difficult to modify for various reasons, as
> has been noted in other changes that have occurred for similar reasons,
> such as commit 6740ec97bcdb ("drm/amd/display: Increase frame warning
> limit with KASAN or KCSAN in dml2").
>
> Increase the frame larger than limit when compile testing with clang and
> the sanitizers enabled to avoid this breakage in all{mod,yes}config, as
> they are commonly used and valuable testing targets. While it is not the
> best to hide this issue, it is not really relevant when compile testing,
> as the sanitizers are commonly stressful on optimizations and they are
> only truly useful at runtime, which COMPILE_TEST states will not occur
> with the current build.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412121748.chuX4sap-lkp@i=
ntel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/d=
rm/amd/display/dc/dml2/Makefile
> index d9c27ebe12ee08d6330eb199cd8ca9c8489fa5b2..91c4f3b4bd5f46ac5c1c74f66=
5b06dbe61081917 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -29,7 +29,11 @@ dml2_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
>  ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> +frame_warn_flag :=3D -Wframe-larger-than=3D4096
> +else
>  frame_warn_flag :=3D -Wframe-larger-than=3D3072
> +endif
>  else
>  frame_warn_flag :=3D -Wframe-larger-than=3D2048
>  endif
>
> ---
> base-commit: 695c2c745e5dff201b75da8a1d237ce403600d04
> change-id: 20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig=
-f034d9c5118e
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
