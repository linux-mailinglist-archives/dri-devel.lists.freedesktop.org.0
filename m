Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5089BA28C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 22:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8A10E238;
	Sat,  2 Nov 2024 21:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jd9ExHrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1F010E21E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 21:33:28 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso111003266b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730583207; x=1731188007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h8gAlTw0svDiPzpMB5zzuqlBR36g3b0IZyn9R0jBMYo=;
 b=jd9ExHrFnR5pjGS01SEbHMLGGkOZ1lWOUpR/nltSgPtT7b5zcyCCwPCeL2MRL9O1iU
 te9WUdeHsRqk5sXfDCJhgOGAGDEZBwm3fuScSAFppTrV20iXpPt2H/XocfmhyDjW0uBI
 KKvXKpjuqdYWCzC4J/z4aGGOkgXr/FTCQxvykGHK2aNGWE5sK9pJw+yvr3efh4HrzgKd
 s/0Q0D5S4JrpTq/13O07u3HmkPXw/1+s/ESpyO787SYZ6UKsLS0N5/4i+c451faK9mjU
 1Fibxv8Hg9T/h5ugcPzxgKZeVYyZihqYWHqkvf2Ex1k3CMkzGHnfpAHUKY0aNa3sd/tF
 8JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730583207; x=1731188007;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8gAlTw0svDiPzpMB5zzuqlBR36g3b0IZyn9R0jBMYo=;
 b=pblSaDgrxjj28p9j7G1WaVvM49FP4llhVghgCzd9ZDty8BlwPlXxrLaThhPh9rcnfS
 hwdCWCI3xBUv31gdgZswzqAhO/UmxFn2QH8erxMMBKd7ZhSQtYxWQrVsIi0rqOU/1N7M
 q6XCl79EKjNUFzBsnkzY0dgTw0KlWE3yFCVoDTXoG84Wwj/3xw1ClD+bM6wIHrT4nsBv
 74xRJzrQlzKmV9jD574UgU2J/nQR+Fn0wMl5MHCeyPNE1MqglHw3sISUfbkXi1WHAzyt
 ykQVNxLv9FGVcpLR6EE9+vQ5lNwPTrOre80ppV6Uur7IKjJououihu2+PDpRk6fzb9kZ
 uZOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh6bGP0z7/XTltKt6hkHLo72CP9u55ntqRWVSuSkHwrulm68ZroYRBHxLXFYjYQY+WH28f20mMWI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuhXORIljp6qAZYdPNh2fq0Ca7Ed450LQiPT//lLLk8gESwpfo
 7t4mPOj8gEILrK2wWI1FYa/6kvOkt2PyJkzfbdAEuZbOhPhSpVG7
X-Google-Smtp-Source: AGHT+IH47gif+nc8G9fZtVq+fePWzw1u5vWQFD0ce3Y5n7tTa5Rx55HOlcJeRiyk7kQgH1udaEXsTg==
X-Received: by 2002:a17:907:3e1d:b0:a9e:21e5:d6cc with SMTP id
 a640c23a62f3a-a9e65435e10mr657640966b.20.1730583206423; 
 Sat, 02 Nov 2024 14:33:26 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a029:9600:b581:b80a:431b:19ed?
 (dynamic-2a02-3100-a029-9600-b581-b80a-431b-19ed.310.pool.telefonica.de.
 [2a02:3100:a029:9600:b581:b80a:431b:19ed])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9e564e8ea1sm347691466b.92.2024.11.02.14.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Nov 2024 14:33:25 -0700 (PDT)
Message-ID: <f09db690-f4a2-41d2-905f-764faa8e6f0c@gmail.com>
Date: Sat, 2 Nov 2024 22:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm: Change drm_class from pointer to const struct
 class
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <9e5567f6-c27e-4875-9db8-0435669a7d7c@gmail.com>
 <56lilw7gkq4ggtxfoykxcd727llmdrc2wksoafhjktxwpxil4e@6kcfqgwtxcrj>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <56lilw7gkq4ggtxfoykxcd727llmdrc2wksoafhjktxwpxil4e@6kcfqgwtxcrj>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.09.2024 17:11, Dmitry Baryshkov wrote:
