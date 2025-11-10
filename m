Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBA1C44AAF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 01:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07D910E284;
	Mon, 10 Nov 2025 00:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="ekU+gLel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 356 seconds by postgrey-1.36 at gabe;
 Mon, 10 Nov 2025 00:08:06 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03210E09D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 00:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762733285; x=1763338085; i=w_armin@gmx.de;
 bh=F9qjRrMtzp8T2rDv7S95wGwx/DKJTR4Z/kvAF1ahX3k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ekU+gLelcxJjZ0bTcb6CbgzvB4TDf5ba8F+BGPI34g6JQAT3KQDfsQLQXjYh5TYR
 pqp2Gi4InhrNTWwJ4hE3NH20R7TJ2b2hWUqtntpVXOdKmzuCgCIiZXYfK9e30HzfR
 jKfpQRPSnGu+xQ6Awe48YPjfMY2GsSScU0UqWBCPrNj06YAVtN/7P/adcybFt2OT5
 iZh0vUY6jlTuxM3+QP2jHzYuBOkkpeBVgLZ4RhvCsdVMgRyhZWuzCtfCbIna77BWU
 N5caqTcM8lSZxCgf+lkKl0ZRXc0x2dmFUBGDP6KN+YxgNOehflMHQ0vff/nQHB4gd
 QimBMiiAzAE2aTQOIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeMG-1vjmcT3Ofk-00KqH7; Mon, 10
 Nov 2025 01:02:05 +0100
Message-ID: <1b41a90b-3583-4543-877a-0925a4e08853@gmx.de>
Date: Mon, 10 Nov 2025 01:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: lenovo-wmi-{capdata, other}: Support
 multiple Capability Data
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20251031155349.24693-1-i@rong.moe>
 <20251031155349.24693-4-i@rong.moe>
 <8c14706f-f3cc-45e9-bdef-db2c9171f46e@gmx.de>
 <dd93f38bc0129b4b75e2dbde676d402376bc301c.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <dd93f38bc0129b4b75e2dbde676d402376bc301c.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m6NvvspB4HsPXt/NbiJJPfZ1bnEkpQX4Q7Y0/y8RJKp6Qk3Ugj3
 NoSbCphoqmG8JjrgfyB8sUYCwV8Kb8Xp3CI3gCdk3zHAG5ti7BcB4WNVTjYjw/BX7snym18
 bjWMROhLe9K1nY/OK3oYthVY9l/dMV7fwwiC97pDjM4351m7ZbWwdufh/ZVx5o/5uzytx4d
 dX1GBJMd6YXE0Y4mXemcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uSvzMsB3sOU=;Crsv+SzNcyhu90cko9BPAYi/rgb
 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
 nMXpxqKb148qCPuiQ=
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

Am 06.11.25 um 13:36 schrieb Rong Zhang:

