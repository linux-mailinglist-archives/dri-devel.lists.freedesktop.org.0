Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185335D60D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 05:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62696E188;
	Tue, 13 Apr 2021 03:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820F6E188
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 03:44:28 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t22so11011119pgu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 20:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=47wD8xwWnEKLMN5FtKD6zAzX1Pa36iYfxbU1wCIqJ40=;
 b=nEU+LL9SgYTRCvWcahxiNpnKvyooWlOeXj64dyCpFKTQoXcjho37iHetnv+XWpvy31
 o3wJqJj9zcs9in/Esmufnj5HwT2g5znCyfJu7daWmYlGplIkkMdagAcgLGXmDuNQ33Pp
 qsnoFgHLooAOebU9fMvrZ8vN2iFqwv6BwwTqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=47wD8xwWnEKLMN5FtKD6zAzX1Pa36iYfxbU1wCIqJ40=;
 b=EBPokixqGd3GYoc+KdkSeJDl0KN9sBTwK2iJxjEl6HECBXBRsGnU6sG4tu4ki5Ac2Q
 kRTth5bWfB2+mn843T6jmDXk5PELOhqWFVQIdrUDC2O2eN0ZNXk+arKuO8Y1Ha0CdE/o
 99N7WH2675iOyB/6OtQO75Q6baSpS4v7fhwneYmWPQffPDxa9jsfkfaKNqXPiVvt3SI3
 oKQ66rs2BYtq4CpP+Bd/lQldYKCm234q1ggEsEneJcaZVF2p5oYH7FVdxH8oL7iyLB/Y
 BZxp9NjL3JC6LOdvdaE+2cJ5fw0LZ29rMsP/LCR1wHDvX5eAjNgrnm7G1KZaWgMwhOJU
 MZbw==
X-Gm-Message-State: AOAM530GfGxR6BhM/m3gMhhDVQybAv/7wDgeH+5H0h+imvPFdbrKcWAZ
 gXUKV7A2uzYaNqT51v4fu1o68w==
X-Google-Smtp-Source: ABdhPJyYtRwnTVo858HHRocZd1GcOzAjQyZ28PzIv/swFx8j0ouxxXirl2hNMF/D+JrhN2OFpPjf8Q==
X-Received: by 2002:a65:4985:: with SMTP id r5mr30033322pgs.65.1618285467888; 
 Mon, 12 Apr 2021 20:44:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
 by smtp.gmail.com with ESMTPSA id u1sm12890575pgg.11.2021.04.12.20.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 20:44:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618247003-28821-1-git-send-email-khsieh@codeaurora.org>
References: <1618247003-28821-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: do not re initialize of audio_comp
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 12 Apr 2021 20:44:26 -0700
Message-ID: <161828546608.3764895.4087177206996707347@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-12 10:03:23)
> At dp_display_disable(), do not re initialize audio_comp if
> hdp_state == ST_DISCONNECT_PENDING (unplug event) to avoid
> race condition which cause 5 second timeout expired.

More details please.

> Also
> add abort mechanism to reduce time spinning at dp_aux_transfer()
> during dpcd read if type-c connection had been broken.

Please split this to a different patch.

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_link.c    | 20 +++++++++++++++-----
>  4 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 7c22bfe..e5ece8c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -28,6 +28,7 @@ struct dp_aux_private {
>         u32 offset;
>         u32 segment;
>         u32 isr;
> +       atomic_t aborted;

Why is it an atomic?

>  
>         struct drm_dp_aux dp_aux;
>  };
> @@ -343,6 +344,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>  
>         mutex_lock(&aux->mutex);
>  
> +       if (atomic_read(&aux->aborted)) {
> +               ret = -ETIMEDOUT;
> +               goto unlock_exit;
> +       }
> +

Cool, it's checked inside a mutex.

>         aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
>  
>         /* Ignore address only message */
> @@ -533,3 +539,15 @@ void dp_aux_put(struct drm_dp_aux *dp_aux)
>  
>         devm_kfree(aux->dev, aux);
>  }
> +
> +void dp_aux_abort(struct drm_dp_aux *dp_aux, bool abort)
> +{
> +       struct dp_aux_private *aux;
> +
> +       if (!dp_aux)
> +               return;
> +
> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> +
> +       atomic_set(&aux->aborted, abort);
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4992a049..8960333 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -898,8 +898,10 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>         /* wait only if audio was enabled */
>         if (dp_display->audio_enabled) {
>                 /* signal the disconnect event */
> -               reinit_completion(&dp->audio_comp);
> -               dp_display_handle_plugged_change(dp_display, false);
> +               if (dp->hpd_state != ST_DISCONNECT_PENDING) {
> +                       reinit_completion(&dp->audio_comp);
> +                       dp_display_handle_plugged_change(dp_display, false);
> +               }
>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>                                 HZ * 5))
>                         DRM_ERROR("audio comp timeout\n");

This hunk is the first part of the patch and should be split away to one
for itself, with appropriate Fixes tag and a proper explanation.

> @@ -1137,20 +1139,26 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>                 /* hpd related interrupts */
>                 if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
>                         hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
> +                       dp_aux_abort(dp->aux, false);
>                         dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>                 }
>  
>                 if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>                         /* stop sentinel connect pending checking */
> +                       dp_aux_abort(dp->aux, false);
>                         dp_del_event(dp, EV_CONNECT_PENDING_TIMEOUT);
>                         dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
>                 }
>  
> -               if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK)
> +               if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
> +                       dp_aux_abort(dp->aux, false);
>                         dp_add_event(dp, EV_HPD_REPLUG_INT, 0, 0);
> +               }
>  
> -               if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> +               if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) {
> +                       dp_aux_abort(dp->aux, true);

Ok, so it seems that we want to stop trying aux transfers if the unplug
irq comes in? That's a pretty big sledge hammer to stop a transfer in
the middle of progress. Why doesn't the hardware timeout and stop or the
dpcd reads in this DP driver fail and start bailing out when the cable
is disconnected? Having to inject that synthetically is not great. Is
there some sort of AUX channel "status" bit that can be read from the
aux registers in the DP hardware to see if the connection was lost?

>                         dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +               }
>         }
>  
>         /* DP controller isr */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..d35b18e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link *dp_link)
>         return 0;
>  }
>  
> -static void dp_link_parse_sink_status_field(struct dp_link_private *link)
> +static int dp_link_parse_sink_status_field(struct dp_link_private *link)
>  {
>         int len = 0;
>  
>         link->prev_sink_count = link->dp_link.sink_count;
> -       dp_link_parse_sink_count(&link->dp_link);
> +       len = dp_link_parse_sink_count(&link->dp_link);
> +       if (len < 0) {
> +               DRM_ERROR("DP lparse sink count failed\n");

s/lparse/parse/?

> +               return len;
> +       }
>  
>         len = drm_dp_dpcd_read_link_status(link->aux,
>                 link->link_status);
> -       if (len < DP_LINK_STATUS_SIZE)
> +       if (len < DP_LINK_STATUS_SIZE) {
>                 DRM_ERROR("DP link status read failed\n");
> -       dp_link_parse_request(link);
> +               return len;
> +       }
> +
> +       return dp_link_parse_request(link);
>  }
>  
>  /**
> @@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link *dp_link)
>  
>         dp_link_reset_data(link);
>  
> -       dp_link_parse_sink_status_field(link);
> +       ret = dp_link_parse_sink_status_field(link);
> +       if (ret) {
> +               return ret;
> +       }
>  
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
