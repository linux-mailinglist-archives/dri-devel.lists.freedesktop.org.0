Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5647DBC317C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697F210E02A;
	Wed,  8 Oct 2025 00:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Do0npa/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D931410E02A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 00:53:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 534234873D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 00:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357C4C19425
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759884804;
 bh=D6FweyKYmmdqK4i8JM+DNzHo424r1zBspUkYHqnYvCk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Do0npa/QgiFr2rpTxYu8fCoLwb8676EQpVlzpUYIxx452a/AiTCg6u+2SYyt4Bcil
 DqyE6Z/rDQVO2Y3qjE3LcIpnPBKjQD6oxmllHdx16Cce7FnNv07xhqaNRB6ePSN0NA
 RrjsyAcv8GAcYb1mjhlzcA3MuU5fn/1n6ziVT1FRWxFSi0SWPjcM3euTiVjR8NfLYY
 qf1ZiwpZdLyvhCdUB0rybmjLTk017mQ2tw0s09IQWaA/xe5dHK/zZy7EayUilkJy/m
 5jOZPFMOZ4/r07rjcUpCqRxj3OgFZVEUatHXUxOI/WAX85/X7bPtoKUlDMq/957tAI
 1bvnTo5fV3hxA==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-57e03279bfeso511732e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 17:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQYq917GqvydCyiXBddzl3g5tVm8kwmH1daW3+RZ66DMPv8RGgtdO6aZIQI/wDH+Kdo/+d6YRBlmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAZ3MZCwthO8i1L/IlVfmvMcIb0SOm464oQB8P/VQNkyC+iS7S
 ZCrt7vRwqK0WcxEU3lF89cpq8rGAIrCGmUc2emhW4VkkYj24tdjdRfKtCPoMKJQwUmm2oKYmqnN
 tpdGQ+GglcH8QBrNlW13ZIrYodFafAO4=
X-Google-Smtp-Source: AGHT+IG/2mh+7aGFp6yuZ/PHAh5VmeA0UzQePRnzK9Z9+tu50SDI+hbN8RUBkkU8FkCKt3PSGQusoMls3HZeIoqjddo=
X-Received: by 2002:a05:6512:3d26:b0:586:a95f:cac1 with SMTP id
 2adb3069b0e04-5906f3107bbmr359245e87.12.1759884802311; Tue, 07 Oct 2025
 17:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251002210044.1726731-2-ardb+git@google.com>
 <5824c012-dcb2-4312-9b16-810656290831@amd.com>
 <CAMj1kXHUjL7=CPz0viSBvfeX=BKNYuUkrpTizn9H1ZgJecB6cQ@mail.gmail.com>
 <CAMj1kXEzNPJOE_-gndNcFmE9CjLpsFCjfytaXbvm-1Khu62XRA@mail.gmail.com>
In-Reply-To: <CAMj1kXEzNPJOE_-gndNcFmE9CjLpsFCjfytaXbvm-1Khu62XRA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 7 Oct 2025 17:53:08 -0700
X-Gmail-Original-Message-ID: <CAMj1kXHhQ41WCgGFeb_dPLVbp+SZG-JvG4uxV9pMTCs3bnGyog@mail.gmail.com>
X-Gm-Features: AS18NWCbTXTjj2ZApuB9b1_e6m6Cn170sDL3ZYdCcXcNdRu-0RV8hzeUMtrgZ4g
Message-ID: <CAMj1kXHhQ41WCgGFeb_dPLVbp+SZG-JvG4uxV9pMTCs3bnGyog@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, will@kernel.org, 
 catalin.marinas@arm.com, mark.rutland@arm.com, broonie@kernel.org, 
 Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Tue, 7 Oct 2025 at 13:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 6 Oct 2025 at 12:59, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 6 Oct 2025 at 19:42, Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> > >
> > > On 02.10.25 23:00, Ard Biesheuvel wrote:
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > The point of isolating code that uses kernel mode FPU in separate
> > > > compilation units is to ensure that even implicit uses of, e.g., SI=
MD
> > > > registers for spilling occur only in a context where this is permit=
ted,
> > > > i.e., from inside a kernel_fpu_begin/end block.
> > > >
> > > > This is important on arm64, which uses -mgeneral-regs-only to build=
 all
> > > > kernel code, with the exception of such compilation units where FP =
or
> > > > SIMD registers are expected to be used. Given that the compiler may
> > > > invent uses of FP/SIMD anywhere in such a unit, none of its code ma=
y be
> > > > accessible from outside a kernel_fpu_begin/end block.
> > > >
> > > > This means that all callers into such compilation units must use th=
e
> > > > DC_FP start/end macros, which must not occur there themselves. For
> > > > robustness, all functions with external linkage that reside there s=
hould
> > > > call dc_assert_fp_enabled() to assert that the FPU context was set =
up
> > > > correctly.
> > >
> > > Thanks a lot for that, I've pointed out this restriction before as we=
ll.
> > >
> > > Since we had that issue multiple times now would it be somehow possib=
le to automate rejecting new code getting this wrong?
> > >
> > > E.g. adding something to the DC_FP_START()/DC_FP_END() or kernel_fpu_=
begin/end macros to make sure that they fail to compile on compolation unit=
s where FP use is enabled?
> > >
> >
> > Something like the below perhaps?
> >
>
> Never mind, that doesn't work. dc_fpu_begin() is an out-of-line
> function, and so it is the DC_FP_START() macro that evaluates to
> something that includes an arch-provided assert. I'll code something
> and send it out.

OK, so as it turns out, the logic already exists to force a build time
error in this case. However, due to the way the amdgpu driver
constructs its own API around kernel_fpu_begin() and kernel_fpu_end(),
the logic never fires for the users for DC_FP_START.

It is sufficient to include linux/fpu.h:

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h
b/drivers/gpu/drm/amd/display/dc/os_types.h
index 782316348941..6ef9b7f5e099 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <linux/fpu.h>

 #include <asm/byteorder.h>

Maybe this could be folded into this patch?
