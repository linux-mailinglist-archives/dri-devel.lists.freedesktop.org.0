Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C37C727E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 18:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E08F10E4F0;
	Thu, 12 Oct 2023 16:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B256710E074;
 Thu, 12 Oct 2023 16:26:37 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so772041fac.0; 
 Thu, 12 Oct 2023 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697127997; x=1697732797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBcJDMO8BqJFA0osnFXlLxTGR2LNlFZQr/WWXq6Wi0U=;
 b=bJlVJXF1FyeEzHMI9/o1HFwPs+XbeYFNhNv/Grwy+UXGvJytTVwq2zo/DfMdELTe/O
 Ab+tC5y4P/K3N5FfzvLTtiyvdwI5exh3mbmr/+5LvsvQ91aszpsEXKtvJ/wMj0ZnX8mA
 1PLtM2xCsp7xb4rrd9QhLZopj0wfXtZU3Fzw6BZ0PuFXQI5d+Dy45DrFtV7k5vDTnAnW
 pwnqEbi3BJ6hBiADmees7ITGH0CNx7+PIYYNeap88ctonCgb24RWs+cx0htlpkml6KzK
 e1swk2LoCgAJyF3n/gSaNfwjujqhFLAYvY28+/iSdofSUW/TQl+xhb+qRGf2vIftAqk4
 jA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697127997; x=1697732797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBcJDMO8BqJFA0osnFXlLxTGR2LNlFZQr/WWXq6Wi0U=;
 b=LZaKrvTlw6FIh9KdwUnt1keIp5RQeII67lyXKdwPfFB4g/8g+MFtRcBsRIUe//48Hm
 ICI9qle2hV5GimvO2ZhY05ivLpmrHxiCerhbgcdRVG8BltVKWzkB3j7KKFtoTm7JGU80
 UiE3o6x+fYGE8CKfKrTWTpJpkFBf2eSG+CXP3NtXqpvXjMgw6HeqU+VnTxCZRYZRbJdn
 x8X81f4tNP3hMo6JHKTi1NNtEhHz+942oumW5SBhy5gxjLhgNviugu4sDPLvvM0nDtoh
 6wdfBOMGwBLvfuFdVfpetjKKyuQjI7TvC6vsPm0H5BIGr7VAhbhQozJ6PtpIrk4BGu1Y
 2uXA==
X-Gm-Message-State: AOJu0Yw2rIb++VedCB8viRmVpgZ19JazXKWwxD80pQRen+Arev3hc7zt
 Q58GFYliPlVtclLI4t5uqrL8lD3GxXww9AQKMrmNFax1
X-Google-Smtp-Source: AGHT+IFUrc0sLwkm6fAdE0Ys+114EjlMatPYD8Ku+zVny9zH5yswsOsrwiyGA9vIiuPk7/4R78tUxC5ZFCCqzUPj/zU=
X-Received: by 2002:a05:6870:160b:b0:1c0:d0e8:8ff9 with SMTP id
 b11-20020a056870160b00b001c0d0e88ff9mr26744492oae.16.1697127996643; Thu, 12
 Oct 2023 09:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231011012143.4091532-1-make_ruc2021@163.com>
In-Reply-To: <20231011012143.4091532-1-make_ruc2021@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Oct 2023 12:26:25 -0400
Message-ID: <CADnq5_OzFoCDoOMRURXuh6fT=1KXwg6SGs=p4+jwpUqwimkNiw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix a possible null pointer dereference
To: Ma Ke <make_ruc2021@163.com>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 9:32=E2=80=AFPM Ma Ke <make_ruc2021@163.com> wrote:
>
> In radeon_tv_get_modes(), the return value of drm_cvt_mode()
> is assigned to mode, which will lead to a NULL pointer
> dereference on failure of drm_cvt_mode(). Add a check to
> avoid null point dereference.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index d2f02c3dfce2..b84b58926106 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -1119,6 +1119,8 @@ static int radeon_tv_get_modes(struct drm_connector=
 *connector)
>         else {
>                 /* only 800x600 is supported right now on pre-avivo chips=
 */
>                 tv_mode =3D drm_cvt_mode(dev, 800, 600, 60, false, false,=
 false);
> +               if (!tv_mode)
> +                       return 0;
>                 tv_mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PR=
EFERRED;
>                 drm_mode_probed_add(connector, tv_mode);
>         }
> --
> 2.37.2
>
