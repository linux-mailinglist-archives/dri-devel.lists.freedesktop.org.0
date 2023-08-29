Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8178C6F0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9473410E284;
	Tue, 29 Aug 2023 14:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539D10E284;
 Tue, 29 Aug 2023 14:09:38 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a751d2e6ecso3315273b6e.0; 
 Tue, 29 Aug 2023 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693318178; x=1693922978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9NXVMwpSZjzi1EW/drhoYIcfeMOkgEiQn8oAztJMHeQ=;
 b=V0OGk5Vadr83Qa7RVuH/qYseQvGodk8qHCsO+ZMngUYwP89xFUMkMU4tvJIDIwkya6
 YDNYgptbxamCvqBlgiYALIRrUMWU7MtR50Dsj0h1g09SXkcQQd/1TiHoewUwyj8DuPTD
 s7GgROLycZawpcoWxbaogsaEhfHXjqojCQDOAU9BUF6andZUs/ickWBagz5kPtWUvPjo
 0k6p/2CIWdcXohaQ1U6lpfKjh3LOMBOsP75RSSG6s2l7v1MPMPo5gvhiKEYbckh/4Xs4
 3d9ulwZ9ZimqccxHpE1mcFkL0sFg1vp4o5nVW1tZPXvrQ2yeAnf5D+Nar/aWUZxb9TP5
 BdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693318178; x=1693922978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NXVMwpSZjzi1EW/drhoYIcfeMOkgEiQn8oAztJMHeQ=;
 b=TkDagSUO1I8svXiZCdug+fr4qpxd/sxYmMNaK7aUgwd9rKQyUN2BVa9y7+ZLSZ+EGW
 1o7/r8QsdgNNexq2fvBFrVIL/QDKlZJ/dnw+c7SWCQZeWbNhzQ2PwKeSGNNPNSbKXXCD
 lCerXXX02zTwEynXpmsV3GQyPkK7NU6hXZg74mlsoKa1mDF+SeJrKeVRSe+vtpaZxuUg
 EGAx5vZ+O+waM0D8tWKSFxH7pNNOlXgQK1RcVrzKJuj5WTV3x04eVx2JSnaW7HjzTccB
 x+ukVXeu5cIJfyf/3Iv6Kw+WdDOlJOaC6ettLaZUVNHa1cXXxKP7wRZgkoNRjty/YsMX
 Ijxg==
X-Gm-Message-State: AOJu0YwJ42XrLPoPtgxZYfWngXKpA+1DZrQQcxsi0aTiWkqHXHqBXTcA
 uXqC+q9/aovgrjobGlQTnQSAlza1nUOgpTrR+mw=
X-Google-Smtp-Source: AGHT+IHW07rLwA6rZ5tH8YoyiIaIaYTgVDGlb89CQpVWFwR0auPKiPgl5x5XnismG3SxABECMPqSHYzqoGqL6wDlBfE=
X-Received: by 2002:a05:6808:1a84:b0:3a4:38fa:2e08 with SMTP id
 bm4-20020a0568081a8400b003a438fa2e08mr13873870oib.7.1693318177948; Tue, 29
 Aug 2023 07:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230829113931.54391-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230829113931.54391-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Aug 2023 10:09:26 -0400
Message-ID: <CADnq5_MV+hVLRcMLrN4TE1xX1Q5dfMzi7+aWwZFcenF1uk+9iQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Revert "drm/amd/display: Implement zpos property""
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 7:40=E2=80=AFAM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> This reverts commit 984612bd4649c91f12e9c7c7f9e914fdc8ba7d3f.
>
> The problematic IGT test case (i.e. kms_atomic@plane-immutable-zpos) has
> been fixed as of commit cb77add45011 ("tests/kms_atomic: remove zpos <
> N-planes assert") to the IGT repo. So, reintroduce the reverted code.
>
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/cb77add45=
011b129e21f3cb2a4089a73dde56179
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 894bc7e4fdaa..df568a7cd005 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1469,6 +1469,15 @@ int amdgpu_dm_plane_init(struct amdgpu_display_man=
ager *dm,
>                 drm_plane_create_blend_mode_property(plane, blend_caps);
>         }
>
> +       if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +               drm_plane_create_zpos_immutable_property(plane, 0);
> +       } else if (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY) {
> +               unsigned int zpos =3D 1 + drm_plane_index(plane);
> +               drm_plane_create_zpos_property(plane, zpos, 1, 254);
> +       } else if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +               drm_plane_create_zpos_immutable_property(plane, 255);
> +       }
> +
>         if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY &&
>             plane_cap &&
>             (plane_cap->pixel_format_support.nv12 ||
> --
> 2.41.0
>
