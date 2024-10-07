Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C639922A9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 03:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7CA10E2E9;
	Mon,  7 Oct 2024 01:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jocggA4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1CB10E2E9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 01:46:39 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-84ea36b65cfso775100241.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 18:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728265598; x=1728870398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I7P4o4lqoq+/5/fIQFIlC3dJz4di8qGjmyqkb1fWR8=;
 b=jocggA4CI4mXfzG7eXXdIdjSzqwuowwbMrLGVOVcc+3k3axeCdf97T4Auz6KIyfkBv
 60LjJprAC/CxqiMfpbJSjsqKxOBXxCQ9CUOhSGsnnnYFsuzHYpZL/b3UOlcOJbhDkeqd
 hHBfY6xY5hs60gRdHUfA1VcsSo6Rauo9B9biKHGuejTO2WL8/Q/qO6fR9BIlmpOIaYWM
 9gOf60y2CE3zW3iZmjooyA8F6dSVFyf/XlI/D9ZcdXJa3HZWbOu/MqETZhqpr+br62Fn
 4zKNKbNd51PuCKmPPxQI4s1C510583UxzTQfAO1H/kvitvPqXz+zRuJ4pR3O14ZYi0ld
 8GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728265598; x=1728870398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6I7P4o4lqoq+/5/fIQFIlC3dJz4di8qGjmyqkb1fWR8=;
 b=HowqF7OKVr05mPOnurKPxsH0aqhMTipdFzqeQfaE/29wV7APnsA9YVRTPKXVJbYMDj
 jByp9Bm0bsIyVO12D4Dn0/NsIkzvN5C6GN7kYexXsgXT5au/xkVZ9t43dJbybHH+yMCI
 N8kGgpHoCV70x0fMGmE60Hsmi8cSwS/KU3w4j27tM8pCx/H71xNU9ZgqN7Lsw7x2/MaF
 j6WY15PbLyJDbTtpcBa5u4YoQzHrLiwThLBS03f6+OKpj7FmJIXyRFPUSKcZ/dLMoUj7
 U2oaps0V4/c+hg6NgjJD8YufMbzTQoXGWcJ+DW8ZEUE5GgK4BzMPHd8O+f5tWdw6LyTe
 xIuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq0+xqyX71AcSFUB5zEoyTOh4sJCCybONXOq5JjB5TquqTmdPLLncFVX9lIugv6Zi+iJ7AulhCxdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4CeJ77l1DFAvAxJhuCUn10r1z7lq2hOM9jjo0TNd/1f2JN82R
 dUyM6xu09K+MqjV6E1A+37Nnt6raLc4h6g6pfAV4BIiVXP+vSj4zesVWffmB5UqU//U+cAR5yuy
 9j9M4x7bweifQ9mWhNjK3a/Ivx7w=
X-Google-Smtp-Source: AGHT+IHn77otsKYlNOvgcsPX5BgvnpzzQqomM/S9P5IjJKyLNB7h0JdstqFb1GMHjr7HniWTcTfA6P2c37takKxUm+4=
X-Received: by 2002:a05:6122:3d15:b0:50c:79a4:c4a with SMTP id
 71dfb90a1353d-50c855966e4mr5467687e0c.13.1728265598461; Sun, 06 Oct 2024
 18:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240926052608epcas1p39e2db7b275e944285d0925b3e5c649b9@epcas1p3.samsung.com>
 <20240926-remove_crtc-v1-1-9a20062444cb@samsung.com>
In-Reply-To: <20240926-remove_crtc-v1-1-9a20062444cb@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 7 Oct 2024 10:46:02 +0900
Message-ID: <CAAQKjZPkc+y47Pv87EmUhLJ9SFASOuMKgvvN0UXZcg11tkjaOg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: remove unused prototype for crtc
To: Kwanghoon Son <k.son@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

2024=EB=85=84 9=EC=9B=94 26=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 2:33, K=
wanghoon Son <k.son@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> exynos_drm_crtc_wait_pending_update, exynos_drm_crtc_finish_update
> are not used anymore.

Merged.

Thanks,
Inki Dae

>
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/e=
xynos/exynos_drm_crtc.h
> index 0ed4f2b8595a..1815374c38df 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
> @@ -19,9 +19,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct d=
rm_device *drm_dev,
>                                         enum exynos_drm_output_type out_t=
ype,
>                                         const struct exynos_drm_crtc_ops =
*ops,
>                                         void *context);
> -void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_=
crtc);
> -void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
> -                                  struct exynos_drm_plane *exynos_plane)=
;
>
>  /* This function gets crtc device matched with out_type. */
>  struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *d=
rm_dev,
>
> ---
> base-commit: 684a64bf32b6e488004e0ad7f0d7e922798f65b6
> change-id: 20240925-remove_crtc-9647baaab5cd
>
> Best regards,
> --
> Kwanghoon Son <k.son@samsung.com>
>
>
