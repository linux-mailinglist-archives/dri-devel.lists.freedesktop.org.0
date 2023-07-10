Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6F74DC41
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFC710E2B3;
	Mon, 10 Jul 2023 17:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4109E10E2B9;
 Mon, 10 Jul 2023 17:22:09 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56344354e2cso3358925eaf.1; 
 Mon, 10 Jul 2023 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689009728; x=1691601728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2URZjHoSzSdFZGhiJ/VRg5MQG2hq7x25wO7hMvPNMM=;
 b=c1SAQjQCpoHXWp5nZdwWBuFYj+dfYWIQZ4DTW397XSdxmeJztJjOJD/zhRL3+fKhmU
 jlMElbbizYtyN7AOXhiQPQ2UWMLebWkNr48afVJoWlDcTPHV1lUyw8HIUDW49VnmpzNZ
 E579nGpBsdIsmT3uvpXshkE60VMBCPepIbsGA8MyqHnCX9GX2ZT6C9MVx2Wzsz+1SL96
 I3PAXdK/OB0rFG0v9M0kLUAPC5zRawGIINBeCBn+hSoqJywGwMtB3M+psItoynLsmGs9
 KzFZ60m0o7jPjVtPm50kf0u1daNpKSuDNJML0PWk7UO2y4ZRQaY41ivNujcHmsz6ZM1D
 2ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689009728; x=1691601728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2URZjHoSzSdFZGhiJ/VRg5MQG2hq7x25wO7hMvPNMM=;
 b=EnnKomCvYOQ3IYUj/7xPSKsV7r3eWRclhQKoGMuR8jHjjG4rfdGzZsEc3bbfEFW4jx
 h6A6IDuo08ICup5Y81es4MmU4zRGyGbTiqCXeMb4ae03k9P3nNLSrPmBnbyn5u0zaESx
 OLQv6tu3QCIy6AX0nzF0+7AGxSlLnnqXydtAzpSmfSF4XQdJn8I/aA1AaeTs+PkJHLXm
 B2ibpDPJQfJsZZGQmiLr9UYBubzX9iqi/Hhvjy4OP23pdJhUO6ziIp9mQ1Ya0L8BF7PX
 +n9RHlvYxoeQzJQXyqyB17+wxeZC5FOpoaNUG6uTWmNAVj6uCnCJY13dCxEAERLoF1mj
 XCZA==
X-Gm-Message-State: ABy/qLYQPfqW+RazlnFPwd1Yk87PVaNMglyzfTSneMHEvlDYxIGnakZr
 nalSGS25iLrh2fkZbIDSALkKspur5BnxgYWKKbc=
X-Google-Smtp-Source: APBJJlGRNm/9SaOFBDmmcSSOrC76TrdQEZJHDGjiF19hRgY5GQuIkZPqthqMvq+sqpBGG8TAM6ol9kfvIYhDP0o1W6M=
X-Received: by 2002:a4a:d649:0:b0:565:86fa:5de6 with SMTP id
 y9-20020a4ad649000000b0056586fa5de6mr9890899oos.9.1689009727950; Mon, 10 Jul
 2023 10:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230710074943.54300-1-xujianghui@cdjrlc.com>
 <21106d58871949c9f301c1bab81ae111@208suo.com>
In-Reply-To: <21106d58871949c9f301c1bab81ae111@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Jul 2023 13:21:57 -0400
Message-ID: <CADnq5_NMTbJkCyttYCqrYVbaz2qXveHEk4JQiAaFaV73VP2FFw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: ERROR: "(foo*)" should be "(foo *)"
To: sunran001@208suo.com
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jul 10, 2023 at 3:52=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix four occurrences of the checkpatch.pl error:
> ERROR: "(foo*)" should be "(foo *)"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/radeon_test.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_test.c
> b/drivers/gpu/drm/radeon/radeon_test.c
> index a5e1d2139e80..c9fef9b61ced 100644
> --- a/drivers/gpu/drm/radeon/radeon_test.c
> +++ b/drivers/gpu/drm/radeon/radeon_test.c
> @@ -156,10 +156,10 @@ static void radeon_do_test_moves(struct
> radeon_device *rdev, int flag)
>                         i, *vram_start, gtt_start,
>                         (unsigned long long)
>                         (gtt_addr - rdev->mc.gtt_start +
> -                       (void*)gtt_start - gtt_map),
> +                       (void *)gtt_start - gtt_map),
>                         (unsigned long long)
>                         (vram_addr - rdev->mc.vram_start +
> -                       (void*)gtt_start - gtt_map));
> +                       (void *)gtt_start - gtt_map));
>                   radeon_bo_kunmap(vram_obj);
>                   goto out_lclean_unpin;
>               }
> @@ -207,10 +207,10 @@ static void radeon_do_test_moves(struct
> radeon_device *rdev, int flag)
>                         i, *gtt_start, vram_start,
>                         (unsigned long long)
>                         (vram_addr - rdev->mc.vram_start +
> -                       (void*)vram_start - vram_map),
> +                       (void *)vram_start - vram_map),
>                         (unsigned long long)
>                         (gtt_addr - rdev->mc.gtt_start +
> -                       (void*)vram_start - vram_map));
> +                       (void *)vram_start - vram_map));
>                   radeon_bo_kunmap(gtt_obj[i]);
>                   goto out_lclean_unpin;
>               }
