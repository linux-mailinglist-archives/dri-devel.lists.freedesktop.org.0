Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF153BF652
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147F76E87C;
	Thu,  8 Jul 2021 07:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37466E87C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 07:34:43 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id u66so942022oif.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=oAvMp+Ra1hGRaw0is8fIIs3Aux+5CC2LcgaoBBqSCPs=;
 b=bTXwCHKV7sHOm1Z7kkZ8GWVgoqOb4OtNM+ev5IT9t0vJ20NZSagGBxfaqD+XRlP+64
 4qBk2HriPIlZmnxv2kzGONNKYXGRxAupwfuAsb/AviXZ0w/jsNMyMTvO52BjsONPJc19
 Mm4bsNwHamNxyT8Mdku1KpQnSfFb/VhGEYGr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=oAvMp+Ra1hGRaw0is8fIIs3Aux+5CC2LcgaoBBqSCPs=;
 b=kD98BVTTb7wribVDXJomhtY+SdkyKmTkVAzEVQtRcl44rpWbZCu7nJWU6gh/jizA0H
 fynHegjgGpJGeoCFXq3RmbBjlhEv4P8sMwMORUa0b4SiuJEJWZ9kg3wWlaIDlbEZdWc1
 z8l1T2Tk+OkNbLi0WIdfax6TfMkAEAXnabjB2xpy/nyK49mSQMyo6Z86Fh5Aue2xeyYD
 tYA9GknmPrEFLZ3rKXVN2F/EKlMSRnIVjnVtrq4vRvIgSKbnOGrudnznU3tnR0YM7UlC
 3IWLuLshxgpVtYZSK+XL/zr+2mEGadfZYCGi0nxAHQ1TdnqC28PR4HmMihpzZy/DoirO
 w5fw==
X-Gm-Message-State: AOAM531Fpv2ZLy8efAOAHFbt8FfkOuNmX2RHoI03M3c+zISeG9x9pXXW
 Ei9bBIZGfhsTkdkXTPHD01YbseFA82jl2M/FNVwXbg==
X-Google-Smtp-Source: ABdhPJxwpT6g2vtdmGi//wdPVjt2NQptFRmwbqjDsqzx3VBRFaxDJ3FHoWrljvZiKGOo3CIhCFJPJQcaguvqdTp1bRY=
X-Received: by 2002:aca:d941:: with SMTP id q62mr2639352oig.166.1625729683241; 
 Thu, 08 Jul 2021 00:34:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:34:42 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 8 Jul 2021 07:34:42 +0000
Message-ID: <CAE-0n53JxLuQZBUMLOuH_Bm7zQ7Vite2OhjTB_xO=s_KAGarXw@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-06 10:20:16)
> Aux hardware calibration sequence requires resetting the aux controller
> in order for the new setting to take effect. However resetting the AUX
> controller will also clear HPD interrupt status which may accidentally
> cause pending unplug interrupt to get lost. Therefore reset aux
> controller only when link is in connection state when dp_aux_cmd_fifo_tx()
> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 4a3293b..eb40d84 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -353,6 +353,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                         if (!(aux->retry_cnt % MAX_AUX_RETRIES))
>                                 dp_catalog_aux_update_cfg(aux->catalog);
>                 }
> +               /* reset aux if link is in connected state */
> +               if (dp_catalog_link_is_connected(aux->catalog))

How do we avoid resetting aux when hpd is unplugged and then plugged
back in during an aux transfer?

> +                       dp_catalog_aux_reset(aux->catalog);
>         } else {
>                 aux->retry_cnt = 0;
>                 switch (aux->aux_error_num) {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
