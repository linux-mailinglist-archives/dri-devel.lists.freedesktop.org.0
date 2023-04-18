Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFD6E6D48
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 22:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6510E889;
	Tue, 18 Apr 2023 20:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386AE10E889
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 20:09:52 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-24756a12ba0so1137247a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681848591; x=1684440591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJjRijV5blbjzZLZll3N1JO9eikZc6Mlip365pggL9w=;
 b=RxI8ccMnJU34C26Ht6af/Th3w247gQIO0uQnzRfH2qt11y5bG/KVu1JIv98zlpx4D1
 6+T+7fm9LFj2LYaDIo2LT8T1Xo9ePq7ThXSPvAlSvNHct8dmTKu+ixGW2MxKCmKPEic5
 0NMP5HW32YUXzNX6ZAvMzUZ+r7/o+fZqhWAmOZNWEtuGQr2uKAwqdsnDPOcnCQXkusAL
 lEJpFgOxxgNb/wSBQGjXS2rZ5x92nLQ4+hV53yJlZyN8pSO9LtwYDE3KxhzcV0myrIXX
 ZNsRtuRyCHtRAnfOYgVIMLVSDSYy3KfNTnfDpnhlSRuUbePgyG4vh2nQsd84Uc0WGgIG
 AqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681848591; x=1684440591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJjRijV5blbjzZLZll3N1JO9eikZc6Mlip365pggL9w=;
 b=eN0eQ1Q/MzazJM952ZG7prIuIzE4kZuQCJ0Oc81kIJLddvydTTGZKXr/Ekhh/a+ee5
 6cKGo1EdTmIv0eTN5FQZUUNo7sfV8KTMAkbitTxU4gJ3Y7WR19HXWosbNGqAyrY/9BYw
 7CC7l4A0sBQm9X6hvFgmDGk5yasN0tVh/n82uiKeAL1xq4O0NnwKig/lKJCISZqzBU9w
 E+0PTbybeUIVr2PYalebtkAlfvxATz0RuuTh+hYQuPyF9yE80gceHd8ehLXbipKag8Vj
 BrcvTqwxBhexRFo9yw0Si11+OTFwHZqpx42TFbt9Qapl/xiX9y9fxru5LEmmls6jO/VP
 8QZQ==
X-Gm-Message-State: AAQBX9cc7oxltw58TLZcDO0ku4OU2/9xerDxVNtG7CtaTZN0Yg65Q42/
 w8BpbLazlhUpg+3/c7mmsbNdpldy+iBJSqu2mPG1sg==
X-Google-Smtp-Source: AKy350baeGq9wa+UpgsWuLoH1elNcvdt1oOkfqqmaCQpAHbi6Eath+2E2j22ABbywJdPOlHgLe3u3xkeQP5kmoW7nv0=
X-Received: by 2002:a17:90a:fe8c:b0:246:f73c:3aba with SMTP id
 co12-20020a17090afe8c00b00246f73c3abamr618143pjb.39.1681848590753; Tue, 18
 Apr 2023 13:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230408165023.2706235-1-trix@redhat.com>
In-Reply-To: <20230408165023.2706235-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 13:09:39 -0700
Message-ID: <CAKwvOdmFtc0shP45t7S9aoh1+UGXyaX_aodvJd97d-nH5J0HQg@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: remove variable count
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 nathan@kernel.org, kraxel@redhat.com, spice-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 8, 2023 at 9:50=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable
>   'count' set but not used [-Werror,-Wunused-but-set-variable]
>         int count =3D 0;
>             ^
> This variable is not used so remove it.

Thanks for the patch!

Fixes: 64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_cmd.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.=
c
> index 281edab518cd..d6ea01f3797b 100644
> --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> @@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
>  {
>         uint32_t handle;
>         int idr_ret;
> -       int count =3D 0;
>  again:
>         idr_preload(GFP_ATOMIC);
>         spin_lock(&qdev->surf_id_idr_lock);
> @@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
>         handle =3D idr_ret;
>
>         if (handle >=3D qdev->rom->n_surfaces) {
> -               count++;
>                 spin_lock(&qdev->surf_id_idr_lock);
>                 idr_remove(&qdev->surf_id_idr, handle);
>                 spin_unlock(&qdev->surf_id_idr_lock);
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
