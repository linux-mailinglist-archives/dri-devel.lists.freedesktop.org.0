Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF880D121
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 17:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D05010E4B1;
	Mon, 11 Dec 2023 16:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C82C10E4B1;
 Mon, 11 Dec 2023 16:23:02 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1fae23895c9so3194269fac.3; 
 Mon, 11 Dec 2023 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702311781; x=1702916581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvXAIFU3cHSe8gZFgZZL313yZ6BsbgxanKxV0o2G4D8=;
 b=cfIlVbamUHbtXMA5lhhKghQNu4h5XQqiqGZFyT2t8xuaHiS988acdv+cNdtsH3BEaQ
 Yk1Pt/aalBb72st2fKs7Arwz4HMUC6Fiy+xbE+BiBZDSZHqG4apvronXvtgQxiNQBama
 8mjTV1+fcuJxNXQJJ9gj4+OQ7yHwoh93dVO7hjVIrW6qaZ0old7Rm59FuwqxyQ6T2R8N
 v2SI1xdGUKgtRHgt5BfNlBD8wuL5DVtl4wPdGR7k29HoqJdkEaAKuE3qChxOitIxO4RH
 AMywUgjg+3Cu1hxZpFdDA79HruaX3c6XO+wavP4PeS5tfJJtez3IoQP7Z/b2TbZnN+jy
 /Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702311781; x=1702916581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvXAIFU3cHSe8gZFgZZL313yZ6BsbgxanKxV0o2G4D8=;
 b=Ufcwa1AwiaO6ydFGa5p8K3cPgwamBy3Nyuiu+Wktz8FyLXaNGLsYMhmcn6gCQmKr5N
 CNpA4V6LeW/18zBQXPL1SlpMvSFx84fk9RXisIbis2EeNpt26TeoBW/TYPLmVnBA78vz
 xTpa4ZTShEYJYECL0diRW3kLlK+HMIX9K507uFz++zHjZNbY2U6gyYu8OjCIw/MmjbJ+
 4wVr2svV8auz+/0/Uz5KWRTN8fmj4zg1COKJy7TefuP5slhPQhXoAnTEiNEU4x0uWc+I
 v86kKpX1U4cDgcm+Rsh9CdWg8pb9I14k45ZD5EMyYAMoKz9q5Dc7G9D87Vw6PnRWSE7j
 EmHA==
X-Gm-Message-State: AOJu0YwXSAMT9DfM0qeePvJxY9AMhxFlYXi/h8xtfVpZI5xRU4zWOlfG
 fqkLlX0c1mbwaCM8cakIv9zgpVw+r1h5qTTVlGct0ZXxums=
X-Google-Smtp-Source: AGHT+IE6Pdq+QZOPZcT87hzEwOyfLxxsaDNBp8XrIaNN3aLL6Q2E3qAZa+aCTM/ghgMcR5Uq8on+1btr2EnnabaqbsI=
X-Received: by 2002:a05:6870:b154:b0:1fb:78d7:91b8 with SMTP id
 a20-20020a056870b15400b001fb78d791b8mr5975573oal.34.1702307889216; Mon, 11
 Dec 2023 07:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
 <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
In-Reply-To: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Dec 2023 10:17:57 -0500
Message-ID: <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
To: Samuel Holland <samuel.holland@sifive.com>
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Leo Li <sunpeng.li@amd.com>, llvm@lists.linux.dev,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 10, 2023 at 5:10=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Arnd,
>
> On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
> > On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
> >> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
> >>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> >>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> >>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> >>>>> architectures. Enabling hardware FP requires overriding the ISA str=
ing
> >>>>> for the relevant compilation units.
> >>>>
> >>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> >>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_v=
ba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DI=
SPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula=
tion' [-Wframe-larger-than]
> >>>
> >>> :(
> >>>
> >>>> Nathan, have you given up on these being sorted out?
> >>>
> >>> Does your configuration have KASAN (I don't think RISC-V supports
> >>> KCSAN)? It is possible that dml/dcn32 needs something similar to comm=
it
> >>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KAS=
AN
> >>> or KCSAN in dml2")?
> >>>
> >>> I am not really interested in playing whack-a-mole with these warning=
s
> >>> like I have done in the past for the reasons I outlined here:
> >>>
> >>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X=
/
> >>
> >> I also see one of these with clang 17 even with KASAN disabled:
> >>
> >> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32=
.c:37:6:
> >> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalc=
ulate'
> >> [-Wframe-larger-than]
> >> void dml32_recalculate(struct display_mode_lib *mode_lib)
> >>
> >>      ^
> >> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
> >>
> >> So I'm in favor of just raising the limit for these files for clang, l=
ike you
> >> suggested in the linked thread.
> >
> > How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
> > in that function? That should also avoid the build failure
> > but give a better indication of where the problem is
> > if someone actually runs into that function and triggers
> > a runtime stack overflow.
>
> Won't that break actual users of the driver, trading an unlikely but
> theoretically possible stack overflow for a guaranteed crash? The intent =
of this
> series is that I have one of these GPUs plugged in to a RISC-V board, and=
 I want
> to use it.

Does this patch address the issue?
https://gitlab.freedesktop.org/agd5f/linux/-/commit/72ada8603e36291ad91e4f4=
0f10ef742ef79bc4e

Alex
