Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA7987093D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 19:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FD8112432;
	Mon,  4 Mar 2024 18:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bpn2jrS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB097112433
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 18:13:40 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-608959cfcbfso52655927b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709576019; x=1710180819; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EjE93o2p/BNRD6duwy1hrbCPE/L1Bz04gG2eWZQ12G8=;
 b=Bpn2jrS6bCzrnUcZsJBBjB3f6Rp2Xz41UqiAI7c4KBKSlOAkzuaS69wyWw7SNxrkGj
 fP3Vi84UKRcDTp0t+Y4+rvGeZ3LJZOh1QSiONW7uvdUBOUfyPmEQVSzrsm15l3V1TzUF
 u1ezyvSCbYPLaehypZEGN/yMjfZue0Fz5nLRJGNcWifFWp0yK/Znh6nC6utdQ7gFwv3M
 5Z4HTRhXpf3CCVOyA/z0BMYA18FJvLzDvZ/jyx5cpqNPBmSGHD2VWfWqn8jvGWobgyDE
 lzySbekTkLxN8PedWszFHM3KfcwBbwLLO8GwLXkYlUtsqeNKcJlj3JY6i+bhhkuvBgVq
 UwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709576019; x=1710180819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjE93o2p/BNRD6duwy1hrbCPE/L1Bz04gG2eWZQ12G8=;
 b=a2QujWui4Dl6uc9rz4ydMbNJ3ZYRwAb97zr9o73DiW47FzPGusHIDfG/WT5ixiCWHF
 IfiIA5AMXGYpwMK9ST0l70CmN+/X+WbExDgFzFFC+ghMghxvkCbNKOx7G6xE3sRLIVQ2
 v1AAjPYUdXRywqyfnPzMIr3d4x7i7IwPLa9U13gqYYmOGe+arP8CgI7GJx5EhIJPoScQ
 B3VugMj0Gt3ZUub+dbrFx9We//UEjVUhpi69S71svFLDbR16e7872eN0c2q6lVrXpJQN
 hsnt23ACCHY3wGe9lCbXDxuNFrkyQsdn/erOf6rCmICwpx8LuCjOkNcVM41X0+7Z1oV7
 T75w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjL639zAqGrHHNiLsWYgjZfEezuzPwxK9TubymO37kodq9RupsiFeX1lWx7RTkC1hjS4KToeZzyBz5RtgqIT1jLpEIYlYmwhiS7MtOTe3n
X-Gm-Message-State: AOJu0Yy6mMsrzfO+dZuv7C0FhFchf4Bs/7ZWRoNyqa82vf9ofOfzxKUX
 HJJa/y+CV9UHvBCCBWwVpnNmouWovoVeZb8m81590QpkBmigaO6ODx1YADw8ejIjsqPTMdSnLrp
 nAPYbT7UaRl5YUqPaeH9JZLUPtuuADePcPajVvw==
X-Google-Smtp-Source: AGHT+IHEsG0xIbxTLt0nqR9d2jAuFPIONsiU/QGgPiLY+SElLJU2fbWTW9Q10bJjRdOjSCCR3L+cVAZZv/zuB053MDw=
X-Received: by 2002:a0d:d491:0:b0:609:8132:79b3 with SMTP id
 w139-20020a0dd491000000b00609813279b3mr10243342ywd.10.1709576019520; Mon, 04
 Mar 2024 10:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240304175152.1199270-1-andriy.shevchenko@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 20:13:28 +0200
Message-ID: <CAA8EJpqAzWdntbmg-NyQcbLHtUoh-m=g_u=ZWiMimubsWW22sQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/msm/hdmi: Replace of_gpio.h by proper one
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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

On Mon, 4 Mar 2024 at 19:51, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it directly, replace it
> with what is really being used.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c8ebd75176bb..24abcb7254cc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -5,8 +5,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include <linux/gpio/consumer.h>
>  #include <linux/of_irq.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>
> --
> 2.43.0.rc1.1.gbec44491f096
>


-- 
With best wishes
Dmitry
