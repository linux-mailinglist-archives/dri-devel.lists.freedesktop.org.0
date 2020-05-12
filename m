Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682801D0BA0
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28796E9CF;
	Wed, 13 May 2020 09:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6914 seconds by postgrey-1.36 at gabe;
 Tue, 12 May 2020 22:39:26 UTC
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191466EA56
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 22:39:25 +0000 (UTC)
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CKH7MC022072
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=DuO9+XzCs9Szkec9RCDi2yJoEzCU6NDkZ7chFDvuD+E=;
 b=SkYIEvrjFz3NnI2JTXQwT4aC+MZJ1ZCmUjTWVxkIQY6ls/faYjKQRsUnH0XXvxUgNU5G
 x5sem2GZ+HjiPYQmBpJ2QtnMZeVeqKrIuUK/04bxCcAlkpkL02y+dRX1kVYwOMZe6DjM
 F0zvnZr1dnEAkyBgJcZBC/CEETjj8Zgvk0K1w5nD47fbPmU+QSXWy3ttDEZEv/5zsAqF
 EZppV2JBXnZxUyD4Ld8DuxZ39HTLV45+hIicvIH19HxNz8U5D/Okgi6zS3UMZKwcMwte
 otSDK1xYx4roSP/7BdGQhGfUjv8wV6koJRTDfgJxcaiuarCN9t8RkLX9+6JRO4mQp0jE EA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 3100y0gcsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:44:11 -0400
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CKNQMS126713
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:44:10 -0400
Received: from ausc60pc101.us.dell.com (ausc60pc101.us.dell.com
 [143.166.85.206])
 by mx0b-00154901.pphosted.com with ESMTP id 3101109ktd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:44:09 -0400
X-LoopCount0: from 10.166.132.190
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="1555048327"
From: <Mario.Limonciello@dell.com>
To: <hdegoede@redhat.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <rajatja@google.com>, <jani.nikula@linux.intel.com>
Subject: RE: [RFC v2] drm/connector: Add support for privacy-screen properties
 (v2)
Thread-Topic: [RFC v2] drm/connector: Add support for privacy-screen
 properties (v2)
Thread-Index: AQHWJ7xIktWUnlUipkKoS8r+15lJDKik61zw
Date: Tue, 12 May 2020 20:44:08 +0000
Message-ID: <64cb58c2e5254b4c8f539cecd6953090@AUSX13MPC105.AMER.DELL.COM>
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <20200511174724.21512-2-hdegoede@redhat.com>
In-Reply-To: <20200511174724.21512-2-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-05-12T20:43:56.8593322Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=e6908ad5-5236-40c1-b52a-324cd5489261;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [143.166.24.40]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_07:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 cotscore=-2147483648 priorityscore=1501 mlxlogscore=999 clxscore=1011
 impostorscore=0 mlxscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005120152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 clxscore=1011 cotscore=-2147483648 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005120152
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: dri-devel@lists.freedesktop.org, Sonny.Quintanilla@dell.com,
 jaredz@redhat.com, mpearson@lenovo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Monday, May 11, 2020 12:47 PM
