Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC754AB71
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 10:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFA210FC16;
	Tue, 14 Jun 2022 08:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F217F10FD0C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655194209; x=1686730209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zv1KKzmF6zXtKfqHFutKI0fiY58cScPq9J52k7YOFMU=;
 b=eN1hKDq3fGMNKKqv2fIyECvqDjA9otw7muewl9cQllYlNGUhQ4rCiqPc
 52klE795k8uippoOsO9sDxsuUvMpVg2p4AErfO18BfXWN1TLoVaTvTZ5p
 1JtmP3kWa2h7+g+2bELdV8x3S8hA7t60eQyOY7A2vs6dQmhhe2S5tBsfO
 qi2k7XWb/1hdSYRcvqGTkh4YPSFmzrI8b6HtSLnYV6/Go9JPYcRhDsp+g
 yCbXUiq3P6hWgqhpgIBGsTNdzwVeVQcDTcCQhqAQVVO8eoMICq1fNH36u
 HKbWqnJcDncRKrLWBF8OpFGP8FNKAKdLFKSFubD4ACAaRnYx795S39qUV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="303952996"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="303952996"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 01:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="726704202"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 14 Jun 2022 01:10:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 14 Jun 2022 11:10:01 +0300
Date: Tue, 14 Jun 2022 11:10:01 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 2/7] usb: typec: mux: Add CONFIG guards for functions
Message-ID: <YqhCWXOpuOjxwpwp@kuha.fi.intel.com>
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-3-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609181106.3695103-3-pmalani@chromium.org>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
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

Hi,

On Thu, Jun 09, 2022 at 06:09:41PM +0000, Prashant Malani wrote:
> There are some drivers that can use the Type C mux API, but don't have
> to. Introduce CONFIG guards for the mux functions so that drivers can
> include the header file and not run into compilation errors on systems
> which don't have CONFIG_TYPEC enabled. When CONFIG_TYPEC is not enabled,
> the Type C mux functions will be stub versions of the original calls.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v1:
> - Added static inline to stub functions.
> - Updated function signature of stub functions from "struct typec_mux"
>   to "struct typec_mux_dev" in accordance with updates from commit
>   713fd49b430c ("usb: typec: mux: Introduce indirection")
> 
>  include/linux/usb/typec_mux.h | 38 +++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index ee57781dcf28..9eda6146fd26 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -58,6 +58,8 @@ struct typec_mux_desc {
>  	void *drvdata;
>  };
>  
> +#if IS_ENABLED(CONFIG_TYPEC) || IS_MODULE(CONFIG_TYPEC)
> +
>  struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
>  				       const struct typec_altmode_desc *desc);
>  void typec_mux_put(struct typec_mux *mux);
> @@ -76,4 +78,40 @@ void typec_mux_unregister(struct typec_mux_dev *mux);
>  void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
>  void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
>  
> +#else
> +
> +static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
> +				       const struct typec_altmode_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}

The mux is optional resource for the drivers - fwnode_typec_mux_get()
returns NULL if there is no mux for the caller - so it's better to
just return NULL from this stub.

> +static inline void typec_mux_put(struct typec_mux *mux) {}
> +
> +static inline int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
> +{
> +	return -EOPNOTSUPP;
> +}

Return 0 in this case. That way this stub matches the function
behaviour:

        ...
        if (IS_ERR_OR_NULL(mux))
                return 0;
        ...

> +static inline struct typec_mux *
> +typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}

You don't need this one. Just leave the original outside of the ifdef.
It's already an inline wrapper function.

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
>  #endif /* __USB_TYPEC_MUX */

thanks,

-- 
heikki