> On Sun, Sep 08, 2024 at 02:11:25PM GMT, Heiner Kallweit wrote:
>> Define class drm statically and constify it. This ensure that no user
>> of the exported struct class can tamper with it.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_internal.h       |  2 +-
>>  drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>>  drivers/gpu/drm/drm_sysfs.c          | 32 ++++++++++++++--------------
>>  3 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index 1705bfc90..6e0df44b6 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -139,7 +139,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
>>  void drm_master_internal_release(struct drm_device *dev);
>>  
>>  /* drm_sysfs.c */
>> -extern struct class *drm_class;
>> +extern const struct class drm_class;
>>  
>>  int drm_sysfs_init(void);
>>  void drm_sysfs_destroy(void);
>> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
>> index 6cc39e307..2fbd24ba5 100644
>> --- a/drivers/gpu/drm/drm_privacy_screen.c
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
>> @@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>>  	mutex_init(&priv->lock);
>>  	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>>  
>> -	priv->dev.class = drm_class;
>> +	priv->dev.class = &drm_class;
>>  	priv->dev.type = &drm_privacy_screen_type;
>>  	priv->dev.parent = parent;
>>  	priv->dev.release = drm_privacy_screen_device_release;
>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> index f8577043e..f443f9a76 100644
>> --- a/drivers/gpu/drm/drm_sysfs.c
>> +++ b/drivers/gpu/drm/drm_sysfs.c
>> @@ -58,7 +58,15 @@ static struct device_type drm_sysfs_device_connector = {
>>  	.name = "drm_connector",
>>  };
>>  
>> -struct class *drm_class;
>> +static char *drm_devnode(const struct device *dev, umode_t *mode)
>> +{
>> +	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
>> +}
>> +
>> +const struct class drm_class = {
>> +	.name = "drm",
>> +	.devnode = drm_devnode,
>> +};
>>  
>>  #ifdef CONFIG_ACPI
>>  static bool drm_connector_acpi_bus_match(struct device *dev)
>> @@ -93,11 +101,6 @@ static void drm_sysfs_acpi_register(void) { }
>>  static void drm_sysfs_acpi_unregister(void) { }
>>  #endif
>>  
>> -static char *drm_devnode(const struct device *dev, umode_t *mode)
>> -{
>> -	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
>> -}
>> -
> 
> Please keep this function in place and move drm_class declarattion next
> to it. It simplifies reviewing the code.
> 
>>  static int typec_connector_bind(struct device *dev,
>>  				struct device *typec_connector, void *data)
>>  {
>> @@ -138,14 +141,12 @@ static const struct component_ops typec_connector_ops = {
>>   */
>>  int drm_sysfs_init(void)
>>  {
>> -	drm_class = class_create("drm");
>> -	if (IS_ERR(drm_class))
>> -		return PTR_ERR(drm_class);
>> +	int ret = class_register(&drm_class);
>>  
>> -	drm_class->devnode = drm_devnode;
>> +	if (!ret)
>> +		drm_sysfs_acpi_register();
>>  
>> -	drm_sysfs_acpi_register();
>> -	return 0;
>> +	return ret;
>>  }
>>  
>>  /**
>> @@ -156,8 +157,7 @@ int drm_sysfs_init(void)
>>  void drm_sysfs_destroy(void)
>>  {
>>  	drm_sysfs_acpi_unregister();
>> -	class_destroy(drm_class);
>> -	drm_class = NULL;
>> +	class_unregister(&drm_class);
> 
> This code makes me wonder: can we define static classes in unloadable
> modules? What happens if userspace holds the reference on the class in
> sysfs, while we remove the module ?
> 
I'm not sure, just saw that this isn't an unusual scenario.
Let's ask the drivers/base maintainers.
+Greg/Rafael

>>  }
>>  
>>  static void drm_sysfs_release(struct device *dev)
>> @@ -337,7 +337,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>>  		return -ENOMEM;
>>  
>>  	device_initialize(kdev);
>> -	kdev->class = drm_class;
>> +	kdev->class = &drm_class;
>>  	kdev->type = &drm_sysfs_device_connector;
>>  	kdev->parent = dev->primary->kdev;
>>  	kdev->groups = connector_dev_groups;
>> @@ -516,7 +516,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>  			minor_str = "card%d";
>>  
>>  		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>> -		kdev->class = drm_class;
>> +		kdev->class = &drm_class;
>>  		kdev->type = &drm_sysfs_device_minor;
>>  	}
>>  
>> -- 
>> 2.46.0
>>
>>
> 

