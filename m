Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BA787254
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AF510E56B;
	Thu, 24 Aug 2023 14:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DFB10E56A;
 Thu, 24 Aug 2023 14:53:12 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1c11d53221cso4396488fac.2; 
 Thu, 24 Aug 2023 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692888791; x=1693493591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEgAJuBvB5RrueW913Bvc0IDd42WONx4EX0C4ngeyAc=;
 b=cvzc/Ma42+/EH5GnV6gaAnBXY5rYSiYhq4y7y1CG0RIlz3m5ivrGOqHDG9qJYtccXi
 CtNva/9uHFWsO5lCrNmZ+QsUe3y1P/ANtqnuJdTfI46L+8TecVzb9Sgj4KkjQDT4pmKp
 TMtmCnIHMqlVovR/5d96sRjp2QDxVVxGOTXbs8RaciNESp00L0YrG0IlVztW+P1EL7sY
 hN9k2rc34EvMEV1xZ8+wa+TAfvX05EEwHA22eg0XHr+n4KZcJaiQLru90PKsOqzwFXqu
 qLl6cOCDlS5BfpT8K/ATHjsxe+xEvExHpSvTUv9lmd0hxNu7M5KMmldvJaiuL2LMFzgM
 X2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692888791; x=1693493591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEgAJuBvB5RrueW913Bvc0IDd42WONx4EX0C4ngeyAc=;
 b=VoNEwn+KhqRpw8AccIXgUnGM0mpedBvAhUdTQJ2XnI6pIvclieAKuR/uQD4b2Ff8a2
 Vt9P+Zzvwsr4T5d8GHVAmfkcv7KbGO0OQOv/NJdpgEKleJ895X8RRKVBpYa04aluA2S2
 JDbq/OXgtt+pgQI9v/cfwb709fvTVQu/miBNP4KhctxVKA/JSOo6VcjJbGqg9gaEoQW3
 hDaL8zH2j7ZpAkqsb8ytWFTxzEbV+2buGp6dbBOcTHTRsX+8Zk7yKW/LvZtRh94ty2Jj
 Zo+p01Pqh8h1fMNYPUnVrOHx5GP9eo9ngkDHjBUpQN7hcc/MK6y7aeVhACWnGiItCgib
 QVaQ==
X-Gm-Message-State: AOJu0YyR6Kcu5FyN2xZGWOX4eztplBB+cuGfW44FbKWv9WG50AKMNqom
 L+guFm4PAQG1UQSyZrg/K23/FibbCq0MMOnC2VY=
X-Google-Smtp-Source: AGHT+IHkkjwf7Pf1Rx/dcEiwdD8uFdhQ76ZVl2mt75hB4yRbeXBGdMKP9T/bACPndUFjk98cNFZLiNjyEpjNR0fqUuY=
X-Received: by 2002:a05:6870:9722:b0:1b7:4521:14b6 with SMTP id
 n34-20020a056870972200b001b7452114b6mr19020700oaq.5.1692888791355; Thu, 24
 Aug 2023 07:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-8-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-8-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:53:00 -0400
Message-ID: <CADnq5_O7m7QPEOi8Fgr5a4V6HcLNUyOuYO23Y=sGYtbnF6r_CQ@mail.gmail.com>
Subject: Re: [PATCH 07/20] drm/radeon/radeon_ttm: Remove unused variable 'rbo'
 from radeon_bo_move()
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

Applied.  Thanks!

On Thu, Aug 24, 2023 at 3:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_ttm.c: In function =E2=80=98radeon_bo_move=
=E2=80=99:
>  drivers/gpu/drm/radeon/radeon_ttm.c:201:27: warning: variable =E2=80=98r=
bo=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
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
> 2.42.0.rc1.204.g551eb34607-goog
>
