Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9854AAD0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608A210FB95;
	Tue, 14 Jun 2022 07:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BA010FB95
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655192571; x=1686728571;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+MarE9Bt954nv0S2s3X8rKe2+hnrvQ0fK8d6D4CykL8=;
 b=MfJHrsJBYF3xes+G9W7b00L8WNW81KOGMYTWptfTfECA8iUHg98ET32R
 Z2pc4eefW1cEew5ZBAlaUCh4CyOxkMeKXWLYR4f7Jj7jBq0JfZqDkMFbp
 DHz06YytCLP2h23BhaFBcLStr442MC05xMci0YRp/y9Z8FkdbNDErA1E0
 VKr5Db6XFWMelqHcjr44RTL+/YPxZvYq9tO/7yO3cL3ngfKHXi601eFyp
 5sro9A73eBM7hiBTw9xjmSkNMuKBf/OmUrL1lCO4IsLTfreKku05LEMFk
 c9m94k4UMhDO0KX8S7EDqN6pWPlpmqDXT4f+Kv6hp/p5heKmRUH8T6M+q Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="303947148"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="303947148"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="726695020"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 14 Jun 2022 00:42:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 14 Jun 2022 10:42:42 +0300
Date: Tue, 14 Jun 2022 10:42:42 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 1/7] usb: typec: mux: Allow muxes to specify mode-switch
Message-ID: <Yqg78j6ffEVFklBX@kuha.fi.intel.com>
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-2-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609181106.3695103-2-pmalani@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 06:09:40PM +0000, Prashant Malani wrote:
> Loosen the typec_mux_match() requirements so that searches where an
> alt mode is not specified, but the target mux device lists the
> "mode-switch" property, return a success.
> 
> This is helpful in Type C port drivers which would like to get a pointer
> to the mux switch associated with a Type C port, but don't want to
> specify a particular alt mode.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes since v1:
> - No changes.
> 
>  drivers/usb/typec/mux.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index fd55c2c516a5..464330776cd6 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -281,9 +281,13 @@ static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
>  	if (match)
>  		goto find_mux;
>  
> -	/* Accessory Mode muxes */
>  	if (!desc) {
> -		match = fwnode_property_present(fwnode, "accessory");
> +		/*
> +		 * Accessory Mode muxes & muxes which explicitly specify
> +		 * the required identifier can avoid SVID matching.
> +		 */
> +		match = fwnode_property_present(fwnode, "accessory") ||
> +			fwnode_property_present(fwnode, id);
>  		if (match)
>  			goto find_mux;
>  		return NULL;
> -- 
> 2.36.1.476.g0c4daa206d-goog

-- 
heikki
