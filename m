Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FD094DB98
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A9D10E0E1;
	Sat, 10 Aug 2024 08:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="I+T/qZCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2064.outbound.protection.outlook.com [40.92.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DA710E0E1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm3rh6TJdkT6zZQoU7K0TXIPYECfaEG6zMVNJ0CUl0f5zY+w7pEyafNKYZl1Df8nEBZSSKlWttOeWNyJc910GRQzp6yqpqvmP4vxIAvIKwHbWeDRaFYpacsx8RZQkT178i1cx1AVh9+C5KGhpmf8jtwi+UnyGIqGONJGl4e/Y6nztM5oDeZmdNeAXD5dyWKHsHbOW8AeAO4+Eu3pYJkrOSB/I0RbHcs0tDeqsBGmLk5MkwJraWXoBLU6BjDa3SsvZPu/D60TDegxr0eCWYSGSukvKdm9YTlUfDtArHRbCbemKK1QA+uRk2VGXLBdFrt/o1K9bJWmwmkAlFO+bQJNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/zP/mnLZJrlbp7AYkwNz2HLdKDliZ7YVFVeNNLeZDQ=;
 b=MckWAKSfmOewYJuxHdfO9eY+8Tb+vydgfsHRm5VMV3WG3qW9uQQ6SzubtxHwhFJeHOuU6LhXWRS7NWpsRHaxNGbLPhX7R89wDXIMVcEPzw9nAXU/NjMtC1/BPOeZ+BYa4fylOw5mcfoV/J2f0Cl55e7Wdm2ZbCbi2kn3k9fcHqdJMNUMdB7vl1lG1rwjvgOhQf5PfVB96HCAQRXvIKpR+jEIC1WmUvWM1GsFU/XovFVDStnDJSpviZukRViIhM11qUA1LDJVmTDa4eTzOR1KIMWnK1trcZXoKVbm1Jl5lpB1mwsawMPKnnvUcb+mjYfTERTjYj15M4DwHaZa7UZ/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/zP/mnLZJrlbp7AYkwNz2HLdKDliZ7YVFVeNNLeZDQ=;
 b=I+T/qZCDLwem9k6PqhJVSAm8XRPe/NhGkzp+zzArmJ5pMGHAmCnZDZBXLe4LcFzKjdVF3opGf/JN4rxR/1cfqhLgb9JyL8WCmF2EhiLB+3b3BqDoCciclCN1NvAnn4Qge0NZmoBu51Bl1QkXSa0gRYoyWg5wDuUspdIYcQRUzpvsK/ygRSmQKHyVgCsiQJg6IoSmRErkKbbMOLyqNKPoj+2gxUTYKwJ5k7hrUo8NPg7GglB3YmUfSMDxADZCS9mPUU+o560NEPpcq4hqx4qLyDl7k48aHt93uK14QoXMs+mAKh0l2iFIYum4YPSiziubMJVfO/30ZGzDdi6AkDmyGg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1259.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.18; Sat, 10 Aug 2024 08:48:47 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:48:47 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH v4 3/10] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Topic: [PATCH v4 3/10] HID: hid-appletb-kbd: add support for fn toggle
 between media and function mode