> Hi Armin,
>
> On Tue, 2025-11-04 at 21:20 +0100, Armin Wolf wrote:
>> Am 31.10.25 um 16:51 schrieb Rong Zhang:
>>
>>> The current implementation are heavily bound to capdata01. Rewrite it =
so
>>> that it is suitable to utilize other Capability Data as well.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Rong Zhang <i@rong.moe>
>>> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Fix function parameter 'type' not described in 'lwmi_cd_match' (than=
ks
>>>     kernel test bot)
>>> ---
>>>    drivers/platform/x86/lenovo/wmi-capdata.c | 208 +++++++++++++++++--=
=2D--
>>>    drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
>>>    drivers/platform/x86/lenovo/wmi-other.c   |  27 ++-
>>>    3 files changed, 190 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platf=
orm/x86/lenovo/wmi-capdata.c
>>> index c5e74b2bfeb3..1f7fc09b7c3f 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
>>> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>>> @@ -12,8 +12,13 @@
>>>     *
>>>     * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>>     *   - Initial implementation (formerly named lenovo-wmi-capdata01)
>>> + *
>>> + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
>>> + *   - Unified implementation
>>>     */
>>>   =20
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>>    #include <linux/acpi.h>
>>>    #include <linux/cleanup.h>
>>>    #include <linux/component.h>
>>> @@ -36,6 +41,25 @@
>>>    #define ACPI_AC_CLASS "ac_adapter"
>>>    #define ACPI_AC_NOTIFY_STATUS 0x80
>>>   =20
>>> +enum lwmi_cd_type {
>>> +	LENOVO_CAPABILITY_DATA_01,
>>> +};
>>> +
>>> +#define LWMI_CD_TABLE_ITEM(_type)		\
>>> +	[_type] =3D {				\
>>> +		.guid_string =3D _type##_GUID,	\
>>> +		.name =3D #_type,			\
>>> +		.type =3D _type,			\
>>> +	}
>>> +
>>> +static const struct lwmi_cd_info {
>>> +	const char *guid_string;
>>> +	const char *name;
>>> +	enum lwmi_cd_type type;
>>> +} lwmi_cd_table[] =3D {
>>> +	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
>>> +};
>>> +
>>>    struct lwmi_cd_priv {
>>>    	struct notifier_block acpi_nb; /* ACPI events */
>>>    	struct wmi_device *wdev;
>>> @@ -44,15 +68,19 @@ struct lwmi_cd_priv {
>>>   =20
>>>    struct cd_list {
>>>    	struct mutex list_mutex; /* list R/W mutex */
>>> +	enum lwmi_cd_type type;
>>>    	u8 count;
>>> -	struct capdata01 data[];
>>> +
>>> +	union {
>>> +		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
>>> +	};
>>>    };
>>>   =20
>>>    /**
>>>     * lwmi_cd_component_bind() - Bind component to master device.
>>>     * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
>>>     * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
>>> - * @data: cd_list object pointer used to return the capability data.
>>> + * @data: lwmi_cd_binder object pointer used to return the capability=
 data.
>>>     *
>>>     * On lenovo-wmi-other's master bind, provide a pointer to the loca=
l capdata
>>>     * list. This is used to call lwmi_cd*_get_data to look up attribut=
e data
>>> @@ -64,9 +92,15 @@ static int lwmi_cd_component_bind(struct device *cd=
_dev,
>>>    				  struct device *om_dev, void *data)
>>>    {
>>>    	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
>>> -	struct cd_list **cd_list =3D data;
>>> +	struct lwmi_cd_binder *binder =3D data;
>>>   =20
>>> -	*cd_list =3D priv->list;
>>> +	switch (priv->list->type) {
>>> +	case LENOVO_CAPABILITY_DATA_01:
>>> +		binder->cd01_list =3D priv->list;
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>>   =20
>>>    	return 0;
>>>    }
>>> @@ -76,30 +110,33 @@ static const struct component_ops lwmi_cd_compone=
nt_ops =3D {
>>>    };
>>>   =20
>>>    /**
>>> - * lwmi_cd01_get_data - Get the data of the specified attribute
>>> + * lwmi_cd*_get_data - Get the data of the specified attribute
>>>     * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
>>>     * @attribute_id: The capdata attribute ID to be found.
>>> - * @output: Pointer to a capdata01 struct to return the data.
>>> + * @output: Pointer to a capdata* struct to return the data.
>>>     *
>>> - * Retrieves the capability data 01 struct pointer for the given
>>> - * attribute for its specified thermal mode.
>>> + * Retrieves the capability data struct pointer for the given
>>> + * attribute.
>>>     *
>>>     * Return: 0 on success, or -EINVAL.
>>>     */
>>> -int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=
 capdata01 *output)
>>> -{
>>> -	u8 idx;
>>> -
>>> -	guard(mutex)(&list->list_mutex);
>>> -	for (idx =3D 0; idx < list->count; idx++) {
>>> -		if (list->data[idx].id !=3D attribute_id)
>>> -			continue;
>>> -		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
>>> -		return 0;
>>> +#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
>>> +	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id, =
_output_t *output)	\
>>> +	{											\
>>> +		u8 idx;										\
>>> +		if (WARN_ON(list->type !=3D _cd_type))						\
>>> +			return -EINVAL;								\
>>> +		guard(mutex)(&list->list_mutex);						\
>>> +		for (idx =3D 0; idx < list->count; idx++) {					\
>>> +			if (list->_cdxx[idx].id !=3D attribute_id)				\
>>> +				continue;							\
>>> +			memcpy(output, &list->_cdxx[idx], sizeof(list->_cdxx[idx]));		\
>>> +			return 0;								\
>>> +		}										\
>>> +		return -EINVAL;									\
>>>    	}
>>>   =20
>>> -	return -EINVAL;
>>> -}
>>> +DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdat=
a01);
>>>    EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
>>>   =20
>>>    /**
>>> @@ -112,10 +149,21 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO=
_WMI_CD");
>>>     */
>>>    static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>>>    {
>>> +	size_t size;
>>>    	int idx;
>>> +	void *p;
>>> +
>>> +	switch (priv->list->type) {
>>> +	case LENOVO_CAPABILITY_DATA_01:
>>> +		p =3D &priv->list->cd01[0];
>>> +		size =3D sizeof(priv->list->cd01[0]);
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>>   =20
>>>    	guard(mutex)(&priv->list->list_mutex);
>>> -	for (idx =3D 0; idx < priv->list->count; idx++) {
>>> +	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
>>>    		union acpi_object *ret_obj __free(kfree) =3D NULL;
>>>   =20
>>>    		ret_obj =3D wmidev_block_query(priv->wdev, idx);
>>> @@ -123,11 +171,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
>>>    			return -ENODEV;
>>>   =20
>>>    		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
>>> -		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
>>> +		    ret_obj->buffer.length < size)
>>>    			continue;
>>>   =20
>>> -		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
>>> -		       ret_obj->buffer.length);
>>> +		memcpy(p, ret_obj->buffer.pointer, size);
>>>    	}
>>>   =20
>>>    	return 0;
>>> @@ -136,20 +183,28 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
>>>    /**
>>>     * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
>>>     * @priv: lenovo-wmi-capdata driver data.
>>> + * @type: The type of capability data.
>>>     *
>>>     * Allocate a cd_list struct large enough to contain data from all =
WMI data
>>>     * blocks provided by the interface.
>>>     *
>>>     * Return: 0 on success, or an error.
>>>     */
>>> -static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>>> +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type=
 type)
