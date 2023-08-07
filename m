Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057AF772D11
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57710E373;
	Mon,  7 Aug 2023 17:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8215D10E371;
 Mon,  7 Aug 2023 17:33:50 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a78604f47fso2261805b6e.1; 
 Mon, 07 Aug 2023 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429630; x=1692034430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Xgnz7mlTNaIdh0IQghOP6QiClppwV7KNLYC2hrQ44c=;
 b=QPZZdCl+yIUJyB11mddD06BONdKoecQPaEP9meDsWe2HbjDlBALihWQ4wMNJ7FoIz1
 SQz3GbST9klBEdZ0nuYgVb3lBXEOFoBeNLSPG/M8wVoy0/B8fRmiRMuWrYjHSZ4Z7zlg
 TIKT1BQu0vFEXl46H7x5/YZ5tA5bhqJtArOU/pROsUWre5q+2u6RfXdx0yw0OOFPABuF
 Xem/F4Gqkvpur33XGzEI5spVd3kVX/AT2jkwK734EfSQ6iuPJgs1ksvXc+u5AkyDALYz
 4XXBL3B1shhfcVuLBt1JqhWB3hrwXWhfOaK8j5p3N3qZhhoyDuf37hBpU1ZxuPgv4D0X
 SpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429630; x=1692034430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Xgnz7mlTNaIdh0IQghOP6QiClppwV7KNLYC2hrQ44c=;
 b=HhAFx02qKCqzTB1Nlnvbl0BExL3XrqqOFp1MGYWiDKSuufkenm0yCPLTTW6asbkkF+
 uPemP1wCFnDGh4Yd4Pfnf/llni9dgkm+FJZ0gpaZb3RTEQEAZjjniIDDyotnUMlEkms6
 FAWlKj9GhmELcQed2dUyP8ktIYP5XUvRLNuuKY+tXFFbeaTEd4JlVavZ1sltfRG4HO/h
 mdOUGlmbbwpXDPiqrIj2GnVqpzkGrLvDvnAC+ueP+uk2acP9f4YPyshFuGoX19ZJYRUR
 36b4mPFd1MPtjkjya2Jx97kG7pjZ4wy4MVrx+n38wpCMcxqXDd19mDaNz34RqLuklKJw
 8XTA==
X-Gm-Message-State: AOJu0Yy4FCFjMpYOTkNYgKjILicU8p5mXwUlL8QDh+IBpQ9Np+B7rhby
 iiZYBEiG6Jv8Rj0J1QNVNfNAwLP4tsHjllBRLts=
X-Google-Smtp-Source: AGHT+IGB/gO1axOANy6aP1Itgk+YXBFfN97zNjuiniI4JVi6s03LTT2FmLcUSxQdRIIa1IqEQiOwimnRFlqlirYYu4M=
X-Received: by 2002:a05:6808:15a5:b0:3a7:55f2:552d with SMTP id
 t37-20020a05680815a500b003a755f2552dmr11757972oiw.58.1691429629797; Mon, 07
 Aug 2023 10:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230802075309.13950-1-sunran001@208suo.com>
In-Reply-To: <20230802075309.13950-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:33:38 -0400
Message-ID: <CADnq5_NdP=Uk3JCFwvO12nOWGJuFh9ZWaEuH7zSWsKAM9hufXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in vcn_v3_0.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:53=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required before the open brace '{'
> ERROR: "foo * bar" should be "foo *bar"
> ERROR: space required before the open parenthesis '('
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v3_0.c
> index b76ba21b5a89..1e7613bb80ae 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -1105,7 +1105,7 @@ static int vcn_v3_0_start(struct amdgpu_device *ade=
v)
>                 if (adev->vcn.harvest_config & (1 << i))
>                         continue;
>
> -               if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG){
> +               if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>                         r =3D vcn_v3_0_start_dpg_mode(adev, i, adev->vcn.=
indirect_sram);
>                         continue;
>                 }
> @@ -1789,7 +1789,7 @@ static int vcn_v3_0_dec_msg(struct amdgpu_cs_parser=
 *p, struct amdgpu_job *job,
>         struct amdgpu_bo *bo;
>         uint64_t start, end;
>         unsigned int i;
> -       void * ptr;
> +       void *ptr;
>         int r;
>
>         addr &=3D AMDGPU_GMC_HOLE_MASK;
> @@ -2129,7 +2129,7 @@ static int vcn_v3_0_set_powergating_state(void *han=
dle,
>                 return 0;
>         }
>
> -       if(state =3D=3D adev->vcn.cur_state)
> +       if (state =3D=3D adev->vcn.cur_state)
>                 return 0;
>
>         if (state =3D=3D AMD_PG_STATE_GATE)
> @@ -2137,7 +2137,7 @@ static int vcn_v3_0_set_powergating_state(void *han=
dle,
>         else
>                 ret =3D vcn_v3_0_start(adev);
>
> -       if(!ret)
> +       if (!ret)
>                 adev->vcn.cur_state =3D state;
>
>         return ret;
> @@ -2228,8 +2228,7 @@ static const struct amd_ip_funcs vcn_v3_0_ip_funcs =
=3D {
>         .set_powergating_state =3D vcn_v3_0_set_powergating_state,
>  };
>
> -const struct amdgpu_ip_block_version vcn_v3_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vcn_v3_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_VCN,
>         .major =3D 3,
>         .minor =3D 0,
> --
> 2.17.1
>
