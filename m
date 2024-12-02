Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35309E08AF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 17:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003CE10E7CB;
	Mon,  2 Dec 2024 16:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h9lWIjkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB6E10E7CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 16:35:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-434a10588f3so28904915e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733157337; x=1733762137; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8eql7Ns+uGGm9HgifQjo4XUl6VBylMvV+veZoo9jkdI=;
 b=h9lWIjkTyQYDH3cNDmWiMqCRAeKNCphEGf5ypemO81AteYMsYn0qK/7mIFl3xKXmzk
 uqWr1r9IWmxTFnAu3+gIxNHjYGX9m5LxsrZE8TNFRzn9m9ANiDGC/ELfAZ6B+/QchB8J
 VFtOcoLuxXrUFps1TmpWIlslIlC8X92KQGNqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733157337; x=1733762137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eql7Ns+uGGm9HgifQjo4XUl6VBylMvV+veZoo9jkdI=;
 b=WEnZFYaegKW8CiP8fTi/BToucsfEn44Vkj+VeJzGTJcHxfBun2vw/OfEDlAzNIz9jk
 zGd/pJ0mgRonM/y7d/STAm+or9M0HheJAv2n5kX8FxR0eoHidIoLn+b7oUjHpQUx5Glh
 Ln8IBDgy/6ScTBDKlJf6fRsBXqbFP3xpJ5Ge9FEoR+CSQPBGGoOocINNv0S/B77pcmXM
 IYP5uD4GecT5vqLJMygEanWXNyNsKyKl0eYRUmm1O6/ZfOWxkHe4hJsbgvAnoZL7NW+v
 HBGnjgXmeVg4PhMcSzzeFesbff8AOj2eZzo3tQ7ElHt67rKtKkRiWyyImJp0s9hkky8Q
 HTOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5LNXga1ZDfySNq1aQ8Ml19RAbULhLLW5sEy7D376rgH+MVkhjlNow1IKdQyQLvfJfTRtz502ifN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLIDAMyeHKt8sxqIADyV+wcxJ9fJk4amV5T3edCpBRfUbxq20A
 5g2K9A9HB54JRXSEawb33J4krt59SJOz8UDE5Po7+GG9wZUe0J0ymsNIDyzye0I=
X-Gm-Gg: ASbGncte5wfK1TTAwyuDnA+jwjhn3SUI3g9zboaBJlb009scZJfetTW7FMchaEzjbSc
 JYmi7Vi1Muedj5YuHa4pWk0ryIxPn0V374r3mGPgBriDDnLkFANiq019mIh7gtaz5Yzp2ZGdx/m
 JR9mmx2Ifc3FuKYMyu6lzsTqKOKXWWhaSdWGsPeRkUp7IYBhkVpb73WTU4NNdo2eak3l28voWXx
 njWZl7LUA9yXxGIALJOMaVZCYfymR4d6UjFe+vVu18g6RIAbOnIa+y+ckfB2w==
X-Google-Smtp-Source: AGHT+IHWoz9VLXWA9E4fldx9+8VfACSCwdWfeadjeDtaCl1Ih1nC9+GCl9XUVwcqBqCLWfsjOZ4W4Q==
X-Received: by 2002:a05:600c:3b25:b0:434:a830:936a with SMTP id
 5b1f17b1804b1-434a9de78ddmr184200725e9.21.1733157337122; 
 Mon, 02 Dec 2024 08:35:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0d9bc11sm161572615e9.4.2024.12.02.08.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:35:36 -0800 (PST)
Date: Mon, 2 Dec 2024 17:35:34 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Z03h1uNoAGgS0Rek@phenom.ffwll.local>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126161859.1858058-2-imre.deak@intel.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> Atm when the connector is added to the drm_mode_config::connector_list,
> the connector may not be fully initialized yet. This is not a problem
> for user space, which will see the connector only after it's registered
> later, it could be a problem for in-kernel users looking up connectors
> via the above list.
> 
> To resolve the above issue, add a way to separately initialize the DRM
> core specific parts of the connector and add it to the above list. This
> will move adding the connector to the list after the properties on the
> connector have been added, this is ok since these steps don't have a
> dependency.
> 
> v2: (Jani)
> - Let initing DDC as well via drm_connector_init_core().
> - Rename __drm_connector_init to drm_connector_init_core_and_add().
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> Signed-off-by: Imre Deak <imre.deak@intel.com>

