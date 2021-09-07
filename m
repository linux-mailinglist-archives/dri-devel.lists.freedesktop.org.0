Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8F402D78
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC826E084;
	Tue,  7 Sep 2021 17:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD9F6E084;
 Tue,  7 Sep 2021 17:09:07 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id h133so13632361oib.7;
 Tue, 07 Sep 2021 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kK/sEOfN/pZIuqO14/lsd4LIY43xYqn1JYhVweF1vGI=;
 b=Mqfrhoc6dDyOOKYKg8JmzfkKcP7bC2XDcIAejCqjWUuHwRw32QFPLrMh3AFntRPgNY
 sQpyvXh2xR7YXesIdHdWl7wByP72cRua98xOmS/suC6DwFsymUUPDE5Ont6H5yR15CYq
 aXKPiSwBsyc/aLhumurGupVHGy9Hpt0/8U2WsXbB2bUHx2ID3NHDQafzyYL5uEXLP1By
 EcjHQqazagwCMzgdV/pHNhrL9s7wd7Q12U4Kr1cfAYlfSJrXHrpoFQb4J71TsR4UYUqE
 /hsenOoFDa43Qe2TSjEXj0WgAPcTJzAfdwj7Fcm/lZH9seotoMFe0NJM9Z325Hq8RISN
 snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kK/sEOfN/pZIuqO14/lsd4LIY43xYqn1JYhVweF1vGI=;
 b=he7JzYfAdXcPB9wt8dZxrqoS3s0pAqesS1fPHr79qxlNXHIPd1J/uVR4bxMEEGgly/
 3bn+8/n3kp2nt7xJfv8RfpjLMLCYrXb6BLKIAQ2HEcYSFBG8zpeQg2bvb5vAndbKGQ0V
 l3s27s6roF3kIDhyUnKC17tN8ZiA0HxldcW75x0EtjMuZTxMepvVOjKl14A7rK1dacyg
 1nFD6DqiFoqvYGIOfRcrii7kGeLrOftuUDaS9spN6mjSe78p1f+gW5c4/JCN9vtDC+kJ
 MNyZgBMW60yxTIzus4GHSv59ZyvcRc1+siDjLD5OHpKeKUjfBWmmgUhFle+zEG6rf7cx
 4gPw==
X-Gm-Message-State: AOAM533a6zwUdGOb1fH78RVzzRc3HydSDyZEyU8kBWlr4VTKko0bQx3m
 jdCt3rrw7uXT3tZk1TkGbouB+XjhbcAzSBYXX9M=
X-Google-Smtp-Source: ABdhPJw3/KyAiUHheOHTfy1uxzpNIALadQUdXX4RSLVEVjvJIVCLeww+QUmPCLFJXghPEihFMVQ58zj8hBJHILS7AAg=
X-Received: by 2002:a05:6808:483:: with SMTP id z3mr3634257oid.5.1631034546918; 
 Tue, 07 Sep 2021 10:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <1630921347-122646-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1630921347-122646-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 13:08:56 -0400
Message-ID: <CADnq5_PYgN2__PLUB89LR6PNNjOOxeyVcgmBG_N2jsBFXKiQCg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: make configure_lttpr_mode_transparent
 and configure_lttpr_mode_non_transparent static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Sep 6, 2021 at 5:42 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> From: chongjiapeng <jiapeng.chong@linux.alibaba.com>
>
> This symbols is not used outside of dc_link_dp.c, so marks it static.
>
> Fix the following sparse warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1766:16:
> warning: symbol 'configure_lttpr_mode_non_transparent' was not declared.
> Should it be static?
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:1755:16:
> warning: symbol 'configure_lttpr_mode_transparent' was not declared.
> Should it be static?
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: chongjiapeng <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index a666401..4e2cf8f 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -1752,7 +1752,7 @@ uint8_t dp_convert_to_count(uint8_t lttpr_repeater_count)
>         return 0; // invalid value
>  }
>
> -enum dc_status configure_lttpr_mode_transparent(struct dc_link *link)
> +static enum dc_status configure_lttpr_mode_transparent(struct dc_link *link)
>  {
>         uint8_t repeater_mode = DP_PHY_REPEATER_MODE_TRANSPARENT;
>
> @@ -1763,7 +1763,7 @@ enum dc_status configure_lttpr_mode_transparent(struct dc_link *link)
>                         sizeof(repeater_mode));
>  }
>
> -enum dc_status configure_lttpr_mode_non_transparent(
> +static enum dc_status configure_lttpr_mode_non_transparent(
>                 struct dc_link *link,
>                 const struct link_training_settings *lt_settings)
>  {
> --
> 1.8.3.1
>
