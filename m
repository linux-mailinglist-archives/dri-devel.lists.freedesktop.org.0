Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE66B0D10
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FE810E621;
	Wed,  8 Mar 2023 15:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED80910E623;
 Wed,  8 Mar 2023 15:39:59 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s41so12439214oiw.13;
 Wed, 08 Mar 2023 07:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678289999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaAUtb/N9UL1YS9AZl0SE37nPbeXIoJeDvkrLAar53k=;
 b=kpbqi66Gx1HUmzbNTjMnEaY0fUaP1rVbAomOrfPAi6GcirN4TmHcJZpl5yUCh4UNdS
 U4IDL+DM0ggo2lH3wHX/dnuTn/mpin2tE/Gj8L7gY5gv/NyN2Gge346/MazBZ4W2N2fg
 jgao/+S/aHEmZbK3Jk6+1IjLZmTiWLxYTTdgbUBb76oHb/wY08vCu88wfQf6y+IOZvao
 H3AML1UGkdJgfPY1UtiJhSHPjt7nNXel5yiWfJ1V8y9HF1dzPGsQ6WMzcHUEekR09tGC
 dcX/F9eBZF3eUUSdNU1G+3HRSSW45zh/JrcRmFjnnocojr2YSAQjfE2mZimv+iTK0ykr
 Nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678289999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaAUtb/N9UL1YS9AZl0SE37nPbeXIoJeDvkrLAar53k=;
 b=D2ficiN/mNcZOWZqhLkH6/c4qd7jj2gmgA4nkCqQUTZY90DlRuzWK5IdKU5zzIdwMX
 vXZ5aGeRRN71UkV86j6eanIDZ2R7kpWMmEofZik+pXHE7cJtIqy3zvaUFp4psHI4vc25
 9RK0dgKRzKO/2Xz6x6e+oDAEeXlP//3J3V8bFZ2BFefmmDV9jXPYAQAktj9v+hXVhnJi
 Lh0LeqxuX04UgQKc4WTjXltMO5Xrur40vgvdPHdrPRgfW0ndcfcD+VD1LAQM9OmT101g
 BuMRcexpg+vo+rgeu2MLsLA8B7p54dQw/k0VQ/sxADMfqc2nlYuV51SGYUFJwuQ4BkfK
 wVBg==
X-Gm-Message-State: AO0yUKX4xYRBh9PdjVSHCXNRniUHRpnNmci5R2dsc8bI8d4Qi2QokDmU
 UAgRB70ZnAB3ottCg9Uh4uLVlToWb4bY6x51YH8=
X-Google-Smtp-Source: AK7set/l1y6f5wm26prcQWrhc6hlrODYBjN/jrOtHMUH61GhN/Z+0wVcB3PTAdG/g3xV47wB9O//ChhmmBH37L39xEw=
X-Received: by 2002:a05:6808:8f7:b0:36e:f6f5:5cf0 with SMTP id
 d23-20020a05680808f700b0036ef6f55cf0mr5499115oic.3.1678289999154; Wed, 08 Mar
 2023 07:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20230308140943.2009970-1-trix@redhat.com>
In-Reply-To: <20230308140943.2009970-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Mar 2023 10:39:47 -0500
Message-ID: <CADnq5_PdEGjvc59HjaYdffrNmAfFWuVe5M23wenHZMyF9LdCOA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused variable res_pool
To: Tom Rix <trix@redhat.com>
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
Cc: amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jerry.Zuo@amd.com, hersenxs.wu@amd.com,
 hamza.mahfooz@amd.com, Wayne.Lin@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Mar 8, 2023 at 9:10 AM Tom Rix <trix@redhat.com> wrote:
>
> With gcc and W=3D1, there is this error
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:121=
4:31:
>   error: variable =E2=80=98res_pool=E2=80=99 set but not used [-Werror=3D=
unused-but-set-variable]
>  1214 |         struct resource_pool *res_pool;
>       |                               ^~~~~~~~
>
> Since res_pool is unused, remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 2739bef9b90c..4b9b5e4050fc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1211,7 +1211,6 @@ static int pre_compute_mst_dsc_configs_for_state(st=
ruct drm_atomic_state *state,
>         bool computed_streams[MAX_PIPES];
>         struct amdgpu_dm_connector *aconnector;
>         struct drm_dp_mst_topology_mgr *mst_mgr;
> -       struct resource_pool *res_pool;
>         int link_vars_start_index =3D 0;
>         int ret =3D 0;
>
> @@ -1220,7 +1219,6 @@ static int pre_compute_mst_dsc_configs_for_state(st=
ruct drm_atomic_state *state,
>
>         for (i =3D 0; i < dc_state->stream_count; i++) {
>                 stream =3D dc_state->streams[i];
> -               res_pool =3D stream->ctx->dc->res_pool;
>
>                 if (stream->signal !=3D SIGNAL_TYPE_DISPLAY_PORT_MST)
>                         continue;
> --
> 2.27.0
>
