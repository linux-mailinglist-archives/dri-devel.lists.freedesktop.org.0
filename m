Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D297446EE32
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB1010E61D;
	Thu,  9 Dec 2021 16:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68CC10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:12:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0C07B8232A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 00:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758A8C341CE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 00:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639008960;
 bh=oVSOBOa6BXE/T1paveXxdxhNyigIeoXyMRSYZn5ztc8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xbh8zW9a4BNtJUamHUMgd/G0U8wsAoNVgu1NdgnUQI0ziYSTS+YgLYditYytslYMV
 gpYPw9Hed6vDfqNYjGjQHm6CYrQayp5dUoqMH9GDL3Hxf0v3JXgggWq75Vg0UHvPF+
 twc+0rdfYigCw0aVZNhLRLo/HP3iWhwwF6twjVb3yT4vWUcQiYAVbjLaazlyHAIUli
 dEkh9xiFVxGU4ZJWeUDF+mwjhuSE46dbwDtxXv/wDBu/aUZGA/8NzfI+2YdsnpAN/J
 JxylvXVMA0wdeknmQ/Bg+KnTQEV0y4T4tkDlsTXUIKf8EkNhql0t7hEShiiVHPSCit
 Mx4A/NqJ6Vywg==
Received: by mail-ed1-f50.google.com with SMTP id o20so14011531eds.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 16:16:00 -0800 (PST)
X-Gm-Message-State: AOAM533PeqgrQ3yEAGwpIEDBFGiBbhcyLZb4xOV+tWM6LAOB/wCOIBmI
 pFTGSRJW9f+5V86/Ihk9YAJmpnx1LNfmmFpfnQ==
X-Google-Smtp-Source: ABdhPJwbRkLlN1DN6NRjc1MrpWhMmKdZKIytk32WxKVDcsvTdDXYzOYWNAqhEtEdWyy6APe77L/rn1RVklA5TSKKC5c=
X-Received: by 2002:a50:d883:: with SMTP id p3mr24003865edj.94.1639008958411; 
 Wed, 08 Dec 2021 16:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
In-Reply-To: <20211027162806.2014022-1-markyacoub@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Dec 2021 08:15:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
Message-ID: <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: markyacoub@chromium.org
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark:

Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:28=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Mark Yacoub <markyacoub@google.com>
>
> At the reset hook, call __drm_atomic_helper_plane_reset which is
> called at the initialization of the plane and sets the default value of
> rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.

This patch looks good to me, but please fix this checkpatch warning:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Mark
Yacoub <markyacoub@google.com>' !=3D 'Signed-off-by: Mark Yacoub
<markyacoub@chromium.org>'

total: 0 errors, 1 warnings, 11 lines checked

Regards,
Chun-Kuang.

>
> Tested on Jacuzzi (MTK).
> Resolves IGT@kms_properties@plane-properties-{legacy,atomic}
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index e6dcb34d30522..accd26481b9fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
>                 state =3D kzalloc(sizeof(*state), GFP_KERNEL);
>                 if (!state)
>                         return;
> -               plane->state =3D &state->base;
>         }
>
> +       __drm_atomic_helper_plane_reset(plane, &state->base);
> +
>         state->base.plane =3D plane;
>         state->pending.format =3D DRM_FORMAT_RGB565;
>  }
> --
> 2.33.0.1079.g6e70778dc9-goog
>
