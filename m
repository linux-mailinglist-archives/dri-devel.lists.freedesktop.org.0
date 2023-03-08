Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9F6B0D1E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB6210E616;
	Wed,  8 Mar 2023 15:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C3210E60E;
 Wed,  8 Mar 2023 15:40:59 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 r23-20020a05683001d700b00690eb18529fso9208437ota.1; 
 Wed, 08 Mar 2023 07:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1eaevzD/VPDBLno7am529FO5BQItrE1PVYk+UmlJ30=;
 b=jo7rya6xSxN51x9Agv7lCoYt3NELUGNXEedCdddprWZMyEetydQ+VAzjhfsveqPncT
 U4OyFqbRxprUag/By3VxXdmsuY2RVJU/msDixT15maV8wgkSpTAv3wXuVsKS7DB9SKeL
 wqB8/HNzPeUWM15t6WQz3t8RRJrSsAd3inuqxvUgnUCLvP03jMmjh7XNmNuJVKRGd+hI
 jLqruPfGAiNzz5wFrUsJgqPPj9Kcg5+ToW18Zr/vrJligw92oiYGcWq8H6/wNNA6THGq
 32iu2QBeI7T+IKQz4/WtUGE4Pamkdfwm7P0UNgeizuDfP1cVfy1y6hfRvT8DHsseOfYa
 jHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1eaevzD/VPDBLno7am529FO5BQItrE1PVYk+UmlJ30=;
 b=4L86tm+giMHbLmTWq69u4ibGlH68hhTdhLIxlk5khaLAHyLWHm4ZXfCsVKPRu+j56P
 E7eyjkn/l+7A7ewxDpB1Oo0z+/JeGxawyz+puzWcq6VVaDB8vIeguXKio/f3LUdlFIwI
 uFageM3hrsgFZTHIzKc3+kCoaD0Vc/KJeN33OdHKrJEcMNeiOEhqKa0+lsQwOKgMi5nB
 K1pENexQDK18JlacB/hZpjPtJw/J5T/VRhk6rAWHNxjlOS/8/XRsuU7UGfFz55kzePmJ
 18c5CZippD5vMMu7ERssYiZC2203q1bQbmL7Ocpo8YKELL/I6x0emfFJRBjK+bwHP4Nc
 C9Qg==
X-Gm-Message-State: AO0yUKXDt6NHtdhkkyj+PXcQGGXUlY1+yayUqdQlytvWcQfxEd035wkx
 pmlMAMv2bLAibzqL6cXdKGCyb9t7kwEl9WtefSg=
X-Google-Smtp-Source: AK7set/3YXnoE0ouW6QKye+UdVIfFc6/NcrKfnpl+KoXnboudNx6jNlvIiSmQTAgHzhdNCUl12UfKeVmimwBzUUsk9Y=
X-Received: by 2002:a9d:724c:0:b0:68b:ccee:5ead with SMTP id
 a12-20020a9d724c000000b0068bccee5eadmr6361844otk.3.1678290058340; Wed, 08 Mar
 2023 07:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20230308141057.2010361-1-trix@redhat.com>
In-Reply-To: <20230308141057.2010361-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Mar 2023 10:40:46 -0500
Message-ID: <CADnq5_PtFqWKvVePq+jydpC06QG35q420-9iQErv6OcgYcPzJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused variable available
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
Cc: candice.li@amd.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wenjing.liu@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, Jun.Lei@amd.com,
 christian.koenig@amd.com, mghaddar@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Mar 8, 2023 at 9:11 AM Tom Rix <trix@redhat.com> wrote:
>
> With gcc and W=3D1, there is this error
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c=
:297:13: error:
>   variable =E2=80=98available=E2=80=99 set but not used [-Werror=3Dunused=
-but-set-variable]
>   297 |         int available =3D 0;
>       |             ^~~~~~~~~
>
> Since available is unused, remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  .../drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c   | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_b=
w.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
> index f14217cc16fd..2f0311c42f90 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
> @@ -294,7 +294,6 @@ bool link_dp_dpia_set_dptx_usb4_bw_alloc_support(stru=
ct dc_link *link)
>  void dpia_handle_bw_alloc_response(struct dc_link *link, uint8_t bw, uin=
t8_t result)
>  {
>         int bw_needed =3D 0;
> -       int available =3D 0;
>         int estimated =3D 0;
>         int host_router_total_estimated_bw =3D 0;
>
> @@ -373,20 +372,13 @@ void dpia_handle_bw_alloc_response(struct dc_link *=
link, uint8_t bw, uint8_t res
>
>                 // 1. If due to unplug of other sink
>                 if (estimated =3D=3D host_router_total_estimated_bw) {
> -
>                         // First update the estimated & max_bw fields
>                         if (link->dpia_bw_alloc_config.estimated_bw < est=
imated) {
> -                               available =3D estimated - link->dpia_bw_a=
lloc_config.estimated_bw;
>                                 link->dpia_bw_alloc_config.estimated_bw =
=3D estimated;
>                         }
>                 }
>                 // 2. If due to realloc bw btw 2 dpia due to plug OR real=
loc unused Bw
>                 else {
> -
> -                       // We took from another unplugged/problematic sin=
k to give to us
> -                       if (link->dpia_bw_alloc_config.estimated_bw < est=
imated)
> -                               available =3D estimated - link->dpia_bw_a=
lloc_config.estimated_bw;
> -
>                         // We lost estimated bw usually due to plug event=
 of other dpia
>                         link->dpia_bw_alloc_config.estimated_bw =3D estim=
ated;
>                 }
> --
> 2.27.0
>
