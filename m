Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046770C1FA
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91910E346;
	Mon, 22 May 2023 15:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7910E346;
 Mon, 22 May 2023 15:08:59 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-555508fd7f9so358915eaf.3; 
 Mon, 22 May 2023 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684768139; x=1687360139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zEQv3FIbNS1PaTN4avSONv8aFWRzp4oZp63VmdRfIQ=;
 b=APxy0p2J1/Z9SeVZDSFJRP7VppH2mbN9g1a/A+OCaoF1awvld8+JcU3RndpAbDoGvw
 rlWlQcqxw5nbtDVdCMt0IPNiavwuDHKx37xbTu8bs4Zn+SIE0eWt4OnKpGPCyyhgDppn
 X+gs3+Kc/G+uNygq8Sc/vu6h5PKVXKcD6QzTmkc2DpANpfixnQn2+IMXhrwu5Dic+vyQ
 hv/4oPqypp/Jvww2ra1CRNWOHmvPB0/T6MM4DaLrXS+Ku6uqh7eMTeWZfgJ/HPwYsNJV
 fTn3aKfUqH/A0eWJZcVoXfMpjIvSnqRz2mR6EDbXmM5XqrVUDcdUMbXSMhbhj9B+gGyM
 1EqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684768139; x=1687360139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zEQv3FIbNS1PaTN4avSONv8aFWRzp4oZp63VmdRfIQ=;
 b=FW50IaGyR8iPdDcAbhkCBe/MN/Sx9FuuRucnIVOYizYlABtYb6Xy/uQhXa5RjcHQka
 ux4nadwvu+2kPJaf8syYz0QdDzD34lmfwdxN4CHDOQ7gC3sh/3Ak69aTQ8GED5NVkGjf
 i5Is4OvJkcWLp+kX3gaLN2UQPBSA0I4y0FLWSU/C5AnGqM0dTjdxrnvLCMDVwIvTdx8U
 Fi23Jek3orcd5he3ZKcetUg9T0UHBSK5z/ghtMEP8c/yxfBYB+YdkbKl/ITPCkOzboue
 Az7UCDT4NcLENJs1+W1g3Rm2fJ1iHIJ2vNoyynZAlLvS1wMZrtT9TofS4mwE9jPSlxuZ
 x7PA==
X-Gm-Message-State: AC+VfDys9AE/xonSLHZjrXAm3AeNsdpvyImPMzfC7PYlP1HKxA8q5Mqf
 rG47swnHO5XkQIsXws2ByMSQ6C+qU/xHgpgVS7I=
X-Google-Smtp-Source: ACHHUZ4ExIpEUZerP6mCCiZ9lUpYbGZ/+E9RYgK/eNnvHmmMatIIjmZ0rZ09JHcdKkuRDXO7nEzde1gvbpvsjleXhGs=
X-Received: by 2002:a4a:924d:0:b0:552:4bca:a9df with SMTP id
 g13-20020a4a924d000000b005524bcaa9dfmr5154196ooh.3.1684768138804; Mon, 22 May
 2023 08:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230522115047.1169839-1-arnd@kernel.org>
 <20230522115047.1169839-5-arnd@kernel.org>
In-Reply-To: <20230522115047.1169839-5-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 May 2023 11:08:47 -0400
Message-ID: <CADnq5_Mg1BZ9PKHNtFdk4F2Ny7rQo8Tr2PA93MF-yF811d7EwA@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: fix acpi build warnings
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Tim Huang <tim.huang@amd.com>, Jingyu Wang <jingyuwang_vip@163.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Hans de Goede <hdegoede@redhat.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Mon, May 22, 2023 at 7:51=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Two newly introduced functions are in the global namespace but have no pr=
ototypes
> or callers outside of amdgpu_acpi.c, another function is static but only =
has
> a caller inside of an #ifdef:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:902:13: error: no previous proto=
type for 'amdgpu_acpi_get_node_id' [-Werror=3Dmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:928:30: error: no previous proto=
type for 'amdgpu_acpi_get_dev' [-Werror=3Dmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:860:33: error: 'amdgpu_acpi_get_=
numa_info' defined but not used [-Werror=3Dunused-function]
>
> Avoid the warnings by marking all of them static and ensuring that the co=
mpiler is
> able to see the callsites.
>
> Fixes: c34db97b8217 ("drm/amdgpu: Add API to get numa information of XCC"=
)
> Fixes: 1f6f659d06e1 ("drm/amdgpu: Store additional numa node information"=
)
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 873532c4adbe..1dbcd0e62478 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -899,13 +899,15 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_num=
a_info(uint32_t pxm)
>   *
>   * Returns ACPI STATUS OK with Node ID on success or the corresponding f=
ailure reason
>   */
> -acpi_status amdgpu_acpi_get_node_id(acpi_handle handle,
> +static acpi_status amdgpu_acpi_get_node_id(acpi_handle handle,
>                                     struct amdgpu_numa_info **numa_info)
>  {
> -#ifdef CONFIG_ACPI_NUMA
>         u64 pxm;
>         acpi_status status;
>
> +       if (!IS_ENABLED(CONFIG_ACPI_NUMA))
> +               return_ACPI_STATUS(AE_NOT_EXIST);
> +
>         if (!numa_info)
>                 return_ACPI_STATUS(AE_ERROR);
>
> @@ -920,12 +922,9 @@ acpi_status amdgpu_acpi_get_node_id(acpi_handle hand=
le,
>                 return_ACPI_STATUS(AE_ERROR);
>
>         return_ACPI_STATUS(AE_OK);
> -#else
> -       return_ACPI_STATUS(AE_NOT_EXIST);
> -#endif
>  }
>
> -struct amdgpu_acpi_dev_info *amdgpu_acpi_get_dev(u16 bdf)
> +static struct amdgpu_acpi_dev_info *amdgpu_acpi_get_dev(u16 bdf)
>  {
>         struct amdgpu_acpi_dev_info *acpi_dev;
>
> --
> 2.39.2
>
