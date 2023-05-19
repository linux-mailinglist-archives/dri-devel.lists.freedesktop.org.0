Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A4709D18
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B223010E55B;
	Fri, 19 May 2023 17:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0E10E55B;
 Fri, 19 May 2023 17:01:11 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-19a0988a925so1434571fac.0; 
 Fri, 19 May 2023 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684515670; x=1687107670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BscCUYhDrbbZeWwOY16G73CsQ2N1HXyllhvuAAh+zdk=;
 b=nNGsgocaW2gcBQg7oBg4bdChMCvmeKvbGw6RIiR2BYK8f9aVZ8srVGeiXX67n9KCJH
 PVckNM6PLUqhPsZPozMnWXhoRuT6AytrafdYrwzjqCfItafhx981hHkeKcWkJFX6oqtT
 1ySf0PV5Gy0n0DARb71Uwx5wK8pnEFtji/3w8AV/bB7iaABbwSZTmmWWf1gOavAyg7m1
 /Zw4ZsTQkDmJesEgmFY4PVAWuwZ4buH8ZQVbxp8RKuZHrcuBBdWVzFVG5p4R2qqaBCRO
 mP+N/3TQwqFlJTue8LdMVFGlNyO/88PeABj6XCQOEPwrXaQSIoNl0AluinzAZ9CNxxkY
 LsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515670; x=1687107670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BscCUYhDrbbZeWwOY16G73CsQ2N1HXyllhvuAAh+zdk=;
 b=TMIJxOqjH7TixfQnac0K0pod29K7xc+PI4FHDg5ZZwQlykiL/J0nggcc4yarJ6L6aL
 Rvv8oDEgtFRkrpIRQutK3r1nts+/upQs3IPb/xrGDtQq7qxMp8qUNVlw09Zgwlz2pq89
 XP4e1TX6dNwg4DjvPWvJEfOvUjwL+iLRu6rneMIcTyqAV3eoIr7+q6cORIWJhBocFPGT
 JYsqGN9jhH60F6frlAe4SVb+EOXEd0ylil0QLNu98hfhQvdEzz1sbhWixRDXYvEl8lv2
 PL1vhYaQeD37p7bfGF5MbO9+ga9kyTMe3ZuAbFM/WwBuk7NMpRSsYnTM28Ci3YGth9+e
 lWrQ==
X-Gm-Message-State: AC+VfDz7IMyRfTdljsQHV8D0PINWbnmdvGUoARW9UYJ9lf6Z5Af3yZ3C
 akQeiKM8I90aFAevk6Z1UtcI3cnU0qggV/dZt3Q=
X-Google-Smtp-Source: ACHHUZ4JdyyWFR++dX6pa3JXiXVqqt9CDs4SPAzYIRtQkywKq6WavRq7f9aY3UIHbsx7soKiGSxMfGQWVQTLzox9pZw=
X-Received: by 2002:a05:6870:5a98:b0:199:b01d:e9ab with SMTP id
 dt24-20020a0568705a9800b00199b01de9abmr1614938oab.2.1684515669965; Fri, 19
 May 2023 10:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230518135208.996214-1-hch@lst.de>
In-Reply-To: <20230518135208.996214-1-hch@lst.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 May 2023 13:00:58 -0400
Message-ID: <CADnq5_NcuBpY9piiefc1tt9obj_Wh1GbVW+rSykDhaLAQaFqbg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: stop including swiotlb.h
To: Christoph Hellwig <hch@lst.de>
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
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 18, 2023 at 9:52=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> radeon does not need swiotlb.h, so stop including it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 2220cdf6a3f680..04df08356d553f 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -36,7 +36,6 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/swap.h>
> -#include <linux/swiotlb.h>
>
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> --
> 2.39.2
>
