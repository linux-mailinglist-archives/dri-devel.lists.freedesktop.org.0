Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83B2ABC17F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 16:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8110E3EA;
	Mon, 19 May 2025 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QmVbca2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF510E452;
 Mon, 19 May 2025 14:59:37 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-231bfc4600bso4807405ad.1; 
 Mon, 19 May 2025 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747666777; x=1748271577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJbKnQ6THaOIWWHkWKM4XnXv59kQm5WmU7EOv3ddOfo=;
 b=QmVbca2U1FBRmoqC5cfR6Sz5uUookQrWZmo64vyDiMsQ6/8cnvnSpyzcXYCybA/zBW
 3L79HC0zBb1LGihK4XWFtDUVUY4kpusyJuHVC1QAuWfsf8fQp+kPEnQ0FwBWeFsUO7DE
 Hn9DzWQ4ub7OK3eroQ2xoQDuYT9aKMTZjLHJq/zDrKK6FP7viI5/oePF/gHFwA9QOFs6
 GkJSbpRfH+6m1VwwAhzJSfihnuzkdOeBSQ1xXfa2/RJojQc2weKQzxlEvxKG5tKKtleQ
 ZoYo4whHaB0i71JLKXa6BZKL1nNP+Hcr4UEKt9ROq8sTCAApVbiiRub+s6iCz9fvaGMK
 +sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747666777; x=1748271577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJbKnQ6THaOIWWHkWKM4XnXv59kQm5WmU7EOv3ddOfo=;
 b=XLrOAgtpVpRxvqLpJyMCnP/shNphLDGeKoA3sq+1O2Fytq3KxZuT9ilvGLWWauMLuB
 HBLcEDJZtvdKxv6RyIN3LsGz2/EyB3+6uPxf059Nfb/qrlXOVHVkawk8f26V0nsp+nY4
 tNJzW5Wfni+eVT9F5wUkI93NzNIPcrYCxhwTip0VK/ruRkoI5JewlCk1LjgKqCofn4/o
 P/XPN0Dd+pviDoHc8+6qGErvUcMe8665dv1gYbKd6clIHTI2EJxQ38xpKJVugbWW8DPf
 +9Rqm7nFjp2/WoCTXJZTaeJ/mSMqdVfIwtOBUg0KfHeluGoHHPukehRKiOWA74oqwdWg
 2Hzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRzOcmE23X5YPsgE1fY4YXRUhhk2e83r9FljnC+I55VeaVYeU/AagW7uX8KShBHFpDNCwyDgeW@lists.freedesktop.org,
 AJvYcCXcgk8aUMuZmKdikMBgcn89dqklC8A56uB5QQh87ZfZJquqCgcA/ejxvP+3v9yaAJiYyK1CNchJnhjB@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz64fq2urET7XXHcogK+1wrRGBcfHRz8nTA+eHhsvZFF54i9zUu
 8ZQbVwLPxf4lCRrf64dpEzpTuODZo14pNNFfl7ZVxLw2ZaAzON+or+oLhj7/cVzGauc5Z8qguns
 gKCimtr95S3R3u9SbGM7P+VLMJVAgE0I=
X-Gm-Gg: ASbGnctkySpZyl4KNsYvopMxRlgbIjkCVGuU4QXyTXRQKhSKDP0C+TeXQbtrwFj08T8
 39KGDO7NjXC1vazjdfxg4d5QfkJ79Pscvd4FYmQd7ilg4BvkjBc8Ct7TwPLvwmvLcZ6Md0fnsVq
 qlFbBcauNqMepwaOuahU2Bea2lK7yxJFKIBA==
X-Google-Smtp-Source: AGHT+IHLS/MC9ULQUfEueaLkKs2Re4yb5qkf2UfVq+r3wklL/AUqeNW5UH4uETMeYpvy3Y7FlPakYzri3fcicI5uAZA=
X-Received: by 2002:a17:902:cf07:b0:220:e1e6:446e with SMTP id
 d9443c01a7336-231d437f0damr66974215ad.1.1747666777173; Mon, 19 May 2025
 07:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:59:25 -0400
X-Gm-Features: AX0GCFsSRi45LP3otZw9uo5k9qEKoUzLkQAZiNfSWJQGWEj7HNf0_zawacqQN8Y
Message-ID: <CADnq5_PSfZ+jMMAXb427TF1Z0qQBq_kgZVo+3qfrXkFxJTSzRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] fixing typo in function name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
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

On Sat, May 17, 2025 at 8:38=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/atombios.h | 2 +-
>  drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/a=
tombios.h
> index 2db407892..b961096a4 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
>  #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE              =
  0x01
>  #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                             =
  0x02
>  #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                       =
  0x08
> -#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                             =
  0x10
> +#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                             =
  0x10
>
>  /***********************************************************************=
***********************************************
>    ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
> diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_=
dpm.c
> index 55dbf450b..4aa050385 100644
> --- a/drivers/gpu/drm/radeon/kv_dpm.c
> +++ b/drivers/gpu/drm/radeon/kv_dpm.c
> @@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_de=
vice *rdev)
>                                 le32_to_cpu(igp_info->info_8.ulNbpStateNC=
lkFreq[i]);
>                 }
>                 if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
> -                   SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
> +                   SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
>                         pi->caps_enable_dfs_bypass =3D true;
>
>                 sumo_construct_sclk_voltage_mapping_table(rdev,
> --
> 2.39.5
>
