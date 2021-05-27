Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2A3928A6
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A006ECEE;
	Thu, 27 May 2021 07:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 27 May 2021 07:35:56 UTC
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8C26ECEE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:35:56 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id mARdlaFdiVN4kmARglNVXe; Thu, 27 May 2021 09:28:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1622100527; bh=hFxleLkQbi2DehZKbcn/fKp/iPPMGlQrIH9r58p0DSI=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=PqlGxKtu8iukY/gm1Xw6bXX03nAeQrBy7J6+y41EflNxA9jPw2Isc6KdBAki67tsG
 bXe80P30nPfA+xfkt2dWA6bjFHT9eeEleBNIjyzRLhD6sexHfFTWit9IbRTNx32XDr
 tfQNjEvnc+Ij1i4dh5VDADeVyGrrp2gnh5/+A2g4O5aPmUUYog141r9irTDC2q/KjQ
 ii0RPi0NJSE3xSV77Jg6IKIrPtwsc/2Umt3ygM60GzdIn9znY/RV9ZjBPo8V2amTi1
 ZrOxcvYtggcDB2mGRAc0xdEfO1IVPKAn9KLyKlWItOSvdlAJ/uc/qdjfVSqQpfRO9v
 aofrguqsSY1+g==
Subject: Re: [PATCH v5 3/3] drm_dp_cec: add MST support
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20210525105913.v5.1.I6f50a7996687318ba298c24a3663c8be7dd432c7@changeid>
 <20210525105913.v5.3.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aed2ad01-c636-af44-ab87-4a0fd30fa0ee@xs4all.nl>
Date: Thu, 27 May 2021 09:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525105913.v5.3.If7fc06fd679af0665ada9ff0524291c61dd35d24@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEybmc8tzFobMGU9DOSJQVUvicc+nIu9WKzobw7kLHkqZUAlXzZzGtzuZfS7nfwxDZNhYSU0IPg485mJYtVIa/zg4hX9ot8ij5yO208rLZhhaExowTsz
 CglL3jHnHvhS0RgGv58tL6S8/3OCP9+cK5Pfcn6wG3C1q1kyKUhVtS7friqxxa8nMyzCL00y9Y4pOxxJjj6f0A967r+KZrq7UGQ/LmVBqjWJgzlE9TrC0nHl
 prGTC3OXnljaB7NxTAsGS/cuR7TzOoui4bjCqWKi2b4J6e+QUYf6AudM4HMIT566/SyTlxrGyiQk23dC/dhA4SRHXPZ314sOkHNiMqpTjknQeQfz191trTzX
 63WkoyrjmfOYkFcpq200Gr+ioAXQtMNej1Te0CmcFm+90FZFkzvvH2eZk+UpMzOUtCjT5GIdJqXPN0lCFhN17+ojw4pbFB3S8oVighC7tCv0mZjoxenaJ06D
 BMIHZHl47A78UbZnut6INhUMz2rmBzn1iQ5OBg==
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Just a minor nitpick below:

On 25/05/2021 02:59, Sam McNally wrote:
> With DP v2.0 errata E5, CEC tunneling can be supported through an MST
> topology.
> 
> When tunneling CEC through an MST port, CEC IRQs are delivered via a
> sink event notify message; when a sink event notify message is received,
> trigger CEC IRQ handling - ESI1 is not used for remote CEC IRQs so its
> value is not checked.
> 
> Register and unregister for all MST connectors, ensuring their
> drm_dp_aux_cec struct won't be accessed uninitialized.
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Removed use of work queues
> - Updated checks of aux.transfer to accept aux.is_remote
> 
> Changes in v3:
> - Fixed whitespace in drm_dp_cec_mst_irq_work()
> - Moved drm_dp_cec_mst_set_edid_work() with the other set_edid functions
> 
> Changes in v2:
> - Used aux->is_remote instead of aux->cec.is_mst, removing the need for
>   the previous patch in the series
> - Added a defensive check for null edid in the deferred set_edid work,
>   in case the edid is no longer valid at that point
> 
>  drivers/gpu/drm/drm_dp_cec.c          | 20 ++++++++++++++++----
>  drivers/gpu/drm/drm_dp_mst_topology.c | 24 ++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index 3ab2609f9ec7..1abd3f4654dc 100644
> --- a/drivers/gpu/drm/drm_dp_cec.c
> +++ b/drivers/gpu/drm/drm_dp_cec.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_dp_helper.h>
> +#include <drm/drm_dp_mst_helper.h>
>  
>  /*
>   * Unfortunately it turns out that we have a chicken-and-egg situation
> @@ -245,13 +246,22 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
>  	int ret;
>  
>  	/* No transfer function was set, so not a DP connector */
> -	if (!aux->transfer)
> +	if (!aux->transfer && !aux->is_remote)
>  		return;
>  
>  	mutex_lock(&aux->cec.lock);
>  	if (!aux->cec.adap)
>  		goto unlock;
>  
> +	if (aux->is_remote) {
> +		/*
> +		 * For remote connectors, CEC IRQ is triggered by an explicit
> +		 * message so ESI1 is not involved.
> +		 */
> +		drm_dp_cec_handle_irq(aux);
> +		goto unlock;
> +	}
> +
>  	ret = drm_dp_dpcd_readb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
>  				&cec_irq);
>  	if (ret < 0 || !(cec_irq & DP_CEC_IRQ))
> @@ -307,7 +317,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  	u8 cap;
>  
>  	/* No transfer function was set, so not a DP connector */
> -	if (!aux->transfer)
> +	if (!aux->transfer && !aux->is_remote)
>  		return;
>  
>  #ifndef CONFIG_MEDIA_CEC_RC
> @@ -375,6 +385,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  unlock:
>  	mutex_unlock(&aux->cec.lock);
>  }
> +

