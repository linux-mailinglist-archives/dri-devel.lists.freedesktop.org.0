Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E052040E1B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FEF6EBA1;
	Thu, 16 Sep 2021 16:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0EE6EBA0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631811044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDF6UEaYgXOPbdgC8r3gLUgk/GLIW2qq4Zlz9YVIF9M=;
 b=Kt2BFy3F2hCxdvy68vzWPyu0gVaW2Skkr/sXikf2uejGo/4DnQsdLn0on6LVTTObhR6V9L
 uQaKBmPtL5weHAeJuK1fuQ852fORGCZGwDNza/FHcmB1iFCgcplbqAAlm2Om05RSNhEETh
 RKvdzvWB9g6W4Cp/fBZOt6pW4ED3QOw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-jO9_SIExOTKNr42ege6K7g-1; Thu, 16 Sep 2021 12:50:43 -0400
X-MC-Unique: jO9_SIExOTKNr42ege6K7g-1
Received: by mail-qv1-f69.google.com with SMTP id
 a15-20020a0ce34f000000b0037a944f655dso60256290qvm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=PDF6UEaYgXOPbdgC8r3gLUgk/GLIW2qq4Zlz9YVIF9M=;
 b=uryjvsVqrsCri80Ti07HW1UAzqRz4SVuZU75wCZxVnzU2duFs8xo/Td6mIIdopVTWa
 0EYw2dTJLnb2wkoOIvrgOLBB4ayxssqkmzJY/9zT1vjD8GhUxyCoKuWcYyCChrUO/ETk
 xkTS3um+FLb+EwXu1lRme7f29oUyXcrjnFzuWJpjT1vk9/ig7TY+NOESoeZSwlXbIjpV
 5/hY+KERMcCvUn8ncMBbZ+/BET0OHeKoQPeD0fRPVFSEAZSmxDuoC6Wc0KsfDRBclahz
 GmtvCIZ/Ud85mI8R9yoYLTh1KvqJO1FKzx4lUOdRuF28vR6ZZtQSPpSsoTYfhL/trHpx
 O8RA==
X-Gm-Message-State: AOAM530Kmqzgd0dMFdojXODLVaj0Hcv9vRXJYqmeHiJ0PWDabAImxLHz
 W1OusO3omhCQZUtSl5QGvL+k7LATU6U2V8YCqbjnWLxXGUi9yj2t0WaKtlcJBpmUMrOS8VwQkLw
 /HzT+g9hvo77xddZhRu2KGYszqIB9
X-Received: by 2002:a05:620a:1403:: with SMTP id
 d3mr5858253qkj.67.1631811042663; 
 Thu, 16 Sep 2021 09:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyobm/E2u/c0Lwj1wJ2YziNc8T+8u/bHNQuAWK/jnkwBm95wQ/eYuEnWVG8L1TCiUt21VRxew==
X-Received: by 2002:a05:620a:1403:: with SMTP id
 d3mr5858223qkj.67.1631811042363; 
 Thu, 16 Sep 2021 09:50:42 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e25sm2811178qka.83.2021.09.16.09.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 09:50:41 -0700 (PDT)
Message-ID: <f9157235d0a163a1eb4127412cbea39978a213f5.camel@redhat.com>
Subject: Re: [PATCH 4/9] drm/privacy-screen: Add notifier support
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mark Gross <mgross@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Pekka
 Paalanen <pekka.paalanen@collabora.com>, Mario Limonciello
 <mario.limonciello@outlook.com>, Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>, Marco Trevisan
 <marco.trevisan@canonical.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org
Date: Thu, 16 Sep 2021 12:50:40 -0400
In-Reply-To: <b3583afa-6801-7c32-daab-6085e463c137@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-5-hdegoede@redhat.com>
 <6c9daf86dbbd5fe98f84efd3bae3240f0bf93387.camel@redhat.com>
 <b3583afa-6801-7c32-daab-6085e463c137@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 2021-09-16 at 11:06 +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/15/21 10:26 PM, Lyude Paul wrote:
