Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81435996F57
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B0610E1DC;
	Wed,  9 Oct 2024 15:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NgLlvuSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302310E1DC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:13:17 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e2908e8d45eso278308276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728486797; x=1729091597;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AfPTpiN4aad3T6mZgb6RDh2QQ1DT/Yh1KX1coYoFy2A=;
 b=NgLlvuSsVqWsxJRgUomC6yEoGBHPrOPF+3K7bphbIs/5CzPkQXeoREBulhtZ1jc3II
 cjyx7WQyrlr91Fgnh9hJCUrmbLBAGGWhwEneW8HoS6+zV0vuGfjcT+SHhcer4UX0snbl
 tAGXlGeaRJlXpBfDHIOTFHm+tnjgAyjl3VTI89jzLqrID8M9QAdpYXVIcjMYhYorYWfs
 bI8Xmp0TTixwFEAL5h6DKuxjls/3EEkhGJzQooNrAbUW2yg6TEsboPyAJrzBZEY6TeYG
 zAc66QRWw/F9miwDMg/OGRylCMvCxOf0ooV8LIFpcOT8ULkwMRB2Zy9CcE2wuiGQT2jB
 5EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728486797; x=1729091597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AfPTpiN4aad3T6mZgb6RDh2QQ1DT/Yh1KX1coYoFy2A=;
 b=XMBK5ObU5e6vW56KyMdRWbYBtblvoqrrFy0b/cI/vr0Xd4ZS4k43QpGKEb5OQyBugU
 OUBrievqz/Lgipwd8gaY0Y13ke+HQDDvzUqP7EJKz5BmAqgU46XZnktJ7HKL8tH9FZja
 KvpISVcaR3HL9a5j3fXAUxyO/J0Dn4pWid5NxAWLbLCZ8tRNQdLsPmKdGu7wGhrGJ+Bh
 mQ1+z377Tlr1or1Hri/tBlRTZAJhjnnbATno2KNmPMBFHg33PSkxU8UUOIKNHOJrGgA2
 LeAbWX5GHwUwBpoKh1ZWkcWUvkDBZclJlY0mXsBb0K1BzkeztGGgoHBk/yp0yxQ8LLRW
 aFkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYl/sKeoP0Z4sDL62IRDECx1R2V19XtyR3+/AsqFnW7y86LvAOXn4tQx1RoWplIVSt+ONx9x08GHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTGSYpu/11r5pKUv9oqOvcmB9iAeBzDUnkra4gnsc5Xg9lV07x
 5WJORGNSjKtnNSieG+FXOouSkxp6fU0Kh2T0vLuCkXpSsjbg8FunWxTS02x9IqBS3ohFdCVtynV
 0yVcTEkQqNjyDn4IJMETb70ES7hVyiMGtHt9XwQ==
X-Google-Smtp-Source: AGHT+IFQnljARkFyZK89RrmYSNweHnZyZHGjNcp+dV+v9WlCqUME83KF3jhQwIzFZxKZ4Bx4MQzGAqHFDV3g+lf/fNs=
X-Received: by 2002:a05:6902:91b:b0:e28:6d3c:f869 with SMTP id
 3f1490d57ef6-e28fe32e057mr2694212276.11.1728486796968; Wed, 09 Oct 2024
 08:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241009141240.1948482-1-mcanal@igalia.com>
 <20241009141240.1948482-2-mcanal@igalia.com>
In-Reply-To: <20241009141240.1948482-2-mcanal@igalia.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Oct 2024 16:13:01 +0100
Message-ID: <CAPY8ntA4PwVbUUTiDxez7ooUegOKc=Hj1PnrXYP2KNrYJ2uLQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Fix VC4's mailing lists
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
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

Hi Ma=C3=ADra

On Wed, 9 Oct 2024 at 15:12, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> VC4 has two relevant mailing list: kernel-list@raspberrypi.com and
> dri-devel@lists.freedesktop.org. Therefore, list those two mailing
> lists in the VC4 section.

dri-devel@lists.freedesktop.org is automatically picked up by
get_maintainer.pl due to vc4 living under /drivers/gpu/drm. Likewise
the DT bindings are covered. AIUI that means we don't need to list it
explicitly.

> Actually, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> was already listed in the VC4 section, but it was listed as a reviewer.
> List it as a mailing list.

I had this debate with Maxime in v1 when I added this [1].
It's not an open list as most L: entries are. The top of MAINTAINERS
lists as "L: *Mailing list* that is relevant to this area". That
mailing list is dri-devel.
You also get "Broadcom internal kernel review list
<bcm-kernel-feedback-list@broadcom.com>" listed as R: in various
MAINTAINERS entries.

I don't know the definitive answer here, but it seemed to fit reasonably as=
 R:.

  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2024-June/458863.html


> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a740b73e4ecf..18084e91475c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7800,7 +7800,8 @@ DRM DRIVERS FOR VC4
>  M:     Maxime Ripard <mripard@kernel.org>
>  M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
>  R:     Ma=C3=ADra Canal <mcanal@igalia.com>
> -R:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:     dri-devel@lists.freedesktop.org
>  S:     Supported
>  T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:     Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
> --
> 2.46.2
>
