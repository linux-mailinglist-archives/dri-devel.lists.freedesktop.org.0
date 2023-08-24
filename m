Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0F786A53
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D543610E4EF;
	Thu, 24 Aug 2023 08:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A28710E4F2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbW1FngvFUK7KWlxfPdST+Zwcl1JxZSoJl2PteoHaDs=;
 b=G5iM+VJwol/JxIC0faEYlwNrC9c+sdp+1HRjue1YT/3kIeQQpGcOZ2Lukuu76njBc2X1lc
 Mm0KjflpEbnzVXRDZ4ElXy0at37PV6O+AF3rHNtKPtnXnHqq/4FemtgYv86cBQ1JKOhJ8q
 PeOX23532ZOV/xVK1Z3ZwOewD1h8sqI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-fP4KHaPTPSSZ7obMliL5ww-1; Thu, 24 Aug 2023 04:42:15 -0400
X-MC-Unique: fP4KHaPTPSSZ7obMliL5ww-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2bbafb70ecbso14129641fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 01:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866533; x=1693471333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbW1FngvFUK7KWlxfPdST+Zwcl1JxZSoJl2PteoHaDs=;
 b=LQMvzUA3qXHv+zO/YnugI/ILnMoKUphQGJroh3Yl/+JuHetqGmNztpbP0i2QTxMe23
 m0DbbTG1+U5VfMj2rjcskrjFhgRkx9C2wRhm2TkXkQbHD6CaUxQr38C8FG9Mh1uKxnwc
 2aK3WumJS53LgohGB3DCLxsyGlal8YC+NAEuuN7qDErusIi/px5MVyrrHAcJ87Ao/90G
 JgN76UhpzUKR0eN2bRafgTC0n/3Fh5awXHffnYhu2hGxGi+PJCVJTn0FTTd8Qr3aBlF6
 P427KSTyOQt+Yf10jfS13/8ixPr6P9VVGC3+6wlrSZH+KPqeHyitmu4FLMkjvSIuMAQt
 sY7w==
X-Gm-Message-State: AOJu0Yydp3VknSRaHyFhsYPlCiHrzlW+a48maupRbAG7pmFQX21HPbBD
 AItKFHcxlXM352e8RZb5w1a7O2BCJoDlWa91qb+D/nZBHG/RknlIBKflOQSkfQG+lzzsfjYDQ3g
 bYy3BgFmikl4XKb5F8QrxpEKp5zcSNwGxEPd12Dxw750R
X-Received: by 2002:a05:651c:102f:b0:2b7:34c0:a03a with SMTP id
 w15-20020a05651c102f00b002b734c0a03amr10216701ljm.3.1692866533699; 
 Thu, 24 Aug 2023 01:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElJNjBNGCil9PiBaG5sCBxmyOojBV3da4X7jH+b9AMAG6B3VNG1VxewojaAZwNQ4H48vofhmQ8taWfMFeXp1c=
X-Received: by 2002:a05:651c:102f:b0:2b7:34c0:a03a with SMTP id
 w15-20020a05651c102f00b002b734c0a03amr10216692ljm.3.1692866533551; Thu, 24
 Aug 2023 01:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-7-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-7-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Aug 2023 10:42:02 +0200
Message-ID: <CACO55ttW6gmTLNOW+Ty34s77yOBw-FhL6gWZnuXYqQYjw4WxOQ@mail.gmail.com>
Subject: Re: [PATCH 06/20] drm/nouveau/dispnv04/crtc: Demote kerneldoc abuses
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 9:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:453: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:629: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/no=
uveau/dispnv04/crtc.c
> index a34924523133c..5454dbb669566 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct dr=
m_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] =3D 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_fr=
amebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.42.0.rc1.204.g551eb34607-goog
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

