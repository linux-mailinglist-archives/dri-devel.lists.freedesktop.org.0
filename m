Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750CE40CDEA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414B6EA26;
	Wed, 15 Sep 2021 20:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735836EA24
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631737568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEOcbUkGPZ7blNBJVJc9F7vTSn5ckBc/PVtnTYcF2yM=;
 b=BkEK3zUz4fzB+p8sA50vzibu6s1E8OgpPZVyPIqPDMMr7JNprlU2s0+EowTYawXeMHJIW7
 92Tjbz31Li8zhcjLAseyZPgGwz+EJ138HUDjnh0ZDN/HFBdJCi49SO6doWmjHS27geHyhs
 IiBPHd8QFnWZbITuPphY9yAaJIX++Lw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-oJZyWOo2NvO4AVQphvmKEg-1; Wed, 15 Sep 2021 16:26:07 -0400
X-MC-Unique: oJZyWOo2NvO4AVQphvmKEg-1
Received: by mail-qk1-f200.google.com with SMTP id
 21-20020a370815000000b003d5a81a4d12so7984243qki.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aEOcbUkGPZ7blNBJVJc9F7vTSn5ckBc/PVtnTYcF2yM=;
 b=AObnYsmPmsrHNnychPLMQ0GWbfU2lYPU0Hdaej/LN+GwvFTdoOka35XELxecwrkkRp
 tr8UYx8XfbiTEqxTp2ynmy/xJRKfI0WEJqzvJ4fKfQazSaiOq7RNqdf/2j84Y6QCXUrL
 Z46nJdHxEGZpIweaZD04mvZQEzEJvjYC1wP9FHRyatdbN/yxeDVnFT3HDw1LxewxKfkm
 LZMyhKRi+4ntjtF3yJVOwK7EeEsnXd/z8ll2Jdfq94YHVG0Iuizyg7E0okCqOw4fWcRf
 YA+fKjVSlwmrAc6asCyDgkNrLVqsn/tlD4uY9Havbq/oYfaVoVoH3xBKQGuXaFSf7zMF
 P+Tg==
X-Gm-Message-State: AOAM531SXZIJsmMdgLqfQKgG9rM3KLd68Xv6ALJN6YJo3bxDMwWlRIfP
 +kRPgAiRv3FRMx4MFS70iwXh6SPq253i7SL/PeoX515IjzEDvCtIKuLrcxkHdCBpNfYma6klzBJ
 4UPe1OU8FvVVmWFvwV9dYfb398Ogg
X-Received: by 2002:a05:6214:12ee:: with SMTP id
 w14mr1743720qvv.52.1631737566952; 
 Wed, 15 Sep 2021 13:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyefS1x0VI2E7eu3q7MWppZQFPVXd0FOIKTCBizvMduza4mRH0kgLODGVglI1yQQshxbSqLdA==
X-Received: by 2002:a05:6214:12ee:: with SMTP id
 w14mr1743689qvv.52.1631737566677; 
 Wed, 15 Sep 2021 13:26:06 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 187sm768778qke.32.2021.09.15.13.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 13:26:06 -0700 (PDT)
Message-ID: <6c9daf86dbbd5fe98f84efd3bae3240f0bf93387.camel@redhat.com>
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
Date: Wed, 15 Sep 2021 16:26:04 -0400
In-Reply-To: <20210906073519.4615-5-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-5-hdegoede@redhat.com>
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

