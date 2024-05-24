Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E6B8CE3AE
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006810E218;
	Fri, 24 May 2024 09:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBPwyQyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A308A10E218
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:43:22 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e95a1eff78so8389461fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716543801; x=1717148601; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OsWVQTfT7df58fpSGLkZCtsbCMRflqNxxYlAlGuL/2c=;
 b=gBPwyQynuYvOR+iEI0Z4MVg0I60dv8Po6ZdoRFhcKyV2IShGMsraNemWtUyQn6qBzr
 GapHQYLwnub+HGgLDS3OxuW3KoIdJ5nYFKxSyhdNsUnbglOAU+fJdEmoYS0G/G2WEt1L
 a3MOLv3nnc/ppE8GFRBDQ5L2qEmrIK7cRqMUolL/5kaQKL6O7QHbCujqxQMNqksMnyeV
 Om+2weRGk2OyYRvPJV98r/77i6NFD0t1Nme1Nxt486vUn7L3CMPFq56mQ7vcGZ3sS2Db
 ATiaYO0W6AfOhudgxcjomIU+uJwU5qgNnkX+WvdYJUxhcS7NmcSuuxSA1UOE31c2li6P
 fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716543801; x=1717148601;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OsWVQTfT7df58fpSGLkZCtsbCMRflqNxxYlAlGuL/2c=;
 b=dY97v+7YvX8/EY+VWnQLqd2KwObBEbVLNvIYsyyPSpCUQqPFsjqMDS5N9Q/w/iHz3m
 E8MJu959BQ7OEzJ8XiJnMaK8T3wvVuYaKXgepqFMMXsijg+HeGGm0dRbFjzdmEYix32D
 NDxaO/HaLAc6/g6Rd15WDgchlSXrWCUFEShZzCYs+5/Wh6sk7GhpkX/gyPchOaychaGh
 QfjTP+dbZFNCpz9vzyXnmovHnHtpdGp3ozxH4iuLLPLiTIIrJAkw2Lw1n2NtO/gR1V/N
 +/x94dKRKG7OvM4bl3qhoBnHgidNSgCpyEH1rY28ZFU12sc2ntkqp/naRbz5PcseYAI8
 bDvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsmSf2I1TXPmy7cAuYxN5TKpFzz//OUQNLqipith/KON85x8cR0Hi+rLnSiVe79s0i7qOSWiBJygWfMz4nly3Ak6wkOCJT4S8IWKssYDqc
X-Gm-Message-State: AOJu0Yx6QlpocB14SdVFP4WnWvSanOZVEQm7P8U8OCk07BtaOZPKpPym
 ceSsIeWzn6k3QchKlPG3OS4lTdnaQcMXwHfIEI4yyZXl6TJmzi7NbVBQ6JPv1vg=
X-Google-Smtp-Source: AGHT+IEgvRjNTdAczPMN3IxHxRGtpPDjB3IaHz1XVZx83tnK5mdnWEeYaN9YImeJHMTSymEhtPrY4g==
X-Received: by 2002:a2e:2c19:0:b0:2e9:564a:db29 with SMTP id
 38308e7fff4ca-2e95b0c4da4mr16297911fa.29.1716543800699; 
 Fri, 24 May 2024 02:43:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bdcd21esm1211721fa.100.2024.05.24.02.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 02:43:20 -0700 (PDT)
Date: Fri, 24 May 2024 12:43:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, u.kleine-koenig@pengutronix.de, 
 a-bhatia1@ti.com, javierm@redhat.com, nikhil.nd@ti.com, jani.nikula@intel.com, 
 amishin@t-argos.ru
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Add mode_valid hook for the
 drm_bridge_funcs
Message-ID: <unpyokzp44mxbycjam375zp3xhxz4vtrhjbafg2hnwycm6e3g3@ywv6hwkdenlz>
References: <20240524071348.106210-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524071348.106210-1-j-choudhary@ti.com>
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

On Fri, May 24, 2024 at 12:43:48PM +0530, Jayesh Choudhary wrote:
> With the support for the 'DRM_BRIDGE_ATTACH_NO_CONNECTOR' case,
> the connector_helper funcs are not initialized if the encoder has this
> flag in its bridge_attach call. Till now we had mode_valid hook only in
> the drm_connector_helper_funcs. Add this hook in drm_bridge_funcs to
> validate the modes in this case as well.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 31 +++++++++++++++----
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 8a91ef0ae065..0aee038f5db7 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1617,12 +1617,10 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
>  	return true;
>  }
>  
> -static
> -enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
> -					  struct drm_display_mode *mode)
> +static enum
> +drm_mode_status cdns_mhdp_mode_valid(struct cdns_mhdp_device *mhdp,
> +				     const struct drm_display_mode *mode)
>  {
> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> -
>  	mutex_lock(&mhdp->link_mutex);
>  
>  	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
> @@ -1635,6 +1633,16 @@ enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
>  	return MODE_OK;
>  }
>  
> +static enum drm_mode_status
> +cdns_mhdp_connector_mode_valid(struct drm_connector *conn,
> +			       struct drm_display_mode *mode)
> +{
> +	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> +	const struct drm_display_mode *mod = mode;
> +
> +	return cdns_mhdp_mode_valid(mhdp, mod);
> +}
> +
>  static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
>  					    struct drm_atomic_state *state)
>  {
> @@ -1678,7 +1686,7 @@ static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
>  static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
>  	.detect_ctx = cdns_mhdp_connector_detect,
>  	.get_modes = cdns_mhdp_get_modes,
> -	.mode_valid = cdns_mhdp_mode_valid,
> +	.mode_valid = cdns_mhdp_connector_mode_valid,

Just move it to bridge_funcs and drop it from connector_helper_funcs. It
should be enough.

>  	.atomic_check = cdns_mhdp_connector_atomic_check,
>  };
>  
> @@ -2233,6 +2241,16 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
>  	return cdns_mhdp_edid_read(mhdp, connector);
>  }
>  
> +static enum drm_mode_status
> +cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> +
> +	return cdns_mhdp_mode_valid(mhdp, mode);
> +}
> +
>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.atomic_enable = cdns_mhdp_atomic_enable,
>  	.atomic_disable = cdns_mhdp_atomic_disable,
> @@ -2247,6 +2265,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.edid_read = cdns_mhdp_bridge_edid_read,
>  	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
>  	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
> +	.mode_valid = cdns_mhdp_bridge_mode_valid,
>  };
>  
>  static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
