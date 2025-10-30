Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB85C20E32
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD02910E9E0;
	Thu, 30 Oct 2025 15:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P5C95DD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1010E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:20:33 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-340299fd35aso186750a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761837633; x=1762442433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4n2ZAbC/7CporyooiQ9y7Oblbi4ys3ElhAZOq431qrQ=;
 b=P5C95DD2vRwUcZ+E+z7IhDrdS+X6e76HdhTtNkjKYGx6eqFxYCL1C2yqOpicztrt2x
 prlQolsJ7oNjdNxKx5IwYB4dAvIWvXKssdI/Sab3X7CUAmcDm0JtQ8vui81P9JN9qRFU
 eI4Ex3B3ONnbmadvL4hxgT62IowoG5xDelZgNKwXazzGJoCS3+GRbWTKuVgqwbmC6xzz
 h1K2lRE335d2+AdyN9MTDFrtby17PcsK4nW0XmJ0UsHbgHJd227mw1KJfycRYJnyPtvF
 ER2xd1x6hmst7iQfEyu8gX/1H64CZciH9B+rEDiOlRq1XhLHjrDdCCh4Z/7cDdXYMDEY
 lxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761837633; x=1762442433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4n2ZAbC/7CporyooiQ9y7Oblbi4ys3ElhAZOq431qrQ=;
 b=B97hOWYe9Zru6TKe8FaBBSYG3q2BhfHPqdGqxzUJqvYF0qFB2jr+vRVkEGQAMR3MvB
 QkyN9b1/B+nzX1TmVLHJidSBdYdxrKilAJH/MuOn1EPjt4WgY3MB+6V0N99hOa1pHCfp
 3VScS8xIxLGvuCIIEO2aTc7to+OPOQH47sCUh7yHA0dg0tgrx2BmFBY4IsAc/zUYP0za
 vFABX4Nk8Unesi7OQ5ochChViBPaEjYdhQtRmDQVvNAtznRAHIrZjwk1SLpESyx/7UZW
 eRgD6SsnqXrxfYGCnmiCtvMfLh4owVPKBebXuQUIO7M0RPK4eoF0IAPy7wbbH8ws1YXF
 UPhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/xyIMpMkKSpiH7V/X1bNWNZNl9kMSOYij2D7ZFCLzBmGSFT/7rGEzl25KY914uy+I5McUlei8YtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAklyVKAm4ONYO9q99mC1TrQnRsUQIjkJwrY2RGvXSdtCHg2V0
 wXjaAOEPopqlDRQvZKvArOS/Y3bMiAHb6XtRENomte5du88Iofb0UN2iqM7XMLQBJRPwyP11REe
 KIO4LJttOc6hbWrjw5bgMNZX35rO4NII=
X-Gm-Gg: ASbGncttByGwNCTY+YVHoiIZUak3Hiv7C4wt/sNIZd0JucmYKwUguuN9U0JLbJxUY1v
 7PLwGkFlHI9SMiurRq/T8RAbPOW6p8Qwe41lumi4h7eep3Es01ULPHo5CwbV1+fpOuHiuhATkpe
 i9u0VjpFgLGPreUI+rJNM3pRjur7HO35OHmPXdYPVFMTjUjkI+5BSxiVnSWd03zsQO8FxPnDxHK
 kXI99ZpDRgdfOy5yaqjDNWq8YdH2Z8Am5hmsaAXQlaMvWP+/AhyYroHb8hH
X-Google-Smtp-Source: AGHT+IFb9s2heQmxBOs16F9sJ4fOGsoBxkOFOsxPxU7gqSkUUjW9axA4peKPZGOc6kGJhiEtISZ7fWFZ7zDcJ9fzKU8=
X-Received: by 2002:a17:902:f395:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-2951a49dd38mr397265ad.8.1761837633262; Thu, 30 Oct 2025
 08:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251030143737.136120-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20251030143737.136120-1-lukas.bulwahn@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Oct 2025 11:20:21 -0400
X-Gm-Features: AWmQ_bmVii5Alx1O5jsx56pQkAEpJlLlfevil6R4SK7ejJJXXuksGVL19-p25ec
Message-ID: <CADnq5_OR72MJvXHTGzzW-oP+z8X=7vQiCpytmuBJNsN7=Tw=pA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in AMD DISPLAY CORE - DML
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Austin Zheng <austin.zheng@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 waynelin <Wayne.Lin@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
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

Applied.  Thanks!

On Thu, Oct 30, 2025 at 10:46=E2=80=AFAM Lukas Bulwahn <lbulwahn@redhat.com=
> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit e6a8a000cfe6 ("drm/amd/display: Rename dml2 to dml2_0 folder")
> renames the directory dml2 to dml2_0 in ./drivers/gpu/drm/amd/display/dc,
> but misses to adjust the file entry in AMD DISPLAY CORE - DML.
>
> Adjust the file entry after this directory renaming.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d739e18aab6..7031ee1e7cff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1080,7 +1080,7 @@ M:        Austin Zheng <austin.zheng@amd.com>
>  M:     Jun Lei <jun.lei@amd.com>
>  S:     Supported
>  F:     drivers/gpu/drm/amd/display/dc/dml/
> -F:     drivers/gpu/drm/amd/display/dc/dml2/
> +F:     drivers/gpu/drm/amd/display/dc/dml2_0/
>
>  AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>  M:     Huang Rui <ray.huang@amd.com>
> --
> 2.51.0
>
