Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC925772A8C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7310E2AC;
	Mon,  7 Aug 2023 16:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FE710E2AC;
 Mon,  7 Aug 2023 16:23:50 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1bba254a7d4so3676127fac.2; 
 Mon, 07 Aug 2023 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425429; x=1692030229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IutisKUxSex6+AO1pD8aPRPz9d2NNY3R1jp6DKxdDOU=;
 b=iJ64I1cECsaaUtRWyIX4rGvNdgjNVSuBQbJPUMNASE3bSLJ2Qkjs1eXgkWbubInFG9
 JuOp5D+dgNuWyE5gp6/POnWlR8ajwEpgFNZ7raxjX8khkeNMoUlNKrnfrcMkjRf36BPa
 9IVquV7DwnUoTOXaOgGI0300kSi+CxPus3cZq/MhSl2ek7jQecDvlRmKYBUlmvGuYJLt
 RWvpF6HrW8Vrgh95VH6Klp6zvsydRQMd1bFKwDOHhbHO8C7BlK/jYKe5TWtUN/rGSuVj
 nTd62S1OzZZzB1dYaZHBhbFqKlCruSc/EcTyUcJ+4FzdsLT7tNQxjvh8DDRRp8E2k6t1
 422Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425429; x=1692030229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IutisKUxSex6+AO1pD8aPRPz9d2NNY3R1jp6DKxdDOU=;
 b=A2rRsBxVwYmZr3cJqmljEOolyzhT132GFerzPlwZaGm8cAYEgGjj5meaggZq04nsks
 94hXFmejlZvxsZ8bnkkeghdTB/7wIlgPT+K2q1lA4Or2gKEivj2TmvllIicFlaCrqY/Z
 /TYT0DqbAptxgYRS4gyFTvfcbrKTVWIeh+rWLcKVTmMkOwr4n3tWfz76dtO9580O7/dz
 zsMnv2jIqJAaipczTf5Ljpt2xu95M1YqIC60W8V36xRSyCRbgQm2RfOxTh+EJcaHMrNh
 kzSbuRsVLdXFwhBhCop0dSn/ckyJFgfuV7LyJrSfqu6AcPHVIQBRu6ewUaLADPzIleuV
 oAJg==
X-Gm-Message-State: AOJu0YzlxG7QpvWykLdr/VQvy2YlB0WD2Pj4s1f3VlY3QQXJVBwZVN78
 GvKmxW0i74x2AKeROqFIGQubrS7xPu4GganRWm/THTi+
X-Google-Smtp-Source: AGHT+IGZo2uqDnzuqlUtTLAMntPIx4KKfmqoss2Wq/oAXN/Zac1lFpQPRP7LyrGTdD73ypz3W4Nz5EkuiGGyMhQLUyY=
X-Received: by 2002:a05:6870:b525:b0:1be:c2c5:a1cf with SMTP id
 v37-20020a056870b52500b001bec2c5a1cfmr11317397oap.51.1691425429629; Mon, 07
 Aug 2023 09:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230801022814.4577-1-sunran001@208suo.com>
In-Reply-To: <20230801022814.4577-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:23:38 -0400
Message-ID: <CADnq5_NvRJeZUK8--n9vCdF+NxxQqLdPcrgwKwh6mY1BL3W7xg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in amdgpu_smu.c
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 10:28=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '=3D' (ctx:WxV)
> ERROR: spaces required around that '&&' (ctx:VxW)
> ERROR: that open brace { should be on the previous line
> ERROR: space required before the open parenthesis '('
> ERROR: space required before the open brace '{'
> ERROR: spaces required around that ':' (ctx:VxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/=
amd/pm/swsmu/amdgpu_smu.c
> index ce41a8309582..a7199275ffb8 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -618,7 +618,7 @@ static int smu_set_funcs(struct amdgpu_device *adev)
>                 adev->pm.pp_feature &=3D ~PP_GFXOFF_MASK;
>                 arcturus_set_ppt_funcs(smu);
>                 /* OD is not supported on Arcturus */
> -               smu->od_enabled =3Dfalse;
> +               smu->od_enabled =3D false;
>                 break;
>         case IP_VERSION(13, 0, 2):
>                 aldebaran_set_ppt_funcs(smu);
> @@ -1648,7 +1648,7 @@ static int smu_hw_fini(void *handle)
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>         struct smu_context *smu =3D adev->powerplay.pp_handle;
>
> -       if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
> +       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
>                 return 0;
>
>         smu_dpm_set_vcn_enable(smu, false);
> @@ -1700,7 +1700,7 @@ static int smu_suspend(void *handle)
>         int ret;
>         uint64_t count;
>
> -       if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
> +       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
>                 return 0;
>
>         if (!smu->pm_enabled)
> @@ -2217,8 +2217,7 @@ const struct amd_ip_funcs smu_ip_funcs =3D {
>         .set_powergating_state =3D smu_set_powergating_state,
>  };
>
> -const struct amdgpu_ip_block_version smu_v11_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version smu_v11_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_SMC,
>         .major =3D 11,
>         .minor =3D 0,
> @@ -2226,8 +2225,7 @@ const struct amdgpu_ip_block_version smu_v11_0_ip_b=
lock =3D
>         .funcs =3D &smu_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version smu_v12_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version smu_v12_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_SMC,
>         .major =3D 12,
>         .minor =3D 0,
> @@ -2235,8 +2233,7 @@ const struct amdgpu_ip_block_version smu_v12_0_ip_b=
lock =3D
>         .funcs =3D &smu_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version smu_v13_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version smu_v13_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_SMC,
>         .major =3D 13,
>         .minor =3D 0,
> @@ -2337,7 +2334,7 @@ int smu_get_power_limit(void *handle,
>         if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
>                 return -EOPNOTSUPP;
>
> -       switch(pp_power_type) {
> +       switch (pp_power_type) {
>         case PP_PWR_TYPE_SUSTAINED:
>                 limit_type =3D SMU_DEFAULT_PPT_LIMIT;
>                 break;
> @@ -2349,7 +2346,7 @@ int smu_get_power_limit(void *handle,
>                 break;
>         }
>
> -       switch(pp_limit_level){
> +       switch (pp_limit_level) {
>         case PP_PWR_LIMIT_CURRENT:
>                 limit_level =3D SMU_PPT_LIMIT_CURRENT;
>                 break;
> @@ -2595,7 +2592,7 @@ static int smu_read_sensor(void *handle,
>                 *size =3D 4;
>                 break;
>         case AMDGPU_PP_SENSOR_VCN_POWER_STATE:
> -               *(uint32_t *)data =3D atomic_read(&smu->smu_power.power_g=
ate.vcn_gated) ? 0: 1;
> +               *(uint32_t *)data =3D atomic_read(&smu->smu_power.power_g=
ate.vcn_gated) ? 0 : 1;
>                 *size =3D 4;
>                 break;
>         case AMDGPU_PP_SENSOR_MIN_FAN_RPM:
> @@ -2868,7 +2865,7 @@ static int smu_set_xgmi_pstate(void *handle,
>         if (smu->ppt_funcs->set_xgmi_pstate)
>                 ret =3D smu->ppt_funcs->set_xgmi_pstate(smu, pstate);
>
> -       if(ret)
> +       if (ret)
>                 dev_err(smu->adev->dev, "Failed to set XGMI pstate!\n");
>
>         return ret;
> --
> 2.17.1
>
