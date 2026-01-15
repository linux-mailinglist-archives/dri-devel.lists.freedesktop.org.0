Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64234D257EC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796C110E0A4;
	Thu, 15 Jan 2026 15:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CATtqpnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5E510E0A4;
 Thu, 15 Jan 2026 15:51:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 21E966001A;
 Thu, 15 Jan 2026 15:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91462C116D0;
 Thu, 15 Jan 2026 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768492281;
 bh=2J+TdHYzgTN2yJ0X77D7zcdhxU/R5+WXQmkIRo4Fh4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CATtqpnvyUSTzVUskfKuk+1AkSMhYULNXK6ZBPxcTgncNdl/+GqnT8UexbclGODTY
 bLF6vnZr4FDnPT+a07kRrxDse86bhNKKbFvRn0+su4/fK2cOFLhXLrb+W3m8cYeaqQ
 VksToyaWJqNDDRDuAecnhtM4+cMW3KJGgdnsqCtU9yxQxAgTxuwgtNq0fRqpZeg6DX
 JzlxF0NdtQUfW49cR5gerXxVycoV8P7dDmTK6n8BE1x6wOb9zHe7JoWJnzy+7EvhCh
 POfl0FhZpgaWWdTOlszHcFhTY38QeHHWzYaBXrhKqZPxpO3wONznIgg/RQ+oTmwHgK
 JWJhGExvR1yPg==
Date: Thu, 15 Jan 2026 09:51:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] drm/msm/dp: drop event data
Message-ID: <34tjg54i2hhwb22iwcm6za6buxdges6yynaftta6lww3yrvflr@ybob2zocugee>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
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

On Thu, Jan 15, 2026 at 09:29:11AM +0200, Dmitry Baryshkov wrote:
> With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
> it, removing also the argument from event handlers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e0b424ac861a..e93de362dd39 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -69,7 +69,6 @@ enum {
>  
>  struct msm_dp_event {
>  	u32 event_id;
> -	u32 data;
>  	u32 delay;
>  };
>  
> @@ -218,7 +217,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
>  }
>  
>  static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
> -						u32 data, u32 delay)
> +			    u32 delay)
>  {
>  	unsigned long flag;
>  	struct msm_dp_event *todo;
> @@ -236,7 +235,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
>  	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
>  	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
>  	todo->event_id = event;
> -	todo->data = data;
>  	todo->delay = delay;
>  	wake_up(&msm_dp_priv->event_q);
>  	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
> @@ -576,7 +574,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>  	return rc;
>  }
>  
> -static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
> +static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  {
>  	u32 state;
>  	int ret;
> @@ -602,7 +600,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
>  
>  	if (state == ST_DISCONNECT_PENDING) {
>  		/* wait until ST_DISCONNECTED */
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
> +		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
>  	}
> @@ -644,7 +642,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
>  							plugged);
>  }
>  
> -static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
> +static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
>  {
>  	u32 state;
>  	struct platform_device *pdev = dp->msm_dp_display.pdev;
> @@ -706,7 +704,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
>  	return 0;
>  }
>  
> -static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
> +static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>  {
>  	u32 state;
>  
> @@ -724,7 +722,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  
>  	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
>  		/* wait until ST_CONNECTED */
> -		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
> +		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
>  	}
> @@ -1079,7 +1077,6 @@ static int hpd_event_thread(void *data)
>  			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
>  			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
>  			todo_next->event_id = todo->event_id;
> -			todo_next->data = todo->data;
>  			todo_next->delay = todo->delay - 1;
>  
>  			/* clean up older event */
> @@ -1105,13 +1102,13 @@ static int hpd_event_thread(void *data)
>  
>  		switch (todo->event_id) {
>  		case EV_HPD_PLUG_INT:
> -			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
> +			msm_dp_hpd_plug_handle(msm_dp_priv);
>  			break;
>  		case EV_HPD_UNPLUG_INT:
> -			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
> +			msm_dp_hpd_unplug_handle(msm_dp_priv);
>  			break;
>  		case EV_IRQ_HPD_INT:
> -			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
> +			msm_dp_irq_hpd_handle(msm_dp_priv);
>  			break;
>  		default:
>  			break;
> @@ -1212,19 +1209,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>  			dp->msm_dp_display.connector_type, hpd_isr_status);
>  		/* hpd related interrupts */
>  		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
> -			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
>  
>  		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> -			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
> +			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
>  		}
>  
>  		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
> -			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> -			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
> +			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
> +			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
>  		}
>  
>  		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> -			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
>  
>  		ret = IRQ_HANDLED;
>  	}
> @@ -1649,7 +1646,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	if (dp->is_edp)
> -		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> +		msm_dp_hpd_plug_handle(msm_dp_display);
>  
>  	mutex_lock(&msm_dp_display->event_mutex);
>  	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> @@ -1722,7 +1719,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
>  	if (dp->is_edp)
> -		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
> +		msm_dp_hpd_unplug_handle(msm_dp_display);
>  
>  	mutex_lock(&msm_dp_display->event_mutex);
>  
> @@ -1844,7 +1841,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  		return;
>  
>  	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
>  	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
>  }
> 
> -- 
> 2.47.3
> 
> 