So looking at the thread, I guess it'd be good to document some consensus
stance on kunit tests, and whether or not we're at the point where for new
things or extensions of functions that already have kunit coverage we need
them. But I think that's orthogonal.

On the patch itself, I don't think it's the right fix. And by extension, I
don't think the i915 fix is correct either, because we have a bigger mess
here:

- GETCONNECTOR does indeed not show a connector that's not yet registers.

- But GETRESOURCES happily lists them. Which means we have a very silly
  race here, which isn't good.

- I think the correct solution is to move the list_add to the registration
  step, which would also move connectors in-line with other dynamically
  added kms objects like blobs or fbs (although those have a single-step
  registration+init function, so it's less obvious what's going on).

- The same thing applies on the unregister side of things, once a
  connector is unregistered I don't think it should stick around in any
  list. But I'm not entirely sure, would need to check with Lyude to make
  sure this doesn't break anything in mst helpers.

Now implementing this is going to be a bit a mess:

- For static connectors drivers _really_ want the connectors to be on the
  lists, otherwise a lot of the driver setup code just wont work. And
  we've worked towards removing all the explicit drm_connector_register
  calls, readding feels a bit silly.

- I think short-term we could just use the connector type to decide this,
  if it's MST it's a dynamic connector, and the list_add would need to be
  done late in drm_connector_register.

- Once the need pops up for other connectors to be dynamic (like for
  dynamic drm_bridge hotplug) we can add a drm_connector_dynamic_init or
  similar. I don't think splitting up _init further like you do here in
  two functions is correct, because the only place where it's correct to
  add a dynamic/hotplugged connector to the lists is in
  drm_connector_register, not anywhere else.

- It would be really nice if we could add a check to
  drm_connector_register to make sure it's not called for any connector
  which is already on the connector list, since that's a driver bug. Of
  course this would mean we'd need to split that from the internal version
  we call from drm_dev_register.

  Unfortunately that's not yet doable because the following todo isn't
  completed yet:

  https://dri.freedesktop.org/docs/drm/gpu/todo.html#connector-register-unregister-fixes

  I guess just add another bullet there?

Does this sound like a plan or am I completely wrong here?

Cheers, Sima


