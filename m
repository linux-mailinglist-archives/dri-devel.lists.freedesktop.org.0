Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A67255A1AD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0C410EFE5;
	Fri, 24 Jun 2022 19:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D03610EFFA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=UjJArgZikc+1F8Y2ck4wWccZ8s6f8XXRW7MV7w4vXus=;
 b=lBJRLuI0gLHuvu0ibnaFcFavASKg/NOMRMsD08xNT7vuFkUmPf7sNjyD2eoBCPnge4TSKh/sptFbS
 +bGlUZqazxH4JEv5N+VrEpOLpnQLK+4VAjd7LKQMrO7EAB+4GRsZSVGKynaz2IalCAMjaAqPtRLhhR
 qN+DYr3ZvBU7ti4mronH4Mq6IWl89WpKKhGxYQ5UKeONecaIdtXeTJ2MCU2DxXuSZ6dZieoXUem+h3
 RwZLz9yRkXHznm8CFhouvW0+zq6coTPHdSetyEmC7mxtVUDeP+SRGkZSB38SfkSrForPiwYNkakzJY
 xHsHqHMiwz3y1kYVv3LUhCh02iOBUew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=UjJArgZikc+1F8Y2ck4wWccZ8s6f8XXRW7MV7w4vXus=;
 b=96T8TtWOrvHt74QIyenKH/0XpvQl+G7U99YMhuCeSFCdPAvgo9cNYozn8+u8Tzdk9gRVump4x27h+
 IKX80O0DA==
X-HalOne-Cookie: 3453b373dccfa3378b029d78a7339b3956db4622
X-HalOne-ID: 5c181970-f3f3-11ec-a6c4-d0431ea8a283
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5c181970-f3f3-11ec-a6c4-d0431ea8a283;
 Fri, 24 Jun 2022 19:25:09 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:25:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 05/68] drm/connector: Mention the cleanup after
 drm_connector_init
Message-ID: <YrYPk6JkGo/Bh9NI@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-6-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:31:06PM +0200, Maxime Ripard wrote:
> Unlike encoders and CRTCs, the drm_connector_init() and
> drm_connector_init_with_ddc() don't mention how the cleanup is supposed to
> be done. Let's add it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Looks sensible,
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 353d83ae09d3..f0c4665caf38 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -222,6 +222,10 @@ void drm_connector_free_work_fn(struct work_struct *work)
>   * Initialises a preallocated connector. Connectors should be
>   * subclassed as part of driver connector objects.
>   *
> + * At driver unload time the driver's &drm_connector_funcs.destroy hook
> + * should call drm_connector_cleanup() and free the connector structure.
> + * The connector structure should not be allocated with devm_kzalloc().
> + *
>   * Returns:
>   * Zero on success, error code on failure.
>   */
> @@ -345,6 +349,10 @@ EXPORT_SYMBOL(drm_connector_init);
>   * Initialises a preallocated connector. Connectors should be
>   * subclassed as part of driver connector objects.
>   *
> + * At driver unload time the driver's &drm_connector_funcs.destroy hook
> + * should call drm_connector_cleanup() and free the connector structure.
> + * The connector structure should not be allocated with devm_kzalloc().
> + *
>   * Ensures that the ddc field of the connector is correctly set.
>   *
>   * Returns:
> -- 
> 2.36.1
