Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A090D47386D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 00:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B732C10E8A6;
	Mon, 13 Dec 2021 23:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A3910E8A6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 23:27:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 862336127D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 23:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBC4C34601
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 23:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639438062;
 bh=5C4sKIJkDWnzqKi1DVmCPmhnZw+GJklmGaruVVfz/Us=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DBDel3/b09B8MAqmRBftelzSWrRT0Fao0eN26+VIkmotRWYIz9khngk3zMQAFpFsV
 UYPQ34xdcNQ9gN+St3ISrhi1cqpiX3jmEdbr/bKqhB2WUv75keiYb6Bahe+8refa+b
 ok9Zb07gfwxi6+7FyO6MPnNttYlk2r+fAj/VE7nq5Z0M9uv/49R6Hg5iOhzHHJU9g4
 t1AORzAOdrDkXo1HjPiQiRaim0tBjxnTYBNvBZzVyX+eRiVLAuj4z8KQvaX26Tniec
 hmN53tFmQb/Wos2aIwoNYwbtPiLIBUCo6YbKWBXO2lpv7JSzNsU8QMfh7db7ykd81r
 OyJpLvOHBnyLg==
Received: by mail-ed1-f45.google.com with SMTP id r11so56559358edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 15:27:41 -0800 (PST)
X-Gm-Message-State: AOAM530/xRJtpwju9KVT7UMLbOaPuZbiBe8MUaPDf4Iz8aAQYk35bZKc
 va2ae+qt3CWxHN934bhstpkhGhTwwSOW+obiSQ==
X-Google-Smtp-Source: ABdhPJwLnov5UNyZv+LEB38x0lFU1vvX2PYYVOPjAuD4tUbrtVO8ogqV6SxarYFeSUJAf2ZA8cFBGfsyhuXRPtjbOVk=
X-Received: by 2002:a17:906:9b82:: with SMTP id
 dd2mr1644254ejc.406.1639438060292; 
 Mon, 13 Dec 2021 15:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <20211213160742.744333-1-markyacoub@chromium.org>
In-Reply-To: <20211213160742.744333-1-markyacoub@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 14 Dec 2021 07:27:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
Message-ID: <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: Mark Yacoub <markyacoub@chromium.org>
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
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mark:

Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:08=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> At the reset hook, call __drm_atomic_helper_plane_reset which is
> called at the initialization of the plane and sets the default value of
> rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

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
> 2.34.1.173.g76aa8bc2d0-goog
>
