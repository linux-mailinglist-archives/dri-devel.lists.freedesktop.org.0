Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3787C78ED3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C66210E04C;
	Fri, 21 Nov 2025 12:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iN9p1X8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2DE10E04C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:02:25 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2EEEC6A;
 Fri, 21 Nov 2025 13:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763726417;
 bh=Z2GL9mckblOsewxGx//Z4PjeFtj/fxrv3yPZCRoz6S8=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=iN9p1X8XYtYa/sUGj4a2ErZW3bsoyya6UukphbxvjXOOP2RP2R4PJblMuE+L/Rttl
 IGo6H2NxOS2m/aRN8DknGsKkZSHnaElCVkun01OzlS4mz1evYMkMXBCpHzjGdGYuDr
 W2xYcOnpPynYHM4hzwi0qdzwbdDeDwS44ln2E+t8=
Message-ID: <082379e2-2d00-4f2f-82dd-cff93d2867af@ideasonboard.com>
Date: Fri, 21 Nov 2025 14:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 5/6] cadence: cdns-mhdp8546*: Change
 drm_connector from structure to pointer
To: Harikrishna Shenoy <h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
 <20251120121416.660781-6-h-shenoy@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, aradhya.bhatia@linux.dev,
 devarsht@ti.com, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, linux@treblig.org, luca.ceresoli@bootlin.com,
 lumag@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mordan@ispras.ru, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, tzimmermann@suse.de,
 u-kumar1@ti.com
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251120121416.660781-6-h-shenoy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 20/11/2025 14:14, Harikrishna Shenoy wrote:
> After enabling DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, mhdp->connector is not
> initialised during bridge_attach(). The connector is however required in
> few driver calls like cdns_mhdp_hdcp_enable() and
> cdns_mhdp_modeset_retry_fn().Now that we have dropped the legacy code
> which became redundant with introduction of DRM_BRIDGE_ATTACH_NO_CONNECTOR
> usecase in driver,we can cleanly switch to drm_connector pointer
> instead of structure.
> 
> Set it in bridge_enable() and clear it in bridge_disable(),
> and make appropriate changes.
> 
> This allows us to dynamically set the reference in bridge_enable()
> when the connector becomes available and clear it in bridge_disable().
> This change is necessary to properly integrate with the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set while maintaining all
> connector-dependent functionality in the driver.

Now the code looks fine, but you didn't update the description, which
now looks to be quite wrong for this.

 Tomi

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c  | 14 +++++++-------
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h  |  3 +--
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c  | 16 ++++++++--------
>  3 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 816d5d87b45fe..002b4be3de674 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1765,12 +1765,12 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>  
>  	mutex_lock(&mhdp->link_mutex);
>  
> -	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
> -								       bridge->encoder);
> -	if (WARN_ON(!mhdp->connector_ptr))
> +	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
> +								   bridge->encoder);
> +	if (WARN_ON(!mhdp->connector))
>  		goto out;
>  
> -	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
> +	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
>  	if (WARN_ON(!conn_state))
>  		goto out;
>  
> @@ -1869,7 +1869,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
>  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
>  		mhdp->info->ops->disable(mhdp);
>  
> -	mhdp->connector_ptr = NULL;
> +	mhdp->connector = NULL;
>  	mutex_unlock(&mhdp->link_mutex);
>  }
>  
> @@ -1964,7 +1964,7 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	struct drm_connector_state *old_state, *new_state;
>  	struct drm_atomic_state *state = crtc_state->state;
> -	struct drm_connector *conn = mhdp->connector_ptr;
> +	struct drm_connector *conn = mhdp->connector;
>  	u64 old_cp, new_cp;
>  
>  	mutex_lock(&mhdp->link_mutex);
> @@ -2179,7 +2179,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
>  
>  	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
>  
> -	conn = mhdp->connector_ptr;
> +	conn = mhdp->connector;
>  
>  	/* Grab the locks before changing connector property */
>  	mutex_lock(&conn->dev->mode_config.mutex);
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index a76775c768956..b297db53ba283 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -375,8 +375,7 @@ struct cdns_mhdp_device {
>  	 */
>  	struct mutex link_mutex;
>  
> -	struct drm_connector connector;
> -	struct drm_connector *connector_ptr;
> +	struct drm_connector *connector;
>  	struct drm_bridge bridge;
>  
>  	struct cdns_mhdp_link link;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> index 5ac2fad2f0078..1d433ad3fe878 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> @@ -393,9 +393,9 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
>  {
>  	int ret;
>  
> -	if (mhdp->connector_ptr) {
> +	if (mhdp->connector) {
>  		dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
> -			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
> +			mhdp->connector->name, mhdp->connector->base.id);
>  	}
>  
>  	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
> @@ -445,10 +445,10 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
>  	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
>  		goto out;
>  
> -	if (mhdp->connector_ptr) {
> +	if (mhdp->connector) {
>  		dev_err(mhdp->dev,
>  			"[%s:%d] HDCP link failed, retrying authentication\n",
> -			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
> +			mhdp->connector->name, mhdp->connector->base.id);
>  	}
>  
>  	ret = _cdns_mhdp_hdcp_disable(mhdp);
> @@ -494,16 +494,16 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
>  	struct drm_device *dev = NULL;
>  	struct drm_connector_state *state;
>  
> -	if (mhdp->connector_ptr)
> -		dev = mhdp->connector_ptr->dev;
> +	if (mhdp->connector)
> +		dev = mhdp->connector->dev;
>  
>  	if (!dev)
>  		return;
>  
>  	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>  	mutex_lock(&mhdp->hdcp.mutex);
> -	if (mhdp->connector_ptr && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		state = mhdp->connector_ptr->state;
> +	if (mhdp->connector && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		state = mhdp->connector->state;
>  		state->content_protection = mhdp->hdcp.value;
>  	}
>  	mutex_unlock(&mhdp->hdcp.mutex);

