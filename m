Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEF25076E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0590E6E436;
	Mon, 24 Aug 2020 18:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB096E436;
 Mon, 24 Aug 2020 18:25:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o4so5819533wrn.0;
 Mon, 24 Aug 2020 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YAIp8ZarRWu0DneCjynShSWStsctWj+flPeQS/fuk90=;
 b=ImIVgxc0O5olzfnTRLTN9/f5FqqUKOFbAjtbqVq5jBtfjjbeT+rd4I2gAXsX0v2qNs
 7Wyf1fQU68zeCq+HvLJBNqXm52IjBh9zQ198pexe3sGUjQ6ATcRO9Gl4q2A0PgRsQpi8
 NoZStLpCl2firUTTtspxaDxeYN8Y/Vso+j+Cm9+6lP7pC+0RVxUvzDRkNqRTRXMsjGCh
 wRaoR488quQursJ9PBFHXVrFSCjYdrzUAAFcqjkAXLQbmtN9fzI89KwgOGc2SUAvTQ2T
 iui6QTm2wPq8LdYEO34ITEvweK6WEudZEAe152gjpoOodkiuB4BmM58f6v/UugonIuuo
 57dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YAIp8ZarRWu0DneCjynShSWStsctWj+flPeQS/fuk90=;
 b=Tkm3d6biiPb/ip8Tn5fGVqoJY3lgCgEfz3o/bDR3SeoBetNPUIU4nk0i2dJtYjXHcq
 zFQ1C+z4eiDj3UsPNj8J5/1gspVsyOh1Ie/fErUxgsdsuVnLr7mrb7xRW3biB07N8wFu
 InyI7gvDgf36j34zYzJl/JTpt1fpv0R22npvHnT5/lCGzC0LG80Opk06/UHsMV40SUy2
 EGxFQOJc5VCrw1ooDo+AfYYZrS83NFd+AacL1wQS+grLCEcoxMMPJbH7G9s/CPTA9uei
 mVUyDMbFWvQ/GjQIK5yjLbkQBIvq3T1mdFwb5yDBU3JnT8875J9/Uad3leYOFrhgIQPM
 bjBA==
X-Gm-Message-State: AOAM531L1mVzDV51BHkv3kBogB/q3uN0NxShqywSpbq0U8ZrdNGs+Qzn
 o4VZRpmTB4g6JLzR3Gxy7SETs/Th8rJ5iB7uARPXBzN4O/0=
X-Google-Smtp-Source: ABdhPJzSKmSBY48GlofEmwpRYlP/Xg4nbwx0nfnoM1l2mMj5wUpD1EWeGKMwmT6iUWsh+bMCoVnfYFpnMPBQI1S/oxI=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr7304310wrs.419.1598293524074; 
 Mon, 24 Aug 2020 11:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200824163751.606577-1-sashal@kernel.org>
 <20200824163751.606577-34-sashal@kernel.org>
In-Reply-To: <20200824163751.606577-34-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 14:25:13 -0400
Message-ID: <CADnq5_M6MvH2nB_C6j7NezKGPeCRbEFZ-9kXf-_j+d9OQV0h0A@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 34/38] drm/amdgpu: disable gfxoff for
 navy_flounder
To: Sasha Levin <sashal@kernel.org>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 12:38 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Jiansong Chen <Jiansong.Chen@amd.com>
>
> [ Upstream commit 9c9b17a7d19a8e21db2e378784fff1128b46c9d3 ]
>
> gfxoff is temporarily disabled for navy_flounder,
> since at present the feature has broken some basic
> amdgpu test.
>
> Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Support for this chip does not exist in 5.4 or any other older trees.
Please drop this.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 64d96eb0a2337..3a5b4efa7a5e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -617,6 +617,9 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
>         case CHIP_NAVI10:
>                 adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
>                 break;
> +       case CHIP_NAVY_FLOUNDER:
> +               adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
> +               break;
>         default:
>                 break;
>         }
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
