Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F49482E5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 22:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20610E2A1;
	Mon,  5 Aug 2024 20:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MrhaOny9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8296710E2A1;
 Mon,  5 Aug 2024 20:06:30 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2cb4c584029so8391a91.3; 
 Mon, 05 Aug 2024 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722888390; x=1723493190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhhwNjysRV1ApJpRrTYi20sRokbUvK79VIcbcb1hQIU=;
 b=MrhaOny91/MczerT64sABxYtwSDFWXpRYNH/kT2IvJ2z+jJWxR17f4GLZsAKs+yQYd
 5rKz+eCY6JtC/Swyn0CPHWEd5RTT1tpuIkuvjE14j5GmdGrKI639TdW7Lsk5tLLt8dTy
 ZA8LfLL86BglaGBTlmhzwxT2owUVI1tImT9w9zBwjXG6XjsPWk9PrElTGf/o6ZP0xXZB
 QSIIdOCuFFjt33qhOQ2l3eZya0dm628Okef2B2lLhkYWKVO4cT5MNN2RRncOi2pPhX4l
 P2uxEImKQXXSqUgYsJe2DR58LYQHHEyjSlqYF1nzJXWU052sQ6DfHHoZQ3quTxZRit73
 /ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722888390; x=1723493190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhhwNjysRV1ApJpRrTYi20sRokbUvK79VIcbcb1hQIU=;
 b=ptG+4EGdBn248uDKMHcqXsYeBFH1w5lmftldd/cCgef2+FhT/nJcVPflvPOMyqgZNt
 MVd/2ZMHBurzI5ethjfsL+5IxQEAIt3CQq3tHC9TrmrSTN0iDGRiOhYpat+o9OxKrQEU
 aqUmCvgZ22E9qhfFeJkTdQsOyzp71tBgz/ZTMi+h4xSMdkJa0CSJzJ07eLGK9mmRkgLR
 v8T38KI3J+wyuYfOo3bULAPQfFA93jBe0xjGlWN8cLcIdkvJeERWGx8oQjSDnDGmBC1e
 NmPacfTjkbYpmLqpUTPGMlSw92cqvyxhnhsEH+urETMBKCH7q5/Vgzm3+oB5i0Doq47v
 9ugQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSZ0wl5ynON6h8d4+qaIvsKTAeEu3qaIDdeALRoj5xrvfD5eXj/su9mhsIIOkENuZOSa8Oe7aILcEhtg9dCfU3yLd3W/UC68j7jQYG1L9O
X-Gm-Message-State: AOJu0YwOHUctAxyABr7iHD+NCMytMelzchY2A+5zf9MfhhDKSPByqgcp
 W/lSxwSiM5TTcg15uEOkgQXKxiZaWJqPsNoBEwvSu1BWCcCC8LFIDPNQIV22XZHkbCYnpdOS5nf
 Ng8+457+wTgLID0lS05dEhFaLhTRxMw==
X-Google-Smtp-Source: AGHT+IFRPNtDJR1LFejyrg8XiakZOiGzS9Uk+4UHp48b7BTue3j4pJ6Q3mck8pz/FbAcnuik1/mUBeAEwTKahh5lHOQ=
X-Received: by 2002:a17:90a:a417:b0:2c9:6f5e:f5c1 with SMTP id
 98e67ed59e1d1-2cff93fe5c5mr12697459a91.10.1722888389853; Mon, 05 Aug 2024
 13:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
In-Reply-To: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 16:06:17 -0400
Message-ID: <CADnq5_Oeh-pzGQG55xv9u_fYjrdWrcCBy5-rFxX+X8mW5sBYeQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd: some trivial fixes
To: tjakobi@math.uni-bielefeld.de
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

Applied the series.  Thanks!

Alex

On Sun, Aug 4, 2024 at 10:14=E2=80=AFAM <tjakobi@math.uni-bielefeld.de> wro=
te:
>
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> Nothing serious here, just some bits I noticed when reading code.
>
> Tobias Jakobi (3):
>   drm/amd: Make amd_ip_funcs static for SDMA v5.0
>   drm/amd: Make amd_ip_funcs static for SDMA v5.2
>   drm/amdgpu/swsmu: fix SMU11 typos (memlk -> memclk)
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c                  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h                  | 1 -
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c                  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h                  | 1 -
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 4 ++--
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++--
>  6 files changed, 6 insertions(+), 8 deletions(-)
>
> --
> 2.44.2
>