On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> Add support for privacy-screen consumers to register a notifier to
> be notified of external (e.g. done by the hw itself on a hotkey press)
> state changes.
> 
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_privacy_screen.c      | 67 +++++++++++++++++++++++
>  include/drm/drm_privacy_screen_consumer.h | 15 +++++
>  include/drm/drm_privacy_screen_driver.h   |  4 ++
>  3 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_privacy_screen.c
> b/drivers/gpu/drm/drm_privacy_screen.c
> index 294a09194bfb..7a5f878c3171 100644
> --- a/drivers/gpu/drm/drm_privacy_screen.c
> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> @@ -255,6 +255,49 @@ void drm_privacy_screen_get_state(struct
> drm_privacy_screen *priv,
>  }
>  EXPORT_SYMBOL(drm_privacy_screen_get_state);
>  
> +/**
> + * drm_privacy_screen_register_notifier - register a notifier
> + * @priv: Privacy screen to register the notifier with
> + * @nb: Notifier-block for the notifier to register
> + *
> + * Register a notifier with the privacy-screen to be notified of changes
> made
> + * to the privacy-screen state from outside of the privacy-screen class.
> + * E.g. the state may be changed by the hardware itself in response to a
> + * hotkey press.
> + *
> + * The notifier is called with no locks held. The new hw_state and sw_state
> + * can be retrieved using the drm_privacy_screen_get_state() function.
> + * A pointer to the drm_privacy_screen's struct is passed as the void *data
> + * argument of the notifier_block's notifier_call.
> + *
> + * The notifier will NOT be called when changes are made through
> + * drm_privacy_screen_set_sw_state(). It is only called for external
> changes.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
> +                                        struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_register(&priv->notifier_head, nb);
> +}
> +EXPORT_SYMBOL(drm_privacy_screen_register_notifier);
> +
> +/**
> + * drm_privacy_screen_unregister_notifier - unregister a notifier
> + * @priv: Privacy screen to register the notifier with
> + * @nb: Notifier-block for the notifier to register
> + *
> + * Unregister a notifier registered with
> drm_privacy_screen_register_notifier().
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
> +                                          struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_unregister(&priv->notifier_head, nb);
> +}
> +EXPORT_SYMBOL(drm_privacy_screen_unregister_notifier);
> +
>  /*** drm_privacy_screen_driver.h functions ***/
>  
>  static ssize_t sw_state_show(struct device *dev,
> @@ -352,6 +395,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>                 return ERR_PTR(-ENOMEM);
>  
>         mutex_init(&priv->lock);
> +       BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>  
>         priv->dev.class = drm_class;
>         priv->dev.type = &drm_privacy_screen_type;
> @@ -399,3 +443,26 @@ void drm_privacy_screen_unregister(struct
> drm_privacy_screen *priv)
>         device_unregister(&priv->dev);
>  }
>  EXPORT_SYMBOL(drm_privacy_screen_unregister);
> +
> +/**
> + * drm_privacy_screen_call_notifier_chain - notify consumers of state
> change
> + * @priv: Privacy screen to register the notifier with
> + *
> + * A privacy-screen provider driver can call this functions upon external
> + * changes to the privacy-screen state. E.g. the state may be changed by
> the
> + * hardware itself in response to a hotkey press.
> + * This function must be called without holding the privacy-screen lock.
> + * the driver must update sw_state and hw_state to reflect the new state
> before
> + * calling this function.
> + * The expected behavior from the driver upon receiving an external state
> + * change event is: 1. Take the lock; 2. Update sw_state and hw_state;
> + * 3. Release the lock. 4. Call drm_privacy_screen_call_notifier_chain().
> + */
> +void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen
> *priv)
> +{
> +       if (WARN_ON(mutex_is_locked(&priv->lock)))
> +               return;

Are we sure about this check? mutex_is_locked() checks whether a mutex is
locked by anyone, not just us. So this seems like it would cause us to
WARN_ON() and abort if anyone else (not just ourselves) is holding the lock to
read the privacy screen state.

> +
> +       blocking_notifier_call_chain(&priv->notifier_head, 0, priv);
> +}
> +EXPORT_SYMBOL(drm_privacy_screen_call_notifier_chain);
> diff --git a/include/drm/drm_privacy_screen_consumer.h
> b/include/drm/drm_privacy_screen_consumer.h
> index 0cbd23b0453d..7f66a90d15b7 100644
> --- a/include/drm/drm_privacy_screen_consumer.h
> +++ b/include/drm/drm_privacy_screen_consumer.h
> @@ -24,6 +24,11 @@ int drm_privacy_screen_set_sw_state(struct
> drm_privacy_screen *priv,
>  void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
>                                   enum drm_privacy_screen_status
> *sw_state_ret,
>                                   enum drm_privacy_screen_status
> *hw_state_ret);
> +
> +int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
> +                                        struct notifier_block *nb);
> +int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
> +                                          struct notifier_block *nb);
>  #else
>  static inline struct drm_privacy_screen *drm_privacy_screen_get(struct
> device *dev,
>                                                                 const char
> *con_id)
> @@ -45,6 +50,16 @@ static inline void drm_privacy_screen_get_state(struct
> drm_privacy_screen *priv,
>         *sw_state_ret = PRIVACY_SCREEN_DISABLED;
>         *hw_state_ret = PRIVACY_SCREEN_DISABLED;
>  }
> +static inline int drm_privacy_screen_register_notifier(struct
> drm_privacy_screen *priv,
> +                                                      struct notifier_block
> *nb)
> +{
> +       return -ENODEV;
> +}
> +static inline int drm_privacy_screen_unregister_notifier(struct
> drm_privacy_screen *priv,
> +                                                        struct
> notifier_block *nb)
> +{
> +       return -ENODEV;
> +}
>  #endif
>  
>  #endif
> diff --git a/include/drm/drm_privacy_screen_driver.h
> b/include/drm/drm_privacy_screen_driver.h
> index 5187ae52eb03..24591b607675 100644
> --- a/include/drm/drm_privacy_screen_driver.h
> +++ b/include/drm/drm_privacy_screen_driver.h
> @@ -54,6 +54,8 @@ struct drm_privacy_screen {
>         struct mutex lock;
>         /** @list: privacy-screen devices list list-entry. */
>         struct list_head list;
> +       /** @notifier_head: privacy-screen notifier head. */
> +       struct blocking_notifier_head notifier_head;
>         /**
>          * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
>          * This is NULL if the driver has unregistered the privacy-screen.
> @@ -77,4 +79,6 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>         struct device *parent, const struct drm_privacy_screen_ops *ops);
>  void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
>  
> +void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen
> *priv);
> +
>  #endif

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

