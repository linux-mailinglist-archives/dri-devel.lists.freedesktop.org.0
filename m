Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6915EF942
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 17:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBB510E621;
	Thu, 29 Sep 2022 15:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5470110E621
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 15:41:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x92so2502622ede.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=T6/M92tDqAap2CUetFUNSvf5fKxFn0XgEHDjWBCcOpg=;
 b=l15LngSHAiInxobzxdMyeRClT0LlMX2C5EMzDAX4h4hOcSc2OPrJpSm1VN9Nj/mtup
 t2gMXWCsesW4EnV98234v4+dUkc3mSve1WX7qAIrJK9g83K1ZsCB3nMrHIhum3heG5Rw
 bDSXx+n/bu5AuF8DGZaMRx8C/mMDHovX95VqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=T6/M92tDqAap2CUetFUNSvf5fKxFn0XgEHDjWBCcOpg=;
 b=OFR8W7aTz0w5dPhyL0mUteAcTbqPPPWx11ktfBva+dYo8EcwQ7NapscDq6RhiJVUJQ
 TbdbaooBMKzAbH2R/m97bIQhYoLdzv9FWgmLwlJwwP6eS8Wa8m4ImXyh0N0MT0dkO5Nz
 MeyUfeyEgbwXB9yJt5UsxFTA/VqFyycdBj4mIfmjIj2stR94RkrTdR77Po2vWqzeJ9kO
 LY+X8PtQ0BuhEMb/XdcNAT0LJm5AfbsBbpZYtEGZEM4SeN3AhEu+99APzef7jLQZegCr
 1ETQXikekLAIOVsd64zGLQX0XRndl2WSt9lCYVDLmFjsVHTtBjQAVdaE1jyl6pN3DWYu
 Z5Bw==
X-Gm-Message-State: ACrzQf2R9t62lE6iBD+4ZQN3lRJ69ZwCo3lK8AM+DX0DCjJoIkTd4K95
 aSESTsMWUjjrVIlH+AN0E9nvXV38u/iL8IVu
X-Google-Smtp-Source: AMsMyM7GQGCtWL05yt3X0UQcZgM51KMv4JVEtSihvZVopyRqDhWTiopxsvVhdkX1e/pE2+3Oocbgqw==
X-Received: by 2002:a05:6402:26d3:b0:451:6ca9:bc5e with SMTP id
 x19-20020a05640226d300b004516ca9bc5emr3857919edd.325.1664466080629; 
 Thu, 29 Sep 2022 08:41:20 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 gh33-20020a1709073c2100b0077d6f628e14sm4122703ejc.83.2022.09.29.08.41.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 08:41:18 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id m4so2826886wrr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:41:17 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr2928239wra.617.1664466077020; Thu, 29
 Sep 2022 08:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220929012911.2521786-1-jason.yen@paradetech.corp-partner.google.com>
In-Reply-To: <20220929012911.2521786-1-jason.yen@paradetech.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Sep 2022 08:41:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xauvh1XhMUQZc8cp3-Wo4TRgD1waLiwAXP5z8EBW9Nrg@mail.gmail.com>
Message-ID: <CAD=FV=Xauvh1XhMUQZc8cp3-Wo4TRgD1waLiwAXP5z8EBW9Nrg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add software to support aux defer
To: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 28, 2022 at 6:29 PM Jason Yen
<jason.yen@paradetech.corp-partner.google.com> wrote:
>
> This chip can not handle aux defer if the host directly program
> its aux registers to access edid/dpcd. So we need let software
> to handle the aux defer situation.
>
> Signed-off-by: Jason Yen <jason.yen@paradetech.corp-partner.google.com>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 31e88cb39f8a..967dec840b91 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -303,6 +303,14 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
>         case SWAUX_STATUS_ACKM:
>                 len = data & SWAUX_M_MASK;
>                 break;
> +       case SWAUX_STATUS_DEFER:
> +       case SWAUX_STATUS_I2C_DEFER:
> +               if (is_native_aux)
> +                       msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
> +               else
> +                       msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> +               len = data & SWAUX_M_MASK;
> +               break;

Overall this looks OK to me, but please send a v2 that removes the
line above that states:

/* Ignore the DEFER cases as they are already handled in hardware */

-Doug