> ---
>  drivers/gpu/drm/drm_connector.c | 111 ++++++++++++++++++++++++++------
>  include/drm/drm_connector.h     |   6 ++
>  2 files changed, 97 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849e..fd7acae8656b2 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -218,11 +218,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
>  	}
>  }
>  
> -static int __drm_connector_init(struct drm_device *dev,
> -				struct drm_connector *connector,
> -				const struct drm_connector_funcs *funcs,
> -				int connector_type,
> -				struct i2c_adapter *ddc)
> +static int __drm_connector_init_core(struct drm_device *dev,
> +				     struct drm_connector *connector,
> +				     const struct drm_connector_funcs *funcs,
> +				     int connector_type,
> +				     struct i2c_adapter *ddc)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int ret;
> @@ -273,6 +273,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	/* provide ddc symlink in sysfs */
>  	connector->ddc = ddc;
>  
> +	INIT_LIST_HEAD(&connector->head);
>  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
> @@ -288,14 +289,6 @@ static int __drm_connector_init(struct drm_device *dev,
>  
>  	drm_connector_get_cmdline_mode(connector);
>  
> -	/* We should add connectors at the end to avoid upsetting the connector
> -	 * index too much.
> -	 */
> -	spin_lock_irq(&config->connector_list_lock);
> -	list_add_tail(&connector->head, &config->connector_list);
> -	config->num_connector++;
> -	spin_unlock_irq(&config->connector_list_lock);
> -
>  	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
>  	    connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>  		drm_connector_attach_edid_property(connector);
> @@ -332,6 +325,86 @@ static int __drm_connector_init(struct drm_device *dev,
>  	return ret;
>  }
>  
> +/**
> + * drm_connector_init_core - Initialize the core state of a preallocated connector
> + * @dev: DRM device
> + * @connector: the connector to init
> + * @funcs: callbacks for this connector
> + * @connector_type: user visible type of the connector
> + * @ddc: pointer to the associated ddc adapter
> + *
> + * Initialises the core state of preallocated connector. This is
> + * equivalent to drm_connector_init(), without adding the connector to
> + * drm_mode_config::connector_list. This call must be followed by calling
> + * drm_connector_add() during initialization to expose the connector to
> + * in-kernel users via the above list.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_connector_init_core(struct drm_device *dev,
> +			    struct drm_connector *connector,
> +			    const struct drm_connector_funcs *funcs,
> +			    int connector_type,
> +			    struct i2c_adapter *ddc)
> +{
> +	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> +		return -EINVAL;
> +
> +	return __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> +}
> +EXPORT_SYMBOL(drm_connector_init_core);
> +
> +/**
> + * drm_connector_add - Add the connector
> + * @connector: the connector to add
> + *
> + * Add the connector to the drm_mode_config::connector_list, exposing the
> + * connector to in-kernel users. This call must be preceded by a call to
> + * drm_connector_init_core().
> + */
> +void drm_connector_add(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	spin_lock_irq(&config->connector_list_lock);
> +	list_add_tail(&connector->head, &config->connector_list);
> +	config->num_connector++;
> +	spin_unlock_irq(&config->connector_list_lock);
> +}
> +EXPORT_SYMBOL(drm_connector_add);
> +
> +static void drm_connector_remove(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	if (list_empty(&connector->head))
> +		return;
> +
> +	spin_lock_irq(&dev->mode_config.connector_list_lock);
> +	list_del_init(&connector->head);
> +	dev->mode_config.num_connector--;
> +	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> +}
> +
> +static int drm_connector_init_core_and_add(struct drm_device *dev,
> +					   struct drm_connector *connector,
> +					   const struct drm_connector_funcs *funcs,
> +					   int connector_type,
> +					   struct i2c_adapter *ddc)
> +{
> +	int ret;
> +
> +	ret = __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_add(connector);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_connector_init - Init a preallocated connector
>   * @dev: DRM device
> @@ -361,7 +434,7 @@ int drm_connector_init(struct drm_device *dev,
>  	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
>  		return -EINVAL;
>  
> -	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
> +	return drm_connector_init_core_and_add(dev, connector, funcs, connector_type, NULL);
>  }
>  EXPORT_SYMBOL(drm_connector_init);
>  
> @@ -398,7 +471,7 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
>  	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
>  		return -EINVAL;
>  
> -	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
> +	return drm_connector_init_core_and_add(dev, connector, funcs, connector_type, ddc);
>  }
>  EXPORT_SYMBOL(drm_connector_init_with_ddc);
>  
> @@ -442,7 +515,7 @@ int drmm_connector_init(struct drm_device *dev,
>  	if (drm_WARN_ON(dev, funcs && funcs->destroy))
>  		return -EINVAL;
>  
> -	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
> +	ret = drm_connector_init_core_and_add(dev, connector, funcs, connector_type, ddc);
>  	if (ret)
>  		return ret;
>  
> @@ -659,10 +732,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  	connector->name = NULL;
>  	fwnode_handle_put(connector->fwnode);
>  	connector->fwnode = NULL;
> -	spin_lock_irq(&dev->mode_config.connector_list_lock);
> -	list_del(&connector->head);
> -	dev->mode_config.num_connector--;
> -	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> +
> +	drm_connector_remove(connector);
>  
>  	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
>  	if (connector->state && connector->funcs->atomic_destroy_state)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e3fa43291f449..2476dcbd3c34d 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2122,6 +2122,12 @@ struct drm_connector {
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>  
> +int drm_connector_init_core(struct drm_device *dev,
> +			    struct drm_connector *connector,
> +			    const struct drm_connector_funcs *funcs,
> +			    int connector_type,
> +			    struct i2c_adapter *ddc);
> +void drm_connector_add(struct drm_connector *connector);
>  int drm_connector_init(struct drm_device *dev,
>  		       struct drm_connector *connector,
>  		       const struct drm_connector_funcs *funcs,
> -- 
> 2.44.2
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