> > On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> > > Add support for privacy-screen consumers to register a notifier to
> > > be notified of external (e.g. done by the hw itself on a hotkey press)
> > > state changes.
> > > 
> > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_privacy_screen.c      | 67 +++++++++++++++++++++++
> > >  include/drm/drm_privacy_screen_consumer.h | 15 +++++
> > >  include/drm/drm_privacy_screen_driver.h   |  4 ++
> > >  3 files changed, 86 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_privacy_screen.c
> > > b/drivers/gpu/drm/drm_privacy_screen.c
> > > index 294a09194bfb..7a5f878c3171 100644
> > > --- a/drivers/gpu/drm/drm_privacy_screen.c
> > > +++ b/drivers/gpu/drm/drm_privacy_screen.c
> > > @@ -255,6 +255,49 @@ void drm_privacy_screen_get_state(struct
> > > drm_privacy_screen *priv,
> > >  }
> > >  EXPORT_SYMBOL(drm_privacy_screen_get_state);
> > >  
> > > +/**
> > > + * drm_privacy_screen_register_notifier - register a notifier
> > > + * @priv: Privacy screen to register the notifier with
> > > + * @nb: Notifier-block for the notifier to register
> > > + *
> > > + * Register a notifier with the privacy-screen to be notified of
> > > changes
> > > made
> > > + * to the privacy-screen state from outside of the privacy-screen
> > > class.
> > > + * E.g. the state may be changed by the hardware itself in response to
> > > a
> > > + * hotkey press.
> > > + *
> > > + * The notifier is called with no locks held. The new hw_state and
> > > sw_state
> > > + * can be retrieved using the drm_privacy_screen_get_state() function.
> > > + * A pointer to the drm_privacy_screen's struct is passed as the void
> > > *data
> > > + * argument of the notifier_block's notifier_call.
> > > + *
> > > + * The notifier will NOT be called when changes are made through
> > > + * drm_privacy_screen_set_sw_state(). It is only called for external
> > > changes.
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +int drm_privacy_screen_register_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                        struct notifier_block *nb)
> > > +{
> > > +       return blocking_notifier_chain_register(&priv->notifier_head,
> > > nb);
> > > +}
> > > +EXPORT_SYMBOL(drm_privacy_screen_register_notifier);
> > > +
> > > +/**
> > > + * drm_privacy_screen_unregister_notifier - unregister a notifier
> > > + * @priv: Privacy screen to register the notifier with
> > > + * @nb: Notifier-block for the notifier to register
> > > + *
> > > + * Unregister a notifier registered with
> > > drm_privacy_screen_register_notifier().
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                          struct notifier_block *nb)
> > > +{
> > > +       return blocking_notifier_chain_unregister(&priv->notifier_head,
> > > nb);
> > > +}
> > > +EXPORT_SYMBOL(drm_privacy_screen_unregister_notifier);
> > > +
> > >  /*** drm_privacy_screen_driver.h functions ***/
> > >  
> > >  static ssize_t sw_state_show(struct device *dev,
> > > @@ -352,6 +395,7 @@ struct drm_privacy_screen
> > > *drm_privacy_screen_register(
> > >                 return ERR_PTR(-ENOMEM);
> > >  
> > >         mutex_init(&priv->lock);
> > > +       BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
> > >  
> > >         priv->dev.class = drm_class;
> > >         priv->dev.type = &drm_privacy_screen_type;
> > > @@ -399,3 +443,26 @@ void drm_privacy_screen_unregister(struct
> > > drm_privacy_screen *priv)
> > >         device_unregister(&priv->dev);
> > >  }
> > >  EXPORT_SYMBOL(drm_privacy_screen_unregister);
> > > +
> > > +/**
> > > + * drm_privacy_screen_call_notifier_chain - notify consumers of state
> > > change
> > > + * @priv: Privacy screen to register the notifier with
> > > + *
> > > + * A privacy-screen provider driver can call this functions upon
> > > external
> > > + * changes to the privacy-screen state. E.g. the state may be changed
> > > by
> > > the
> > > + * hardware itself in response to a hotkey press.
> > > + * This function must be called without holding the privacy-screen
> > > lock.
> > > + * the driver must update sw_state and hw_state to reflect the new
> > > state
> > > before
> > > + * calling this function.
> > > + * The expected behavior from the driver upon receiving an external
> > > state
> > > + * change event is: 1. Take the lock; 2. Update sw_state and hw_state;
> > > + * 3. Release the lock. 4. Call
> > > drm_privacy_screen_call_notifier_chain().
> > > + */
> > > +void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen
> > > *priv)
> > > +{
> > > +       if (WARN_ON(mutex_is_locked(&priv->lock)))
> > > +               return;
> > 
> > Are we sure about this check? mutex_is_locked() checks whether a mutex is
> > locked by anyone, not just us. So this seems like it would cause us to
> > WARN_ON() and abort if anyone else (not just ourselves) is holding the
> > lock to
> > read the privacy screen state.
> 
> Thank you for catching this, yes this check indeed is wrong. AFAIK
> there is no way to check that the mutex has been locked by us, so this
> extra sanity check simply needs to be removed.
> 
> I'll drop the check before pushing this to drm-misc-next (more on
> that in a reply to the cover letter), if that is ok with you.

