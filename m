Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A3B772CA9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A063910E34A;
	Mon,  7 Aug 2023 17:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C96889D39;
 Mon,  7 Aug 2023 17:20:17 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6bc8d1878a0so4080436a34.1; 
 Mon, 07 Aug 2023 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428816; x=1692033616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tjmnvzk6F5Cc3BXb1Q9hk2iZgMj75iv+C6EvtJVbyY=;
 b=OhhYefLvsjRTZ0L12AmrUT5XV4rc7JF5/9w+yBEJ4aEMupPPdlv2xZJNoxvP4hq/a1
 E3EthlVG+MD6+El1SJrSc3HyAk+o1BmSnjx571YrpVVzjDf2Yj7bWntSu3adDKUohvBQ
 QEL/k5w/HgpCoG++LBg4YAm2mcTU4RXb8CS39SNizclX6Rt02fuovrhfBJXBbI92mefi
 agt5dAy+vWonE7c3WS83P8iDw4aTk7yjKMWl/TXhawka1KL7+O8DfWpMxy87KAih+E98
 BK3F+P0nF9OEkAROhQzo0lSZzfqXOHy9S6L35AbWq4ofCjsa0kEjwJF1w+W1T6lL/AI4
 402A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428816; x=1692033616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+tjmnvzk6F5Cc3BXb1Q9hk2iZgMj75iv+C6EvtJVbyY=;
 b=QVPtUilyCqbK2QTmVXpvNLtIABaZVydxNZgMm18R+bYhCnD0m1F6fjcaGPA8Q2zGrm
 HV2Kk2ZjXYGBw8UF9T7QQqUzM8WdDnQit9SjEhA0B8fqe3NFqWUM9x565biEBBlLNbQ4
 dXpGfYDaGvm8m84DTQw8diZM9Ko5SeDtlJzcYVJkwaf0zX1sDTeuXbH0VHSqXK4g4Ad9
 SGwgQdsNMYmAHHc6GpUMd3ivUo80+2umRyEN4sH9XdAJ/QLfYTI673PW1BydXT7LY55B
 Y2e/aW1g3VuO5XnV4cpwP4K4FYabPp9bTctJlXdmeIbT+1C3e2oQVhq7rr05ro//kJGT
 OhJg==
X-Gm-Message-State: AOJu0YzIEBFZEH4f5lbzaRdxQxbebLBmxBwt4QFe3gRQssLMhYtKkhcI
 Drk3TONjXZR4ijLoyocV0Gh68vPAou7qDMvoCMY=
X-Google-Smtp-Source: AGHT+IGv+vt5Hld//6AeQPcv0rUDVYpQJnIe/R19tAp0YTd7yrv7i9JfsLOqtgPJBg4KhaiINvLEdQ8QUp9gOYDO/2Y=
X-Received: by 2002:a05:6870:fba9:b0:1bf:b863:b6d with SMTP id
 kv41-20020a056870fba900b001bfb8630b6dmr9826435oab.1.1691428816327; Mon, 07
 Aug 2023 10:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230802065127.12183-1-sunran001@208suo.com>
In-Reply-To: <20230802065127.12183-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:20:05 -0400
Message-ID: <CADnq5_PQr8Op2tqs4s78Qg+niP9=VMxxPQt9Ya8BJL-czWCshQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/atomfirmware: Clean up errors in
 amdgpu_atomfirmware.c
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

On Wed, Aug 2, 2023 at 2:51=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '>=3D' (ctx:WxV)
> ERROR: spaces required around that '!=3D' (ctx:WxV)
> ERROR: code indent should use tabs where possible
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 0b7f4c4d58e5..835980e94b9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -58,7 +58,7 @@ uint32_t amdgpu_atomfirmware_query_firmware_capability(=
struct amdgpu_device *ade
>         if (amdgpu_atom_parse_data_header(adev->mode_info.atom_context,
>                                 index, &size, &frev, &crev, &data_offset)=
) {
>                 /* support firmware_info 3.1 + */
> -               if ((frev =3D=3D 3 && crev >=3D1) || (frev > 3)) {
> +               if ((frev =3D=3D 3 && crev >=3D 1) || (frev > 3)) {
>                         firmware_info =3D (union firmware_info *)
>                                 (mode_info->atom_context->bios + data_off=
set);
>                         fw_cap =3D le32_to_cpu(firmware_info->v31.firmwar=
e_capability);
> @@ -597,7 +597,7 @@ bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_d=
evice *adev,
>                                           index, &size, &frev, &crev,
>                                           &data_offset)) {
>                 /* support firmware_info 3.4 + */
> -               if ((frev =3D=3D 3 && crev >=3D4) || (frev > 3)) {
> +               if ((frev =3D=3D 3 && crev >=3D 4) || (frev > 3)) {
>                         firmware_info =3D (union firmware_info *)
>                                 (mode_info->atom_context->bios + data_off=
set);
>                         /* The ras_rom_i2c_slave_addr should ideally
> @@ -850,7 +850,7 @@ int amdgpu_atomfirmware_get_fw_reserved_fb_size(struc=
t amdgpu_device *adev)
>
>         firmware_info =3D (union firmware_info *)(ctx->bios + data_offset=
);
>
> -       if (frev !=3D3)
> +       if (frev !=3D 3)
>                 return -EINVAL;
>
>         switch (crev) {
> @@ -909,7 +909,7 @@ int amdgpu_atomfirmware_asic_init(struct amdgpu_devic=
e *adev, bool fb_reset)
>         }
>
>         index =3D get_index_into_master_table(atom_master_list_of_command=
_functions_v2_1,
> -                                            asic_init);
> +                                       asic_init);
>         if (amdgpu_atom_parse_cmd_header(mode_info->atom_context, index, =
&frev, &crev)) {
>                 if (frev =3D=3D 2 && crev >=3D 1) {
>                         memset(&asic_init_ps_v2_1, 0, sizeof(asic_init_ps=
_v2_1));
> --
> 2.17.1
>