Spurious newline added, just drop this change.

Regards,

	Hans

>  EXPORT_SYMBOL(drm_dp_cec_set_edid);
>  
>  /*
> @@ -383,7 +394,7 @@ EXPORT_SYMBOL(drm_dp_cec_set_edid);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>  {
>  	/* No transfer function was set, so not a DP connector */
> -	if (!aux->transfer)
> +	if (!aux->transfer && !aux->is_remote)
>  		return;
>  
>  	cancel_delayed_work_sync(&aux->cec.unregister_work);
> @@ -393,6 +404,7 @@ void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>  		goto unlock;
>  
>  	cec_phys_addr_invalidate(aux->cec.adap);
> +
>  	/*
>  	 * We're done if we want to keep the CEC device
>  	 * (drm_dp_cec_unregister_delay is >= NEVER_UNREG_DELAY) or if the
> @@ -428,7 +440,7 @@ void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
>  				   struct drm_connector *connector)
>  {
>  	WARN_ON(aux->cec.adap);
> -	if (WARN_ON(!aux->transfer))
> +	if (WARN_ON(!aux->transfer && !aux->is_remote))
>  		return;
>  	aux->cec.connector = connector;
>  	INIT_DELAYED_WORK(&aux->cec.unregister_work,
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 29aad3b6b31a..5612caf9fb49 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2359,6 +2359,8 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
>  int drm_dp_mst_connector_late_register(struct drm_connector *connector,
>  				       struct drm_dp_mst_port *port)
>  {
> +	drm_dp_cec_register_connector(&port->aux, connector);
> +
>  	drm_dbg_kms(port->mgr->dev, "registering %s remote bus for %s\n",
>  		    port->aux.name, connector->kdev->kobj.name);
>  
> @@ -2382,6 +2384,8 @@ void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
>  	drm_dbg_kms(port->mgr->dev, "unregistering %s remote bus for %s\n",
>  		    port->aux.name, connector->kdev->kobj.name);
>  	drm_dp_aux_unregister_devnode(&port->aux);
> +
> +	drm_dp_cec_unregister_connector(&port->aux);
>  }
>  EXPORT_SYMBOL(drm_dp_mst_connector_early_unregister);
>  
> @@ -2682,6 +2686,21 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
>  		queue_work(system_long_wq, &mstb->mgr->work);
>  }
>  
> +static void
> +drm_dp_mst_handle_sink_event(struct drm_dp_mst_branch *mstb,
> +			    struct drm_dp_sink_event_notify *sink_event)
> +{
> +	struct drm_dp_mst_port *port;
> +
> +	if (sink_event->event_id & DP_SINK_EVENT_CEC_IRQ_EVENT) {
> +		port = drm_dp_get_port(mstb, sink_event->port_number);
> +		if (port) {
> +			drm_dp_cec_irq(&port->aux);
> +			drm_dp_mst_topology_put_port(port);
> +		}
> +	}
> +}
> +
>  static struct drm_dp_mst_branch *drm_dp_get_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
>  							       u8 lct, u8 *rad)
>  {
> @@ -4170,6 +4189,8 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
>  	if (msg->req_type == DP_CONNECTION_STATUS_NOTIFY) {
>  		drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_stat);
>  		hotplug = true;
> +	} else if (msg->req_type == DP_SINK_EVENT_NOTIFY) {
> +		drm_dp_mst_handle_sink_event(mstb, &msg->u.sink_event);
>  	}
>  
>  	drm_dp_mst_topology_put_mstb(mstb);
> @@ -4362,6 +4383,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>  		break;
>  	}
>  out:
> +	if (ret != connector_status_connected)
> +		drm_dp_cec_unset_edid(&port->aux);
>  	drm_dp_mst_topology_put_port(port);
>  	return ret;
>  }
> @@ -4392,6 +4415,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
>  		edid = drm_get_edid(connector, &port->aux.ddc);
>  	}
>  	port->has_audio = drm_detect_monitor_audio(edid);
> +	drm_dp_cec_set_edid(&port->aux, edid);
>  	drm_dp_mst_topology_put_port(port);
>  	return edid;
>  }
> 

