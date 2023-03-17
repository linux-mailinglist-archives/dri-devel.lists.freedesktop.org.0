Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA896BF29E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A7110E41E;
	Fri, 17 Mar 2023 20:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BC710E418;
 Fri, 17 Mar 2023 20:32:57 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17aaa51a911so6981570fac.5; 
 Fri, 17 Mar 2023 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RfMN7DRIcyqsTtzN8E9y+T6KdTmfa65N2EjbDjm3zY=;
 b=FCW5yVym72MxBW25JQav1TzIabA1cYrb4CyrTIayWtwSGPt0m9OAV/IHKHgXY6qgoQ
 IKtZoU1qsTr10zUsRONDgaRZcNdWQokX39v2ufOerYGbHjuqid7fsnXwccIWtXmeyLrL
 WYJx8euxaY9CEJ6Q8tNGxc7EmFWCIkBunhQfVgx4tNFBQlu/fnx8BdK+dc/A8gk/V50v
 1rIJ5TbaT7vQqzLwNBRgqAMyasbNnmE2TrQlCgqMpquTtrZFgi1gqdMhambWqdFGYjG8
 OfRce4S/DzqVUCZhQXUlkVLrlBLwVrSgr9HRr0koylzLx8FNvsstjXI/LFq5VpUsm8Zh
 yErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/RfMN7DRIcyqsTtzN8E9y+T6KdTmfa65N2EjbDjm3zY=;
 b=F05IaMzJsZz4F0ihBzZRA3lkwrjjiWz3vJUqoiJ/44f4hDNw5prMFlA+FBF2BB3J4x
 0qjsF78uf10cwrYqVBAbSovd8n22JL0YzPzt9D0fXvFcAhNXCsjuItDOW4zFQ1EyTxVC
 WRon+YOE8WE4oDAlo6tbEjNowlyIIF0KXH813ekTwTah/rkbjtIxNEsndwqER0llONXD
 QGdqIQoVy7r0dYFrFXmm9P1sYCDITPVzDr/8q4J4BPYyGoAyHH39aIA9yggA56HcrLF0
 8k0sgdxX6+7aewtWdiWNieAaoM13aLACPF55i4Cpkw2ofF6/B7g1tjy3JLoxE5MR4t97
 eDSg==
X-Gm-Message-State: AO0yUKW/IfNFVz2g+QhFDuX3pBNXil2fpK+Uk9eIVhUSjNZ5AH8u7Rsp
 S3d9H5stoPrQx3cQwv2RWxfQk3BD1rtSPnbemYY=
X-Google-Smtp-Source: AK7set9pwElEd/aUD3iyT/dmmI+xSHtUnpnvu7q5FwEC9FpCXyCDiYObJzPkAJO7vw6nJFli+VEKTOKzZN/kH6PIIXg=
X-Received: by 2002:a05:6871:48c6:b0:17a:a999:e87e with SMTP id
 qf6-20020a05687148c600b0017aa999e87emr337853oab.3.1679085176245; Fri, 17 Mar
 2023 13:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-27-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-27-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:32:45 -0400
Message-ID: <CADnq5_OD8o=zEndGqyEPEpgtW9b3xRh=62haLZOfEFMARFRJ6A@mail.gmail.com>
Subject: Re: [PATCH 26/37] drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
 SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:48:2=
2: warning: =E2=80=98SYNAPTICS_DEVICE_ID=E2=80=99 defined but not used [-Wu=
nused-const-variable=3D]

CONFIG_DRM_AMD_DC_DCN was recently dropped so this patch is no longer relev=
ant.

Alex


>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 330ab036c830f..a8904184673f6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -44,9 +44,6 @@
>  #include "dm_helpers.h"
>  #include "ddc_service_types.h"
>
> -/* MST Dock */
> -static const uint8_t SYNAPTICS_DEVICE_ID[] =3D "SYNA";
> -
>  /* dm_helpers_parse_edid_caps
>   *
>   * Parse edid caps
> @@ -703,6 +700,9 @@ static void apply_synaptics_fifo_reset_wa(struct drm_=
dp_aux *aux)
>         DC_LOG_DC("Done apply_synaptics_fifo_reset_wa\n");
>  }
>
> +/* MST Dock */
> +static const uint8_t SYNAPTICS_DEVICE_ID[] =3D "SYNA";
> +
>  static uint8_t write_dsc_enable_synaptics_non_virtual_dpcd_mst(
>                 struct drm_dp_aux *aux,
>                 const struct dc_stream_state *stream,
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
