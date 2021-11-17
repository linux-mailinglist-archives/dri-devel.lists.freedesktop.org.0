Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC655454F51
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 22:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285E86E5A0;
	Wed, 17 Nov 2021 21:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993BC6E5A0;
 Wed, 17 Nov 2021 21:25:50 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id bf8so9324165oib.6;
 Wed, 17 Nov 2021 13:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zsu8m7qQZBsyokKQZY/iZgWOtExTquEP9UNXXnM1Y8c=;
 b=b533kvOf4e8JBJ9EkfEo3sj0vhQ75lTR8y1eKODyoirSRFIQuU9CL6bJ6IdUO3dggl
 Hbu31/Ad4e7ESqE+85/dRjFUnvjwJYD50t/92GYwlbRvJIjQkmbLftmZCebSvDfyqNoK
 uQeOK6+l5P6+7UJN2M7oUemyLBu05La8WBbtvkhYkgkwVldALtOSBbaV6l6GtCZKY6iY
 j7kbLGsCFI35kTGidd4bSElsoD8FHEwwqHU/h4YDmaIOvv2l7NT6MbPTcTp7uhSZKMd5
 JLm1FJ2f/drGidY82Qj8/wKCFM7K0ukA9IylajmJE2xgTsj4lTZT+gRKYbRUFvFPHh9l
 Z6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zsu8m7qQZBsyokKQZY/iZgWOtExTquEP9UNXXnM1Y8c=;
 b=W+q74+D7pEh8RkyMLflVoM2EANVmKJkX/mQ1H4XA29K0U55+unhV0HHW2RSFxkMiQV
 i2gnzv3m47vlMua868TZPiIzlvSGEuohv/BFYhZJiFZgPm96OFiTr06gtWUGyxN2dLjo
 aCLD2uYgF21jpF7PnbrFJ7TvGBwwLdLn9895tBHZRajcT8WUXUZsptjK1gUyWRMKFJUJ
 BsjcIJvJJ8zxCN5h10jdKhMgLkEck7g5ulusMPDELw4Q963eUcEFBnT8yivxdMbBOgpo
 to4dd+tzb2Sme+tx+2wbrcHiWXQMve6iOvjnl/EQnArWxYJz8ptNOzlMzngreRbRn7YU
 7qOA==
X-Gm-Message-State: AOAM530imhd4OBmwY+EV7vx5/qjdlKUmPL/b7pz5fIp149m7oza58orI
 dWXyi7jIJqLi/jrzM/fa5YFDzT8dtCTCgOdLGPI=
X-Google-Smtp-Source: ABdhPJy5h/L+MOfdOoOjqkVwS+fSx+XGB7jC6qbNniJ83Ca/X7uM2gYzZJqyGXoZ9O04fFdc8zN5edaSaWWn8c3+glY=
X-Received: by 2002:a05:6808:44:: with SMTP id
 v4mr2808864oic.123.1637184349846; 
 Wed, 17 Nov 2021 13:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20211115071429.7314-1-bernard@vivo.com>
In-Reply-To: <20211115071429.7314-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:25:39 -0500
Message-ID: <CADnq5_Nj46a0mOHKcR-Y__fucV9Ug7EpvtZphFfWMTHtaoGfkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: remove useless break after return
To: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied thanks.  If you want to make the numbering more sequential,
please also update the other dce files if you make that change.

Alex

On Mon, Nov 15, 2021 at 2:14 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> This change is to remove useless break after return.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index b200b9e722d9..8318ee8339f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2092,22 +2092,18 @@ static int dce_v8_0_pick_dig_encoder(struct drm_encoder *encoder)
>                         return 1;
>                 else
>                         return 0;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
>                 if (dig->linkb)
>                         return 3;
>                 else
>                         return 2;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
>                 if (dig->linkb)
>                         return 5;
>                 else
>                         return 4;
> -               break;
>         case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
>                 return 6;
> -               break;
>         default:
>                 DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
>                 return 0;
> --
> 2.33.1
>
