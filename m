Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C5229F14C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C6F6E8E7;
	Thu, 29 Oct 2020 16:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E656E8E7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 16:23:09 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id t15so867026ual.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TyGKT1Ssh4EGtVJkUsdYOSjFOp44Ii97uktL7500tnU=;
 b=EU4Fj/uDwgPJsmMvCgG3jCvCR3wXy0zZ48+qsRQWLekp4/DTtv/OJfsPylzaeEcSjO
 TlmSRLJqFyniC8qHahEAdQVlKABPDCZW8B/oEQABP3UT5uPSuET1QUAVi/OwVdAOkjsb
 DPkoL+2mCtkiN100JyynufBZ3yTxp5g8NIupA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TyGKT1Ssh4EGtVJkUsdYOSjFOp44Ii97uktL7500tnU=;
 b=OpzNTEV+DUzCHVzbmgiv+BXM1kkzyrHbeJxpbTkWhy6q57yZW2c4yy2tQZT8LolO66
 64GE/3Fm2lmGoyz254YQ5qH2ngZDFA5lPWce5fmsngOcWO8crSInH/XGhK6YV7zqxPac
 7paWzhf22axzgLlp9qjfUG7TpCmzrjrrlmCyc+F3dlQT31VSUS1fpQ9CFSuiSL4TQjeX
 AQnSpWz23vsE3Y4pTTxZJGiPKO4K4HdYK0BHuaoJxYk6x9T9OeNDDUx93A/k1utGNnx4
 NxH7omkvK7wGCdfwfd0+gKylaVc70PbX+q5sJBmNWVOuj6b0mTAe0L61gAyCsVSu2bkm
 /izg==
X-Gm-Message-State: AOAM531UqqEjrG718/SLRcVmAKZS5rfxT7ZjayF4iup0zA9JhDI/D3pu
 RPC1TtPDkSEMtONCV3CjQ46Q86stWP/nEw==
X-Google-Smtp-Source: ABdhPJypDEsJCmJHp4r1puRbSr6k8AWhI0pNbDN+hhwxU67x74dZJMjvE6qO7cf2wam37yK28gZdVw==
X-Received: by 2002:ab0:768:: with SMTP id h95mr3418178uah.23.1603988588512;
 Thu, 29 Oct 2020 09:23:08 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id e10sm382549uar.19.2020.10.29.09.23.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:23:07 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id r21so855173uaw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:23:07 -0700 (PDT)
X-Received: by 2002:ab0:6cb0:: with SMTP id j16mr3481621uaa.64.1603988587026; 
 Thu, 29 Oct 2020 09:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201029011154.1515687-1-swboyd@chromium.org>
 <20201029011154.1515687-5-swboyd@chromium.org>
In-Reply-To: <20201029011154.1515687-5-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2020 09:22:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U93bfZv_uLG0XFXtBBMrD7gg=L3ijnpPnOCgeeo=CqAg@mail.gmail.com>
Message-ID: <CAD=FV=U93bfZv_uLG0XFXtBBMrD7gg=L3ijnpPnOCgeeo=CqAg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Update reply on aux failures
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 28, 2020 at 6:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We should be setting the drm_dp_aux_msg::reply field if a NACK or a
> SHORT reply happens.

I don't think you update the "reply" field for SHORT, right?  You just
return a different size?


> Update the error bit handling logic in
> ti_sn_aux_transfer() to handle these cases and notify upper layers that
> such errors have happened. This helps the retry logic understand that a
> timeout has happened, or to shorten the read length if the panel isn't
> able to handle the longest read possible.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 +++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6b6e98ca2881..19737bc01b8f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -878,6 +878,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>         case DP_AUX_NATIVE_READ:
>         case DP_AUX_I2C_READ:
>                 regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val);
> +               msg->reply = 0; /* Assume it's good */
>                 break;
>         default:
>                 return -EINVAL;
> @@ -909,10 +910,32 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>         ret = regmap_read(pdata->regmap, SN_AUX_CMD_STATUS_REG, &val);
>         if (ret)
>                 return ret;
> -       else if ((val & AUX_IRQ_STATUS_NAT_I2C_FAIL)
> -                || (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT)
> -                || (val & AUX_IRQ_STATUS_AUX_SHORT))
> -               return -ENXIO;
> +
> +       if (val & AUX_IRQ_STATUS_AUX_RPLY_TOUT) {
> +               /*
> +                * The hardware tried the message seven times per the DP spec
> +                * but it hit a timeout. We ignore defers here because they're
> +                * handled in hardware.
> +                */
> +               return -ETIMEDOUT;
> +       }
> +       if (val & AUX_IRQ_STATUS_AUX_SHORT) {
> +               ret = regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &len);
> +               if (ret)
> +                       return ret;

IIUC, your digging through the code showed that in order to fully
handle the "SHORT" case you also needed to add support for
"DP_AUX_I2C_WRITE_STATUS_UPDATE", right?

Even without handling "DP_AUX_I2C_WRITE_STATUS_UPDATE" though, this
patch seems to be an improvement and I'd support landing it.

Oh, I guess one other thing: I think this is all from code inspection,
right?  You didn't manage to reproduce anything that would tickle one
of these code paths?  Might be worth mentioning, even if "after the
cut"?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
