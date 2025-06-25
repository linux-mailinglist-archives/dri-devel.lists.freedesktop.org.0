Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC49AE893D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416F510E6E2;
	Wed, 25 Jun 2025 16:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2Au3ZsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA05D10E6E2;
 Wed, 25 Jun 2025 16:10:08 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-312f53d0609so804764a91.1; 
 Wed, 25 Jun 2025 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750867808; x=1751472608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBrFETaroCkX96G0zPZ5a1Zi1enIMSLL8f4PbO8cLto=;
 b=G2Au3ZsMQixVOrSndizMn44QhcqHlH9+FgZSNnRkECk0YVDW2m+8owvn8VPxsUsFj5
 D/UzEw8aLtA2DK2JWFzeMtq2TvQLxPWc+pkfWr+44dNhysjcPCE7u9ZkSkY4Xpk/lWvk
 UrChS7INGCwnJlEzq96zkQyTVrQqLPPzd4/nVHiAS3yCK2CO+/epVJFUaliAn592R6nz
 MEDXo27JnFeDix0PtObvv3AL4k6LbH3yqlSBj8WefOHMdViSNKWVmeX0p5fOmWTUkRuK
 2LYYk3T9ICFieFps8qQKNBMBefaN03HysecXQqAUAcmaiVbEoAVfLA4qd36MI98TiBOs
 TaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750867808; x=1751472608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBrFETaroCkX96G0zPZ5a1Zi1enIMSLL8f4PbO8cLto=;
 b=xKD0HNS+3I5MpKKimKTxOQ/jgBfVhfXi1svyPJgeqBA/YqGHBal348Pj4DChl6bzl0
 jwYQn2Ok4peWh5zBnny+KRaVy9WZ88doIpd6oMsIx5xJ28cwK/9koBjn4R1MTQbJ0C4Z
 zpLQ/usvg/k++kEAy3q25DkFy1qZW0wqMLYXVTYjmy2GzK5XLZXvRlvvBmAHZWqe3eBY
 BI/uGktxoOduIqVeE0fuQXrHNa5hZ+Na00uS+/uMM8ScszM4aTbwq/gdJ189SE0CahPo
 PMKsm4xXT9ZBQiqRaKcXt+FQN5wvhiySDXwgr5FDga3qmnJcZOsZ5Xf14644rJsJXcRu
 KXRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd59hekGI4xClOvwEYrRjw7LeWc05QZLjYKBtYJP9V3UsQJ0811H4xMcokwrcOOvEt0uU3C2uF@lists.freedesktop.org,
 AJvYcCWu5zWd0IIrRvCcpEY2MzCMtPBUVabMSBzoddGvqRav0RlP8Kk5rOteR07TncuOxUpZHmYmwcnZQ0eu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRs5Wnq7B7QMbmYQGxw8XrzQ57XPK77nnzUxoApqndu4PzkAa0
 Uzjdq/Z6s0M2EekijAZa88PkAEA/xbQ5iugjQXKzQEVSFyQeO1bbmjUjYQdx1/AKA2MG3ZmeT2n
 kTi6CJ0h8lxmovbGAaF2VPowVzfIdqRE=
X-Gm-Gg: ASbGncsBZMcBjlEaafCM/zYEXiqGLyNI7b1u1fI+g4qqIkeXTWMu+M6Mv6YIcVGR4Rl
 9Y4MOFBOIZRPjj09rlAA8mXMjjxtOk5dfnFDj2txOTPyt0As93UsER1xqx1IUhpb2UynSV8WVJ6
 Nm3+oja9hdl2eaGkVs2P5p4wbGFY34MMkMJH4IoWgnBYeq
X-Google-Smtp-Source: AGHT+IHiFkqqa0Jk0YluhhIJsYOZtiuNq//whIW6tk0w3miq/6hky/sAIaoctJZgV6n+D97P3fnMOoCUgzmVKhey2rA=
X-Received: by 2002:a17:90b:49:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-315f26b0cedmr1903570a91.7.1750867808265; Wed, 25 Jun 2025
 09:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250625084314.414044-1-tzimmermann@suse.de>
 <1f6b8e22-8608-4026-a306-3b4d38fb8027@amd.com>
 <CADnq5_N1b59pmKJY1kH=j76a8w6_Bnpyu_V3ZdCJnb1v-kBgLw@mail.gmail.com>
 <03e6d939-ff99-437a-b45a-6349e5ac739c@suse.de>
In-Reply-To: <03e6d939-ff99-437a-b45a-6349e5ac739c@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 12:09:56 -0400
X-Gm-Features: AX0GCFv1IjeKkmH0pg7f1hI7eccXjrqWhvT8ddCwVHSYpLbWf32qcCnPuic-R_8
Message-ID: <CADnq5_Niq5bymcLncKM34jyHBFcrUu0-=_A9887N92-dCcr03g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/amd: Avoid using import_attach directly
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 25, 2025 at 11:31=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 25.06.25 um 16:40 schrieb Alex Deucher:
> > On Wed, Jun 25, 2025 at 7:25=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> On 25.06.25 10:42, Thomas Zimmermann wrote:
> >>> The field import_attach of struct drm_gem_object is often only
> >>> required by PRIME code. In other places, replace its use with
> >>> clearer alternatives.
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the e=
ntire series.
> >>
> > Thomas,
> >
> > Feel free to take them via whatever tree makes sense if you have
> > further work that depends on these, otherwise, let me know and I can
> > pick them up.
>
> Please take them into AMD trees.
>

Applied.  Thanks!

Alex

> Best regards
> Thomas
>
> >
> > Alex
> >
> >>> v2:
> >>> - keep amdgpu_bo_print_info() as-is (Christian)
> >>>
> >>> Thomas Zimmermann (2):
> >>>    drm/amdgpu: Test for imported buffers with drm_gem_is_imported()
> >>>    drm/amdgpu: Use dma_buf from GEM object instance
> >>>
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  5 ++---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 10 +++++-----
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++---
> >>>   6 files changed, 14 insertions(+), 15 deletions(-)
> >>>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
