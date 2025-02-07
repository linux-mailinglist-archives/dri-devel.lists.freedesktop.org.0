Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A82A2B929
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93BD10E095;
	Fri,  7 Feb 2025 02:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dHTg+1tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27BA10E095
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:41:18 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so14968511fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738896077; x=1739500877; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=;
 b=dHTg+1tBxqtdKBfqNoLWDKsMvNnuJKJXnIOuq+5sxdOhAAL26uDtFV0envsZDIvEYK
 RjcAfecaRvwdpt/tw0z2GzCU5qtIlTBrR+aDn/gA+PLxBi2IYz6WgY4iHD9jZYBp6gTT
 RPlHhgoysRPnHzd8kjCjTYnFzDVFgzHVb57D7KUEDptSAWCnfdAnyySt+wq97mbL8D8h
 hwsOFyMS7qEOq3DzF5h7SpFZLraf+QlH5zXX6Bl1ahideJ/3+U3WaLOLUG3xH0TTeD3B
 xNzjTmgYv8gppzQTKAGrJmy86RBe0W/Lm4FtreHek4Sk+SPoBUrjD4RegqNZU75dPAyk
 nOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738896077; x=1739500877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jd0S048MaszlErqb2pMIxhAhVHzJ2amWO0CFkcTTMIM=;
 b=Wo1Q4bovHbdCpgxKTIp6RlHI/kKDVI25Pka1xhR2z/kWvTdpcBDmwMPs/q3FKabuni
 MtdrsE3nDx4iTJlS8/Wt3+sRiXpz6II/Z2AY/srVCq/Uc6GFhLHlqJY4EMmjw+xOKD2i
 J1bjRIhSeZzgodompvDozWo86Nk7NaC5+LDaoAPfcppLlA2i+pWtL/7k8ga1DmwVZ8JT
 eCR9DVX4MTXVft2f65w/u3B3uhlp3/eUaZTxeinrg2t28AMyJjRlB7BGmTAN4H6zEffB
 CDY+Hv1R2pIkoawXlD9jUzzGcv34nc6ZDlOsZL3F6E/ZVbd4Dx4Fpyu8Be0eqN36tigC
 RZNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw69Gfhbb7Iryb04n4cMNck+ISAH1ybL7N3DdTwSBlK7RBbjkkSJCHEcj/1VBPlIg6ABfJZBiini0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB5DTzeRe9PuowWWRwrrat45/dB6vF33ytgNy1x35iVC1iNOCd
 quuGj7QFXurmYRurTGKb+FsfOBzPYkK65WQNn/4ccKKwkwZmHWhTT6hUWC4B68U=
X-Gm-Gg: ASbGncsHvTKvBS2ZVNkW3YJR2HpaIUPIhWRuxTLzOS8KnmEBo3UmJxzujNhupUhXxHF
 yWFpKesfm2NsYzDreBry/gMtWB6goS3nxiXXdnTDybuTdelGrD1G+v3E40FCkGZrIVUTJzixMgx
 V1chjD9BSlWkXWFWenUn9fv9nw06ZFj3m6IC1GBYybUobFm9YMB9pcc1ETg8bWH5S99BwkkiMs/
 reJ+KsqqOPmn8py980aKh2NM9eHsxsHmHKjLduc77ffR9hY367n3UY83fQfaEGhl1RJZnejxbN2
 ycryN3XjrWitj4v+Bs7DgWCWdgd40f6FmQ0PVa951aaPliBfvaBJXcCaHpJnfksiV9ExELY=
X-Google-Smtp-Source: AGHT+IEIcd1sCML4fLg7Ve3DlNewsN2pmF2R25wfRsiSNl5rJY8Hp8NDfnaEsylPnGJC1zPGHr481w==
X-Received: by 2002:a05:651c:150c:b0:300:1f12:3d54 with SMTP id
 38308e7fff4ca-307e57cb21fmr3904511fa.1.1738896076944; 
 Thu, 06 Feb 2025 18:41:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de177cc4sm2954991fa.7.2025.02.06.18.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:41:15 -0800 (PST)
Date: Fri, 7 Feb 2025 04:41:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 05/26] drm/debugfs: add top-level 'bridges' file
 showing all added bridges
Message-ID: <vnmkwcqv74y6qxbgmq7s5fkodjxiaow3hbob7xacfw2n6tyuth@ldddeoshkqdp>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-5-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:20PM +0100, Luca Ceresoli wrote:
> The global bridges_list holding all the bridges between drm_bridge_add()
> and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
> it.
> 
> To avoid code duplication, move the code printing a bridge info to a common
> function.
> 
> Note: this change requires exporting bridge_list and the mutex protecting
> it.
> 
> Also add a comment about bridge_lock to make checkpatch happy.

