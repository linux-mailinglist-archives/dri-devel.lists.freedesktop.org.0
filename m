Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F69AFDFF8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5F610E1AF;
	Wed,  9 Jul 2025 06:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DiMwEwYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC510E1AF;
 Wed,  9 Jul 2025 06:34:12 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so5556924e0c.0; 
 Tue, 08 Jul 2025 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752042852; x=1752647652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9aod6BXjQrO5vyW4mRKpBJMwKOe6N1K/J0C4KFxzP4=;
 b=DiMwEwYB2+vwFMWipgYlOVl/z2yAj4OLPS0Oi3xFJna8lEUIgYFFDuIJb1B7QNlOqs
 /Xo40DQ/zAUZjstDs1RQo0A/x4Ud9vk+lWRvfTDOXCe57MBpB8H9l+rUTq+7/uszhr8l
 XRBag8WsNRPNIlgjRaf1wEV2VA8o0Fr+jGr1TKSgOzIEqwN3ka4gJHAi6qlz5sq9AaCx
 OiNdiuWYDmR9zvd6GYvYZ65CsuRlDhuE0ackqdKADl2Db0p2AeGaUAzdxI16yrjT0zPl
 VQpSl7khQRw3G5IHPon1oO670avOErAfeFCEs/TYwatLaNy+B9uapuxZYl1zTf3pMqMn
 9Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752042852; x=1752647652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9aod6BXjQrO5vyW4mRKpBJMwKOe6N1K/J0C4KFxzP4=;
 b=cXmLdiP41IJ/XbcqT6fAofXh+SFaeLltjGPwxVTGxYwz+Nyh/OFiL8ICJMeIWOujM7
 qchNOqAipHh7fBZIdl7MVQxrdU/Ijy2CEytcfA6abSUdDtA6XHrIgKAKbmLN8uedmn9N
 Qmf6citfbevu3JlNYQqeO3rqFUjBqTivxDnsQz7VqB1TuWlxFrz6fSxL131bdEm+/DgL
 T+17OpuAwmRLLRfAeSOpAoXXTAkXlJJaZ9NwyFcB/gfWDJcPpNqNcxyndxNcoIdK7h0X
 lCRjRKWHeyv2Ue9mgKQp3BzwO5CLyh+WLdGHdRcIZNnmWVi/kDqj80AdLOVxO524rhJs
 YXzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2a+2iqDcSbTQUQ6bbbaLvGeTNXjdlfhIDhxxTa5vb7O67x4r5aYvN5K4NeOR37wUclfRsqOOGUoHJ@lists.freedesktop.org,
 AJvYcCXcL97dERTbnticyh+7svWPOeN7us3AWSrWikLYdawQfkjH2bV8F/8CArtapRHNN8STKV9RJG17@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYVOg1YDU4DTqlFduQtuyLoA1NZ9l7i/JablPgaV0P4vxu/tRp
 sXJPmYLwoNFvTINvSPOKLSdv3wBjlMNb9HVQTbg0rnsD7nOTQ6kQrEFcbOsZLai8ZzpMXl4yWav
 zdHfeAbeX3t7Wa9eDnoqMzyEQx0BUfJo=
X-Gm-Gg: ASbGncsGquoguedfeqrdPCFkkJLJ6+uAUcgbzZg2EFq4yWM26Cb9fvH66SvS48X+GL7
 4ri+TdceUC4Qhjsl/oOuL2JMkhLTMnfCRY9Qvp4u19BqNYntdFbt70gLnyjFReDgDcEcCPz9FTt
 kBSeOx6UvPGpl5Co9ugral4aIBYZRaBnl30pKWHClIww==
X-Google-Smtp-Source: AGHT+IGzn/x16pDQ53vI1j1ojRFLBVig/bMF+fcC23ilzSsODhT507fDhgyOaAudI+CHcvleaZ8z6iN2Q55SLHQEmyU=
X-Received: by 2002:a05:6122:80aa:b0:531:20dc:924 with SMTP id
 71dfb90a1353d-535d7443235mr586641e0c.11.1752042851298; Tue, 08 Jul 2025
 23:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
 <56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com>
In-Reply-To: <56e7ec54-9820-4e02-be97-2a9e1dedd117@amd.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 9 Jul 2025 14:34:00 +0800
X-Gm-Features: Ac12FXxapUUsFofuo853oFqC-peo6coLRLtZLPkqC5w7REiJr3Q5hyQm71Fknlc
Message-ID: <CAAT7Ki-pg+E83xMCmES+VMWFthGuLMTzKdSbDak0OEMR6kfL0w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: enable kfd on LoongArch systems
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev
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

On Tue, Jul 8, 2025 at 6:12=E2=80=AFAM Felix Kuehling <felix.kuehling@amd.c=
om> wrote:
>
> On 2025-07-05 04:05, Han Gao wrote:
> > KFD has been confirmed that can run on LoongArch systems.
> > It's necessary to support CONFIG_HSA_AMD on LoongArch.
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/a=
mdkfd/Kconfig
> > index 62e88e5362e9..b2387d529bf0 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> > +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >   config HSA_AMD
> >       bool "HSA kernel driver for AMD GPU devices"
> > -     depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 6=
4BIT))
> > +     depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 6=
4BIT) || LOONGARCH)
>
> Is LOONGARCH always 64-bit? If not, please make this (LOONGARCH && 64BIT)=
.
Got it, will submit v2 later.
>
> Other than that, I have no objections to applying this patch.
>
> Regards,
>    Felix
>
>
> >       select HMM_MIRROR
> >       select MMU_NOTIFIER
> >       select DRM_AMDGPU_USERPTR