Sounds fine to me!

> 
> Or do you want me to do a new version addressing this?
> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> > > +
> > > +       blocking_notifier_call_chain(&priv->notifier_head, 0, priv);
> > > +}
> > > +EXPORT_SYMBOL(drm_privacy_screen_call_notifier_chain);
> > > diff --git a/include/drm/drm_privacy_screen_consumer.h
> > > b/include/drm/drm_privacy_screen_consumer.h
> > > index 0cbd23b0453d..7f66a90d15b7 100644
> > > --- a/include/drm/drm_privacy_screen_consumer.h
> > > +++ b/include/drm/drm_privacy_screen_consumer.h
> > > @@ -24,6 +24,11 @@ int drm_privacy_screen_set_sw_state(struct
> > > drm_privacy_screen *priv,
> > >  void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
> > >                                   enum drm_privacy_screen_status
> > > *sw_state_ret,
> > >                                   enum drm_privacy_screen_status
> > > *hw_state_ret);
> > > +
> > > +int drm_privacy_screen_register_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                        struct notifier_block *nb);
> > > +int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen
> > > *priv,
> > > +                                          struct notifier_block *nb);
> > >  #else
> > >  static inline struct drm_privacy_screen *drm_privacy_screen_get(struct
> > > device *dev,
> > >                                                                 const
> > > char
> > > *con_id)
> > > @@ -45,6 +50,16 @@ static inline void
> > > drm_privacy_screen_get_state(struct
> > > drm_privacy_screen *priv,
> > >         *sw_state_ret = PRIVACY_SCREEN_DISABLED;
> > >         *hw_state_ret = PRIVACY_SCREEN_DISABLED;
> > >  }
> > > +static inline int drm_privacy_screen_register_notifier(struct
> > > drm_privacy_screen *priv,
> > > +                                                      struct
> > > notifier_block
> > > *nb)
> > > +{
> > > +       return -ENODEV;
> > > +}
> > > +static inline int drm_privacy_screen_unregister_notifier(struct
> > > drm_privacy_screen *priv,
> > > +                                                        struct
> > > notifier_block *nb)
> > > +{
> > > +       return -ENODEV;
> > > +}
> > >  #endif
> > >  
> > >  #endif
> > > diff --git a/include/drm/drm_privacy_screen_driver.h
> > > b/include/drm/drm_privacy_screen_driver.h
> > > index 5187ae52eb03..24591b607675 100644
> > > --- a/include/drm/drm_privacy_screen_driver.h
> > > +++ b/include/drm/drm_privacy_screen_driver.h
> > > @@ -54,6 +54,8 @@ struct drm_privacy_screen {
> > >         struct mutex lock;
> > >         /** @list: privacy-screen devices list list-entry. */
> > >         struct list_head list;
> > > +       /** @notifier_head: privacy-screen notifier head. */
> > > +       struct blocking_notifier_head notifier_head;
> > >         /**
> > >          * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
> > >          * This is NULL if the driver has unregistered the privacy-
> > > screen.
> > > @@ -77,4 +79,6 @@ struct drm_privacy_screen
> > > *drm_privacy_screen_register(
> > >         struct device *parent, const struct drm_privacy_screen_ops
> > > *ops);
> > >  void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
> > >  
> > > +void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen
> > > *priv);
> > > +
> > >  #endif
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

