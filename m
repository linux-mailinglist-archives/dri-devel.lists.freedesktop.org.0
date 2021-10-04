Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376764212D8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7666EA42;
	Mon,  4 Oct 2021 15:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C36C6EA42
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633362020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKnY6cGMJBFRKcMhi9RzmPp6ONqBx1rqOxR1NUhSmzk=;
 b=QvjpooOU0VPC+DNdW8P58ymGzyW23pyl4rkypkqTrWRx+e4m1PPISjXhF4/vUh/uKvVgeD
 IV8EhUSfthAl23+fXyPUZDpI36gTUDZtCnHQNqlVHZ3cwmzgymfXBd3ygDQWCGo0G/hjnm
 aH/WwZUXmIzHJyzinvvI1zvbsnfZ7QQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-0YnyPKgRMg-7Clv9v-84vw-1; Mon, 04 Oct 2021 11:40:19 -0400
X-MC-Unique: 0YnyPKgRMg-7Clv9v-84vw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x96-20020a50bae9000000b003d871ecccd8so2647160ede.18
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 08:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NKnY6cGMJBFRKcMhi9RzmPp6ONqBx1rqOxR1NUhSmzk=;
 b=f1VPLknPHkJZUKBuq91ZeYIzV+5ZcX46HuEfozsgiXGE/CLj8+eoVxDozvihKMLczx
 GSaOpO1hjnlPd4QETiDbs2OJOTO66CW/38PQquFU1MVEOvk1KpDMkVjkV1EN/aAG0YCK
 aripllwTKCglNrGNDGlUWPQuqUEaODBweaY/NtcB/lVxEdMgQ/8al4sZzLe9wqsZSUtA
 LCKys87McpYyZa9bYpw7k1YHWWJxVY8deqWXqru7LTXX4soy4MPFamJqJwFJ8mmS23Vh
 mmKpCj27SjhE8o2xkQVvW+BdGD+dvWYfDViTvIR1VktGj7uzBjt8nkDyKgOVCxCUbV4R
 1+Hg==
X-Gm-Message-State: AOAM532eh5wFltwOv6l95mZWQmJlMsjOfyl8xGWEWhQNP1e9LW8GT9O1
 OgV5BmITotYC6s+txa7cDkRhW49+T/CcC27e264PdkH+bt9wChMlSaHrhnvzJCXOr69Zvt2CYkt
 F+wOGBOUtuMxX8ES2rPuCrsve1wWO
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr18103436ejb.139.1633362017854; 
 Mon, 04 Oct 2021 08:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcuY1Cmd090zoS0mgBK+Sl36BfNej8LeFirkDGULaqfSZOjs+BWPr0pOtIMrLCUI27ulFo8Q==
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr18103399ejb.139.1633362017607; 
 Mon, 04 Oct 2021 08:40:17 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id c11sm7938461edw.5.2021.10.04.08.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 08:40:17 -0700 (PDT)
