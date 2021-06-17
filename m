Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A713ABC34
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 20:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30C76E97D;
	Thu, 17 Jun 2021 18:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1230F6E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 18:58:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i94so7918435wri.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=apmpXDiEwtgBFMmJSLYRB4EsXDX4A/Xg+9aOa5e+4N0=;
 b=af2uiz7LKyVVu4dqMHVxC+i/TbVDrQnFq6PgWfVTQybc+8SXkAgMmHE0QRz1z5oex/
 oxNzioIDC7IY6mjQNErqAwDOVJETvbRPoJTD5ArBel0BMkWbbzohJ4HVBVp7wC0Dfz92
 frkLO6cF8og1Rmc+DjJ4bsDWMdg20a1RiB7eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=apmpXDiEwtgBFMmJSLYRB4EsXDX4A/Xg+9aOa5e+4N0=;
 b=fs6iDmZceQhD4vYMuR1xVg/MiMVP37i0XczA8Ixc7BHnXe043wVzId4HETSQN3/nCj
 RHx/F1kqcsfBS0dwU1zNq/ov5oU2SANSsMsSpv6jeTAUMSGUt+BrvWc5sZ6EJjg/8wbM
 hBShAcyuUvLZFK4zEsU3P8DRyyCf+xOjm0JK95iQrMqwYQbHk6kD20tjDw2oFaPVyK5I
 /8xBm9aJozI5X1JRbBb3HjWHI+kdHcshwCceRQOJLQbTcqky1jIChtR/CfYGOFO5tdAC
 wcdqlj4G9XzV9OYx1ifJBvs9+Rm/fqylTA/Gfl6AnYfG1Vq/ayBf7+JvtKVUyvodreBR
 pmgg==
X-Gm-Message-State: AOAM533Dgxhc2Ge2iAjL9N9muMOekUeXaZj21Cd9yzqlsIAs6+fymf8G
 gNl7mRFg/UWEZSeMuIZXuVGd+g==
X-Google-Smtp-Source: ABdhPJzxzh5oFv5IrdUXFuTeD8FrHtdKTy5n8pwky73TCWsiiEptPAHWHt/EcQgmMn6w6wJ3j2nwIg==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr735465wrx.161.1623956313695; 
 Thu, 17 Jun 2021 11:58:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q20sm7915278wrf.45.2021.06.17.11.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 11:58:33 -0700 (PDT)
Date: Thu, 17 Jun 2021 20:58:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 1/3] drm/dp_helper: Rework the drm_dp_aux documentation
Message-ID: <YMubV1Ats+cQWaCx@phenom.ffwll.local>
References: <20210616141529.630719-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616141529.630719-1-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 04:15:27PM +0200, Maxime Ripard wrote:
> Split the existing documentation to move the comments on particular
> fields next to them.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - New patch

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for doing this polish&doc improvement.
-Daniel
> ---
>  include/drm/drm_dp_helper.h | 84 +++++++++++++++++++++++++------------
>  1 file changed, 57 insertions(+), 27 deletions(-)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 1e85c2021f2f..1c5ae07ff0c7 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1837,29 +1837,6 @@ struct drm_dp_aux_cec {
>  
>  /**
>   * struct drm_dp_aux - DisplayPort AUX channel
> - * @name: user-visible name of this AUX channel and the I2C-over-AUX adapter
> - * @ddc: I2C adapter that can be used for I2C-over-AUX communication
> - * @dev: pointer to struct device that is the parent for this AUX channel
> - * @crtc: backpointer to the crtc that is currently using this AUX channel
> - * @hw_mutex: internal mutex used for locking transfers
> - * @crc_work: worker that captures CRCs for each frame
> - * @crc_count: counter of captured frame CRCs
> - * @transfer: transfers a message representing a single AUX transaction
> - *
> - * The @dev field should be set to a pointer to the device that implements the
> - * AUX channel.
> - *
> - * The @name field may be used to specify the name of the I2C adapter. If set to
> - * %NULL, dev_name() of @dev will be used.
> - *
> - * Drivers provide a hardware-specific implementation of how transactions are
> - * executed via the @transfer() function. A pointer to a &drm_dp_aux_msg
> - * structure describing the transaction is passed into this function. Upon
> - * success, the implementation should return the number of payload bytes that
> - * were transferred, or a negative error-code on failure. Helpers propagate
> - * errors from the @transfer() function, with the exception of the %-EBUSY
> - * error, which causes a transaction to be retried. On a short, helpers will
> - * return %-EPROTO to make it simpler to check for failure.
>   *
>   * An AUX channel can also be used to transport I2C messages to a sink. A
>   * typical application of that is to access an EDID that's present in the sink
> @@ -1870,21 +1847,74 @@ struct drm_dp_aux_cec {
>   * transfers by default; if a partial response is received, the adapter will
>   * drop down to the size given by the partial response for this transaction
>   * only.
> - *
> - * Note that the aux helper code assumes that the @transfer() function only
> - * modifies the reply field of the &drm_dp_aux_msg structure. The retry logic
> - * and i2c helpers assume this is the case.
>   */
>  struct drm_dp_aux {
> +	/**
> +	 * @name: user-visible name of this AUX channel and the
> +	 * I2C-over-AUX adapter.
> +	 *
> +	 * It's also used to specify the name of the I2C adapter. If set
> +	 * to %NULL, dev_name() of @dev will be used.
> +	 */
>  	const char *name;
> +
> +	/**
> +	 * @ddc: I2C adapter that can be used for I2C-over-AUX
> +	 * communication
> +	 */
>  	struct i2c_adapter ddc;
> +
> +	/**
> +	 * @dev: pointer to struct device that is the parent for this
> +	 * AUX channel.
> +	 */
>  	struct device *dev;
> +
> +	/**
> +	 * @crtc: backpointer to the crtc that is currently using this
> +	 * AUX channel
> +	 */
>  	struct drm_crtc *crtc;
> +
> +	/**
> +	 * @hw_mutex: internal mutex used for locking transfers.
> +	 */
>  	struct mutex hw_mutex;
> +
> +	/**
> +	 * @crc_work: worker that captures CRCs for each frame
> +	 */
>  	struct work_struct crc_work;
> +
> +	/**
> +	 * @crc_count: counter of captured frame CRCs
> +	 */
>  	u8 crc_count;
> +
> +	/**
> +	 * @transfer: transfers a message representing a single AUX
> +	 * transaction.
> +	 *
> +	 * This is a hardware-specific implementation of how
> +	 * transactions are executed that the drivers must provide.
> +	 *
> +	 * A pointer to a &drm_dp_aux_msg structure describing the
> +	 * transaction is passed into this function. Upon success, the
> +	 * implementation should return the number of payload bytes that
> +	 * were transferred, or a negative error-code on failure.
> +	 *
> +	 * Helpers will propagate these errors, with the exception of
> +	 * the %-EBUSY error, which causes a transaction to be retried.
> +	 * On a short, helpers will return %-EPROTO to make it simpler
> +	 * to check for failure.
> +	 *
> +	 * The @transfer() function must only modify the reply field of
> +	 * the &drm_dp_aux_msg structure. The retry logic and i2c
> +	 * helpers assume this is the case.
> +	 */
>  	ssize_t (*transfer)(struct drm_dp_aux *aux,
>  			    struct drm_dp_aux_msg *msg);
> +
>  	/**
>  	 * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
>  	 */
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
