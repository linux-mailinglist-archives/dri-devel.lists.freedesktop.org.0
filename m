Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D37374C3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9F110E0C6;
	Tue, 20 Jun 2023 18:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9303110E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JQ5ZFYFkyb0yQXCy0dQ8gg8lGeS0rV8vcN2JJymIa5Y=;
 b=RjbkFku0/O4XmSmlSwjjESKjpdxcjO3JNEIThXEnPOsS1WxcPJmU3xxTH91u/ljDPgmqoS6JizX3r
 dZpXbfFR/IuEXhIi3vGGlyiFfeM5E8FFfFIDKsVubtLWzY+0cjGnEWDQh6ZMOBk0Tw9SZEzpih4bif
 KUw1qpDMcJVSOi+Y57COcoINoq5OJn0y2gb6pUNYkhvWqzLd+lLQvlx5fXzo11mIBuN7sJ+jfUtLSW
 eq3mbQdaePGGq7/KrdnOtN8W3ZWQTyjA2MKzWm4NZrcMUBnGrLS/wcpQwM3IKTUwpTGvnhdv8mpQqD
 rTg9biHrV0rXOfNjIcSX6Ojth6is+ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JQ5ZFYFkyb0yQXCy0dQ8gg8lGeS0rV8vcN2JJymIa5Y=;
 b=dtayC/rxNs4+RJbawKSMwK4WlcW48h1t/xfAgta5cca46doRcp1wZtuIibJdLxF4Wzeap8DG0WKYD
 2IsznbjBg==
X-HalOne-ID: 6c4836f6-0f9c-11ee-a8ae-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 6c4836f6-0f9c-11ee-a8ae-6f01c1d0a443;
 Tue, 20 Jun 2023 18:58:21 +0000 (UTC)
Date: Tue, 20 Jun 2023 20:58:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/bridge_connector: use
 drm_kms_helper_connector_hotplug_event()
Message-ID: <20230620185820.GA2192874@ravnborg.org>
References: <20230620175506.263109-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620175506.263109-1-contact@emersion.fr>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,
On Tue, Jun 20, 2023 at 05:55:09PM +0000, Simon Ser wrote:
> This adds more information to the hotplug uevent and lets user-space
> know that it's about a particular connector only.

Will this change have impact on user space?
They will start to see CONNECTOR=n where they did not occur before.
Asking as I have not really worked with the hotplug stuff.

The code change looks fine - no comment there.
And if there are no user space worries then:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 19ae4a177ac3..fc6f16e14f36 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -125,7 +125,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>  
>  	drm_bridge_connector_hpd_notify(connector, status);
>  
> -	drm_kms_helper_hotplug_event(dev);
> +	drm_kms_helper_connector_hotplug_event(connector);
>  }
>  
>  static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
> -- 
> 2.41.0
> 
