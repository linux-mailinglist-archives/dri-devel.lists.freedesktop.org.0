Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F4910A00
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B53E10E2A5;
	Thu, 20 Jun 2024 15:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KagBT8lK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2A610E0BC;
 Thu, 20 Jun 2024 15:37:19 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2c8062f9097so325121a91.3; 
 Thu, 20 Jun 2024 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718897838; x=1719502638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uAJa9cd+U3ByOgDIj6AuFYi+T/LG4WllhhWOF2SAZo=;
 b=KagBT8lKlLv4SygVrNgEz7+HxMKv7O5sCinkg8a51q+iXv1yLy5Ey61lQDzy2/jhki
 bKUe+4dVK1c1pdr9MHE76aMoeI7Ab+DG1/n6tXGIYLzd7otN87MFoCCPUsUtDYfGjl60
 RBzCwK2cPIPlJmUEvn23WPfy8uQjoAbWqPiDfoaRwgWMDxZkHQ/vwYp/HfaQ97Atrw32
 fj0k+uEFr3di241y9f8DeuHKmpbIu9LOpAqxbB+6jGZ/oyvPscvhetL639MK3PEra2ho
 2ztFkT8kKzz9DeEzUAO/k308TBqf0KFAO6FJBvOnp2dPfYKJABzusWmapmcpPbslKgXt
 XnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718897838; x=1719502638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uAJa9cd+U3ByOgDIj6AuFYi+T/LG4WllhhWOF2SAZo=;
 b=mtzo3vNsZy0T94jvlxAflvrl504Pz2PiYo+P17D7JvVrLdys2f2mdJ3nGMsfWkbkzn
 OI/gmQ8kvFFPEbViR3LroqeFstyN7CUts7CB8fAmNtLhwUplj2V1KgCQmCxX9ACUS0Hw
 8xD4qUcdyfv9jGY6HPznekHoQ6bxe8IJkDoDmUTxEHb53BuCr5Us0aDZ5+rJwplPSUcq
 gFueLGVeMKoFVxyjiZsgiQcWW+o7IDGqtceDV7HtSmXjexLA8/VjF0UMmzJrEIAnarPa
 C7ptJoofTjAm3E/204NeYjZpgLHIUw+tc3LLDxt5I3xijKl/7v8Ha4vehZGjwlAQvgWp
 4pTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPTz6hLFxci3IInAjWTWJE+m8FrCpxo2x5d3srx6a2o1uRTTsbCqfn45S0+JzkC74p+Za8uGXnU0P335+jV+XadL3NL324QIkCIkC4+Femw+26jhC5Mjh5/Ot3nQcVcBphltPz/pydtxyzyljDAA==
X-Gm-Message-State: AOJu0Yw1w3GLX6E5oLyUHXLTH6kjv4vAQ9eUghd6nqsDTydRhTBXCFTW
 yVpyBTxWwDKWxw8ZH9Ea1M0hfiXzFuSxai0elNV3QwUqfX8Q28xThJXjjhTJxVa3Hs91hb/Yi1x
 be0x3T2Ui31jC/WLyDeEByiK8fis=
X-Google-Smtp-Source: AGHT+IHSa5FQ71JMRXYJyNnf8Gm4yVBhH8IUXZ/P53BWbl/sQt3VuXb0a7WwZrfoKndyPecNdx8rJ7qCoEk/iEFq384=
X-Received: by 2002:a17:90a:2f45:b0:2c7:aafb:8e3c with SMTP id
 98e67ed59e1d1-2c7b5afc252mr6219918a91.18.1718897838148; Thu, 20 Jun 2024
 08:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <a57a9d8f-40bb-4cfa-9dad-4f93a1f33303@moroto.mountain>
In-Reply-To: <a57a9d8f-40bb-4cfa-9dad-4f93a1f33303@moroto.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Jun 2024 11:37:06 -0400
Message-ID: <CADnq5_OeVWwL2UfR0a5eE5TYaQo4QySvTennYJdGQ9r-ajDwWw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up indenting in
 dm_dp_mst_is_port_support_mode()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, 
 Agustin Gutierrez <agustin.gutierrez@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

Alex

On Thu, Jun 20, 2024 at 4:49=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> This code works, but it's not aligned correctly.  Add a couple missing
> tabs.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 48118447c8d9..5d4f831b1e55 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1691,7 +1691,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
>                 if (aconnector->mst_output_port->passthrough_aux) {
>                         if (bw_range.min_kbps > end_to_end_bw_in_kbps) {
>                                 DRM_DEBUG_DRIVER("DSC passthrough. Max ds=
c compression can't fit into end-to-end bw\n");
> -                       return DC_FAIL_BANDWIDTH_VALIDATE;
> +                               return DC_FAIL_BANDWIDTH_VALIDATE;
>                         }
>                 } else {
>                         /*dsc bitstream decoded at the dp last link*/
> @@ -1756,7 +1756,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
>                 if (branch_max_throughput_mps !=3D 0 &&
>                         ((stream->timing.pix_clk_100hz / 10) >  branch_ma=
x_throughput_mps * 1000)) {
>                         DRM_DEBUG_DRIVER("DSC is required but max through=
put mps fails");
> -               return DC_FAIL_BANDWIDTH_VALIDATE;
> +                       return DC_FAIL_BANDWIDTH_VALIDATE;
>                 }
>         } else {
>                 DRM_DEBUG_DRIVER("DSC is required but can't find common d=
sc config.");
> --
> 2.43.0
>