Thread-Index: AQHa6wIdzaMyLzHxXkm2UHho+I6PYw==
Date: Sat, 10 Aug 2024 08:48:47 +0000
Message-ID: <16F62213-44A2-47FF-95DA-E496EE6CD1D1@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2Uqh43Hbfck93wIdNjT3LcEvtXCFge9lD74DwQQ0ETeGS7H9l5Xz+J+1GWueh7xuruj1GJc5VLk=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1259:EE_
x-ms-office365-filtering-correlation-id: e747a52e-837e-46db-c0bb-08dcb9193fee
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|15080799003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: 7tgHc/iIjTCDfHx32kxaMseN94H7k8QgxWTsjn6C41wNvFRrpeD/wlIcLaGHQTO3sX1uiASAw6bWSt98v35SQwIFXgNSpMVIKbrsCiAfW3fch01yeAZsF4CxQKahTgoQ2JzplZXlsa57wsvLU+Subi2f47Xz4NH9wF+FaU/t7/6oRUVaHQtP8JUMCPSE+lCURWZjG2kQHCXJrxWBn1YOecrZr2xE7dwlKjstM5bbHgstNWM/eQl+lznVfx3jpa128AJV/Owl8Fv/7jaco0kHIT+Q0EMHfIUWcf69bEHYkonWKYEQTLgphu956neM4wF32pzXMTYDsSwdkF/L4E12d1F8Sfl6Vt0pLSIMLOtrQoz8A+F7m78Wxi/9Fh778SR6JzWUvsiC9m3n4jEi/ZY7rrFZEwZPsne1SnAmJFAX2GT/vUIUm7bXBmwpmilUqQFeGTSJQcDQ6itKVFMQhykPHyJAAYVN0RJrAde4rHDkWdf/4mzlyRd+26Usfj/J2YPa0UHHVwhJcG/68N2ENeyDI9xt0XdPZvRaKiTndLEGd0qg2z3gL+9vGJmfbBZah7D2WSgruj9N8FdXwD6VLKE2jaWpJARhYZkDEqaqQ+xQO/bm2rkEuP7KD8NjXQx1Nvdfu1k7YPhw7UJ848RrDo6RzefUiPDv47iCtTYmcTbxUWZll0bLdhw0qGz/D6odPnWX
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/yNkm2z1iHex9Z7d9cz9dFrlDA+p9GiTohTu1NgmQ45jK96FA2Yy3lBAGLfp?=
 =?us-ascii?Q?JpToyuhg/XH4gB60B+SLu4lQgcfQSP/xmSINE1K5/i6EphR7AjEw0iqSLNAU?=
 =?us-ascii?Q?xML0ln3Lg12MQvH+Ycbhm/jEofOdaxvInnJXZwpBSkN+mq63AUHhCe1KFMqG?=
 =?us-ascii?Q?gEqAmxsaJtPL0ho5i18EtlTR+bqILwMxGAAYvXtCFWwWyNL//5IXm9NXdKj4?=
 =?us-ascii?Q?ue169ufgiJJRJKGRPysVqIG5WtzBG0rN3XT/oOpy9L6+2JTyrtP+RyjK0wh4?=
 =?us-ascii?Q?UQeDEtuyinmlj7bynoE9K/KsS0t1sO4tAo6FzpBrhsd5FWbHDsNP14iTMa00?=
 =?us-ascii?Q?61iK+DXz69xwnj45CzqgQfDxkrpQbEIjKAv9gHxfp76E9gwnE/lmtEMsRhbe?=
 =?us-ascii?Q?QjtSB4/KvAv9kxOhI9Q5stIiMKXf5AW4ZYuKwanJH7GxQ+wbMArvis1Xoc/I?=
 =?us-ascii?Q?wWMKZ1kt1V/L8N56NLtAlRSW1MBIeDtb913fYHspEqEdaxmvHMuoe2QECjnN?=
 =?us-ascii?Q?hi4UbBvkdaw19uGDYfvemOBRFkQj1dXWlX+zkgqgfcR90JpQPv42IepNhslX?=
 =?us-ascii?Q?dDEOp9gO2KDdcUCSurFQxp9uuAZKDNifSSWShfhrkI/ADk8Fu5uqRS+Nb/G1?=
 =?us-ascii?Q?iEVC9z7raZH+Dpyb46W9zOOnxnKma/7PtxFAu8V1zewgVFDZgW0lBaqqnyGL?=
 =?us-ascii?Q?ZRA3FAATqMVsTZfxthECnA6QB+ocCAn+/4674peNVCUs5wnNfFr0gXXyXeJX?=
 =?us-ascii?Q?PVw8qWCBEo8qfhPOirEoyHSAsU54fOY1V5oioSokyd06DSQHcpKWdr+cwNLh?=
 =?us-ascii?Q?jESiK4TDiMQtwLONbkSChBVdg0j+vJGN38UOYoT1NwWjEhcDxvgtZHV/w+KL?=
 =?us-ascii?Q?c3W5U4HHxKrCQdgjVuHl1ACxH8sHcSOlK+wXy1ENEcEVQIzuRcIAu28YTn9f?=
 =?us-ascii?Q?dxhdENdzEr8Ny3ztY+10bw0fyTuM+nmoAuoQMnox9sQXdaRhBc0cVb4ef3qF?=
 =?us-ascii?Q?XCwy7uzzPxXwVAyREbNGPEGgrRRPEqvwrdIRiLixObzyUDeOvuR7TujFNQqP?=
 =?us-ascii?Q?Kq2M0AOAuDO/eYmBnBzmd4Jp3NQgJkUlFV+sETwHWX3OUKsuo+lKezgDL5t4?=
 =?us-ascii?Q?EeIgVylRUxegtyUhBHSspt+y968lMbkxwpcEtC6rZ08WMCSkBDGPBWRaHDj7?=
 =?us-ascii?Q?Zy2Rsjjamj8qpeWtp+EAl08lYfdLr80PJS5wldbCNKOfQ1JMaOf/VfDH6nPD?=
 =?us-ascii?Q?BqayGD3NF80Y4zLpWs+loYJz5JUMtqwjBTKys06EBI+nsSX1rhRjIl5iU9WI?=
 =?us-ascii?Q?9viY99jjgVVTt23yXVHFeFSb?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BADC844CE38CD04B96C08403D59FC516@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e747a52e-837e-46db-c0bb-08dcb9193fee
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:48:47.7206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1259
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

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for the switching between the Media and Function
keys on the touchbar by pressing the Fn key on Apple Internal Keyboard.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
drivers/hid/hid-appletb-kbd.c | 128 ++++++++++++++++++++++++++++++++++
1 file changed, 128 insertions(+)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index ecac68fc7..442c4d884 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -26,6 +26,8 @@
#define APPLETB_KBD_MODE_OFF	3
#define APPLETB_KBD_MODE_MAX	APPLETB_KBD_MODE_OFF

