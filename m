Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB876013B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D1610E365;
	Mon, 24 Jul 2023 21:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA3A10E365;
 Mon, 24 Jul 2023 21:34:42 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56584266c41so2969345eaf.2; 
 Mon, 24 Jul 2023 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690234482; x=1690839282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQkyjTBZJxu5zihmRYWARPnkRRY4L/Ob/JNKh65ICMo=;
 b=KlSqV22VreeIA6EwsZczaYagWE3+2tI2g9j3O2LBRreCtimrY+1W8JfemEqwndlmBe
 6Vgxi2JlUvNyuDDA/Jpr/LtEg6Sny/j1+whRPloxBEMKTZD2jNeRWBXbTdLo8JEaf+it
 upfujjajck9FaqAGMBK9SMa6JdEIPp0K+yQI8F+qM3voZdxjSoBCB0QQtaJ1ve3bZHHj
 Iw8zogLruFdju5dswuvEFeJu4TyvOoxxgdwhaNWWatsxD6yqOVlfm91m/ShLMSRj8swF
 viMAUZFl+fMrimEnchx7GJ3E8aLN/1PHoEw4i3zLL0GtuMP978to90a5Q4lDssEmjhKt
 bvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690234482; x=1690839282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQkyjTBZJxu5zihmRYWARPnkRRY4L/Ob/JNKh65ICMo=;
 b=IQ8J72UM2He1fQUf88EF7NPazH3OXApSmsonC2asqavbIUQC6+azF+jKJlB7qSnZMV
 ys65QJG4VmPMCNIDLS4djBQUnJtmDLHkMKsxDZBGlEEZfuQq3Kfx1yfzIA09L+2+q1Ul
 s07xwxMykDpagYhoaXvnGyxeNE4jPO5KNo2mAvedTKntusgW6VtP39FvXn5ufYipSFRA
 RzifF1/fnFKjT2kjnVIryJBKR0za5yiKVo/eB3vw96LMwE6WGdLFSjdag8vhTAS4kC27
 FYUMyOv20yZLkp5vwK3XcThrbzMNG0XMZ32mzG5s2MnxdV0SF0g0Gm7fwVIYOvIEkKv9
 VQsA==
X-Gm-Message-State: ABy/qLZR++e3OHKfWIL+EKfmpRo2/hTreNcxMr3uOCisS6AyIZhpLHrt
 i8Il2JsL16Kbdh8+FffsJJKpCELQPhT3Yt3Hir0=
X-Google-Smtp-Source: APBJJlELA15kpf/2nXafUx7Wqq9khE0QcLJc72In7q9KWoXK4MvpztOWeMWheJD756QbdaHJfrKJ5cH9pU8RiskN8L0=
X-Received: by 2002:a4a:9cdc:0:b0:566:f869:6d90 with SMTP id
 d28-20020a4a9cdc000000b00566f8696d90mr8758676ook.6.1690234482025; Mon, 24 Jul
 2023 14:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230724025911.7528-1-xujianghui@cdjrlc.com>
 <6c16a6c089033849af90ad35fe86515a@208suo.com>
In-Reply-To: <6c16a6c089033849af90ad35fe86515a@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:34:30 -0400
Message-ID: <CADnq5_Mofm5ESN6mveMnqeejx3T=CvJ8XH5i10LrLiR29AvPZA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: add missing spaces before ';'
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Jul 23, 2023 at 11:00=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: space required after that ';' (ctx:BxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/radeon_vce.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vce.c
> b/drivers/gpu/drm/radeon/radeon_vce.c
> index ca4a36464340..d1871af967d4 100644
> --- a/drivers/gpu/drm/radeon/radeon_vce.c
> +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> @@ -95,7 +95,7 @@ int radeon_vce_init(struct radeon_device *rdev)
>
>         size =3D rdev->vce_fw->size - strlen(fw_version) - 9;
>         c =3D rdev->vce_fw->data;
> -       for (;size > 0; --size, ++c)
> +       for (; size > 0; --size, ++c)
>                 if (strncmp(c, fw_version, strlen(fw_version)) =3D=3D 0)
>                         break;
>
> @@ -110,7 +110,7 @@ int radeon_vce_init(struct radeon_device *rdev)
>
>         size =3D rdev->vce_fw->size - strlen(fb_version) - 3;
>         c =3D rdev->vce_fw->data;
> -       for (;size > 0; --size, ++c)
> +       for (; size > 0; --size, ++c)
>                 if (strncmp(c, fb_version, strlen(fb_version)) =3D=3D 0)
>                         break;
