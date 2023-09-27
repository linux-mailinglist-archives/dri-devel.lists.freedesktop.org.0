Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772307AF8D6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 05:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6FE10E45F;
	Wed, 27 Sep 2023 03:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895210E45F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 03:52:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ad8d47ef2fso1240246866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 20:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695786736; x=1696391536; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gbudO+4G2j3i97UP7uLWqquSHrnG0YZoAgH3/yd4IYQ=;
 b=N1iNxD4/PVyBL4gJP2oACXcGjKjy403kDtwiU3FFKm0/Z2wX765G5vDVo36J2Rbr2+
 ltlreaeF/G3VicHEF1XSxmrlsIsQsWLksD+ryDbHcdIByFCG1bWRBW77fRma6pX5Z7A2
 BaG93aRsrkDuEp+cb3moKY76JDaQ6zWyC4iDIOKP2iWtJIvlFrBjRBEfNpRw9EglJ/mA
 sVtgeICXoR1s6FdZe1hsWtfk7wnsRGbkaqFtoXQH9ZNddeaFSbuloQPqsUmVFg6oT/R7
 ZkZ6nCEzBR2uYQ33h0MfK1/hvppZyYI5Ae/k+s0ReHgfYRHHJrAjxMEcoMbcRjxPS64U
 DLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695786736; x=1696391536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbudO+4G2j3i97UP7uLWqquSHrnG0YZoAgH3/yd4IYQ=;
 b=mumCXfdzu2GN5AyUp1yJEmMPGkW40lbrVKzOG/jJAsPt3Wu+tQdksf++5t5DRHHEqQ
 +rhSfZ65NhpfV2ymDBrXnlrokT0JiZAj1QP1aZx3e/RQTuVA+m+ZXMnn4iXQC3qm4gpp
 0p2hS273BJtjrsObSS4pf3bYV7KWBmA3Vckj/pFbYduaJcWhyKJj5AqexxbDWSnJdG1l
 CeXBzXbDhOK+WWVpnNZKWrO7ZuOMYnqV7W3up3om3M5XaKgJO/104THFQLZq2aXkovH9
 OdusAC1gwx4OKuTBfc7GgDWz5yDjbf37SUtL696lomqONfyaP0xTyLGC+29u+/SN5akf
 Avlg==
X-Gm-Message-State: AOJu0Ywu5dU1bwEdXUAo6tfHl8GmeHPbnWgRvCAbsCLz6NueAD4kVpKW
 9KBFcM+ql6D7wIu6IgbBxzI/1qw5QqGwKd0bwPw=
X-Google-Smtp-Source: AGHT+IHjLecfIjJaSS+8zDn1jdmYkVtgJJRdPD3qgAnh9MyfKbTdo/P7GLoNn6TCGPw+GhQbpuhlaIq7tmEuJoFL8zU=
X-Received: by 2002:a17:906:e291:b0:9ae:5c99:f2e2 with SMTP id
 gg17-20020a170906e29100b009ae5c99f2e2mr548477ejb.43.1695786736037; Tue, 26
 Sep 2023 20:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230926105146.10808-1-dakr@redhat.com>
In-Reply-To: <20230926105146.10808-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 27 Sep 2023 13:52:04 +1000
Message-ID: <CAPM=9tzVbuoufoEJuZ2t4LkDh0-Gj8xHYCs3iMPcCY=Ay1Jshw@mail.gmail.com>
Subject: Re: [PATCH] drm/gpuvm: doc: fix filename references
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Sept 2023 at 20:52, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Commit f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to
> struct drm_gpuvm") did also change the corresponding filenames which are
> referenced from the documentation, but were not adjusted accordingly.
> Hence, fix up those filenames.

Acked-by: Dave Airlie <airlied@redhat.com>

>
> Fixes: f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/dri-devel/20230926150725.4cca5fc5@canb.auug.org.au/
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/drm-mm.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index c19b34b1c0ed..602010cb6894 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,40 +466,40 @@ DRM MM Range Allocator Function References
>  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>     :export:
>
> -DRM GPU VA Manager
> -==================
> +DRM GPUVM
> +=========
>
>  Overview
>  --------
>
> -.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :doc: Overview
>
>  Split and Merge
>  ---------------
>
> -.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :doc: Split and Merge
>
>  Locking
>  -------
>
> -.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :doc: Locking
>
>  Examples
>  --------
>
> -.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :doc: Examples
>
> -DRM GPU VA Manager Function References
> ---------------------------------------
> +DRM GPUVM Function References
> +-----------------------------
>
> -.. kernel-doc:: include/drm/drm_gpuva_mgr.h
> +.. kernel-doc:: include/drm/drm_gpuvm.h
>     :internal:
>
> -.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> +.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :export:
>
>  DRM Buddy Allocator
> --
> 2.41.0
>