I think, exporting mutex _and_ a list is a bad idea (especially since
they don't have a proper prefix). It might be better to make the
bridge_print() function a more public one (and name it
drm_bridge_print()) and move allbridges attribute definition to
drm_bridge.c

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c   |  5 +--
>  drivers/gpu/drm/drm_debugfs.c  | 70 +++++++++++++++++++++++++++++-------------
>  drivers/gpu/drm/drm_drv.c      |  1 +
>  drivers/gpu/drm/drm_internal.h |  9 ++++++
>  4 files changed, 61 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 241a384ebce39b4a3db58c208af27960904fc662..87cebec2de806781cee22da54d666eee9bde3648 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -195,8 +195,9 @@
>   * driver.
>   */
>  
> -static DEFINE_MUTEX(bridge_lock);
> -static LIST_HEAD(bridge_list);
> +/* Protect bridge_list */
> +DEFINE_MUTEX(bridge_lock);
> +LIST_HEAD(bridge_list);
>  
>  /**
>   * drm_bridge_add - add the given bridge to the global bridge list
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b2178864c7ee12db9aa1f562e106b2f604439f8..7424d5237e7615d63de6bba572ee6050da6709d0 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -740,6 +740,30 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>  	crtc->debugfs_entry = NULL;
>  }
>  
> +static void bridge_print(struct drm_printer *p, struct drm_bridge *bridge, unsigned int idx)
> +{
> +	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
> +	drm_printf(p, "\ttype: [%d] %s\n",
> +		   bridge->type,
> +		   drm_get_connector_type_name(bridge->type));
> +
> +	if (bridge->of_node)
> +		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
> +
> +	drm_printf(p, "\tops: [0x%x]", bridge->ops);
> +	if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +		drm_puts(p, " detect");
> +	if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +		drm_puts(p, " edid");
> +	if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +		drm_puts(p, " hpd");
> +	if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +		drm_puts(p, " modes");
> +	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +		drm_puts(p, " hdmi");
> +	drm_puts(p, "\n");
> +}
> +
>  static int bridges_show(struct seq_file *m, void *data)
>  {
>  	struct drm_encoder *encoder = m->private;
> @@ -747,28 +771,8 @@ static int bridges_show(struct seq_file *m, void *data)
>  	struct drm_bridge *bridge;
>  	unsigned int idx = 0;
>  
> -	drm_for_each_bridge_in_chain(encoder, bridge) {
> -		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
> -		drm_printf(&p, "\ttype: [%d] %s\n",
> -			   bridge->type,
> -			   drm_get_connector_type_name(bridge->type));
> -
> -		if (bridge->of_node)
> -			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
> -
> -		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> -			drm_puts(&p, " detect");
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			drm_puts(&p, " edid");
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -			drm_puts(&p, " hpd");
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			drm_puts(&p, " modes");
> -		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> -			drm_puts(&p, " hdmi");
> -		drm_puts(&p, "\n");
> -	}
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		bridge_print(&p, bridge, idx++);
>  
>  	return 0;
>  }
> @@ -802,3 +806,25 @@ void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
>  	debugfs_remove_recursive(encoder->debugfs_entry);
>  	encoder->debugfs_entry = NULL;
>  }
> +
> +static int allbridges_show(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_bridge *bridge;
> +	unsigned int idx = 0;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list)
> +		bridge_print(&p, bridge, idx++);
> +
> +	mutex_unlock(&bridge_lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(allbridges);

Should it be DEFINE_DEBUGFS_ATTRIBUTE instead?

> +
> +void drm_debugfs_global_add(struct dentry *root)
> +{
> +	debugfs_create_file("bridges", 0444, root, NULL, &allbridges_fops);
> +}
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3cf440eee8a2ab3de134d925db8f1d2ce68062b7..9b6d7bd16ba409b6a9155a9fecbec6bfdd5ea0c2 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1120,6 +1120,7 @@ static int __init drm_core_init(void)
>  	}
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_debugfs_global_add(drm_debugfs_root);
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..b6e875d4b25faae6bb0bb952c3c12bd4819698ec 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -48,6 +48,10 @@ struct drm_prime_file_private;
>  struct drm_printer;
>  struct drm_vblank_crtc;
>  
> +// for drm_debugfs.c
> +extern struct mutex bridge_lock;
> +extern struct list_head bridge_list;
> +
>  /* drm_client_event.c */
>  #if defined(CONFIG_DRM_CLIENT)
>  void drm_client_debugfs_init(struct drm_device *dev);
> @@ -196,6 +200,7 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
>  void drm_debugfs_encoder_add(struct drm_encoder *encoder);
>  void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
> +void drm_debugfs_global_add(struct dentry *drm_debugfs_root);
>  #else
>  static inline void drm_debugfs_dev_fini(struct drm_device *dev)
>  {
> @@ -241,6 +246,10 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
>  {
>  }
>  
> +static inline void drm_debugfs_global_add(struct dentry *drm_debugfs_root)
> +{
> +}
> +
>  #endif
>  
>  drm_ioctl_t drm_version;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
