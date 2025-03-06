Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA2A54677
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA4910E14D;
	Thu,  6 Mar 2025 09:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="agTF1N2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DBC10E14D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:37:31 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3f417de5e25so263621b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 01:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741253850; x=1741858650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLprdd91YTpO/D6PCgkynt4/vJgy2iO2mLGTKPJDuBE=;
 b=agTF1N2ovELrvlKfbzvFmnr9kRL3YwYpqB8oO1awV/Q7Y2rkvtWKzQ7H7veajJC56g
 aTtOJNQpGUwr9ZTwfN3ZIfkCUNXBRTnVaiY6DMHPUrJrtgHu+/SV7MEugI8meM+cRiy7
 TKqRTerQBM/5u1WaqIb+TaL/sI4HvJA3P1JaV+RLJ+Ir2C4oAl+kFVW3yLNXXy3LRYhd
 9aC1HjMUx9ZEkuxCe+JoaEYor6UVbBOQKjNZ1+w+5bgmZVrvEPqctgfiE6jrG+c8/xJ+
 ea3sJugSfGIgZ8ALm9Br2aiFDLOO17uS/NatdGujytqnzCgov9VzdM/qYrZwqA0QWF99
 Pj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741253850; x=1741858650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLprdd91YTpO/D6PCgkynt4/vJgy2iO2mLGTKPJDuBE=;
 b=OAIo+S02kTdBCiZzWNgrTpiYRp6OT8bCa6uoDByCaEGWAQqwyk2AumoO04CDngyqug
 y7LE7FnkLHOt4Hv2lZWt+Km2kaZoL7UR7IrykiwnJJxCmqKKrdVB7GhlkVlCqYpgwGXZ
 vLTZ3jklqMxTn4NsuIu/8rRgErQEAFJKOM9Snqju4cZy5HXMNeKiqlhhz+BApmjqUF7p
 OKH595YfJb/RKzamEimDarCQCrQ9l+ztZAsxxBFWqGu/nLsAV2ZHH09859n/FxT6IjBn
 A5E5fsPrBH1i/Xmc24SOzDjUo+PyE/p+xTzaORHklpGdL1iItub8wvz4mfxKcYMvlnfK
 HUPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNf5XygJWsmvkMm0VrnklL9RWdjnP7uoFlvD/IEkybiFNZ777AfeW9XkxYGGAMElNolLR2kk0LSG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysdiislAdlCxZL6qsf3qNNc8e/NSzUlh6ksa6ad4PC3DfAhH39
 oKLcc5MN1EkxnFrdP0oD3qMwLdhHC7/s6+xumJDSb8t0dRU/rZZgoGEoKH4PWbpXJiYOOv7Ctne
 1RnsgXpSEapVv/OIjivzZ957vRgo=
X-Gm-Gg: ASbGnctqkE5j6TgMa/d+KU9a2kApMDNLkNIRGnf/Rw37Kb6XivkvHKy1i86S6zcB5KF
 80prQkXQL9e5tujs+8BOOU0ulN8SyzsVktxI/Equ7iJd0owwaQZGS3kNOxSm7lIzmmrPkMG7gDM
 rhH3Pas5ypIDP+SHzU8vOajrq6
X-Google-Smtp-Source: AGHT+IG9A27vX8y4RjMpuxk7loCAGz0dZw9H5VkaAL6LjExFUGPLf0UL66ugvSrUJjKHZoWAZYRZwHUIAF3aSPY3uCk=
X-Received: by 2002:a05:6808:1901:b0:3f3:fca6:e780 with SMTP id
 5614622812f47-3f683144936mr3774926b6e.4.1741253850578; Thu, 06 Mar 2025
 01:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20250225203932.334123-1-thorsten.blum@linux.dev>
In-Reply-To: <20250225203932.334123-1-thorsten.blum@linux.dev>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 6 Mar 2025 10:37:18 +0100
X-Gm-Features: AQ5f1JqPYte1Y1sfZ1elIHoDjXZLpaJ74CYxKBCuHA-IVr92zEQbBbverVAm8j4
Message-ID: <CAMeQTsZaE626TpmygVQTXDep-8KiB=HcEo62x+EL=F4Ctfq+wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Replace deprecated strncpy() with strscpy()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Feb 25, 2025 at 9:39=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> strncpy() is deprecated for NUL-terminated destination buffers. Use
> strscpy() instead and remove the manual NUL-termination.
>
> Compile-tested only.
>
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks for the patch.
Applied to drm-misc-next

-Patrik

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma5=
00/cdv_intel_dp.c
> index cc2ed9b3fd2d..ca7f59ff1fda 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -855,8 +855,7 @@ cdv_intel_dp_i2c_init(struct gma_connector *connector=
,
>
>         memset(&intel_dp->adapter, '\0', sizeof (intel_dp->adapter));
>         intel_dp->adapter.owner =3D THIS_MODULE;
> -       strncpy (intel_dp->adapter.name, name, sizeof(intel_dp->adapter.n=
ame) - 1);
> -       intel_dp->adapter.name[sizeof(intel_dp->adapter.name) - 1] =3D '\=
0';
> +       strscpy(intel_dp->adapter.name, name);
>         intel_dp->adapter.algo_data =3D &intel_dp->algo;
>         intel_dp->adapter.dev.parent =3D connector->base.kdev;
>
> --
> 2.48.1
>
