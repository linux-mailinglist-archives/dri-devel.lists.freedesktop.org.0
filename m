Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E051352BB3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 17:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02F56EE61;
	Fri,  2 Apr 2021 15:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE90F6EE76;
 Fri,  2 Apr 2021 15:21:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r14-20020a05600c35ceb029010fe0f81519so1010411wmq.0; 
 Fri, 02 Apr 2021 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WP3VoNZ5+TpRVICeSpHKbkMESNKhKPPMgvYTDtFR2No=;
 b=efsvJeDH4bfJGtQdkNbnC9ctwhORj113XksECOyNa6qnTIizlFnNbshKjAd28C9NlE
 xYKFm+dLni/z0kazJRzB3W1BZ7WwvreVw++K3NB2znXjFCTIHack9TTS3IWOrlD55WuS
 KPUXjY8jP9nKMcDlCNUenwEJitCZbY1qHUVO8VKFEXZBw6kY5W3CzArvXH36OXdqx8lB
 TPnbpIqax2bgGz9IjKpSswkfw4szZXVHzbY9ovIAxw4Evghu24HGSx/RRS+UwLPUBtyH
 348aIxdoekK6fHqAokkMLa+uY/BFgnigXlHeB+B51hmHiyhj4XYjJ4m7WdIcOcoAmXGT
 IMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WP3VoNZ5+TpRVICeSpHKbkMESNKhKPPMgvYTDtFR2No=;
 b=qEHYKl4gq7oIy62sq3rm7Eiw3tT7Fh2SLwqZ3LDwJptQZxN5yq29bGkQx/avx1Cisp
 bVA9xLbP1FQD3jUkBwHWvbAmDLAAfdfnSq4TmYcp5V6Z2yjBchgnBwjGzWBTeWJkVlZy
 i61T9je3sPuOr4Jga4daMp0wwUc2pcDFFdN5K2BvNCSzMWSX+0edskCpnFYuxy46cIOJ
 Ie9YNev7w5v0kfJ6H5qjC7hgAJ/bMI8o81KMGMEqzHA/yDECOE6EbTR5/qPpkl1hP9cG
 6RazFDDaAYL0UbWvndiPbpa+Geq1hsywBoriBBVOmDSf4Ss4c4BNVkKeGWLw3UOykl9o
 Fwjw==
X-Gm-Message-State: AOAM531xSGjwB7LDn9VVbk16S0y2EtXXZbJvVeXFKV4xOQEudrQleFO3
 AuwaEtTZvFYa4cEjLK/MZKQ4VB+5TQARnx1KHOc=
X-Google-Smtp-Source: ABdhPJwbbQ7KmfS8gkvdcBnX8Vt1oOMeWn3SKmQPsX2LZHyur7qUbf39fZLg5ba9thU15fnffhc2jopzrJHXrPc2T/E=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr13582268wma.94.1617376866612; 
 Fri, 02 Apr 2021 08:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <1617364493-13518-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1617364493-13518-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 2 Apr 2021 08:24:31 -0700
Message-ID: <CAF6AEGskP-TNTk33R=qSi39T3g=GttR8K_j+Qk4FQTo23Y7v-g@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: program 3d_merge only if block is attached
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 2, 2021 at 4:55 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Update the 3d merge as active in the data path only if
> the hw block is selected in the configuration.
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>

Thanks, I've added:

Fixes: 73bfb790ac78 ("msm:disp:dpu1: setup display datapath for SC7180 target")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 8981cfa..92e6f1b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -496,7 +496,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>
>         DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>         DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
> -       DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, BIT(cfg->merge_3d - MERGE_3D_0));
> +       if (cfg->merge_3d)
> +               DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> +                             BIT(cfg->merge_3d - MERGE_3D_0));
>  }
>
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
