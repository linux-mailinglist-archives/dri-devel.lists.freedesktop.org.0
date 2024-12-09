Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815159E9C93
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 18:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF1010E4D4;
	Mon,  9 Dec 2024 17:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="iEcDddDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6BE10E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:06:17 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6d88d3d1eb6so44018146d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1733763977; x=1734368777;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CEAfsLVBfsGUy76+oFFFHqlf6kVm31lMCS/pgQCj+NM=;
 b=iEcDddDo/Dfu72WJXTvOTmfBSDaV9g3FGedStDy7YHvvGLmpLhMKDDkIt23xNc60a7
 qLjKWCeklhjSayc7xIfLZI+Fyq8AYmrRT5vxzHekAp2LMpJRqgYE3yxXHL4UULBkCm+3
 afv5QLe8CK7QBLNwnEeg1Bw9UJmX7s76uVr9jFcPu0e30L7V2Pw1XRMi5MoKXf/cs8yn
 T1scdOAYbIsD6iW5AkbmUGWgsyVz0p4vUzG8+uLrnVASxfG9eKlsTvgbRF1ufK99C1Yb
 1EXvapIuADVDMSgUUD/S9UPwWuX8tUMy50j66/xEN1B8FF1F/tMFAqBFlsJR0LmIbfV2
 SAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733763977; x=1734368777;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEAfsLVBfsGUy76+oFFFHqlf6kVm31lMCS/pgQCj+NM=;
 b=mFhj/v4C6uEjbFU2Sz0B6BWlHIsvQtcdq2w1aGrR3Yjabm44bmtdo/rIxoOTFhrtVz
 t6x9t+0KEGpVHOAw6MhLDHY4a89r1gUUH5SViBjxL6zKCgMrmP5s+1O8CSdwDr2EqHIZ
 +smjcmjz4Ine+ODilC+AjWvYTTW+M7Zh5vFDvuav59jJVeY2z0I0Nr0F3cgD43rXkoSX
 1U/4LKUkfcRIkLFFiPiM9oDD8WXsjRpE437Av5WO3Vg3Kh/XQjJlJEM1CqSXBZTTTEvd
 thhfoeeU6SUPWf1EsehkYH6MFR/Bj+jiYYrEQLNeiOI4EOPg7bzl+0XgEId/evrbNVc2
 IOcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpFnaBUYxH/vWjFAkBEUGcmemw03SgtjMCDCRDe8fkBXL54YbORklD7iyXET2pmMReMcbPVtkS2Mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXDWb+dQLItEoxdHJi7rAKCr81J6gL9gPZSwuQj6Tr3G67Yt8J
 MfBSQzj6U+QSJ8Yg1VBezsTGFeQIy494xA2KK33afUVogJ8A5hYQ5JPesjxJPwwjKxYJkh7jbA7
 /QV6B6g9fvQIhKoNv946BVVE4d87dwoSZXNH3Sg==
X-Gm-Gg: ASbGncsyXLGeawA0Rvl7/pqiMWNfKQTNslWK3MxbYjgff9DswOe6UzZqYNFe9Zr7hma
 o6IVgFkryim3cVOrJjfZ9eKEAF2Jj
X-Google-Smtp-Source: AGHT+IGAVS5+GIVv09oM5aUfkNYSqKqLURj0uHGDQYo0Hnrn9PDydwzeP97lSsusJEmrWZvi9Pv6yK2sFETMgjF0y6Y=
X-Received: by 2002:ad4:5f8d:0:b0:6d8:8283:4466 with SMTP id
 6a1803df08f44-6d9213835acmr1371546d6.18.1733763976815; Mon, 09 Dec 2024
 09:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209123215.2781721-1-andyshrk@163.com>
In-Reply-To: <20241209123215.2781721-1-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 9 Dec 2024 17:06:05 +0000
Message-ID: <CAPj87rO0MG2yE_NTndbxQ77rW-p6-ht5kx5vsaOZikQfVmwrgg@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] drm/rockchip: vop2: Add check for 32 bpp format
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Andy,

On Mon, 9 Dec 2024 at 12:32, Andy Yan <andyshrk@163.com> wrote:
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index bd8db45eeba6..1f101a3c3942 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1224,7 +1224,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>                                 return -EINVAL;
>                         }
>                 }
> +       }
>
> +       if (fb->format->format == DRM_FORMAT_XRGB2101010 || fb->format->format == DRM_FORMAT_XBGR2101010) {
> +               if (vop2->data->soc_id == 3588) {
> +                       if (!rockchip_afbc(plane, fb->modifier)) {
> +                               drm_err(vop2->drm, "Unsupported linear 32 bpp for %s\n", win->data->name);
> +                               return -EINVAL;
> +                       }
> +               }

Please do this in the format_mod_supported() hook, so userspace can
see the true support of each format/modifier per plane. This will then
be checked in drm_atomic_plane_check() so you don't need to open-code
it here.

Cheers,
Daniel