+#define APPLETB_DEVID_KEYBOARD	1
+
#define HID_USAGE_MODE		0x00ff0004

static int appletb_tb_def_mode =3D APPLETB_KBD_MODE_SPCL;
@@ -35,11 +37,18 @@ MODULE_PARM_DESC(mode, "Default touchbar mode:\n"
			 "    1 - function-keys\n"
			 "    [2] - special keys");

+static bool appletb_tb_fn_toggle =3D true;
+module_param_named(fntoggle, appletb_tb_fn_toggle, bool, 0644);
+MODULE_PARM_DESC(fntoggle, "Switch between Fn and media controls on pressi=
ng Fn key");
+
struct appletb_kbd {
	struct hid_field *mode_field;

	u8 saved_mode;
	u8 current_mode;
+	struct input_handler inp_handler;
+	struct input_handle kbd_handle;
+
};

static const struct key_entry appletb_kbd_keymap[] =3D {
@@ -172,6 +181,75 @@ static int appletb_kbd_hid_event(struct hid_device *hd=
ev, struct hid_field *fiel
	return kbd->current_mode =3D=3D APPLETB_KBD_MODE_OFF;
}

+static void appletb_kbd_inp_event(struct input_handle *handle, unsigned in=
t type,
+			      unsigned int code, int value)
+{
+	struct appletb_kbd *kbd =3D handle->private;
+
+	if (type =3D=3D EV_KEY && code =3D=3D KEY_FN && appletb_tb_fn_toggle) {
+		if (value =3D=3D 1) {
+			kbd->saved_mode =3D kbd->current_mode;
+			if (kbd->current_mode =3D=3D APPLETB_KBD_MODE_SPCL)
+				appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_FN);
+			else if (kbd->current_mode =3D=3D APPLETB_KBD_MODE_FN)
+				appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_SPCL);
+		} else if (value =3D=3D 0) {
+			if (kbd->saved_mode !=3D kbd->current_mode)
+				appletb_kbd_set_mode(kbd, kbd->saved_mode);
+		}
+	}
+}
+
+static int appletb_kbd_inp_connect(struct input_handler *handler,
+			       struct input_dev *dev,
+			       const struct input_device_id *id)
+{
+	struct appletb_kbd *kbd =3D handler->private;
+	struct input_handle *handle;
+	int rc;
+
+	if (id->driver_info =3D=3D APPLETB_DEVID_KEYBOARD) {
+		handle =3D &kbd->kbd_handle;
+		handle->name =3D "tbkbd";
+	} else {
+		return -ENOENT;
+	}
+
+	if (handle->dev)
+		return -EEXIST;
+
+	handle->open =3D 0;
+	handle->dev =3D input_get_device(dev);
+	handle->handler =3D handler;
+	handle->private =3D kbd;
+
+	rc =3D input_register_handle(handle);
+	if (rc)
+		goto err_free_dev;
+
+	rc =3D input_open_device(handle);
+	if (rc)
+		goto err_unregister_handle;
+
+	return 0;
+
+ err_unregister_handle:
+	input_unregister_handle(handle);
+ err_free_dev:
+	input_put_device(handle->dev);
+	handle->dev =3D NULL;
+	return rc;
+}
+
+static void appletb_kbd_inp_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+
+	input_put_device(handle->dev);
+	handle->dev =3D NULL;
+}
+
static int appletb_kbd_input_configured(struct hid_device *hdev, struct hid=
_input *hidinput)
{
	int idx;
@@ -196,6 +274,40 @@ static int appletb_kbd_input_configured(struct hid_dev=
ice *hdev, struct hid_inpu
	return 0;
}

+static const struct input_device_id appletb_kbd_input_devices[] =3D {
+	{
+		.flags =3D INPUT_DEVICE_ID_MATCH_BUS |
+			INPUT_DEVICE_ID_MATCH_VENDOR |
+			INPUT_DEVICE_ID_MATCH_KEYBIT,
+		.bustype =3D BUS_USB,
+		.vendor =3D USB_VENDOR_ID_APPLE,
+		.keybit =3D { [BIT_WORD(KEY_FN)] =3D BIT_MASK(KEY_FN) },
+		.driver_info =3D APPLETB_DEVID_KEYBOARD,
+	},
+	{ }
+};
+
+static bool appletb_kbd_match_internal_device(struct input_handler *handle=
r,
+					  struct input_dev *inp_dev)
+{
+	struct device *dev =3D &inp_dev->dev;
+
+	/* in kernel: dev && !is_usb_device(dev) */
+	while (dev && !(dev->type && dev->type->name &&
+			!strcmp(dev->type->name, "usb_device")))
+		dev =3D dev->parent;
+
+	/*
+	 * Apple labels all their internal keyboards and trackpads as such,
+	 * instead of maintaining an ever expanding list of product-id's we
+	 * just look at the device's product name.
+	 */
+	if (dev)
+		return !!strstr(to_usb_device(dev)->product, "Internal Keyboard");
+
+	return false;
+}
+
static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_devi=
ce_id *id)
{
	struct appletb_kbd *kbd;
@@ -228,6 +340,20 @@ static int appletb_kbd_probe(struct hid_device *hdev, =
const struct hid_device_id
		goto stop_hw;
	}

+	kbd->inp_handler.event =3D appletb_kbd_inp_event;
+	kbd->inp_handler.connect =3D appletb_kbd_inp_connect;
+	kbd->inp_handler.disconnect =3D appletb_kbd_inp_disconnect;
+	kbd->inp_handler.name =3D "appletb";
+	kbd->inp_handler.id_table =3D appletb_kbd_input_devices;
+	kbd->inp_handler.match =3D appletb_kbd_match_internal_device;
+	kbd->inp_handler.private =3D kbd;
+
+	ret =3D input_register_handler(&kbd->inp_handler);
+	if (ret) {
+		dev_err_probe(dev, ret, "Unable to register keyboard handler\n");
+		goto close_hw;
+	}
+
	ret =3D appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
	if (ret) {
		dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
@@ -251,6 +377,8 @@ static void appletb_kbd_remove(struct hid_device *hdev)

	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);

+	input_unregister_handler(&kbd->inp_handler);
+
	hid_hw_close(hdev);
	hid_hw_stop(hdev);
}
--=20
2.43.0

