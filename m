Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA89EDDAA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 03:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C6A10E7F3;
	Thu, 12 Dec 2024 02:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fov3K2Cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F7610E7F3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 02:31:45 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4afdd15db60so15690137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 18:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733970704; x=1734575504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=;
 b=Fov3K2CgmkF9Lp2Zzeu8qiJE0er8WEpkAizTdgY3bXLqnoZsXwYisVQIj/R8rZtBRE
 e1RcdLkcM8hOmciNknfPJdTKyAlaLN6r6JlPSLjI7PhMFiQ/iEduw+zJ535/OuLGlcoM
 F4qTy4USJr43nfa+zYPIj/r4mheRaRqYTwf19dS+Tsoc0dPO96u5be44fx1wwrHLI8OC
 92JxEmerymw9dvZhTNOwOcIC+3H0Ig6CVSFzKwGxEnqG4bbo02LmBrfpLBf7OdIaiW8r
 Z6BFjY5ljJR5xVBUxqXS7JCQcdxi/jvVkVlkfggg6xgn8E36Rt8agrJ/X+YMXwSuYEtT
 uleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733970704; x=1734575504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=;
 b=Lzwetsm8sdPiy5+zmEkV4NkLeWbIcFXegfKePg5vHGriihvR7hl3YZKGJIpzDUw5jr
 ImVpSatz/QBOkyqKEuaapK/K8Lit204AFCMsJn6UyIN6AWDzYGRvp6yfxVztl7oK5a4a
 lnXy0FAxdnjnAINdjekjBvGmKYy0ngNGvhwl82febY5O4POqGQVfuoq7jLqI371ce2K9
 gs5UO30gszFI43kmwWXqAHq9IauvHmM5Ntf62kVzqIds9ltaAiGSNU8YdrnW4XAgztYP
 IvJ3Wrf9eJC8Ja2/8TplW+Q+3dX6A33Qa+SH/+gl3v7pX3M/4uAEUnSBNlrFrOo0ewAY
 pNhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW64ENTGc8Lou8UNw4y2xnF4o2svdnwEB+OeEtzQ58X23mCGooU/wB8C+oZN/nix3Fj8hVBzXqHyec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3vecsJRBqSLAqxFL5s64s0Hfzj724QByUEXwF6c4VfUcNRqXe
 zreqr6EtnGpgBmnbZs9cbQsHq917rQFxQzKwsX87U/PEp5wqX7qtKuv7spBHCXzLROVjcacSHhz
 D7OaUO0zkg2Q4jAN3pY0hTv/ljGU=
X-Gm-Gg: ASbGncuozr3xVU+8eGe+Fpj2IDtURa1OX7LcmsNG67HxshPksgfU6AatQN69kDTIFgZ
 1NnZhywXLoAgTd+xFQ6KQ+ynmSaV2vhoQOrAg
X-Google-Smtp-Source: AGHT+IGNsNCgBmG79/swXJPi8C8zSBdsU2p2UOH1lPp9B1MI1N0EIazQCQv3y3EW1IUuXeOyXZY2BygT5h26W1N/y5g=
X-Received: by 2002:a05:6102:b11:b0:4b1:130f:9fbb with SMTP id
 ada2fe7eead31-4b2478e161amr2912068137.26.1733970704638; Wed, 11 Dec 2024
 18:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 12 Dec 2024 11:31:08 +0900
Message-ID: <CAAQKjZMuJc1y-6apj6KMVrg6WMVkLbpZ17A=+G6X1OJep+4rPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Remove unnecessary checking
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
 simona@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

Hi,

2024=EB=85=84 12=EC=9B=94 6=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:45, G=
uoqing Jiang <guoqing.jiang@canonical.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> It is not needed since drm_atomic_helper_shutdown checks it.

Correct.

Merged. Thanks,
Inki Dae

>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 2a466d8179f4..461384705cf9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -357,8 +357,7 @@ static void exynos_drm_platform_shutdown(struct platf=
orm_device *pdev)
>  {
>         struct drm_device *drm =3D platform_get_drvdata(pdev);
>
> -       if (drm)
> -               drm_atomic_helper_shutdown(drm);
> +       drm_atomic_helper_shutdown(drm);
>  }
>
>  static struct platform_driver exynos_drm_platform_driver =3D {
> --
> 2.35.3
>
>
