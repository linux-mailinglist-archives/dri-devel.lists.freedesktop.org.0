Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF5D9E7A2E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 21:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DA110E166;
	Fri,  6 Dec 2024 20:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FdC6bB+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C46810E166
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 20:48:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so16795865e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 12:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733518117; x=1734122917; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uGkyEhv3ztOL0A2YCw9gSOgB34ocTzGqhUWHntlpnqs=;
 b=FdC6bB+aZMHwsHdOsq4NBEPdMbBFGecXrTFCnF24iG58bdCli9ma95oTJOrfa9mUky
 GCobYaXAB8RX/TyjoSZLQLB2PX2pfv/NG1cUPB2rw8Sf/DwUD90tawn6UxzLAEE0B2nA
 yS9srlQhDVkDART4ggFdngALRUZVqEvK/NTEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733518117; x=1734122917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGkyEhv3ztOL0A2YCw9gSOgB34ocTzGqhUWHntlpnqs=;
 b=XIHbFDbUq7yp5i7OEszPOUdqs7f07O2qyhcaoEetnmPtxSSta4MxjlMIMG76og7sA/
 tyv8cQQ/syo8YhIr9Xs9eyCQEhTj97iIsPctAVuwyZ/gu1HHObGOgf96NNLtDJe7hate
 C8RLnntMLdJc/mA7HbDZNxLL/1Qx0GEYtVUI+nRBfqggz+HYcGwCokaPzMbAbsnJh+mB
 czSc7q8rp8e4obOnik1T1QUIBblfb3ZWEYm+KUSFR6FaIn7ziOJe+fdE27Z64MER1FEs
 GhMqoO9uGVgS8MpNEophtdxH+A4m4cv5V1S/n3AlfSgcYfvlDu9eXFsTcoJ09kbypJfq
 XKnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdavi5OJpeIof5BQ/cW221YSukutv+wpDpRTbg8ZE1RlkMzmSfWYqebmxLRUVyTuwuMBO5m+nChIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvRcm+fkiwFJRHc7I9RMRLCKCL78/VvYIIfot4KO68In6kaYz6
 MWaoKFoT/+dc/2BlsC1zSKPaeywbErQSftZSjJdcxNwI6Kr1O8mxajFeYBJ6Jgs=
X-Gm-Gg: ASbGncs7WmiWf8zjtKWRpQeKnlY/hOX8ieLCVZq6KpWM3hNWBftiYr5V4fYypkYfqTc
 KP0ZvluHWA0dj53JpEWTb5VnivESZTie3LWfhIP0cBkZ3T7UodRGB5inQl4csVrHCH8oftbduSA
 oEXvF4TAhRttvuV/yGdatkA7larqvYbau+HN7gAsKUCZ/rMmU0M3HHulhQVILdmsFee0zjj8h8i
 v00I2v1lvizzQALjXlUGeiEyoS7YcCEsAEPC2JEo+nXsFlZqxe6HtMKz5jzGw==
X-Google-Smtp-Source: AGHT+IG1GzWyA4FcxVFWvnQD9RzLg1xTe7Zfq3hUlN59nadlTpR2ELzdfTdY47jopHPe169Rqdcrdg==
X-Received: by 2002:a05:600d:8:b0:434:942c:145f with SMTP id
 5b1f17b1804b1-434dded6223mr36427505e9.29.1733518116516; 
 Fri, 06 Dec 2024 12:48:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d6a07sm65634275e9.13.2024.12.06.12.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 12:48:35 -0800 (PST)
Date: Fri, 6 Dec 2024 21:48:32 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Imre Deak <imre.deak@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Z1NjIHoO1MCM_kX2@phenom.ffwll.local>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z03h1uNoAGgS0Rek@phenom.ffwll.local>
 <Z04Te41DE_V5s2dB@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z04Te41DE_V5s2dB@ideak-desk.fi.intel.com>
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

