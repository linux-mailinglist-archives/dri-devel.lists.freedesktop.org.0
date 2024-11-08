Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDDF9C138C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 02:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B74210E324;
	Fri,  8 Nov 2024 01:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mhi7nzIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073B10E324
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 01:20:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37d3e8d923fso1054354f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 17:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731028858; x=1731633658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csXEQJ0hOWDqTcb5yESFfn1ne2rBnPQKOjpHE+1KT3o=;
 b=Mhi7nzIhaImY2INUo2e6uxfcuqhXFvhQ4HlMtjPRk2a5EQcgbmrqEoat1arrcnWZlF
 D6ag09i59NP9ym2rEsffHWx3lQ6v0Nh4/Qf48Li2YmTZ7ZPxJY2TwHy1w+H5HD1Ly1fJ
 FTX16EtWzW0U44HDCNXKA2mSQnvXNjezw8b9KKbAqRTflCMGTMF2dkwuLJoXBmW0tLaS
 uaYDAgTcFFF7btAPZ/VKZgERaDvX3GrrFnOaJ0mq8wBAhobHQhB3U9n/swUsobV7VngP
 r/Eg1ntQJtK8U8iBaeST7pKuibFos3a4/9SQVE9nwpB4jLOeHumcBa2QydeOQNfeUrZA
 eMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731028858; x=1731633658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csXEQJ0hOWDqTcb5yESFfn1ne2rBnPQKOjpHE+1KT3o=;
 b=cmhzZZDwI1X/byekrEyz/vXyLov869OOMD71mV2ZvIEJyTV+mM4Tlrtn5tpKfwEV0I
 9xiQj6qNFv80rva1tKiVvHK7wgg4+6OaVzRQLuteBEryMoIqwKofrLKACf28uCHNIV5k
 rtyzOZqGR1MUJuTvYXa3B0MRclMAC0axMJ7AXEYVdIMp9X3ThhHSysK9TEOaZe8wHPI5
 Gn7u3eK/mDXsdcWahGfPrSxF+sm0W+ahdjkb9qo6e1R2TxSYl7cAWdQa47LOSraffVwo
 01CQszGuApSRqiyKgxYC/zeaDoZBW3wAqyjMz9w84HoJT5sQkwIKS+NAB4+MZqjjNrkY
 EeDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfuCqYsV96XnOtQLDGmsEDzTCklaFFqjWr9NLUbYvEJ+/v5bNi8FkgcaLL2bO7NwUWOc1iqIh6Gr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySCFq1d3WiR3EC6sqbM6f8eU0y/vdL5xXp+577+/wU/TvE34j2
 vll1kZTvJPZE2RlhyjrEZ12UZgbTxXBTorZFVLlJeH6k2iZ3uV1DWZG4kqwg2PgOnOHb6ksrygn
 E1jkro3kK5bPEMwb6K9sQGlpAmI8=
X-Google-Smtp-Source: AGHT+IGv+N35bYAXi2ED91kiigdt2gFXgegiInZyRgIz29V/KnLU08Z7EGRSjBE/pUniNsL6oH5bCieF8fIFO/nhyIo=
X-Received: by 2002:a05:6000:1f81:b0:37d:398f:44f9 with SMTP id
 ffacd0b85a97d-381f1872f2dmr700190f8f.32.1731028858034; Thu, 07 Nov 2024
 17:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20241105212001.38980-1-alexei.starovoitov@gmail.com>
 <20241105212001.38980-2-alexei.starovoitov@gmail.com>
In-Reply-To: <20241105212001.38980-2-alexei.starovoitov@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 7 Nov 2024 17:20:46 -0800
Message-ID: <CAADnVQLMwA1fgApP=H8_jeTeF8JRUXDtMt13qcwUGezvcAQg_Q@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 1/2] drm, bpf: Move drm_mm.c to lib to be used
 by bpf arena
To: bpf <bpf@vger.kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, Kernel Team <kernel-team@fb.com>
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

On Tue, Nov 5, 2024 at 1:20=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> From: Alexei Starovoitov <ast@kernel.org>
>
> Move drm_mm.c to lib:
> - The next commit will use drm_mm to manage memory regions
>   in bpf arena.
> - Move drm_mm_print to drivers/gpu/drm/drm_print.c, since
>   it's not a core functionality of drm_mm and it depeneds
>   on drm_printer while drm_mm is generic and usuable as-is
>   by other subsystems.
> - Replace DRM_ERROR with pr_err to fix build.
>   DRM_ERROR is deprecated in favor of pr_err anyway.
> - Also add __maybe_unused to suppress compiler warnings.
> - Update MAINTAINERS file as well.
>
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> ---
>  MAINTAINERS                       |  1 +
>  drivers/gpu/drm/Makefile          |  1 -
>  drivers/gpu/drm/drm_print.c       | 39 +++++++++++++++++++++++++
>  lib/Makefile                      |  1 +
>  {drivers/gpu/drm =3D> lib}/drm_mm.c | 48 ++++---------------------------
>  5 files changed, 46 insertions(+), 44 deletions(-)
>  rename {drivers/gpu/drm =3D> lib}/drm_mm.c (95%)

DRM folks seem unresponsive :(
A simple move of the file shouldn't take a week to acknowledge.
I had plans to tailor drm_mm to bpf needs, but at this pace
it will take too long, so I'm abandoning this approach
and going a different route. It was worth a try. Fail fast.

pw-bot: cr
