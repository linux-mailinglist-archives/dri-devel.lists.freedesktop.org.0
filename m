Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6B3BD701
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 14:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB126E1D5;
	Tue,  6 Jul 2021 12:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347216E1D5;
 Tue,  6 Jul 2021 12:47:39 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id s4so1296901qkm.13;
 Tue, 06 Jul 2021 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+sEo+Ifpse8bLv4D5nk0jAr29bqXGXbxp11f7D2ypjo=;
 b=iUpwZcp+aNrbM6zeyvqFriNx13Q9LMedd+mlVbO2I1H7fP/g0Auax69brpXmDvRKd/
 aaUmQOUq1VKVcpYGLBqjMtQL3xKzDvBsWQQX7u5+lJ/YTy6gXDkBgFqYPk3/wRdAXSqz
 t57BCPbaOl3BB6TE4C7xpgBrvpw5+49Wn80v5nA59RFanRl0GuJorS02Ttbw1mG050de
 wejk0LkUa+YI5tsfNCxcg1tv1DAPoQAxqPcmzj8zcCbROE6vbP2DHWFQYjGL3mChgnYN
 e1Y5caW+V07+PWL1N5J33Nm6+SrGoOqsJdmrPe+WIc/B4D+EpkRFQRsYZOvzS3+q/8Y+
 oEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+sEo+Ifpse8bLv4D5nk0jAr29bqXGXbxp11f7D2ypjo=;
 b=iwiJ2PSpXs5oLNyFGWnF0FWXh56f8+blb+b3OgTMiKFPnY69q69FKdhMZXdL0KNhEE
 ZhnNPx0dxiKHY4GQCeIK/v12m/wAbPehHcoPvG8aJ48j7IUMhMrvuN2DEmsu0payTWH7
 cTxr9D4IOdGIOy/6NU2GJgLOp0Oo8KmJHaLg3oe222CJvMJL/LI8AVG/Ba7+PY7xCGXB
 M1H+RWfa4N6aSS9pxWHHMYV6lPvvfjia1cSaT7dtNckfz6rkGc5maib8/hG/Ls6CDU4N
 acJgpPlaJXqlTSTVDTjG9mwgEA75vK4WTOoaFLbeoqKwrCQcn+ZDJDR+ym/UMu2iG+rZ
 G+6g==
X-Gm-Message-State: AOAM533B/g2l3gD8+9jAvLiyjl0ch/1E31+Tvwwa7GOt89eB3lpTqpeU
 J/wNPqaTpIiGx/1JlHdM2i/tHFZcfj59j/6FSY8=
X-Google-Smtp-Source: ABdhPJwMoBvULgiEfVZzWuUUKkxYKT+XZkzlQAAK+FylzWkJDVPSxErrOYlOE0ZWarKPudpXpiH3pTdgOIWoyMhDNGs=
X-Received: by 2002:a05:620a:1479:: with SMTP id
 j25mr19587051qkl.426.1625575658359; 
 Tue, 06 Jul 2021 05:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210706101209.3034092-6-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 6 Jul 2021 13:47:11 +0100
Message-ID: <CAM0jSHPqCQ58hnCkShZVq93k3y6J6cNJsyfagXdu5Y1zEN7NtA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915: Always wait for the exclusive
 fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jul 2021 at 11:12, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> We're lifting, or well, clarifying that the restriction that shared
> fences have to be strictly after the exclusive one doesn't apply
> anymore.
>
> So adjust the code to always also wait for the exclusive fence.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/i915_sw_fence.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/=
i915_sw_fence.c
> index 91711a46b1c7..271d321cea83 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -601,10 +601,10 @@ int i915_sw_fence_await_reservation(struct i915_sw_=
fence *fence,
>                 for (i =3D 0; i < count; i++)
>                         dma_fence_put(shared[i]);
>                 kfree(shared);
> -       } else {
> -               excl =3D dma_resv_get_excl_unlocked(resv);
>         }
>
> +       excl =3D dma_resv_get_excl_unlocked(resv);
> +

The dma_resv_get_fences() call looks like it already fishes out the
exclusive fence. Does this not leak the extra ref now?

>         if (ret >=3D 0 && excl) {
>                 pending =3D i915_sw_fence_await_dma_fence(fence,
>                                                         excl,
> --
> 2.32.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
