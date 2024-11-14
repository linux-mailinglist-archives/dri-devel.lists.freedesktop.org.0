Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205BF9C93FE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 22:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614DB10E378;
	Thu, 14 Nov 2024 21:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eDVTGjQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C7D10E04D;
 Thu, 14 Nov 2024 21:18:59 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20cf3f68ff2so543715ad.2; 
 Thu, 14 Nov 2024 13:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731619138; x=1732223938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjOZE3hisAlCS7qwBlAU3bmbS3PWvwStgDVh9a8JQvs=;
 b=eDVTGjQGmA9Qqv4FuZwxhdQLKieiDoc/AeJUremsOhW9Hmd8LQSFxHiHLbfNB/jFgz
 x+DiWDJqvkgGhdIzeClHN5AiUNmtkiuLKC55GaCxKzohqOvag/9n2nBYOnvFBw6BX4AL
 RO6DMbRzP7BgAtSKJdgal6gWlkclxK8n8sr16Y1CIK73hsdkg2dmgRJ/g06L4xHNRoX+
 Gypcyqd3mOdJb3/K0nequzYuEaxy26Y98/X02uTx2kfFrALLOT4qZTV6M29y5GWVCL36
 PKQTUy0+4MbalNpPI4zyR1c7spl8AXKkSOZptxuFwkn8Mad7xRB6DcVXkFVxZzZQ7k70
 WCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731619138; x=1732223938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjOZE3hisAlCS7qwBlAU3bmbS3PWvwStgDVh9a8JQvs=;
 b=XrEQD9YlDcrnjhOyTtbcC8nC7NrVYc8Jk3ABA3V9LH6dqfl3ccpUiYPVXxMUw1zFNh
 8dr/eLofF66gM7vRpXL54yOwwYRwPAp4FfEs+x8vEiCEc7jsuAA/RSL9pcNAw2cYmECL
 ibpvh/32S34l/HMIhBKibVhAXQCstomLaNSFTEzSH6j0q/zQIEwacgLX/dtfetkHPU1m
 VYMFxO795mkj/GjkKYh/LabNh9B2f6BCK3/JteuhJ2TrxFuHdX+5Q1jewMhH9zlCK9fu
 DafqYyIYXipvpaPJgM8doF71G03sxMgyP1zyEcdCMvzxj1AV6MU1BYhLa38zG0uc/oJA
 2QJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmHIUKCQ3L/+QethZUxfNegAgkYXiPWYqjuPtLtHolDYbedZ04UMkYTO3yz80G7HNrQpgzdJtk@lists.freedesktop.org,
 AJvYcCVNIx2pQMbSEmuD5PWY2OEShtL+cVEwqIGR6XSNQLDtRMZCECyRwzY/v1JV+8YuRzc8ECJHPqZ+e8FD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2Feea2LLHFosdfzmLd9fcLGV4gumjYkp7s7awIAzxFAPpfKlW
 XIpunA6XaY8k9rsFiQiY6NBqyiKchbQYb9UWXBV/OV2xLO3vYaUSsyNAsfgL8HkSM5yykgXkigB
 vR1J5yF48NeRa3t0B96RPKEHv5Zc=
X-Google-Smtp-Source: AGHT+IHhzXPmMku0cg2aQkWtxHrVmoYB4Za4dM8qFfs1SAu2VpW3gDJitADrhTqzXMtr1h9ZsN641VCvr03wtASGca4=
X-Received: by 2002:a17:903:2b08:b0:20c:b527:d460 with SMTP id
 d9443c01a7336-211d0d77e16mr1681805ad.6.1731619137932; Thu, 14 Nov 2024
 13:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
 <20241114151150.19576-3-bhavin.sharma@siliconsignals.io>
In-Reply-To: <20241114151150.19576-3-bhavin.sharma@siliconsignals.io>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Nov 2024 16:18:40 -0500
Message-ID: <CADnq5_OmxZ=tHrByQkDiFdwydpvunpkGWTsb8sLq9zb9ajXdkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amd/pm: remove redundant tools_size check
To: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
Cc: alexander.deucher@amd.com, alex.hung@amd.com, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Kenneth Feng <kenneth.feng@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Leo Ma <hanghong.ma@amd.com>, 
 Ryan Seto <ryanseto@amd.com>, Jose Fernandez <josef@netflix.com>, 
 Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Nov 14, 2024 at 10:12=E2=80=AFAM Bhavin Sharma
<bhavin.sharma@siliconsignals.io> wrote:
>
> The check for tools_size being non-zero is redundant as tools_size is
> explicitly set to a non-zero value (0x19000). Removing the if condition
> simplifies the code without altering functionality.
>
> Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
> ---
>  .../amd/pm/powerplay/smumgr/vega12_smumgr.c   | 24 +++++++++----------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c b/dr=
ivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
> index b52ce135d84d..d3ff6a831ed5 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
> @@ -257,20 +257,18 @@ static int vega12_smu_init(struct pp_hwmgr *hwmgr)
>         priv->smu_tables.entry[TABLE_WATERMARKS].size =3D sizeof(Watermar=
ks_t);
>
>         tools_size =3D 0x19000;
> -       if (tools_size) {
> -               ret =3D amdgpu_bo_create_kernel((struct amdgpu_device *)h=
wmgr->adev,
> -                                             tools_size,
> -                                             PAGE_SIZE,
> -                                             AMDGPU_GEM_DOMAIN_VRAM,
> -                                             &priv->smu_tables.entry[TAB=
LE_PMSTATUSLOG].handle,
> -                                             &priv->smu_tables.entry[TAB=
LE_PMSTATUSLOG].mc_addr,
> -                                             &priv->smu_tables.entry[TAB=
LE_PMSTATUSLOG].table);
> -               if (ret)
> -                       goto err1;
> +       ret =3D amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->ad=
ev,
> +                                     tools_size,
> +                                     PAGE_SIZE,
> +                                     AMDGPU_GEM_DOMAIN_VRAM,
> +                                     &priv->smu_tables.entry[TABLE_PMSTA=
TUSLOG].handle,
> +                                     &priv->smu_tables.entry[TABLE_PMSTA=
TUSLOG].mc_addr,
> +                                     &priv->smu_tables.entry[TABLE_PMSTA=
TUSLOG].table);
> +       if (ret)
> +               goto err1;
>
> -               priv->smu_tables.entry[TABLE_PMSTATUSLOG].version =3D 0x0=
1;
> -               priv->smu_tables.entry[TABLE_PMSTATUSLOG].size =3D tools_=
size;
> -       }
> +       priv->smu_tables.entry[TABLE_PMSTATUSLOG].version =3D 0x01;
> +       priv->smu_tables.entry[TABLE_PMSTATUSLOG].size =3D tools_size;
>
>         /* allocate space for AVFS Fuse table */
>         ret =3D amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->ad=
ev,
> --
> 2.43.0
>