> To: Maarten Lankhorst; Maxime Ripard; Thomas Zimmermann; Daniel Vetter; David
> Airlie; Rajat Jain; Jani Nikula
> Cc: Hans de Goede; Pekka Paalanen; Limonciello, Mario; Quintanilla, Sonny;
> Jared Dominguez; Mark Pearson; dri-devel@lists.freedesktop.org
> Subject: [RFC v2] drm/connector: Add support for privacy-screen properties
> (v2)
> 
> 
> [EXTERNAL EMAIL]
> 
> From: Rajat Jain <rajatja@google.com>
> 
> Add support for generic electronic privacy screen properties, that
> can be added by systems that have an integrated EPS.
> 
> Changes in v2 (Hans de Goede)
> - Create 2 properties, "privacy-screen sw-state" and
>   "privacy-screen hw-state", to deal with devices where the OS might be
>   locked out of making state changes
> - Write kerneldoc explaining how the 2 properties work together, what
>   happens when changes to the state are made outside of the DRM code's
>   control, etc.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Co-authored-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  Documentation/gpu/drm-kms.rst     |   2 +
>  drivers/gpu/drm/drm_atomic_uapi.c |   6 ++
>  drivers/gpu/drm/drm_connector.c   | 100 ++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       |  50 +++++++++++++++
>  4 files changed, 158 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 906771e03103..b72b1e0db343 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -445,6 +445,8 @@ Property Types and Blob Property Support
>  .. kernel-doc:: drivers/gpu/drm/drm_property.c
>     :export:
> 
> +.. _standard_connector_properties:
> +
>  Standard Connector Properties
>  -----------------------------
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index a1e5e262bae2..e56a11208515 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -766,6 +766,8 @@ static int drm_atomic_connector_set_property(struct
> drm_connector *connector,
>  						   fence_ptr);
>  	} else if (property == connector->max_bpc_property) {
>  		state->max_requested_bpc = val;
> +	} else if (property == connector->privacy_screen_sw_state_property) {
> +		state->privacy_screen_sw_state = val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -842,6 +844,10 @@ drm_atomic_connector_get_property(struct drm_connector
> *connector,
>  		*val = 0;
>  	} else if (property == connector->max_bpc_property) {
>  		*val = state->max_requested_bpc;
> +	} else if (property == connector->privacy_screen_sw_state_property) {
> +		*val = state->privacy_screen_sw_state;
> +	} else if (property == connector->privacy_screen_hw_state_property) {
> +		*val = state->privacy_screen_hw_state;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 644f0ad10671..01360edc2376 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1186,6 +1186,45 @@ static const struct drm_prop_enum_list dp_colorspaces[]
> = {
>   *	can also expose this property to external outputs, in which case they
>   *	must support "None", which should be the default (since external screens
>   *	have a built-in scaler).
> + *
> + * privacy-screen sw-state, privacy-screen hw-state:
> + *	These 2 optional properties can be used to query the state of the
> + *	electronic privacy screen that is available on some displays; and in
> + *	some cases also control the state. If a driver implements these
> + *	properties then both properties must be present.
> + *
> + *	"privacy-screen hw-state" is read-only and reflects the actual state
> + *	of the privacy-screen, possible values: "Enabled", "Disabled,
> + *	"Enabled, locked", "Disabled, locked". The locked states indicate
> + *	that the state cannot be changed through the DRM API. E.g. there
> + *	might be devices where the firmware-setup options, or a hardware
> + *	slider-switch, offer always on / off modes.
> + *
> + *	"privacy-screen sw-state" can be set to change the privacy-screen state
> + *	when not locked. In this case the driver must update the hw-state
> + *	property to reflect the new state on completion of the commit of the
> + *	sw-state property. Setting the sw-state property when the hw-state is
> + *	locked must be interpreted by the driver as a request to change the
> + *	state to the set state when the hw-state becomes unlocked. E.g. if
> + *	"privacy-screen hw-state" is "Enabled, locked" and the sw-state
> + *	gets set to "Disabled" followed by the user unlocking the state by
> + *	changing the slider-switch position, then the driver must set the
> + *	state to "Disabled" upon receiving the unlock event.
> + *
> + *	In some cases the privacy-screen state might change outside of control
> + *	of the DRM code. E.g. there might be a firmware handled hotkey which
> + *	toggles the state, or the state might be changed through another
> + *	userspace API such as writing /proc/acpi/ibm/lcdshadow. In this case
> + *	the driver must update both the hw-state and the sw-state to reflect
> + *	the new value, overwriting any pending state requests in the sw-state.
> + *
> + *	Note that the ability for the state to change outside of control of
> + *	the DRM master process means that userspace must not cache the value
> + *	of the sw-state. Ccaching the sw-state value and including it in later
> + *	atomic commits may lead to overriding a state change done through e.g.
> + *	a firmware handled hotkey. Therefor userspace must not include the
> + *	privacy-screen sw-state in an atomic commit unless it wants to change
> + *	its value.
>   */
> 
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> @@ -2152,6 +2191,67 @@ int drm_connector_set_panel_orientation_with_quirk(
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
> 
> +static const struct drm_prop_enum_list privacy_screen_enum[] = {
> +	{ PRIVACY_SCREEN_DISABLED,		"Disabled" },
> +	{ PRIVACY_SCREEN_ENABLED,		"Enabled" },
> +	{ PRIVACY_SCREEN_DISABLED_LOCKED,	"Disabled, locked" },
> +	{ PRIVACY_SCREEN_ENABLED_LOCKED,	"Enabled, locked" },
> +};
> +
> +/**
> + * drm_connector_create_privacy_screen_properties -
> + *     create the drm connecter's privacy-screen properties.
> + * @connector: connector for which to create the privacy-screen properties
> + *
> + * This function creates the "privacy-screen sw-state" and "privacy-screen
> + * hw-state" properties for the connector. They are not attached.
> + */
> +void
> +drm_connector_create_privacy_screen_properties(struct drm_connector
> *connector)
> +{
> +	if (connector->privacy_screen_sw_state_property)
> +		return;
> +
> +	/* Note sw-state only supports the first 2 values of the enum */
> +	connector->privacy_screen_sw_state_property =
> +		drm_property_create_enum(connector->dev, DRM_MODE_PROP_ENUM,
> +				"privacy-screen sw-state",
> +				privacy_screen_enum, 2);
> +
> +	connector->privacy_screen_hw_state_property =
> +		drm_property_create_enum(connector->dev,
> +				DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ENUM,
> +				"privacy-screen hw-state",
> +				privacy_screen_enum,
> +				ARRAY_SIZE(privacy_screen_enum));
> +}
> +EXPORT_SYMBOL(drm_connector_create_privacy_screen_properties);
> +
> +/**
> + * drm_connector_attach_privacy_screen_properties -
> + *     attach the drm connecter's privacy-screen properties.
> + * @connector: connector on which to attach the privacy-screen properties
> + *
> + * This function attaches the "privacy-screen sw-state" and "privacy-screen
> + * hw-state" properties to the connector. The initial state of both is set
> + * to "Disabled".
> + */
> +void
> +drm_connector_attach_privacy_screen_properties(struct drm_connector
> *connector)
> +{
> +	if (!connector->privacy_screen_sw_state_property)
> +		return;
> +
> +	drm_object_attach_property(&connector->base,
> +				   connector->privacy_screen_sw_state_property,
> +				   PRIVACY_SCREEN_DISABLED);
> +
> +	drm_object_attach_property(&connector->base,
> +				   connector->privacy_screen_hw_state_property,
> +				   PRIVACY_SCREEN_DISABLED);
> +}
> +EXPORT_SYMBOL(drm_connector_attach_privacy_screen_properties);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>  				    struct drm_property *property,
>  				    uint64_t value)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 19ae6bb5c85b..a8844f4c6ae9 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -271,6 +271,30 @@ struct drm_monitor_range_info {
>  	u8 max_vfreq;
>  };
> 
> +/**
> + * enum drm_privacy_screen_status - privacy screen status
> + *
> + * This enum is used to track and control the state of the integrated privacy
> + * screen present on some display panels, via the "privacy-screen sw-state"
> + * and "privacy-screen hw-state" properties. Note the _LOCKED enum values
> + * are only valid for the "privacy-screen hw-state" property.
> + *
> + * @PRIVACY_SCREEN_DISABLED:
> + *  The privacy-screen on the panel is disabled
> + * @PRIVACY_SCREEN_ENABLED:
> + *  The privacy-screen on the panel is enabled
> + * @PRIVACY_SCREEN_DISABLED_LOCKED:
> + *  The privacy-screen on the panel is disabled and locked (cannot be
> changed)
> + * @PRIVACY_SCREEN_ENABLED_LOCKED:
> + *  The privacy-screen on the panel is enabled and locked (cannot be changed)
> + */
> +enum drm_privacy_screen_status {
> +	PRIVACY_SCREEN_DISABLED = 0,
> +	PRIVACY_SCREEN_ENABLED,
> +	PRIVACY_SCREEN_DISABLED_LOCKED,
> +	PRIVACY_SCREEN_ENABLED_LOCKED,
> +};
> +
>  /*
>   * This is a consolidated colorimetry list supported by HDMI and
>   * DP protocol standard. The respective connectors will register
> @@ -686,6 +710,18 @@ struct drm_connector_state {
>  	 */
>  	u8 max_bpc;
> 
> +	/**
> +	 * @privacy_screen_sw_state: See :ref:`Standard Connector
> +	 * Properties<standard_connector_properties>`
> +	 */
> +	enum drm_privacy_screen_status privacy_screen_sw_state;
> +
> +	/**
> +	 * @privacy_screen_hw_state: See :ref:`Standard Connector
> +	 * Properties<standard_connector_properties>`
> +	 */
> +	enum drm_privacy_screen_status privacy_screen_hw_state;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1285,6 +1321,18 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
> 
> +	/**
> +	 * @privacy_screen_sw_state_property: Optional atomic property for the
> +	 * connector to control the integrated privacy screen.
> +	 */
> +	struct drm_property *privacy_screen_sw_state_property;
> +
> +	/**
> +	 * @privacy_screen_hw_state_property: Optional atomic property for the
> +	 * connector to report the actual integrated privacy screen state.
> +	 */
> +	struct drm_property *privacy_screen_hw_state_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1598,6 +1646,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>  	int width, int height);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>  					  int min, int max);
> +void drm_connector_create_privacy_screen_properties(struct drm_connector
> *conn);
> +void drm_connector_attach_privacy_screen_properties(struct drm_connector
> *conn);
> 
>  /**
>   * struct drm_tile_group - Tile group metadata
> --
> 2.26.0

Hans,

Thanks for putting together this set of modifications.  I believe it does sufficiently
reflect the implementation of privacy screens present on Dell notebooks today containing
them: Latitude 7300 and Latitude 7400.

Those models only offer a HW controlled screen via a hotkey, but that hotkey control
can be removed permanently locking them in an enabled or disabled state.

I feel that your concept of HW state "Enabled, Locked" and "Disabled, Locked" sufficiently
reflects that.

Reviewed-by: Mario Limonciello <Mario.limonciello@dell.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