On Mon, Dec 02, 2024 at 10:07:23PM +0200, Imre Deak wrote:
> On Mon, Dec 02, 2024 at 05:35:34PM +0100, Simona Vetter wrote:
> > On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> > > Atm when the connector is added to the drm_mode_config::connector_list,
> > > the connector may not be fully initialized yet. This is not a problem
> > > for user space, which will see the connector only after it's registered
> > > later, it could be a problem for in-kernel users looking up connectors
> > > via the above list.
> > > 
> > > To resolve the above issue, add a way to separately initialize the DRM
> > > core specific parts of the connector and add it to the above list. This
> > > will move adding the connector to the list after the properties on the
> > > connector have been added, this is ok since these steps don't have a
> > > dependency.
> > > 
> > > v2: (Jani)
> > > - Let initing DDC as well via drm_connector_init_core().
> > > - Rename __drm_connector_init to drm_connector_init_core_and_add().
> > > 
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > 
> > So looking at the thread, I guess it'd be good to document some consensus
> > stance on kunit tests, and whether or not we're at the point where for new
> > things or extensions of functions that already have kunit coverage we need
> > them. But I think that's orthogonal.
> > 
> > On the patch itself, I don't think it's the right fix. And by extension, I
> > don't think the i915 fix is correct either, because we have a bigger mess
> > here:
> > 
> > - GETCONNECTOR does indeed not show a connector that's not yet registers.
> > 
> > - But GETRESOURCES happily lists them. Which means we have a very silly
> >   race here, which isn't good.
> 
> Right, didn't notice that, it needs to be fixed as well.
> 
> > - I think the correct solution is to move the list_add to the registration
> >   step, which would also move connectors in-line with other dynamically
> >   added kms objects like blobs or fbs (although those have a single-step
> >   registration+init function, so it's less obvious what's going on).
> > 
> > - The same thing applies on the unregister side of things, once a
> >   connector is unregistered I don't think it should stick around in any
> >   list. But I'm not entirely sure, would need to check with Lyude to make
> >   sure this doesn't break anything in mst helpers.
> > 
> > Now implementing this is going to be a bit a mess:
> > 
> > - For static connectors drivers _really_ want the connectors to be on the
> >   lists, otherwise a lot of the driver setup code just wont work. And
> >   we've worked towards removing all the explicit drm_connector_register
> >   calls, readding feels a bit silly.
> > 
> > - I think short-term we could just use the connector type to decide this,
> >   if it's MST it's a dynamic connector, and the list_add would need to be
> >   done late in drm_connector_register.
> > 
> > - Once the need pops up for other connectors to be dynamic (like for
> >   dynamic drm_bridge hotplug) we can add a drm_connector_dynamic_init or
> >   similar. I don't think splitting up _init further like you do here in
> >   two functions is correct, because the only place where it's correct to
> >   add a dynamic/hotplugged connector to the lists is in
> >   drm_connector_register, not anywhere else.
> 
> Afaiu the above means adding drm_connector_dynamic_init() which would
> only init the connector w/o adding it to the connector list (i.e. what
> drm_connector_init_core() does) and adding this connector to the list
> from drm_connector_register(), hence not needing the drm_connector_add()
> interface.

drm_connector_dynamic_init() is the more explicit approach, my suggestion
was to just hard-code this behavior for dp mst connectors. Which is a bit
a hack. Either is fine with me.

> I agree this would be better, in the following way: the deferred
> registration via drm_connector_register_all() should continue to work -
> if drm_connector_register() is called by the driver before the drm
> device is registered. So a dynamically inited connector should be added
> to the list - if not yet added - early in the function before returning
> if the drm device is not yet registered.
> 
> Are you ok with the above for now, also fixing GETRESOURCES by checking
> there if the connector is already registered?

I don't think you need to check for registered connectors. For dynamic
ones this should be impossible, and userspace cannot call any ioctl before
drm_dev_register registers all the non-dynamic connectors.

> Moving the addition of the connector to the list later could be done
> once the deferred registration happens in a different way (i.e. not via
> the current connector list).

I don't think you need that special case, the current code should work,
even for dynamic connectors?

