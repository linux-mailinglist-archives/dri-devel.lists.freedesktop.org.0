Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0901CEEE1
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A04F6E86C;
	Tue, 12 May 2020 08:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC9C6E868
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589271142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J05XVpjJWsiII0AT6psUG37vp0FHPnbspTt02rgbDPM=;
 b=MfPZ0qLcB83B9uAHHseJUWCWDIoNKj9JpG1Q2xGK/EjHfDqW+Bv7JeW5rOWfV+AUe2SF0Q
 /NYruDXuclieTnYfk4XEksaXzixueSLXlSfPTW3OaZH5lFi848uMsT2Xc8QK8KD8P3cqml
 T8+1p4HdtrG2Vg6+RmIO3WWKvZKred4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-12rHPhQePjuIIrjmtaWsVQ-1; Tue, 12 May 2020 04:12:21 -0400
X-MC-Unique: 12rHPhQePjuIIrjmtaWsVQ-1
Received: by mail-wr1-f69.google.com with SMTP id g10so6559539wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 01:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J05XVpjJWsiII0AT6psUG37vp0FHPnbspTt02rgbDPM=;
 b=KnNXuPVgvX/ACVmHKOaJiCmwME0hW2ZfbOl9oXUibmudJwyaNlu9j/yqup9qRGKp/o
 uZmV4HOghEGRQt3haSmO9RV2dpVqSlI2WvvqJdXHz6fIUGy+CQJ7bNQCj8/0iELw2jNW
 dy6omOyu6PNCffO6pb7za1H6iouGCUESieu6CA3IMlgCQkXzFmb8aYqa0oDSKsYQzUy4
 gsmRUAyjA1s4Y/6O25eKkPN58bXhgdYi7hIDd3JrPBpw5rpfIYlfsigaQXiZzn6WYLvK
 G/LmDVqI9qtIqoPUiM3GJl0Aul4Xe+dd5Qy9Dv8tuhmSJjuux3dH49tDkP+Cj0kRF3CF
 k6kA==
X-Gm-Message-State: AGi0PuaoorvGmw4/RfLiuZ991e41Go8yC1WMG6LdyaGwr4zx4FnvmOLe
 yLP+XaeO/X8EqjPoE+CBXrayYOaVPVLGl9jpWmWchGqeuPo5kOcic19VfQV4vxhUFnzhl/uXhaS
 xEIil5tVzOu1gDVhi40jvufe/qz79
X-Received: by 2002:adf:fe87:: with SMTP id l7mr24962274wrr.360.1589271139699; 
 Tue, 12 May 2020 01:12:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypIH5ovDlS+lMS1W+Ln9nHeh3ZfaVuCmA4pOjimqRACy/Zl8hdnlExatdJ/SMPAwyHtRjScMBw==
X-Received: by 2002:adf:fe87:: with SMTP id l7mr24962231wrr.360.1589271139323; 
 Tue, 12 May 2020 01:12:19 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id r14sm6254602wmb.2.2020.05.12.01.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 01:12:18 -0700 (PDT)
Subject: Re: [RFC v2] drm/connector: Add support for privacy-screen properties
 (v2)
To: Rajat Jain <rajatja@google.com>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <20200511174724.21512-2-hdegoede@redhat.com>
 <CACK8Z6Hm3nxeGbktqUHkEBOOEXBpLur1sRDL-fqYmZgcTTjjfg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce3f8660-6cc5-f4c1-3316-0445206a8c9d@redhat.com>
