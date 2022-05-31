Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6112539897
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA7110E620;
	Tue, 31 May 2022 21:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C9810E5FA;
 Tue, 31 May 2022 21:21:19 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 61-20020a9d0bc3000000b0060b9bfcfe76so3050047oth.9; 
 Tue, 31 May 2022 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=14I4UbwyvZc+eD1HbI5WSSoBcqZsYR0nCVcYOj4jF60=;
 b=e7xa2Dm/2h8eDTqriJXBMxIHmSbFZQ0dfVMW+2BL/ayhYBc8NQ6aVx9kfSTr2zW70D
 oK1GrCmhwwuCeeQC8incazQBla0C69caxYTNAKSqgANXCsni8+ZfbMYBcmDRId9Y5buJ
 5+y54PaJsZWyuP79FKE6tkFJaJVPrjvgLObCER5jsxb5o8RkU/r+ybMPSLHV9I3DmpzX
 RYwS+02PrTfn7YVXEJtipC9fMJyYImombjbBGbO1I8NW7JEwj+kH8PtZopqGBINM+hiC
 o6vEm7lTiI5hFxiH8fn9N+5GAbo4xwITjBKVoktqbwE9UcNDHGLTrCZAIWfuWPSp0fmi
 EryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14I4UbwyvZc+eD1HbI5WSSoBcqZsYR0nCVcYOj4jF60=;
 b=Ia2MMxbGQAUSmPqXMBlJrDBrYWwP3DNR7jK+fApojWW+JdKxQ02L9aiEUMnLjmr9Df
 gJy/skk0LYbmICM2KyO0UIWO0nfVYSnU72jDxisTyCU87jCJvYWKZqluji+5f/quVFKV
 Cnh9oKV8NPAgy0CSMpUUv6rfIVRlLfjomlwnlI3v1CW2E/jPkbuJJM6Jr86Tkzh5I8Hi
 wn0ST7ZAZiIjIg3siXfWZDzDsfT82BfDzCAmnQR+0F6LHbfDtDSYAQbqpAA6Y4LGJqhE
 7TzOtRp2ZyhjwC8aEiUpTJ5AOoJOBqU3aAqIIXnFfUhMZzemjp7tKyhaFAlduSTKxh7L
 JHKQ==
X-Gm-Message-State: AOAM532JGtHL5XAlj4ohgfYXtcezJ15aWSXqIamiLhr+XFbf2D7RLaIi
 fA6MjChwoQGlbE8iwqqATrQqpr/f5NJ9oC3/89c=
X-Google-Smtp-Source: ABdhPJzoiG6lzp/Tvqt7hr1KyobU2ARwVzpPJeRBzYnmjIuTVY5TGAlERknSQVvMUgKTUfqVxToltdvmzLsIg8Sbx6c=
X-Received: by 2002:a9d:6b98:0:b0:60b:c54:e22b with SMTP id
 b24-20020a9d6b98000000b0060b0c54e22bmr18169628otq.357.1654032079055; Tue, 31
 May 2022 14:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220529072631.307922-1-sunliming@kylinos.cn>
In-Reply-To: <20220529072631.307922-1-sunliming@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 May 2022 17:21:08 -0400
Message-ID: <CADnq5_Np4BrKwgV1ti2xxGS4k5XeWGc0+URuaibNmQxH3Ro5QQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix a missing break in
 gfx_v11_0_handle_priv_fault
To: sunliming <sunliming@kylinos.cn>
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
Cc: kernel test robot <lkp@intel.com>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Dave Airlie <airlied@linux.ie>, kelulanainsley@gmail.com,
 xinhui pan <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 hristian.koenig@amd.com, "Deucher, Alexander" <alexander.deucher@amd.com>,
 "Quan, Evan" <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, May 29, 2022 at 7:50 AM sunliming <sunliming@kylinos.cn> wrote:
>
> Fixes the following w1 warning:
>
> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5873:2: warning: unannotated
> fall-through between switch labels [-Wimplicit-fallthrough].
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index cb581cfc7464..628d3536938e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -6028,6 +6028,7 @@ static void gfx_v11_0_handle_priv_fault(struct amdgpu_device *adev,
>                 break;
>         default:
>                 BUG();
> +               break;
>         }
>  }
>
> --
> 2.25.1
>