Subject: Re: [PATCH 05/10] drm/connector: Add a drm_connector privacy-screen
 helper functions (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude <lyude@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <20211002163618.99175-1-hdegoede@redhat.com>
 <20211002163618.99175-6-hdegoede@redhat.com> <YVscLznEbn0m07Mi@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <78e49b98-f372-995e-bbdc-90c9f8a80ab8@redhat.com>
Date: Mon, 4 Oct 2021 17:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVscLznEbn0m07Mi@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 10/4/21 5:22 PM, Ville Syrjälä wrote:
> On Sat, Oct 02, 2021 at 06:36:13PM +0200, Hans de Goede wrote:
>> Add 2 drm_connector privacy-screen helper functions:
>>
>> 1. drm_connector_attach_privacy_screen_provider(), this function creates
>> and attaches the standard privacy-screen properties and registers a
>> generic notifier for generating sysfs-connector-status-events on external
>> changes to the privacy-screen status.
>>
>> 2. drm_connector_update_privacy_screen(), update the privacy-screen's
>> sw_state if the connector has a privacy-screen.
>>
>> Changes in v2:
>> - Do not update connector->state->privacy_screen_sw_state on
>>   atomic-commits.
>> - Change drm_connector_update_privacy_screen() to take drm_connector_state
>>   as argument instead of a full drm_atomic_state. This allows the helper
>>   to be called by drivers when they are enabling crtcs/encoders/connectors.
>>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c | 102 ++++++++++++++++++++++++++++++++
>>  include/drm/drm_connector.h     |  11 ++++
>>  2 files changed, 113 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index b2f1f1b1bfb4..00cf3b6135f6 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -28,6 +28,7 @@
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_sysfs.h>
>>  
>>  #include <linux/uaccess.h>
>> @@ -462,6 +463,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
>>  		    DRM_CONNECTOR_REGISTERED))
>>  		drm_connector_unregister(connector);
>>  
>> +	if (connector->privacy_screen) {
>> +		drm_privacy_screen_put(connector->privacy_screen);
>> +		connector->privacy_screen = NULL;
>> +	}
>> +
>>  	if (connector->tile_group) {
>>  		drm_mode_put_tile_group(dev, connector->tile_group);
>>  		connector->tile_group = NULL;
>> @@ -543,6 +549,10 @@ int drm_connector_register(struct drm_connector *connector)
>>  	/* Let userspace know we have a new connector */
>>  	drm_sysfs_hotplug_event(connector->dev);
>>  
>> +	if (connector->privacy_screen)
>> +		drm_privacy_screen_register_notifier(connector->privacy_screen,
>> +					   &connector->privacy_screen_notifier);
>> +
>>  	mutex_lock(&connector_list_lock);
>>  	list_add_tail(&connector->global_connector_list_entry, &connector_list);
>>  	mutex_unlock(&connector_list_lock);
>> @@ -578,6 +588,11 @@ void drm_connector_unregister(struct drm_connector *connector)
>>  	list_del_init(&connector->global_connector_list_entry);
>>  	mutex_unlock(&connector_list_lock);
>>  
>> +	if (connector->privacy_screen)
>> +		drm_privacy_screen_unregister_notifier(
>> +					connector->privacy_screen,
>> +					&connector->privacy_screen_notifier);
>> +
>>  	if (connector->funcs->early_unregister)
>>  		connector->funcs->early_unregister(connector);
>>  
>> @@ -2442,6 +2457,93 @@ drm_connector_attach_privacy_screen_properties(struct drm_connector *connector)
>>  }
>>  EXPORT_SYMBOL(drm_connector_attach_privacy_screen_properties);
>>  
>> +static void drm_connector_update_privacy_screen_properties(
>> +	struct drm_connector *connector, bool set_sw_state)
>> +{
>> +	enum drm_privacy_screen_status sw_state, hw_state;
>> +
>> +	drm_privacy_screen_get_state(connector->privacy_screen,
>> +				     &sw_state, &hw_state);
>> +
>> +	if (set_sw_state)
>> +		connector->state->privacy_screen_sw_state = sw_state;
>> +	drm_object_property_set_value(&connector->base,
>> +			connector->privacy_screen_hw_state_property, hw_state);
>> +}
>> +
>> +static int drm_connector_privacy_screen_notifier(
>> +	struct notifier_block *nb, unsigned long action, void *data)
>> +{
>> +	struct drm_connector *connector =
>> +		container_of(nb, struct drm_connector, privacy_screen_notifier);
>> +	struct drm_device *dev = connector->dev;
>> +
>> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +	drm_connector_update_privacy_screen_properties(connector, true);
> 
> This thing still seems pretty unatomic in essence. The standard rule
> is that non-immutable properties do not change under external
> influence. So if userspace is unaware of the change then it could
> just flip the state back to where it was previously. Ie. seems racy
> at least which could in theory lead to some funny ping pong in the
> state.
> 
> To go proper atomic route here the state of the prop should be
> fully cotrolled by userspace. Is that not possible for some reason?

No, the privacy-screen can be toggled on/off with a Fn + somekey
hotkey combo on the laptop's keyboard, this is fully handled
by the laptop's embedded-controller.

Note that when this happens we do send a udev change event
with info on which connector the event is on as well which
property is changed.

The only current userspace consumer of this listens to these
udev events avoiding the ping/pong, also the doc for the
property says:

"Note that the ability for the state to change outside of control of
the DRM master process means that userspace must not cache the value
of the sw-state. Caching the sw-state value and including it in later
atomic commits may lead to overriding a state change done through e.g.
a firmware handled hotkey. Therefor userspace must not include the
privacy-screen sw-state in an atomic commit unless it wants to change
its value."

This was the solution decided upon when this was all first discussed
(after which there was a long wait for the userspace side to get ready).
During the implementation of the userspace side no reasons were found
to change this.

Regards,

Hans



> 
>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +	drm_sysfs_connector_status_event(connector,
>> +				connector->privacy_screen_sw_state_property);
>> +	drm_sysfs_connector_status_event(connector,
>> +				connector->privacy_screen_hw_state_property);
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +/**
>> + * drm_connector_attach_privacy_screen_provider - attach a privacy-screen to
>> + *    the connector
>> + * @connector: connector to attach the privacy-screen to
>> + * @priv: drm_privacy_screen to attach
>> + *
>> + * Create and attach the standard privacy-screen properties and register
>> + * a generic notifier for generating sysfs-connector-status-events
>> + * on external changes to the privacy-screen status.
>> + * This function takes ownership of the passed in drm_privacy_screen and will
>> + * call drm_privacy_screen_put() on it when the connector is destroyed.
>> + */
>> +void drm_connector_attach_privacy_screen_provider(
>> +	struct drm_connector *connector, struct drm_privacy_screen *priv)
>> +{
>> +	connector->privacy_screen = priv;
>> +	connector->privacy_screen_notifier.notifier_call =
>> +		drm_connector_privacy_screen_notifier;
>> +
>> +	drm_connector_create_privacy_screen_properties(connector);
>> +	drm_connector_update_privacy_screen_properties(connector, true);
>> +	drm_connector_attach_privacy_screen_properties(connector);
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_privacy_screen_provider);
>> +
>> +/**
>> + * drm_connector_update_privacy_screen - update connector's privacy-screen sw-state
>> + * @connector_state: connector-state to update the privacy-screen for
>> + *
>> + * This function calls drm_privacy_screen_set_sw_state() on the connector's
>> + * privacy-screen.
>> + *
>> + * If the connector has no privacy-screen, then this is a no-op.
>> + */
>> +void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state)
>> +{
>> +	struct drm_connector *connector = connector_state->connector;
>> +	int ret;
>> +
>> +	if (!connector->privacy_screen)
>> +		return;
>> +
>> +	ret = drm_privacy_screen_set_sw_state(connector->privacy_screen,
>> +					      connector_state->privacy_screen_sw_state);
>> +	if (ret) {
>> +		drm_err(connector->dev, "Error updating privacy-screen sw_state\n");
>> +		return;
>> +	}
>> +
>> +	/* The hw_state property value may have changed, update it. */
>> +	drm_connector_update_privacy_screen_properties(connector, false);
>> +}
>> +EXPORT_SYMBOL(drm_connector_update_privacy_screen);
>> +
>>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>>  				    struct drm_property *property,
>>  				    uint64_t value)
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index a79aec55ea40..b501d0badaea 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -27,6 +27,7 @@
>>  #include <linux/llist.h>
>>  #include <linux/ctype.h>
>>  #include <linux/hdmi.h>
>> +#include <linux/notifier.h>
>>  #include <drm/drm_mode_object.h>
>>  #include <drm/drm_util.h>
>>  
>> @@ -40,6 +41,7 @@ struct drm_encoder;
>>  struct drm_property;
>>  struct drm_property_blob;
>>  struct drm_printer;
>> +struct drm_privacy_screen;
>>  struct edid;
>>  struct i2c_adapter;
>>  
>> @@ -1451,6 +1453,12 @@ struct drm_connector {
>>  	 */
>>  	struct drm_property *max_bpc_property;
>>  
>> +	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
>> +	struct drm_privacy_screen *privacy_screen;
>> +
>> +	/** @privacy_screen_notifier: privacy-screen notifier_block */
>> +	struct notifier_block privacy_screen_notifier;
>> +
>>  	/**
>>  	 * @privacy_screen_sw_state_property: Optional atomic property for the
>>  	 * connector to control the integrated privacy screen.
>> @@ -1788,6 +1796,9 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>  					  int min, int max);
>>  void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
>>  void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
>> +void drm_connector_attach_privacy_screen_provider(
>> +	struct drm_connector *connector, struct drm_privacy_screen *priv);
>> +void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>>  
>>  /**
>>   * struct drm_tile_group - Tile group metadata
>> -- 
>> 2.31.1
> 