>>>    {
>>>    	struct cd_list *list;
>>>    	size_t list_size;
>>>    	int count, ret;
>>>   =20
>>>    	count =3D wmidev_instance_count(priv->wdev);
>>> -	list_size =3D struct_size(list, data, count);
>>> +
>>> +	switch (type) {
>>> +	case LENOVO_CAPABILITY_DATA_01:
>>> +		list_size =3D struct_size(list, cd01, count);
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>>   =20
>>>    	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
>>>    	if (!list)
>>> @@ -159,6 +214,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv=
)
>>>    	if (ret)
>>>    		return ret;
>>>   =20
>>> +	list->type =3D type;
>>>    	list->count =3D count;
>>>    	priv->list =3D list;
>>>   =20
>>> @@ -168,6 +224,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv=
)
>>>    /**
>>>     * lwmi_cd_setup() - Cache all WMI data block information
>>>     * @priv: lenovo-wmi-capdata driver data.
>>> + * @type: The type of capability data.
>>>     *
>>>     * Allocate a cd_list struct large enough to contain data from all =
WMI data
>>>     * blocks provided by the interface. Then loop through each data bl=
ock and
>>> @@ -175,11 +232,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *pr=
iv)
>>>     *
>>>     * Return: 0 on success, or an error code.
>>>     */
>>> -static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
>>> +static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type=
 type)