Date: Tue, 12 May 2020 10:12:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CACK8Z6Hm3nxeGbktqUHkEBOOEXBpLur1sRDL-fqYmZgcTTjjfg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jared Dominguez <jaredz@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/11/20 10:04 PM, Rajat Jain wrote:
> On Mon, May 11, 2020 at 10:47 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Rajat Jain <rajatja@google.com>
>>
>> Add support for generic electronic privacy screen properties, that
>> can be added by systems that have an integrated EPS.
>>
>> Changes in v2 (Hans de Goede)
>> - Create 2 properties, "privacy-screen sw-state" and
>>    "privacy-screen hw-state", to deal with devices where the OS might be
>>    locked out of making state changes
>> - Write kerneldoc explaining how the 2 properties work together, what
>>    happens when changes to the state are made outside of the DRM code's
>>    control, etc.
>>
>> Signed-off-by: Rajat Jain <rajatja@google.com>
>> Co-authored-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> 
> Ack, Thanks for doing this.
> 
>>
>> ---
>>   Documentation/gpu/drm-kms.rst     |   2 +
>>   drivers/gpu/drm/drm_atomic_uapi.c |   6 ++
>>   drivers/gpu/drm/drm_connector.c   | 100 ++++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h       |  50 +++++++++++++++
>>   4 files changed, 158 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
>> index 906771e03103..b72b1e0db343 100644
>> --- a/Documentation/gpu/drm-kms.rst
>> +++ b/Documentation/gpu/drm-kms.rst
>> @@ -445,6 +445,8 @@ Property Types and Blob Property Support
>>   .. kernel-doc:: drivers/gpu/drm/drm_property.c
>>      :export:
>>
>> +.. _standard_connector_properties:
>> +
>>   Standard Connector Properties
>>   -----------------------------
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index a1e5e262bae2..e56a11208515 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -766,6 +766,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>>                                                     fence_ptr);
>>          } else if (property == connector->max_bpc_property) {
>>                  state->max_requested_bpc = val;
>> +       } else if (property == connector->privacy_screen_sw_state_property) {
>> +               state->privacy_screen_sw_state = val;
>>          } else if (connector->funcs->atomic_set_property) {
>>                  return connector->funcs->atomic_set_property(connector,
>>                                  state, property, val);
>> @@ -842,6 +844,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>>                  *val = 0;
>>          } else if (property == connector->max_bpc_property) {
>>                  *val = state->max_requested_bpc;
>> +       } else if (property == connector->privacy_screen_sw_state_property) {
>> +               *val = state->privacy_screen_sw_state;
>> +       } else if (property == connector->privacy_screen_hw_state_property) {
>> +               *val = state->privacy_screen_hw_state;
>>          } else if (connector->funcs->atomic_get_property) {
>>                  return connector->funcs->atomic_get_property(connector,
>>                                  state, property, val);
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 644f0ad10671..01360edc2376 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1186,6 +1186,45 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>    *     can also expose this property to external outputs, in which case they
>>    *     must support "None", which should be the default (since external screens
>>    *     have a built-in scaler).
>> + *
>> + * privacy-screen sw-state, privacy-screen hw-state:
>> + *     These 2 optional properties can be used to query the state of the
>> + *     electronic privacy screen that is available on some displays; and in
>> + *     some cases also control the state. If a driver implements these
>> + *     properties then both properties must be present.
>> + *
>> + *     "privacy-screen hw-state" is read-only and reflects the actual state
>> + *     of the privacy-screen, possible values: "Enabled", "Disabled,
>> + *     "Enabled, locked", "Disabled, locked". The locked states indicate
>> + *     that the state cannot be changed through the DRM API. E.g. there
>> + *     might be devices where the firmware-setup options, or a hardware
>> + *     slider-switch, offer always on / off modes.
> 
> 
> May be add: "This is what the userspace tools must use to query and
> report the actual status at the moment, if needed"

Thank you, suggestions for improving the doc are always very welcome, so I
have tried adding this, both as is and with slightly changed wording. But it
always feels like it is just repeating earlier info. To me the
"reflect the actual state" from the beginning of the paragraph makes it
abundantly clear that this indeed is what userspace should use to get,
well, the actual state.

>> + *
>> + *     "privacy-screen sw-state" can be set to change the privacy-screen state
>> + *     when not locked. In this case the driver must update the hw-state
>> + *     property to reflect the new state on completion of the commit of the
>> + *     sw-state property. Setting the sw-state property when the hw-state is
>> + *     locked must be interpreted by the driver as a request to change the
>> + *     state to the set state when the hw-state becomes unlocked. E.g. if
>> + *     "privacy-screen hw-state" is "Enabled, locked" and the sw-state
>> + *     gets set to "Disabled" followed by the user unlocking the state by
>> + *     changing the slider-switch position, then the driver must set the
>> + *     state to "Disabled" upon receiving the unlock event.
>> + *
>> + *     In some cases the privacy-screen state might change outside of control
>> + *     of the DRM code. E.g. there might be a firmware handled hotkey which
>> + *     toggles the state, or the state might be changed through another
>> + *     userspace API such as writing /proc/acpi/ibm/lcdshadow. In this case
>> + *     the driver must update both the hw-state and the sw-state to reflect
>> + *     the new value, overwriting any pending state requests in the sw-state.
> 
> 
> May be add: "The pending state requests are thus 'discarded'".

Done for the next version (dropping the quotes around discarded).

Regards,

Hans


> 
>>
>> + *
>> + *     Note that the ability for the state to change outside of control of
>> + *     the DRM master process means that userspace must not cache the value
>> + *     of the sw-state. Ccaching the sw-state value and including it in later
>> + *     atomic commits may lead to overriding a state change done through e.g.
>> + *     a firmware handled hotkey. Therefor userspace must not include the
>> + *     privacy-screen sw-state in an atomic commit unless it wants to change
>> + *     its value.
>>    */
>>
>>   int drm_connector_create_standard_properties(struct drm_device *dev)
>> @@ -2152,6 +2191,67 @@ int drm_connector_set_panel_orientation_with_quirk(
>>   }
>>   EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>>
>> +static const struct drm_prop_enum_list privacy_screen_enum[] = {
>> +       { PRIVACY_SCREEN_DISABLED,              "Disabled" },
>> +       { PRIVACY_SCREEN_ENABLED,               "Enabled" },
>> +       { PRIVACY_SCREEN_DISABLED_LOCKED,       "Disabled, locked" },
>> +       { PRIVACY_SCREEN_ENABLED_LOCKED,        "Enabled, locked" },
>> +};
>> +
>> +/**
>> + * drm_connector_create_privacy_screen_properties -
>> + *     create the drm connecter's privacy-screen properties.
>> + * @connector: connector for which to create the privacy-screen properties
>> + *
>> + * This function creates the "privacy-screen sw-state" and "privacy-screen
>> + * hw-state" properties for the connector. They are not attached.
>> + */
>> +void
>> +drm_connector_create_privacy_screen_properties(struct drm_connector *connector)
>> +{
>> +       if (connector->privacy_screen_sw_state_property)
>> +               return;
>> +
>> +       /* Note sw-state only supports the first 2 values of the enum */
>> +       connector->privacy_screen_sw_state_property =
>> +               drm_property_create_enum(connector->dev, DRM_MODE_PROP_ENUM,
>> +                               "privacy-screen sw-state",
>> +                               privacy_screen_enum, 2);
>> +
>> +       connector->privacy_screen_hw_state_property =
>> +               drm_property_create_enum(connector->dev,
>> +                               DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ENUM,
>> +                               "privacy-screen hw-state",
>> +                               privacy_screen_enum,
>> +                               ARRAY_SIZE(privacy_screen_enum));
>> +}
>> +EXPORT_SYMBOL(drm_connector_create_privacy_screen_properties);
>> +
>> +/**
>> + * drm_connector_attach_privacy_screen_properties -
>> + *     attach the drm connecter's privacy-screen properties.
>> + * @connector: connector on which to attach the privacy-screen properties
>> + *
>> + * This function attaches the "privacy-screen sw-state" and "privacy-screen
>> + * hw-state" properties to the connector. The initial state of both is set
>> + * to "Disabled".
>> + */
>> +void
>> +drm_connector_attach_privacy_screen_properties(struct drm_connector *connector)
>> +{
>> +       if (!connector->privacy_screen_sw_state_property)
>> +               return;
>> +
>> +       drm_object_attach_property(&connector->base,
>> +                                  connector->privacy_screen_sw_state_property,
>> +                                  PRIVACY_SCREEN_DISABLED);
>> +
>> +       drm_object_attach_property(&connector->base,
>> +                                  connector->privacy_screen_hw_state_property,
>> +                                  PRIVACY_SCREEN_DISABLED);
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_privacy_screen_properties);
>> +
>>   int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>>                                      struct drm_property *property,
>>                                      uint64_t value)
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 19ae6bb5c85b..a8844f4c6ae9 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -271,6 +271,30 @@ struct drm_monitor_range_info {
>>          u8 max_vfreq;
>>   };
>>
>> +/**
>> + * enum drm_privacy_screen_status - privacy screen status
>> + *
>> + * This enum is used to track and control the state of the integrated privacy
>> + * screen present on some display panels, via the "privacy-screen sw-state"
>> + * and "privacy-screen hw-state" properties. Note the _LOCKED enum values
>> + * are only valid for the "privacy-screen hw-state" property.
>> + *
>> + * @PRIVACY_SCREEN_DISABLED:
>> + *  The privacy-screen on the panel is disabled
>> + * @PRIVACY_SCREEN_ENABLED:
>> + *  The privacy-screen on the panel is enabled
>> + * @PRIVACY_SCREEN_DISABLED_LOCKED:
>> + *  The privacy-screen on the panel is disabled and locked (cannot be changed)
>> + * @PRIVACY_SCREEN_ENABLED_LOCKED:
>> + *  The privacy-screen on the panel is enabled and locked (cannot be changed)
>> + */
>> +enum drm_privacy_screen_status {
>> +       PRIVACY_SCREEN_DISABLED = 0,
>> +       PRIVACY_SCREEN_ENABLED,
>> +       PRIVACY_SCREEN_DISABLED_LOCKED,
>> +       PRIVACY_SCREEN_ENABLED_LOCKED,
>> +};
>> +
>>   /*
>>    * This is a consolidated colorimetry list supported by HDMI and
>>    * DP protocol standard. The respective connectors will register
>> @@ -686,6 +710,18 @@ struct drm_connector_state {
>>           */
>>          u8 max_bpc;
>>
>> +       /**
>> +        * @privacy_screen_sw_state: See :ref:`Standard Connector
>> +        * Properties<standard_connector_properties>`
>> +        */
>> +       enum drm_privacy_screen_status privacy_screen_sw_state;
>> +
>> +       /**
>> +        * @privacy_screen_hw_state: See :ref:`Standard Connector
>> +        * Properties<standard_connector_properties>`
>> +        */
>> +       enum drm_privacy_screen_status privacy_screen_hw_state;
>> +
>>          /**
>>           * @hdr_output_metadata:
>>           * DRM blob property for HDR output metadata
>> @@ -1285,6 +1321,18 @@ struct drm_connector {
>>           */
>>          struct drm_property *max_bpc_property;
>>
>> +       /**
>> +        * @privacy_screen_sw_state_property: Optional atomic property for the
>> +        * connector to control the integrated privacy screen.
>> +        */
>> +       struct drm_property *privacy_screen_sw_state_property;
>> +
>> +       /**
>> +        * @privacy_screen_hw_state_property: Optional atomic property for the
>> +        * connector to report the actual integrated privacy screen state.
>> +        */
>> +       struct drm_property *privacy_screen_hw_state_property;
>> +
>>   #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>>   #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>>   #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
>> @@ -1598,6 +1646,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>>          int width, int height);
>>   int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>                                            int min, int max);
>> +void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);
>> +void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
>>
>>   /**
>>    * struct drm_tile_group - Tile group metadata
>> --
>> 2.26.0
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
