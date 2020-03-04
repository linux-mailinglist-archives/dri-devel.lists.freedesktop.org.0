Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A70817A0EA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F496EA23;
	Thu,  5 Mar 2020 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0354B6EAF8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 09:28:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r17so1449951wrj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 01:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PmkN7hwvga6b6nOJQkMBtxiaPHT0wTUKDIjYfaC+JlM=;
 b=U3q6SAyFqLf4Ao4HllGS0rh74FAspGy70EFJTGwl30cFX4qr7GptUbd6oixMq3aQP5
 GfYItarRtIR2dUNC+CKHTGErork+p07vAbyS0+87mVNilGGD9HoiCuLKD853DLbxuEVz
 wNIPvYGZ+v3I1Y6udMoyUnPB1EAdsyTr2Drf3hc0//ssXuGDNXrCVPji7nkGHjpqYwrA
 xdNuZRdZ+m3i6ooVq1nWnRXOg2hBwqGBmEmHQYsLAoe4ggZyWdAEF1A8aGoW9KEHjjPj
 qLhY+b6+8uRTmKcpkvVPO+ZAMt2l22FBoaAmhuWsga1j94RpWy7RJ7Kgb/SJNvuPFbom
 dJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PmkN7hwvga6b6nOJQkMBtxiaPHT0wTUKDIjYfaC+JlM=;
 b=pj/GqUv2fqrsazm+f0eCL/ZxFEm9lrP3p44isW5fI/uOIafI4mZa3CMMZVxeCqkGhR
 +xOOyDQBxxIcceESfUm5QoqA0nMOlQOb/cWc3byah0GGd5QSlYs0gsHDWzWHfDwpT2eV
 hA9FHoY1VMeGg6nERldpy7E93wQxaYzie9mdiGCQHw6aBycP5cgRvLi9slC/v0Rjr9+K
 udEk2d+gFx3s7bx4w6m5wyLPQrWgqf8W0g4Tcc9sT8Niuh/rv5L8aBUViJ84PNiia+7W
 auXxALXRow4KS2u568NgJLofgKCGLhizxHx1Kd+FdeMTK8BmNYNhpq0OTbW/YBFQm2mC
 6Srw==
X-Gm-Message-State: ANhLgQ3CS7lXqBm8qMrOd5nSCM+TLHyXCDs3oPwzj+ldIAZJKOa+QnIb
 oJ6UPOkb3YJvShv4pL+Yo9qNhAEkhfRxhq0slXrbNw==
X-Google-Smtp-Source: ADFU+vuRtpT1Fbqvbqe6uQOMsu6klsPxlZN6iHsxNNno25qCgaGRqkmaJ9braaycRuZ6meSYuHo1QofgWXHqKyjhpgI=
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr3245947wrs.306.1583314113705; 
 Wed, 04 Mar 2020 01:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20200303163228.52741-1-john.stultz@linaro.org>
In-Reply-To: <20200303163228.52741-1-john.stultz@linaro.org>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Wed, 4 Mar 2020 17:28:18 +0800
Message-ID: <CAKoKPbzUKUtpKVAYKMe4vYi70T33aeN74Q6oR8Ngw70CJ3t96Q@mail.gmail.com>
Subject: Re: [PATCH] drm: kirin: Revert "Fix for hikey620 display offset
 problem"
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 4 Mar 2020 at 00:32, John Stultz <john.stultz@linaro.org> wrote:
>
> This reverts commit ff57c6513820efe945b61863cf4a51b79f18b592.
>
> With the commit ff57c6513820 ("drm: kirin: Fix for hikey620
> display offset problem") we added support for handling LDI
> overflows by resetting the hardware.
>
> However, its been observed that when we do hit the LDI overflow
> condition, the irq seems to be screaming, and we do nothing but
> stream:
>   [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
> over and over to the screen
>
> I've tried a few appraoches to avoid this, but none has yet
> been successful and the cure here is worse then the original
> disease, so revert this for now.

Sorry to hear that. Then it seems such underflow errors can't be
recovered via reset.
Anyway, for this patch
Acked-by: Xinliang Liu <z.liuxinliang@hisilicon.com>

And applied to drm-misc .

-xinliang

>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Fixes: ff57c6513820 ("drm: kirin: Fix for hikey620 display offset problem")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  .../gpu/drm/hisilicon/kirin/kirin_ade_reg.h   |  1 -
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 20 -------------------
>  2 files changed, 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
> index 0da860200410..e2ac09894a6d 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
> @@ -83,7 +83,6 @@
>  #define VSIZE_OFST                     20
>  #define LDI_INT_EN                     0x741C
>  #define FRAME_END_INT_EN_OFST          1
> -#define UNDERFLOW_INT_EN_OFST          2
>  #define LDI_CTRL                       0x7420
>  #define BPP_OFST                       3
>  #define DATA_GATE_EN                   BIT(2)
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 73cd28a6ea07..86000127d4ee 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -46,7 +46,6 @@ struct ade_hw_ctx {
>         struct clk *media_noc_clk;
>         struct clk *ade_pix_clk;
>         struct reset_control *reset;
> -       struct work_struct display_reset_wq;
>         bool power_on;
>         int irq;
>
> @@ -136,7 +135,6 @@ static void ade_init(struct ade_hw_ctx *ctx)
>          */
>         ade_update_bits(base + ADE_CTRL, FRM_END_START_OFST,
>                         FRM_END_START_MASK, REG_EFFECTIVE_IN_ADEEN_FRMEND);
> -       ade_update_bits(base + LDI_INT_EN, UNDERFLOW_INT_EN_OFST, MASK(1), 1);
>  }
>
>  static bool ade_crtc_mode_fixup(struct drm_crtc *crtc,
> @@ -304,17 +302,6 @@ static void ade_crtc_disable_vblank(struct drm_crtc *crtc)
>                         MASK(1), 0);
>  }
>
> -static void drm_underflow_wq(struct work_struct *work)
> -{
> -       struct ade_hw_ctx *ctx = container_of(work, struct ade_hw_ctx,
> -                                             display_reset_wq);
> -       struct drm_device *drm_dev = ctx->crtc->dev;
> -       struct drm_atomic_state *state;
> -
> -       state = drm_atomic_helper_suspend(drm_dev);
> -       drm_atomic_helper_resume(drm_dev, state);
> -}
> -
>  static irqreturn_t ade_irq_handler(int irq, void *data)
>  {
>         struct ade_hw_ctx *ctx = data;
> @@ -331,12 +318,6 @@ static irqreturn_t ade_irq_handler(int irq, void *data)
>                                 MASK(1), 1);
>                 drm_crtc_handle_vblank(crtc);
>         }
> -       if (status & BIT(UNDERFLOW_INT_EN_OFST)) {
> -               ade_update_bits(base + LDI_INT_CLR, UNDERFLOW_INT_EN_OFST,
> -                               MASK(1), 1);
> -               DRM_ERROR("LDI underflow!");
> -               schedule_work(&ctx->display_reset_wq);
> -       }
>
>         return IRQ_HANDLED;
>  }
> @@ -919,7 +900,6 @@ static void *ade_hw_ctx_alloc(struct platform_device *pdev,
>         if (ret)
>                 return ERR_PTR(-EIO);
>
> -       INIT_WORK(&ctx->display_reset_wq, drm_underflow_wq);
>         ctx->crtc = crtc;
>
>         return ctx;
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
