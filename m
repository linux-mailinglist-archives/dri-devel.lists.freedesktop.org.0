Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9F7595FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 14:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395D10E49A;
	Wed, 19 Jul 2023 12:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A73B10E49A;
 Wed, 19 Jul 2023 12:54:47 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-560b56b638eso511289eaf.0; 
 Wed, 19 Jul 2023 05:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689771286; x=1692363286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Ob33aJpEVflG5uQou9d1IRsAjTkbB0H29vIYmLFG+w=;
 b=Jj+8Q1YBMe8h479/EM5nnl3jJ5xPG0W7eLhHi2H+mcna+HquVrBIJMcD/smzGOmwM7
 ie3LZItQUxdSI0xMbCo1PJjzDdJsrHuwnNUU348rCV5T9FRW3dOxXa5K77hFvFKwyzF0
 Xq74ZvO0+Y76KYqOHLFf5E3TvLisnIgXaGCUG52Etj+JSehbCfm0tEAOhpnSBjemzxMs
 JM+cjERlRLPRT/vP1esVY1YcA0z4kcagF5bL9o/6aiG4wmsSXPHtJ5b3tdsJoJl3G0DK
 QVpC8kqCRTiFy2GtMCWsSON9lNGw1oPeFjUGcthkClYhI01n+UjS3kZGu/eshF8aq5MQ
 OlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689771286; x=1692363286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Ob33aJpEVflG5uQou9d1IRsAjTkbB0H29vIYmLFG+w=;
 b=Xz4H8pZnqWbX8l4Y5FxWe/vt3QJOt0UhsO3z0vJLv2ByewBgHy/A5Z5QUs+mPuR4N7
 z0tGKqSXjw8ogcJotRUDfoGbA1tNnmRpcHgEIgGxFh+5VJrpI6yCx0bW6/S25kNU19cd
 Jv2IwUsRL393t6DtdGAaCTuk1KNkgYWEYwp0K0HRqSI2y27gtyepSqonnv58kbmksjQv
 NgisSjqrQklXOqeHGRBM34+vK3ZlXhEILta1vh0jQ/5moz5+EPmj85z5limlqeE/4Hmq
 GvQdlQtPEAowcmnE0kgtNnxcDMUb0QtIvmFje68/wkn6Ja++b53NmW7oSr42BBoPV2/A
 IMDQ==
X-Gm-Message-State: ABy/qLZxZgK63ylg2AJSUlRsS+DLLnzH06NJ9vKosSdNXLq2riOnInWH
 hU+5YriFqynGXtGlhcTSPk4ITiVnIEM48bcbGXc=
X-Google-Smtp-Source: APBJJlG6aZQXLfAUUa0d6UG0g2dC9Dy/0j5uRWDotnm031YoGltAGMBIqdyjCFS8p1vLbNoKJB5F8RQkl2HtXjmJDJA=
X-Received: by 2002:a4a:3350:0:b0:564:e465:5d5c with SMTP id
 q77-20020a4a3350000000b00564e4655d5cmr1635961ooq.2.1689771286177; Wed, 19 Jul
 2023 05:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230717222923.3026018-1-samuel.holland@sifive.com>
 <20230718163953.GA1279879@dev-arch.thelio-3990X>
In-Reply-To: <20230718163953.GA1279879@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jul 2023 08:54:34 -0400
Message-ID: <CADnq5_N5raOvG+seU7MK2jXT5HVk1Wfp+m6yswQiOqdMpnVHAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Allow building DC with clang on RISC-V
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jul 18, 2023 at 12:40=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Jul 17, 2023 at 03:29:23PM -0700, Samuel Holland wrote:
> > clang on RISC-V appears to be unaffected by the bug causing excessive
> > stack usage in calculate_bandwidth(). clang 16 with -fstack-usage
> > reports a 304 byte stack frame size with CONFIG_ARCH_RV32I, and 512
> > bytes with CONFIG_ARCH_RV64I.
> >
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>
> I built ARCH=3Driscv allmodconfig drivers/gpu/drm/amd/amdgpu/ (confirming
> that CONFIG_DRM_AMD_DC gets enabled) with LLVM 11 through 17 with and
> without CONFIG_KASAN=3Dy and I never saw the -Wframe-larger-than instance
> that this was disabled for, so I agree.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> >
> >  drivers/gpu/drm/amd/display/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/=
display/Kconfig
> > index bf0a655d009e..901d1961b739 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -5,7 +5,7 @@ menu "Display Engine Configuration"
> >  config DRM_AMD_DC
> >       bool "AMD DC - Enable new display engine"
> >       default y
> > -     depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
> > +     depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 ||=
 X86_64
> >       select SND_HDA_COMPONENT if SND_HDA_CORE
> >       # !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1=
752
> >       select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) |=
| (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> > --
> > 2.40.1
> >
