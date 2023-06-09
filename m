Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3C72A2BF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 21:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A7110E092;
	Fri,  9 Jun 2023 19:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C558110E092;
 Fri,  9 Jun 2023 19:03:49 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1a49716e9c5so826538fac.1; 
 Fri, 09 Jun 2023 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686337428; x=1688929428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HB940f4muHJWORGyH4neqULh88IjnoNoST1yjCNDlT4=;
 b=L/qpe2IwGUdKq298Sx7UGN+KI97pjXNbdkQXkeMOXJYo6NpEj72QLkoF7c4xv2As08
 vjWJcDwFrQcvvk1/Gv3asfx0OhTu/FahxxeTyMGZ5UU1zHho6i9fEm45NxAhP2CrhnV7
 66vrTVSvo39siWmYCSk/N/kBkesrQyuM8VO52NJI3QZEbOtJDtsWt1Jkbc0OW0EbO/+5
 sv8PJ/ZKgy+bwlDYLxMFFf/ktQQwaIeet2CGf9YEm0DCb7NEZS0zAQ9s2pksrcfynD7m
 aq7xgolR8ukRt4DzUlUndtZW5Sog33ownLyjfoOh9GyeuLKlNuhQQcpZWvzgKaz4HWWA
 2hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686337428; x=1688929428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HB940f4muHJWORGyH4neqULh88IjnoNoST1yjCNDlT4=;
 b=Hb8GN/BprYXToIVhxcmtM9Rs6NCLKmZSSBxyeuveUrddjR6XcXG1+J+IGd7n2s7JFl
 zuv6G7+vuX9oN2ji/BCa7hLsvCSvaz4MyzMeciI0FKVFE0efc9Pek0LaMHvvxSr8q1DY
 O9xyeM4O+TZhyqZmGnHCYr3QTLnZg63xKh6cpaDNKPDx9BRNgh1AQm4OKeA+dWq+X2uT
 Fu2JvHuJHBx7wCKmA0cAWpG0zgW6LVCAerRphBdPN2w9gNOL/bkPzYnNHT3AeP4fLVhA
 OSg4i6YndChrI/MRzKG3YK8wVbfdGLn02UA3tvu6laXeArFurq/kmIXMVi5zaQ92IAm9
 AqSA==
X-Gm-Message-State: AC+VfDwUY7otP4PS2unMSt/fsKdCsBCJpyLxE/bV7DD1tHxxjhH17GxS
 DjbvS606TAF6zaCHhhUyHPZntuJY0ciOkhOv8KM=
X-Google-Smtp-Source: ACHHUZ7lt542r64vRRZ6FrtQ3T3tYd1s0VYWalwcDu9UbyWKq6grTawJybrXl3hxCgMjRiPYRrxXK51HcuPyesLRSnM=
X-Received: by 2002:a05:6870:710:b0:19f:ae40:6492 with SMTP id
 ea16-20020a056870071000b0019fae406492mr2195427oab.5.1686337427804; Fri, 09
 Jun 2023 12:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-15-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-15-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Jun 2023 15:03:36 -0400
Message-ID: <CADnq5_OpT29qg+dbqEmkRKP1-OqEV1QqPU7Wyd0AV1idHAJ4Sw@mail.gmail.com>
Subject: Re: [RESEND 14/15] drm/radeon/radeon_ttm: Remove unused variable
 'rbo' from radeon_bo_move()
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jerome Glisse <glisse@freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is no longer applicable.

Alex

On Fri, Jun 9, 2023 at 4:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_ttm.c: In function =E2=80=98radeon_bo_move=
=E2=80=99:
>  drivers/gpu/drm/radeon/radeon_ttm.c:201:27: warning: variable =E2=80=98r=
bo=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 4eb83ccc4906a..de4e6d78f1e12 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -197,7 +197,6 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>  {
>         struct ttm_resource *old_mem =3D bo->resource;
>         struct radeon_device *rdev;
> -       struct radeon_bo *rbo;
>         int r;
>
>         if (new_mem->mem_type =3D=3D TTM_PL_TT) {
> @@ -210,7 +209,6 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>         if (r)
>                 return r;
>
> -       rbo =3D container_of(bo, struct radeon_bo, tbo);
>         rdev =3D radeon_get_rdev(bo->bdev);
>         if (!old_mem || (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
>                          bo->ttm =3D=3D NULL)) {
> --
> 2.41.0.162.gfafddb0af9-goog
>
