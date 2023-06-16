Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52B733608
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E18010E656;
	Fri, 16 Jun 2023 16:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C5210E655
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=cYTju1OrQNheCoWOQrFIBzGWmu+NmHtz60fra75fns4=;
 b=Ljro0X8pmTpuMJdlYWKK8gfuVL4bverevM2vSa2/9i5yQWxKzXAlGd6KmxxQvJksBD9+gdv7Yzhth
 ir1XUpOl6x2on03SFfselje4cFRTvI4pGavSRPLYrT2Wp3FbHu0ujiB8DPGAZn72WY7mJvQxgFqj7X
 jGgC84/zXgvL2qPTlNGfnq7Yx8sLpXerEJ7Sxa5EbeM4yR0urEqcCigDrdmAVB1lhCxl/2UEcExREX
 l+Z0ZWK5VKaEPXmUIRtOvId95kEl/IbBx4PQx1uMkNKK3qPtMBOWVjvoIrg9XHM89ouMNd2Ky5+pyH
 veJHgyhRZypIOmz5O3LyOPp5dJq1Z9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=cYTju1OrQNheCoWOQrFIBzGWmu+NmHtz60fra75fns4=;
 b=f/IYRycN/+jPMCMmbPpDMB6MVJMqGtdjrmtYCyReph8GGQ5Eb76vopdq7ArF1SfcVq25fCz5ln0U8
 frPL+wNBQ==
X-HalOne-ID: 7260df0d-0c63-11ee-9b02-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 7260df0d-0c63-11ee-9b02-99461c6a3fe8;
 Fri, 16 Jun 2023 16:32:56 +0000 (UTC)
Date: Fri, 16 Jun 2023 18:32:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Add Powertip PH800480T013
 drm_display_mode flags
Message-ID: <20230616163255.GA1697490@ravnborg.org>
References: <20230615201602.565948-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201602.565948-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:16:02PM +0200, Marek Vasut wrote:
> Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
> flags. Those are used by various bridges in the pipeline to correctly
> configure its sync signals polarity.
> 
> Fixes: d69de69f2be1 ("drm/panel: simple: Add Powertip PH800480T013 panel")
> Signed-off-by: Marek Vasut <marex@denx.de>

I do not know PowerTip, but the patch looks fine.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b81b21901940b..a0f4302de130a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3202,6 +3202,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
>  	.vsync_start = 480 + 49,
>  	.vsync_end = 480 + 49 + 2,
>  	.vtotal = 480 + 49 + 2 + 22,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
>  };
>  
>  static const struct panel_desc powertip_ph800480t013_idf02  = {
> -- 
> 2.39.2
