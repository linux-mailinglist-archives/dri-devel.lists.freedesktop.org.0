Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCA2DA2F3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16F16E0C6;
	Mon, 14 Dec 2020 22:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F386E0C6;
 Mon, 14 Dec 2020 22:04:16 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id f16so17343557otl.11;
 Mon, 14 Dec 2020 14:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TX3JAuUmoMFaSLBKp7jxuaJpxpbmhwfuBk/LfmgbykA=;
 b=BB3LPcnvWo/vNeykO5mH6GpRSh5oWkUi9mha/v9PFRWqxPhNpQLjsx1XxJ0nEuOWaq
 neuu5GMg6V/bcCw6cGjg4P5E+Da0J3adx4XOjpqVwyi/C3UmljMSV3lpxeTWIBKPbRU5
 1N86MnUKoL7Q5ZMkVGAdN4RB3pUdV9kl9hPvV2C+jJ7qpjUvsBS/WO8DK6CwdxKyDRbf
 RdnkhBrl/pr/0cVgi6ft9l0+YliN0aChuDETLTkCACAuNt4vZP7ruj8eIc4J7UwbhbNM
 g/mkCPllbPKC4t1IuOj1RGMWTlpytY4KuGnBmdAqKAiK6v/KLC5xdlBbzRwUsiPtyMsP
 Rdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TX3JAuUmoMFaSLBKp7jxuaJpxpbmhwfuBk/LfmgbykA=;
 b=pyU3j47dHLH0pP/ncwatDs7sLuYS4ZydD+lZDxfv+9f0kFwM7AXL1xJpPEPqQ2yhum
 LhpQHEp+1HkAzLXj1/aZj8Rn8CfFGpQILpZnLULEl4D3JN7lg/c5r+Sy483yyqV5EPrX
 oRzYY/8i/NRxQfJy3EZDY5PJxJsMjv5HyFqz7yAoJqWkuASXrQyy2RQXpjRNat/UDOm8
 ijpUS5CCeUANefhUkvb/4k9XjIB56nFmxTGmuOqlzJ8FVq39SfWcvxRgAM/jaauLJM92
 NPU8slhsn5QBe3HwIXD4me413ZAUVykjUD7zs7+MclhTZXkE1ZSPqx9f+x1aR2hrManl
 V8iA==
X-Gm-Message-State: AOAM530oconhkm74uQM6XiXN0+wJ1N1d8Brntpjn5S4eCvpiKB7PJIes
 RZk2rGrhylEfr6JTEzHdnpp9Rr+bUtdaoQQ8JtM=
X-Google-Smtp-Source: ABdhPJwuYKfRUvrb64bJwPGIgLQRDo/8IeY47r1fgMUNYeTjGtyWa0BiH+C81q81L+7AdH5JQCNfOQvlBQF2orAjf7Q=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr21987188ote.132.1607983455510; 
 Mon, 14 Dec 2020 14:04:15 -0800 (PST)
MIME-Version: 1.0
References: <1607715156-4258-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1607715156-4258-1-git-send-email-jrdr.linux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Dec 2020 17:04:04 -0500
Message-ID: <CADnq5_MOqzGe=rDRz5JV3UNTKBWx-XHodZpo5ztMnHwGapac8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fixed kernel test robot warning
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 2:34 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Kernel test robot throws below warning ->
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5349:5:
> warning: no previous prototype for 'amdgpu_dm_crtc_atomic_set_property'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5349:5:
> warning: no previous prototype for function
> 'amdgpu_dm_crtc_atomic_set_property' [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5373:5:
> warning: no previous prototype for 'amdgpu_dm_crtc_atomic_get_property'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5373:5:
> warning: no previous prototype for function
> 'amdgpu_dm_crtc_atomic_get_property' [-Wmissing-prototypes]
>
> As these functions are only used inside amdgpu_dm.c, these can be
> made static.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 313501c..e6d069d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5328,7 +5328,7 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> -int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
> +static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
>                                             struct drm_crtc_state *crtc_state,
>                                             struct drm_property *property,
>                                             uint64_t val)
> @@ -5352,7 +5352,7 @@ int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
>         return 0;
>  }
>
> -int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
> +static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
>                                             const struct drm_crtc_state *state,
>                                             struct drm_property *property,
>                                             uint64_t *val)
> --
> 1.9.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
