Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1AE47C6F2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F146211B595;
	Tue, 21 Dec 2021 18:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511611B593
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640112666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hczl/fhcvDkf/yKuUBJ4xYsAaOY7Hv0t7pVBWGg6a8=;
 b=FXzE6vgJaj1hIuss3k5bttYKWrI5uMJnsGt1r/rDcZuJkuCpMVA6qwPLJ68FxY/EYA5ngV
 RwQICmCNoQYDp+8g8VbPSKzjJGWyVskjYdCoOyg2XRSLFV6MickjYLzIY4V4nSwgI19hew
 EAEKSePB5Sj9b5lD1hPLV/4bZrEXLuQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-AtzU0GW6OHmcg_vNucUIbw-1; Tue, 21 Dec 2021 13:51:04 -0500
X-MC-Unique: AtzU0GW6OHmcg_vNucUIbw-1
Received: by mail-ed1-f72.google.com with SMTP id
 dm10-20020a05640222ca00b003f808b5aa18so11190559edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7hczl/fhcvDkf/yKuUBJ4xYsAaOY7Hv0t7pVBWGg6a8=;
 b=IyagmJ45zL8nW2ZIr8WFVUi05uaPyh+y66m+QzVrLLPKy2xCeIrtrqrESe0LVvr8P4
 UB45xucMuABUSSRkJStTilTSoK4dmsuu1I5bx4gVuygeODZAQkOuovjcKZEFhCEIBhJB
 4rQho3Wx99CUyRWCOFmmgPDr7TW1CdxNyUXg8oMuCQmnZWyFbyM49w0Q5apH+FWwDM5t
 DlYadg2zw+PvJorq8la4sMFHRGPu8VMuq9je/oCiNJKSnlOGlflG8Z/rIejiqRRI3boH
 JTPH7ySxDKzpneBzkQPk9WFAwMm0Py5BZjv5O9wgAiAak1xavzYx/FATF6Ot2ZzUv+25
 1pCA==
X-Gm-Message-State: AOAM532JOZuQfKEFNm6wNXha19u0ZlmLRBDTfNx7IQ0B4qs4dSre5ucE
 78bPUz3h9aeSKmRrIykqcNDGjZwuq5SsKZXRNe+DKmbq1EZ18dqzSHNlMkaztOVQBU2im5aS7dD
 aivmw+HPcVxeNn61tSu7iZA/FUGNl
X-Received: by 2002:a17:906:9b82:: with SMTP id
 dd2mr3766361ejc.406.1640112663650; 
 Tue, 21 Dec 2021 10:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKhGJI6p5aykoXdpRRPjv5+TiP/RvCQZELs9dzZejbGpMiW+w3+zd7TBCkvjW+JID/ORuo1A==
X-Received: by 2002:a17:906:9b82:: with SMTP id
 dd2mr3766345ejc.406.1640112663393; 
 Tue, 21 Dec 2021 10:51:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id w22sm8960767edd.49.2021.12.21.10.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 10:51:02 -0800 (PST)
Message-ID: <e98a06d9-f8e0-bfa8-760f-5d3cc793f2b2@redhat.com>
Date: Tue, 21 Dec 2021 19:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 1/3] drm/privacy_screen: Add drvdata in
 drm_privacy_screen
To: Rajat Jain <rajatja@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, gwendal@google.com,
 seanpaul@google.com, marcheu@google.com, dtor@google.com
References: <20211220222828.2625444-1-rajatja@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211220222828.2625444-1-rajatja@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/20/21 23:28, Rajat Jain wrote:
> Allow a privacy screen provider to stash its private data pointer in the
> drm_privacy_screen, and update the drm_privacy_screen_register() call to
> accept that. Also introduce a *_get_drvdata() so that it can retrieved
> back when needed.
> 
> This also touches the IBM Thinkpad platform driver, the only user of
> privacy screen today, to pass NULL for now to the updated API.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> v3: Initial version. Came up due to review comments on v2 of other patches.
> v2: No v2
> v1: No v1
> 
>  drivers/gpu/drm/drm_privacy_screen.c    |  5 ++++-
>  drivers/platform/x86/thinkpad_acpi.c    |  2 +-
>  include/drm/drm_privacy_screen_driver.h | 13 ++++++++++++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
> index beaf99e9120a..03b149cc455b 100644
> --- a/drivers/gpu/drm/drm_privacy_screen.c
> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> @@ -387,7 +387,8 @@ static void drm_privacy_screen_device_release(struct device *dev)
>   * * An ERR_PTR(errno) on failure.
>   */
>  struct drm_privacy_screen *drm_privacy_screen_register(
> -	struct device *parent, const struct drm_privacy_screen_ops *ops)
> +	struct device *parent, const struct drm_privacy_screen_ops *ops,
> +	void *data)
>  {
>  	struct drm_privacy_screen *priv;
>  	int ret;
> @@ -404,6 +405,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>  	priv->dev.parent = parent;
>  	priv->dev.release = drm_privacy_screen_device_release;
>  	dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
> +	priv->drvdata = data;
>  	priv->ops = ops;
>  
>  	priv->ops->get_hw_state(priv);
> @@ -439,6 +441,7 @@ void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
>  	mutex_unlock(&drm_privacy_screen_devs_lock);
>  
>  	mutex_lock(&priv->lock);
> +	priv->drvdata = NULL;
>  	priv->ops = NULL;
>  	mutex_unlock(&priv->lock);
>  
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 341655d711ce..ccbfda2b0095 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9782,7 +9782,7 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
>  		return 0;
>  
>  	lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
> -						    &lcdshadow_ops);
> +						    &lcdshadow_ops, NULL);
>  	if (IS_ERR(lcdshadow_dev))
>  		return PTR_ERR(lcdshadow_dev);
>  
> diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
> index 24591b607675..4ef246d5706f 100644
> --- a/include/drm/drm_privacy_screen_driver.h
> +++ b/include/drm/drm_privacy_screen_driver.h
> @@ -73,10 +73,21 @@ struct drm_privacy_screen {
>  	 * for more info.
>  	 */
>  	enum drm_privacy_screen_status hw_state;
> +	/**
> +	 * @drvdata: Private data owned by the privacy screen provider
> +	 */
> +	void *drvdata;
>  };
>  
> +static inline
> +void *drm_privacy_screen_get_drvdata(struct drm_privacy_screen *priv)
> +{
> +	return priv->drvdata;
> +}
> +
>  struct drm_privacy_screen *drm_privacy_screen_register(
> -	struct device *parent, const struct drm_privacy_screen_ops *ops);
> +	struct device *parent, const struct drm_privacy_screen_ops *ops,
> +	void *data);
>  void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
>  
>  void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv);
> 

