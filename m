Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844954DA78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3A910E824;
	Thu, 16 Jun 2022 06:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11B510E824
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655360586; x=1686896586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C64wXT8o8e3dnYRSkDU43FZmaurq/w0MSIoJ52kgk9M=;
 b=SGPkQkX3XTI83cig+G/BLE16BN9DkkIDI/e5eKBHXcR3Vmt/Uku34EmC
 Jd8Pt7FuioYAucBcjjSB6jLuVKxa5T/+O7g93GUz1WYSn5hez9mwEazmi
 nUZrAMzwlrupG6/EelP2kgEUOj/0MAA/7FKpIygjvUva+DQj9HT5NwPsY
 QGKJe7PJtC2JrsgET/AJOgypoobyqwmS99qyBvbjW5JC2rHvBosHj2mtn
 TsEjdvEcUbJPOvRFyWb4Z09lpNWuhjbfCKsiE3R72IkDkCVZMx/4KR1uA
 xrmHvyxgAEgC7PKwmHLt6+vXHKxJBoTLANM1CxLjVJ55mdT3VYjhkAQeb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280211832"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="280211832"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="727759979"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 15 Jun 2022 23:22:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 16 Jun 2022 09:22:58 +0300
Date: Thu, 16 Jun 2022 09:22:58 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v4 2/7] usb: typec: mux: Add CONFIG guards for functions
Message-ID: <YqrMQhb2BKtSCIdx@kuha.fi.intel.com>
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <20220615172129.1314056-3-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220615172129.1314056-3-pmalani@chromium.org>
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
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 05:20:18PM +0000, Prashant Malani wrote:
> There are some drivers that can use the Type C mux API, but don't have
> to. Introduce CONFIG guards for the mux functions so that drivers can
> include the header file and not run into compilation errors on systems
> which don't have CONFIG_TYPEC enabled. When CONFIG_TYPEC is not enabled,
> the Type C mux functions will be stub versions of the original calls.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes since v3:
> - No changes.
> 
> Changes since v2:
> - Fix up return types for some of the stubs. Remove 1 unnecessary stub
>   in the else condition.
> - Remove unnecessary IS_MODULE config guard.
> - Added Reviewed-by and Tested-by tags.
> 
> Changes since v1:
> - Added static inline to stub functions.
> - Updated function signature of stub functions from "struct typec_mux"
>   to "struct typec_mux_dev" in accordance with updates from commit
>   713fd49b430c ("usb: typec: mux: Introduce indirection")
> 
>  include/linux/usb/typec_mux.h | 44 ++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index ee57781dcf28..9292f0e07846 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -58,17 +58,13 @@ struct typec_mux_desc {
>  	void *drvdata;
>  };
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +
>  struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
>  				       const struct typec_altmode_desc *desc);
>  void typec_mux_put(struct typec_mux *mux);
>  int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
>  
> -static inline struct typec_mux *
> -typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
> -{
> -	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
> -}
> -
>  struct typec_mux_dev *
>  typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
>  void typec_mux_unregister(struct typec_mux_dev *mux);
> @@ -76,4 +72,40 @@ void typec_mux_unregister(struct typec_mux_dev *mux);
>  void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
>  void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
>  
> +#else
> +
> +static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
> +				       const struct typec_altmode_desc *desc)
> +{
> +	return NULL;
> +}
> +
> +static inline void typec_mux_put(struct typec_mux *mux) {}
> +
> +static inline int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
> +{
> +	return 0;
> +}
> +
> +static inline struct typec_mux_dev *
> +typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +static inline void typec_mux_unregister(struct typec_mux_dev *mux) {}
> +
> +static inline void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data) {}
> +static inline void *typec_mux_get_drvdata(struct typec_mux_dev *mux)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +#endif /* CONFIG_TYPEC */
> +
> +static inline struct typec_mux *
> +typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
> +{
> +	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
> +}
> +
>  #endif /* __USB_TYPEC_MUX */
> -- 
> 2.36.1.476.g0c4daa206d-goog

-- 
heikki
