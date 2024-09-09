Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9A97206A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648E010E607;
	Mon,  9 Sep 2024 17:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X8VTHlW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BAF10E603;
 Mon,  9 Sep 2024 17:25:25 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-502d09a9a7fso47980e0c.0; 
 Mon, 09 Sep 2024 10:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725902725; x=1726507525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6HhkSoNUnMMq3D2hVDty/duRuGXfXAOcY5s6838TPc=;
 b=X8VTHlW97n5isnr4o8597vrtNmNjnbSmn3TyYsbK/g+sy6rDjNCiBgJY6g+xyrT/jX
 AB7IDQTUKwwLEiXntgQNXva44YdDFGmoB5/HsOYR4boyorlu9w3ZCyBSZ9o0M64Xmdms
 WTV5MWxKJ5WAsBR03DJ3Ohlh2aug/rYmSOsqgUyCHMYyPBr90SGoo2TROsuEWVjxGC7J
 b9OulxI5TCoYTP7VsZiG9zwwuBCGj4y0BHTYMk9vsa39K32xKRFXfK3A32PgRmtTJCYx
 oY7uuapVuXFL/GHSt/uto/vGYxiPkQqKMdGvTBpLkSUXfyLrAjsndKb8joG9DQQP+ROl
 9QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725902725; x=1726507525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6HhkSoNUnMMq3D2hVDty/duRuGXfXAOcY5s6838TPc=;
 b=j38xtcAp1yaBap6RazQR9znsoN7gvUmFIWVMZCYJgVfuJDSEA2I8XwdAY66SP3O2KD
 Twe0J/domfzZEM/vCw7gJIOypgtSCGP4treaiq8bceJwdmK61uEbrn672zLVNgqtjkwC
 Zv2dYVduBu8bi8OhIYqpo+AVcU9XCrJTECn7Piscy3NG1Jk813doJ8smPiKTAYF2Vy25
 yshdFavjx5fVnPXXafxEJqy95XKU/V/g+nBQwaJjy0k6tM5zrZDu1L0VsPXNDIj9lPnF
 eDeTfdaok9PmohfHzeqTmcNN52rhNBbH8myutCnKY1D1tQuz2y1qgsYfw31guW+9ua1z
 UV1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqvShjsE0Gb9T0o6OMEQD2dAgmsrr3cIwzHLOLc/PUN0n3otBR0EoX3E3m0mHk3ETSwYxqa6ZuPXCH@lists.freedesktop.org,
 AJvYcCVeWMfQi75eSqfprZpV2acpPqM/5gXiIr3L7hVMzINay88Oxd8iPZWYWG/r+4HD2LO4QC7eZJHG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIn7ds0zh6Uq7vYCh+HuOsicZONW86gxQSbklM14Zpy4/qftGA
 ejs02O7nvZzyFplGhfWXtDioxmF4x2KZvW2/yqBXPTxeS056lqko6zdBwiUGQsZSTDpQqVlFI63
 x4DRDm1TpzF0IddXpPMPRpnpbUM3WGULF
X-Google-Smtp-Source: AGHT+IE+92W3Wb5qGWWv0/BNzhYfbYBSNd1bpAERi4JgZtkLOBi8feyRz8JARPymwdvLFiYP5/0AF80SNFmwkpF82h8=
X-Received: by 2002:a05:6122:6113:b0:501:2e0a:ed2a with SMTP id
 71dfb90a1353d-501e77976bemr6205128e0c.0.1725902724367; Mon, 09 Sep 2024
 10:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240909064000.1198047-1-make24@iscas.ac.cn>
In-Reply-To: <20240909064000.1198047-1-make24@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Sep 2024 13:25:12 -0400
Message-ID: <CADnq5_Ouci1bvRJh+1mDRxgazvL7C-rgg+BjeGyNT-qa=vHtyQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/display: Add null check before access
 structs in dcn32_enable_phantom_plane
To: Ma Ke <make24@iscas.ac.cn>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, alvin.lee2@amd.com, wenjing.liu@amd.com, 
 roman.li@amd.com, dillon.varone@amd.com, moadhuri@amd.com, 
 aurabindo.pillai@amd.com, akpm@linux-foundation.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Mon, Sep 9, 2024 at 2:48=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:
>
> In dcn32_enable_phantom_plane, we should better check null pointer before
> accessing various structs.
>
> Cc: stable@vger.kernel.org
> Fixes: 235c67634230 ("drm/amd/display: add DCN32/321 specific files for D=
isplay Core")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Thanks for the patch.  This is already fixed in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/fdd5ecbbff751c3b9061d8e=
bb08e5c96119915b4

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> index 969658313fd6..1d1b40d22f42 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> @@ -1650,6 +1650,8 @@ static void dcn32_enable_phantom_plane(struct dc *d=
c,
>                         phantom_plane =3D prev_phantom_plane;
>                 else
>                         phantom_plane =3D dc_state_create_phantom_plane(d=
c, context, curr_pipe->plane_state);
> +               if (!phantom_plane)
> +                       return;
>
>                 memcpy(&phantom_plane->address, &curr_pipe->plane_state->=
address, sizeof(phantom_plane->address));
>                 memcpy(&phantom_plane->scaling_quality, &curr_pipe->plane=
_state->scaling_quality,
> --
> 2.25.1
>
