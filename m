Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3647DF899
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E20410E958;
	Thu,  2 Nov 2023 17:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6A910E958;
 Thu,  2 Nov 2023 17:21:49 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1f06931e4f7so122142fac.1; 
 Thu, 02 Nov 2023 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698945708; x=1699550508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Rp/uBT2MTcYjjVBYbc90vM3yxKBzr1d8jsLpQy8gp0=;
 b=F7SC8q3+y9SeBW9z/Xl+NoB07wn1GGwSsbXJeuzKXB6RXm9L59tQjSTWY9WqbC14/n
 QwsJctgQ9Dc91ri1iNw/myxOqJIMKKmPcBuh4LayHPs0otAJpoDn/eXd8O1PyezSw854
 ki9qyjRiUqwAFkZPY1vubQ3kxrVh7ViHcEq+HPQrUsu/LRSm4/o/CUQO4Yn9RQ63M3ig
 91vLjnJMKztzoDvVmLnyWmSwAyhiFg9qOwuAuz2HVAiP02OkC7dfwHEr+ziKb8wrjIkY
 CGbW3Y83E0gjfeSx73NIleA08jISt756z4IcdyYvOnScKchd/lnGnRI1XF3QmLHNRyjW
 h4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698945708; x=1699550508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Rp/uBT2MTcYjjVBYbc90vM3yxKBzr1d8jsLpQy8gp0=;
 b=LvZmy4XG7iviY3uErVUwQ/2e04GWdub3SaDVgVj07rJlyUmXNhEeMHqWOdTR2kN0uX
 Bk6CrWog6AHHh1AWQC0RsevQhmrn8L3eHxE9Updf7s1GvkUmagXx5Hj7f0a48p/q5cZQ
 oy/Qy9f/zeIfA41L1tNwkEL8ZVu6fJUzOFlAiGnlrWJtojN8MKw+408VTeU9lFxjkU0z
 LHXQUAVcNBM/uIAW+BRoovdQIPoaIh2XtkWpYUOE6HxV3GGFmA4sdE35gl4kqqw4V33E
 OSzcq5CXwonebFZ4NUus0hyWS1491KBI1dLvW96CA64KzFrPFb+tdKy+7wNteYkwA6vv
 ahIw==
X-Gm-Message-State: AOJu0Yxf1UnSL9KsntowaWlfJ2470Kq+f0WoUxOWf7nQcjXRwdHx3u30
 PPIIUocWYOWdHHcRt1TF4fBKpV+jiveWIdNU5w8=
X-Google-Smtp-Source: AGHT+IGwkwESGNioZcGP2BYE2/zKNi9YzUdubxg5EfxngkzrELmqWDCxtqHlprEDaYa4rZqREAaw2h3caVJpneZf7kk=
X-Received: by 2002:a05:6871:620b:b0:1ea:8b10:2438 with SMTP id
 rd11-20020a056871620b00b001ea8b102438mr19876616oab.50.1698945708554; Thu, 02
 Nov 2023 10:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org>
 <bb3b74c8-8ab5-472c-84c1-8aa0d8bfa3b8@amd.com>
 <20231102171237.GA1184739@dev-arch.thelio-3990X>
In-Reply-To: <20231102171237.GA1184739@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 13:21:36 -0400
Message-ID: <CADnq5_OvQYq6i78v0=MB4eQjN_secd+DQ5zf7KnM4n1pxHvVdg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Increase frame warning limit for clang
 in dml2
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
Cc: llvm@lists.linux.dev, sunpeng.li@amd.com, trix@redhat.com,
 Xinhui.Pan@amd.com, ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 alexander.deucher@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 2, 2023 at 1:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Thu, Nov 02, 2023 at 12:59:00PM -0400, Hamza Mahfooz wrote:
> > On 11/2/23 12:24, Nathan Chancellor wrote:
> > > When building ARCH=3Dx86_64 allmodconfig with clang, which have sanit=
izers
> > > enabled, there is a warning about a large stack frame.
> > >
> > >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:=
6265:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefet=
ch_check' [-Werror,-Wframe-larger-than]
> > >     6265 | static void dml_prefetch_check(struct display_mode_lib_st =
*mode_lib)
> > >          |             ^
> > >    1 error generated.
> > >
> > > Notably, GCC 13.2.0 does not do too much of a better job, as it is ri=
ght
> > > at the current limit of 2048:
> > >
> > >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:=
 In function 'dml_prefetch_check':
> > >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:=
6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Wer=
ror=3Dframe-larger-than=3D]
> > >     6705 | }
> > >          | ^
> > >
> > > In the past, these warnings have been avoided by reducing the number =
of
> > > parameters to various functions so that not as many arguments need to=
 be
> > > passed on the stack. However, these patches take a good amount of eff=
ort
> > > to write despite being mechanical due to code structure and complexit=
y
> > > and they are never carried forward to new generations of the code so
> > > that effort has to be expended every new hardware generation, which
> > > becomes harder to justify as time goes on.
> > >
> > > There is some effort to improve clang's code generation but that may
> > > take some time between code review, shifting priorities, and release
> > > cycles. To avoid having a noticeable or lengthy breakage in
> > > all{mod,yes}config, which are easy testing targets that have -Werror
> > > enabled, increase the limit for clang by 50% so that cases of extreme=
ly
> > > poor code generation can still be caught while not breaking the major=
ity
> > > of builds. When clang's code generation improves, the limit increase =
can
> > > be restricted to older clang versions.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > > If there is another DRM pull before 6.7-rc1, it would be much
> > > appreciated if this could make that so that other trees are not
> > > potentially broken by this. If not, no worries, as it was my fault fo=
r
> > > not sending this sooner.
> > > ---
> > >   drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/g=
pu/drm/amd/display/dc/dml2/Makefile
> > > index 70ae5eba624e..dff8237c0999 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > > +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > > @@ -60,7 +60,7 @@ endif
> > >   endif
> > >   ifneq ($(CONFIG_FRAME_WARN),0)
> > > -frame_warn_flag :=3D -Wframe-larger-than=3D2048
> > > +frame_warn_flag :=3D -Wframe-larger-than=3D$(if $(CONFIG_CC_IS_CLANG=
),3072,2048)
> >
> > I would prefer checking for `CONFIG_KASAN || CONFIG_KCSAN` instead
> > since the stack usage shouldn't change much if both of those are disabl=
ed.
>
> So something like this? Or were you talking about replacing the clang
> check entirely with the KASAN/KCSAN check?

I think replacing the clang check entirely.  A similar issue was just
reported on different GCC versions:
https://lists.freedesktop.org/archives/amd-gfx/2023-November/100725.html

Alex

>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/d=
rm/amd/display/dc/dml2/Makefile
> index 70ae5eba624e..0fc1b13295eb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -60,8 +60,12 @@ endif
>  endif
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> +ifeq ($(CONFIG_CC_IS_CLANG)$(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),yy=
)
> +frame_warn_flag :=3D -Wframe-larger-than=3D3072
> +else
>  frame_warn_flag :=3D -Wframe-larger-than=3D2048
>  endif
> +endif
>
>  CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o :=3D $(dml2_ccflags) $(=
frame_warn_flag)
>  CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o :=3D $(dml2_ccflags)
>
> > >   endif
> > >   CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o :=3D $(dml2_ccflag=
s) $(frame_warn_flag)
> > >
> > > ---
> > > base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
> > > change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang=
-c93bd2d6a871
> > >
> > > Best regards,
> > --
> > Hamza
> >
