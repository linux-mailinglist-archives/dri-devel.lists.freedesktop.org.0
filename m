Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228343F29C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 00:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEAA6E83B;
	Thu, 28 Oct 2021 22:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829426E848
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 22:20:00 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id m11so5650169oif.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=XlHbKWd6pbbGkZIStSTxFaG7vAcQNI1eMo098oPb11U=;
 b=RhaDuJkxg7XSpHf1uMr3Oikq4bAIm4AIWrTxFhp8J7btCs5Nftz/ce0uJkrqfybZrc
 bNQo6d4RbqLbn4oijl8a1LKrezIg6TCLyulzp5pwHGocfyCOsHOuL2cH3DLL4oQzk6+x
 KMcxqk/gkb95/yfIhVcLt7ii70Z/DCTgQVYUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=XlHbKWd6pbbGkZIStSTxFaG7vAcQNI1eMo098oPb11U=;
 b=zc2gDMYs+q1N6xh+qwUsW8BNcYojX9F8nwdnz8C7W6UucSeLpUz0/yk9pdSTLCDelh
 f8Fq0UXm3iYAUSA1eRMKQZGHZgrE08jR7Qyb7JpfkPXja5SLXMf5d/ePc9KWJC/vbTIt
 uGFpjk+b49L+CDAIXnld9dgnYyYbxQimruSiMk5o6KUiRaWPVsKz8dyUlTd9EBH2cO4u
 X08fZSfo73yLj5msTYHa5WROQFRUiZIIlK/1Q9ORZVxJcuH/SOtDPVzQFHyaGf2X+DQV
 0UoqUoCXNisJjggP90n+XjG/0WmNgN1UsAUPs16vdb2o0TIS1FyaqbXXIJ4odgmOEpg0
 DpjA==
X-Gm-Message-State: AOAM532ol+gqGpjVY5QgPeAzEq18qGcZZIa68Q0+OMTkdd8qnxViX9UZ
 T3gM0gd6K7wpfPi4tu/kdv4iclQhJYzw2Bh+dbSCRQ==
X-Google-Smtp-Source: ABdhPJwfvxRCDnP08dCwT4fknbFntzz7glH0jJBWYvi4icewMHAZCYjPyRlLWbnJ8EuU6GfjGvnkRIw06lYY/iyvDZU=
X-Received: by 2002:a05:6808:23c2:: with SMTP id
 bq2mr11059063oib.32.1635459599626; 
 Thu, 28 Oct 2021 15:19:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:19:59 -0700
MIME-Version: 1.0
In-Reply-To: <1635429901-5734-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1635429901-5734-1-git-send-email-quic_kalyant@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 28 Oct 2021 15:19:59 -0700
Message-ID: <CAE-0n51QgYprv+BPKWHSVgUFDhHzb0t=DRBG_g9yvXeMWyaVqg@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: set default group ID for CTL.
To: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, y@qualcomm.com
Cc: Kalyan Thota <kalyan_t@codeaurora.org>, linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dianders@chromium.org, mkrishn@codeaurora.org, 
 abhinavk@codeaurora.org
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

Quoting Kalyan Thota (2021-10-28 07:05:01)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4ade44b..57b9be1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -179,13 +179,16 @@ enum {
>
>  /**
>   * CTL sub-blocks
> - * @DPU_CTL_SPLIT_DISPLAY       CTL supports video mode split display
> + * @DPU_CTL_SPLIT_DISPLAY,     CTL supports video mode split display
> + * @DPU_CTL_FETCH_ACTIVE,      Active CTL for fetch HW (SSPPs).
> + * @DPU_CTL_VM_CFG,            CTL supports multiple VMs.

Are those commas supposed to be colons? Also the application of the
period/full-stop is not consistent. Please pick one. I see the double
star so it looks like kernel-doc, but probably doesn't parse properly.

>   * @DPU_CTL_MAX
>   */
>  enum {
>         DPU_CTL_SPLIT_DISPLAY = 0x1,
>         DPU_CTL_ACTIVE_CFG,
>         DPU_CTL_FETCH_ACTIVE,
> +       DPU_CTL_VM_CFG,
>         DPU_CTL_MAX
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 64740ddb..455b06a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -498,6 +498,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>         u32 intf_active = 0;
>         u32 mode_sel = 0;
>

Can we get a comment here about what's happening?

> +       if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))

Does it need to be atomic? Sort of doubt it, so probably __test_bit()
would work just as well.

> +               mode_sel = 0xf0000000;

How about a define for 0xf0000000? Preferably a name that matches the
register description for this bit pattern.

> +
>         if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>                 mode_sel |= BIT(17);
>
