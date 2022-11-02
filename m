Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26A61682A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 17:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261A210E4F8;
	Wed,  2 Nov 2022 16:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAF810E4FB;
 Wed,  2 Nov 2022 16:15:31 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso20791756fac.13; 
 Wed, 02 Nov 2022 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgdHlgFUL52ZSlgJoR2BWxLy/c2ChtXsX4iM/BXcyqc=;
 b=ho8Lt6cCmihgvDFQsW1Yod9zxSYinMTGeBkJpi7Z9kRRm94PktrqsKojXGwz8PTa22
 ylgX6D5aVmt463Z5uEMjQ5mYf/FrjayBb94syCzgDLnttyg9Ph9Kzd6ZYgx9PNQ4B5+Z
 RKEflZvPevS8Y+vjindMbLmh3ku4RuY64NutN+HMb/lgzYK42JB9eRsb2SEilvLnPsmx
 sdBBL5lC/5ObFeW4jhfOQMtHraKfShq/EVfFhYdVFGx02ndLkGcbwxOtEsfttViwAh4g
 c5JHz3n4NrKqr5Vy+UmIcpuBZmX/zi8dcyXea4Jyn8WdzlRpzz7xFuFQzB+xOnp+wL3n
 2Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgdHlgFUL52ZSlgJoR2BWxLy/c2ChtXsX4iM/BXcyqc=;
 b=16v8bTnQfbRV+5+eqmwh2IKRuDSTaFeNxumG/8DdZRlaAxasxe6u7zhI7406UKUGLA
 jyJu+8+s6fs4YaPnoHkofPoIn3bpCZH2X2aV5SBgdfFzl60/WjNSn6LzcMXGaMr6yFdz
 PP237Sb3FCql81MAWGOQf9xBt/aCsZytI+BlsGGz6KUdKzXnKZQB3/C+3s+wKzkgzFWr
 krc4yGv9sVUIP9jdYLRihcGtd/z4F4NQ+Eafw/LwDfZuIq5HR4KnAOH+KBGgt/2fC5lY
 PoFYRxfdj4sSfZqQRUZSNwQTmrErfkss+dA19YuBUF2K40Dj3mxJyNEQoPD2288nqjN0
 T1AA==
X-Gm-Message-State: ACrzQf2xZWMVVcpWuJxo2tQT6V4ib21ntqPevlOkSOFroW37pfKZ+QGw
 nd2ciYNCcImpjWsA25Kfeer3JqKEny+0ut/S3bo=
X-Google-Smtp-Source: AMsMyM4e5KRS5+wtnu+5IMwyVsDM0J1Z9m0fl9VvwJLdX+CyYgyy3luD7SpqwqGASkuDfYCIT1DxBn+1OauaueJkz1Y=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr15352738oao.96.1667405731170; Wed, 02
 Nov 2022 09:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221102152540.2389891-1-nathan@kernel.org>
 <20221102152540.2389891-2-nathan@kernel.org>
 <202211020842.8B8E29F8@keescook>
In-Reply-To: <202211020842.8B8E29F8@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Nov 2022 12:15:20 -0400
Message-ID: <CADnq5_NFtZHzOC2o1yq6VjqT8DYB+q200R_xjf+b1qZonRh4=Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Fix type of second parameter in
 odn_edit_dpm_table() callback
To: Kees Cook <keescook@chromium.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 amd-gfx@lists.freedesktop.org, Sami Tolvanen <samitolvanen@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Wed, Nov 2, 2022 at 11:43 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Nov 02, 2022 at 08:25:40AM -0700, Nathan Chancellor wrote:
> > With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> > indirect call targets are validated against the expected function
> > pointer prototype to make sure the call target is valid to help mitigat=
e
> > ROP attacks. If they are not identical, there is a failure at run time,
> > which manifests as either a kernel panic or thread getting killed. A
> > proposed warning in clang aims to catch these at compile time, which
> > reveals:
> >
> >   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:3008:29: error: i=
ncompatible function pointer types initializing 'int (*)(void *, uint32_t, =
long *, uint32_t)' (aka 'int (*)(void *, unsigned int, long *, unsigned int=
)') with an expression of type 'int (void *, enum PP_OD_DPM_TABLE_COMMAND, =
long *, uint32_t)' (aka 'int (void *, enum PP_OD_DPM_TABLE_COMMAND, long *,=
 unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
> >           .odn_edit_dpm_table      =3D smu_od_edit_dpm_table,
> >                                      ^~~~~~~~~~~~~~~~~~~~~
> >   1 error generated.
> >
> > There are only two implementations of ->odn_edit_dpm_table() in 'struct
> > amd_pm_funcs': smu_od_edit_dpm_table() and pp_odn_edit_dpm_table(). One
> > has a second parameter type of 'enum PP_OD_DPM_TABLE_COMMAND' and the
> > other uses 'u32'. Ultimately, smu_od_edit_dpm_table() calls
> > ->od_edit_dpm_table() from 'struct pptable_funcs' and
> > pp_odn_edit_dpm_table() calls ->odn_edit_dpm_table() from 'struct
> > pp_hwmgr_func', which both have a second parameter type of 'enum
> > PP_OD_DPM_TABLE_COMMAND'.
> >
> > Update the type parameter in both the prototype in 'struct amd_pm_funcs=
'
> > and pp_odn_edit_dpm_table() to 'enum PP_OD_DPM_TABLE_COMMAND', which
> > cleans up the warning.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> > Reported-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