Cheers, Sima

> 
> > - It would be really nice if we could add a check to
> >   drm_connector_register to make sure it's not called for any connector
> >   which is already on the connector list, since that's a driver bug. Of
> >   course this would mean we'd need to split that from the internal version
> >   we call from drm_dev_register.
> > 
> >   Unfortunately that's not yet doable because the following todo isn't
> >   completed yet:
> > 
> >   https://dri.freedesktop.org/docs/drm/gpu/todo.html#connector-register-unregister-fixes
> > 
> >   I guess just add another bullet there?
> > 
> > Does this sound like a plan or am I completely wrong here?
> > 
> > Cheers, Sima
> > 
> > 
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 111 ++++++++++++++++++++++++++------
> > >  include/drm/drm_connector.h     |   6 ++
> > >  2 files changed, 97 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index fc35f47e2849e..fd7acae8656b2 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -218,11 +218,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
> > >  	}
> > >  }
> > >  
> > > -static int __drm_connector_init(struct drm_device *dev,
> > > -				struct drm_connector *connector,
> > > -				const struct drm_connector_funcs *funcs,
> > > -				int connector_type,
> > > -				struct i2c_adapter *ddc)
> > > +static int __drm_connector_init_core(struct drm_device *dev,
> > > +				     struct drm_connector *connector,
> > > +				     const struct drm_connector_funcs *funcs,
> > > +				     int connector_type,
> > > +				     struct i2c_adapter *ddc)
> > >  {
> > >  	struct drm_mode_config *config = &dev->mode_config;
> > >  	int ret;
> > > @@ -273,6 +273,7 @@ static int __drm_connector_init(struct drm_device *dev,
> > >  	/* provide ddc symlink in sysfs */
> > >  	connector->ddc = ddc;
> > >  
> > > +	INIT_LIST_HEAD(&connector->head);
> > >  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
> > >  	INIT_LIST_HEAD(&connector->probed_modes);
> > >  	INIT_LIST_HEAD(&connector->modes);
> > > @@ -288,14 +289,6 @@ static int __drm_connector_init(struct drm_device *dev,
> > >  
> > >  	drm_connector_get_cmdline_mode(connector);
> > >  
> > > -	/* We should add connectors at the end to avoid upsetting the connector
> > > -	 * index too much.
> > > -	 */
> > > -	spin_lock_irq(&config->connector_list_lock);
> > > -	list_add_tail(&connector->head, &config->connector_list);
> > > -	config->num_connector++;
> > > -	spin_unlock_irq(&config->connector_list_lock);
> > > -
> > >  	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
> > >  	    connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
> > >  		drm_connector_attach_edid_property(connector);
> > > @@ -332,6 +325,86 @@ static int __drm_connector_init(struct drm_device *dev,
> > >  	return ret;
> > >  }
> > >  
> > > +/**
> > > + * drm_connector_init_core - Initialize the core state of a preallocated connector
> > > + * @dev: DRM device
> > > + * @connector: the connector to init
> > > + * @funcs: callbacks for this connector
> > > + * @connector_type: user visible type of the connector
> > > + * @ddc: pointer to the associated ddc adapter
> > > + *
> > > + * Initialises the core state of preallocated connector. This is
> > > + * equivalent to drm_connector_init(), without adding the connector to
> > > + * drm_mode_config::connector_list. This call must be followed by calling
> > > + * drm_connector_add() during initialization to expose the connector to
> > > + * in-kernel users via the above list.
> > > + *
> > > + * Returns:
> > > + * Zero on success, error code on failure.
> > > + */
> > > +int drm_connector_init_core(struct drm_device *dev,
> > > +			    struct drm_connector *connector,
> > > +			    const struct drm_connector_funcs *funcs,
> > > +			    int connector_type,
> > > +			    struct i2c_adapter *ddc)
> > > +{
> > > +	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> > > +		return -EINVAL;
> > > +
> > > +	return __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> > > +}
> > > +EXPORT_SYMBOL(drm_connector_init_core);
> > > +
> > > +/**
> > > + * drm_connector_add - Add the connector
> > > + * @connector: the connector to add
> > > + *
> > > + * Add the connector to the drm_mode_config::connector_list, exposing the
> > > + * connector to in-kernel users. This call must be preceded by a call to
> > > + * drm_connector_init_core().
> > > + */
> > > +void drm_connector_add(struct drm_connector *connector)
> > > +{
> > > +	struct drm_device *dev = connector->dev;
> > > +	struct drm_mode_config *config = &dev->mode_config;
> > > +
> > > +	spin_lock_irq(&config->connector_list_lock);
> > > +	list_add_tail(&connector->head, &config->connector_list);
> > > +	config->num_connector++;
> > > +	spin_unlock_irq(&config->connector_list_lock);
> > > +}
> > > +EXPORT_SYMBOL(drm_connector_add);
> > > +
> > > +static void drm_connector_remove(struct drm_connector *connector)
> > > +{
> > > +	struct drm_device *dev = connector->dev;
> > > +
> > > +	if (list_empty(&connector->head))
> > > +		return;
> > > +
> > > +	spin_lock_irq(&dev->mode_config.connector_list_lock);
> > > +	list_del_init(&connector->head);
> > > +	dev->mode_config.num_connector--;
> > > +	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> > > +}
> > > +
> > > +static int drm_connector_init_core_and_add(struct drm_device *dev,
> > > +					   struct drm_connector *connector,
> > > +					   const struct drm_connector_funcs *funcs,
> > > +					   int connector_type,
> > > +					   struct i2c_adapter *ddc)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	drm_connector_add(connector);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * drm_connector_init - Init a preallocated connector
> > >   * @dev: DRM device
> > > @@ -361,7 +434,7 @@ int drm_connector_init(struct drm_device *dev,
> > >  	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> > >  		return -EINVAL;
> > >  
> > > -	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
> > > +	return drm_connector_init_core_and_add(dev, connector, funcs, connector_type, NULL);
> > >  }
> > >  EXPORT_SYMBOL(drm_connector_init);
> > >  
> > > @@ -398,7 +471,7 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
> > >  	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> > >  		return -EINVAL;
> > >  
> > > -	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
> > > +	return drm_connector_init_core_and_add(dev, connector, funcs, connector_type, ddc);
> > >  }
> > >  EXPORT_SYMBOL(drm_connector_init_with_ddc);
> > >  
> > > @@ -442,7 +515,7 @@ int drmm_connector_init(struct drm_device *dev,
> > >  	if (drm_WARN_ON(dev, funcs && funcs->destroy))
> > >  		return -EINVAL;
> > >  
> > > -	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
> > > +	ret = drm_connector_init_core_and_add(dev, connector, funcs, connector_type, ddc);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > @@ -659,10 +732,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> > >  	connector->name = NULL;
> > >  	fwnode_handle_put(connector->fwnode);
> > >  	connector->fwnode = NULL;
> > > -	spin_lock_irq(&dev->mode_config.connector_list_lock);
> > > -	list_del(&connector->head);
> > > -	dev->mode_config.num_connector--;
> > > -	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> > > +
> > > +	drm_connector_remove(connector);
> > >  
> > >  	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
> > >  	if (connector->state && connector->funcs->atomic_destroy_state)
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index e3fa43291f449..2476dcbd3c34d 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -2122,6 +2122,12 @@ struct drm_connector {
> > >  
> > >  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> > >  
> > > +int drm_connector_init_core(struct drm_device *dev,
> > > +			    struct drm_connector *connector,
> > > +			    const struct drm_connector_funcs *funcs,
> > > +			    int connector_type,
> > > +			    struct i2c_adapter *ddc);
> > > +void drm_connector_add(struct drm_connector *connector);
> > >  int drm_connector_init(struct drm_device *dev,
> > >  		       struct drm_connector *connector,
> > >  		       const struct drm_connector_funcs *funcs,
> > > -- 
> > > 2.44.2
> > > 
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