>>>    {
>>>    	int ret;
>>>   =20
>>> -	ret =3D lwmi_cd_alloc(priv);
>>> +	ret =3D lwmi_cd_alloc(priv, type);
>>>    	if (ret)
>>>    		return ret;
>>>   =20
>>> @@ -235,9 +292,13 @@ static void lwmi_cd01_unregister(void *data)
>>>   =20
>>>    static int lwmi_cd_probe(struct wmi_device *wdev, const void *conte=
xt)
>>>    {
>>> +	const struct lwmi_cd_info *info =3D context;
>>>    	struct lwmi_cd_priv *priv;
>>>    	int ret;
>>>   =20
>>> +	if (!info)
>>> +		return -EINVAL;
>>> +
>>>    	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>>    	if (!priv)
>>>    		return -ENOMEM;
>>> @@ -245,21 +306,34 @@ static int lwmi_cd_probe(struct wmi_device *wdev=
, const void *context)
>>>    	priv->wdev =3D wdev;
>>>    	dev_set_drvdata(&wdev->dev, priv);
>>>   =20
>>> -	ret =3D lwmi_cd_setup(priv);
>>> +	ret =3D lwmi_cd_setup(priv, info->type);
>>>    	if (ret)
>>> -		return ret;
>>> +		goto out;
>>>   =20
>>> -	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>>> +	if (info->type =3D=3D LENOVO_CAPABILITY_DATA_01) {
>>> +		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>>>   =20
>>> -	ret =3D register_acpi_notifier(&priv->acpi_nb);
>>> -	if (ret)
>>> -		return ret;
>>> +		ret =3D register_acpi_notifier(&priv->acpi_nb);
>>> +		if (ret)
>>> +			goto out;
>>>   =20
>>> -	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &=
priv->acpi_nb);
>>> -	if (ret)
>>> -		return ret;
>>> +		ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
>>> +					       &priv->acpi_nb);
>>> +		if (ret)
>>> +			goto out;
>>> +	}
>>> +
>>> +	ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>>>   =20
>>> -	return component_add(&wdev->dev, &lwmi_cd_component_ops);
>>> +out:
>>> +	if (ret) {
>>> +		dev_err(&wdev->dev, "failed to register %s: %d\n",
>>> +			info->name, ret);
>>> +	} else {
>>> +		dev_info(&wdev->dev, "registered %s with %u items\n",
>>> +			 info->name, priv->list->count);
>>> +	}
>>> +	return ret;
>>>    }
>>>   =20
>>>    static void lwmi_cd_remove(struct wmi_device *wdev)
>>> @@ -267,8 +341,12 @@ static void lwmi_cd_remove(struct wmi_device *wde=
v)
>>>    	component_del(&wdev->dev, &lwmi_cd_component_ops);
>>>    }
>>>   =20
>>> +#define LWMI_CD_WDEV_ID(_type)				\
>>> +	.guid_string =3D _type##_GUID,			\
>>> +	.context =3D &lwmi_cd_table[_type]
>>> +
>>>    static const struct wmi_device_id lwmi_cd_id_table[] =3D {
>>> -	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>>> +	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
>>>    	{}
>>>    };
>>>   =20
>>> @@ -284,21 +362,61 @@ static struct wmi_driver lwmi_cd_driver =3D {
>>>    };
>>>   =20
>>>    /**
>>> - * lwmi_cd01_match() - Match rule for the master driver.
>>> - * @dev: Pointer to the capability data 01 parent device.
>>> - * @data: Unused void pointer for passing match criteria.
>>> + * lwmi_cd_match() - Match rule for the master driver.
>>> + * @dev: Pointer to the capability data parent device.
>>> + * @type: Pointer to capability data type (enum lwmi_cd_type *) to ma=
tch.
>>>     *
>>>     * Return: int.
>>>     */
>>> -int lwmi_cd01_match(struct device *dev, void *data)
>>> +static int lwmi_cd_match(struct device *dev, void *type)
>>> +{
>>> +	struct lwmi_cd_priv *priv;
>>> +
>>> +	if (dev->driver !=3D &lwmi_cd_driver.driver)
>>> +		return false;
>>> +
>>> +	priv =3D dev_get_drvdata(dev);
>>> +	return priv->list->type =3D=3D *(enum lwmi_cd_type *)type;
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd_match_add_all() - Add all match rule for the master driver=
.
>>> + * @master: Pointer to the master device.
>>> + * @matchptr: Pointer to the returned component_match pointer.
>>> + *
>>> + * Adds all component matches to the list stored in @matchptr for the=
 @master
>>> + * device. @matchptr must be initialized to NULL. This matches all av=
ailable
>>> + * capdata types on the machine.
>>> + */
>>> +void lwmi_cd_match_add_all(struct device *master, struct component_ma=
tch **matchptr)
>>>    {
>>> -	return dev->driver =3D=3D &lwmi_cd_driver.driver;
>>> +	int i;
>>> +
>>> +	if (WARN_ON(*matchptr))
>>> +		return;
>>> +
>>> +	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
>>> +		if (!lwmi_cd_table[i].guid_string ||
>>> +		    !wmi_has_guid(lwmi_cd_table[i].guid_string))
>>> +			continue;
>> I am still not happy about this. AFAIK as soon as the ordinary capdata =
WMI devices are bound together,
>> the firmware tells you whether or not the additional fan data WMI devic=
e is available. Maybe you can do
>> something like this:
>>
>> 1. Bind both capdata WMI devices as usual.
>> 2. Check if a fan data WMI device is available (you can use a DMI-based=
 quirk list for devices were
>>      the firmware reports invalid data).
>> 3. Register an additional component that binds to the fan data WMI devi=
ce.
>> 4. Bind both the additional component and the component registered by t=
he fan data WMI device.
>> 5. Register the hwmon device with additional fan data.
>>
>> If the fan data WMI device is not available, you can simply skip steps =
3 and 4 and simply
>> register the hwmon device with any additional fan data.
>>
>> What do you think?
> I tried your approach. I looks pretty well except for step 4:
>
>     debugfs: 'DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-21' already exists in=
 'device_component'
>
> Moreover, component_[un]bind_all() calls __aggregate_find() with ops =3D=
=3D
> NULL, which implies that it can't really distinguish the two aggregate
> devices we have. Thus, we are rely on the insertion sequence of
> aggregate_devices (see component_master_add_with_match()) to make it
> just work. Pseudo code:
>
>     lwmi_other_probe()
>     {
>     	component_match_add(..., lwmi_cd00_match, ...);
>     	component_match_add(..., lwmi_cd01_match, ...);
>     	component_master_add_with_match(..., &ops1, ...);
>     	component_match_add(..., lwmi_cd_fan_match, ...);
>     	component_master_add_with_match(..., &ops2, ...);
>     }
>    =20
>     lwmi_other_remove()
>     {
>     	/* This just works (TM). */
>     	component_master_del(..., &ops2); /* unbinds cd_fan */
>     	component_master_del(..., &ops1); /* unbinds cd00/01 */
>    =20
>     	/* WARNING: at drivers/base/component.c:589 */
>     	/*
>     	component_master_del(..., &ops1); /* unbinds cd_fan!!! */
>     	component_master_del(..., &ops2); /* unbinds cd_fan!!! */
>     	*/
>     }
>
> It seems that the component framework is not prepared to allow multi-
> aggregation master device.
>
> Since we are talking about the component framework: all efforts we made
> here is to work around one of its limitations -- all components must be
> found or else it won't bring up the aggregate device. Do you think
> allowing partially bound aggregate device a good idea? E.g., adding a
> flag, indicating the master device opts in to such behavior, to the
> definition of struct component_master_ops. I can prepare a separate
> patch for that.
>
> CC'ing maintainers and lists of driver core and component framework.

Oh my, i did not know about this limitation. I think adding support for
optional components will be quite complicated to get right, inside i propo=
se
the following:

The current component master is lenovo-wmi-other, with capdata01 and capda=
ta00
being its components (correct me if i am wrong). Instead of registering an=
 additional
component master on lenovo-wmi-other, how about registering it on capdata0=
0?

Basically when probing, capdata00 will register the component for lenovo-w=
mi-other
and then check whether attribute 0x04050000 indicates support for LENOVO_F=
AN_TEST_DATA
(or a DMI check overrides this). Is yes then capdata00 registers an additi=
onal component
master, otherwise the hwmon device is created right away.
The driver for LENOVO_FAN_TEST_DATA registers a component for capdata00. A=
s soon as the
component master from capdata00 is bound to the component from LENOVO_FAN_=
TEST_DATA, a
hwmon device is created.

Do you thing this would be more feasible than extending the component fram=
ework itself?

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
> Thanks,
> Rong
>
>>> +
>>> +		component_match_add(master, matchptr, lwmi_cd_match,
>>> +				    (void *)&lwmi_cd_table[i].type);
>>> +		if (IS_ERR(matchptr))
>>> +			return;
>>> +	}
>>> +
>>> +	if (!*matchptr) {
>>> +		pr_warn("a master driver requested capability data, but nothing is =
available\n");
>>> +		*matchptr =3D ERR_PTR(-ENODEV);
>>> +	}
>>>    }
>>> -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
>>> +EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
>>>   =20
>>>    module_wmi_driver(lwmi_cd_driver);
>>>   =20
>>>    MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>>>    MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
>>>    MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
>>>    MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platf=
orm/x86/lenovo/wmi-capdata.h
>>> index 2a4746e38ad4..1e5fce7836cb 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
>>> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
>>> @@ -7,6 +7,7 @@
>>>   =20
>>>    #include <linux/types.h>
>>>   =20
>>> +struct component_match;
>>>    struct device;
>>>    struct cd_list;
>>>   =20
>>> @@ -19,7 +20,11 @@ struct capdata01 {
>>>    	u32 max_value;
>>>    };
>>>   =20
>>> +struct lwmi_cd_binder {
>>> +	struct cd_list *cd01_list;
>>> +};
>>> +
>>>    int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, stru=
ct capdata01 *output);
>>> -int lwmi_cd01_match(struct device *dev, void *data);
>>> +void lwmi_cd_match_add_all(struct device *master, struct component_ma=
tch **matchptr);
>>>   =20
>>>    #endif /* !_LENOVO_WMI_CAPDATA_H_ */
>>> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfor=
m/x86/lenovo/wmi-other.c
>>> index c6dc1b4cff84..20c6ff0be37a 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-other.c
>>> +++ b/drivers/platform/x86/lenovo/wmi-other.c
>>> @@ -579,14 +579,14 @@ static void lwmi_om_fw_attr_remove(struct lwmi_o=
m_priv *priv)
>>>    static int lwmi_om_master_bind(struct device *dev)
>>>    {
>>>    	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
>>> -	struct cd_list *tmp_list;
>>> +	struct lwmi_cd_binder binder =3D { 0 };
>>>    	int ret;
>>>   =20
>>> -	ret =3D component_bind_all(dev, &tmp_list);
>>> +	ret =3D component_bind_all(dev, &binder);
>>>    	if (ret)
>>>    		return ret;
>>>   =20
>>> -	priv->cd01_list =3D tmp_list;
>>> +	priv->cd01_list =3D binder.cd01_list;
>>>    	if (!priv->cd01_list)
>>>    		return -ENODEV;
>>>   =20
>>> @@ -618,6 +618,7 @@ static int lwmi_other_probe(struct wmi_device *wde=
v, const void *context)
>>>    {
>>>    	struct component_match *master_match =3D NULL;
>>>    	struct lwmi_om_priv *priv;
>>> +	int ret;
>>>   =20
>>>    	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>>    	if (!priv)
>>> @@ -626,12 +627,26 @@ static int lwmi_other_probe(struct wmi_device *w=
dev, const void *context)
>>>    	priv->wdev =3D wdev;
>>>    	dev_set_drvdata(&wdev->dev, priv);
>>>   =20
>>> -	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL=
);
>>> +	lwmi_cd_match_add_all(&wdev->dev, &master_match);
>>>    	if (IS_ERR(master_match))
>>>    		return PTR_ERR(master_match);
>>>   =20
>>> -	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_o=
ps,
>>> -					       master_match);
>>> +	ret =3D component_master_add_with_match(&wdev->dev, &lwmi_om_master_=
ops,
>>> +					      master_match);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (likely(component_master_is_bound(&wdev->dev, &lwmi_om_master_ops=
)))
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * The bind callbacks of both master and components were never calle=
d in
>>> +	 * this case - this driver won't work at all. Failing...
>>> +	 */
>>> +	dev_err(&wdev->dev, "unbound master; is any component failing to be =
probed?");
>>> +
>>> +	component_master_del(&wdev->dev, &lwmi_om_master_ops);
>>> +	return -EXDEV;
>>>    }
>>>   =20
>>>    static void lwmi_other_remove(struct wmi_device *wdev)
