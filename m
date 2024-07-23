Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF2493A820
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 22:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20EF10E63B;
	Tue, 23 Jul 2024 20:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="aDkERYYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CCC10E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 20:40:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B40A81C0082; Tue, 23 Jul 2024 22:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1721767222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2lmDziFDG1E3p7WXaQzsGVZaJLIhUDMeOm4Q/kkov4=;
 b=aDkERYYtSquWM8b0tbPVSelMQpEHXVvIlJZNncTa/baHMTgY84w2fQZZO4XUI8dninlXP8
 AOup+FW5GpJL+eJkDKZSnQIqD7csWQP7IHLmG8hlgBSTsC9gZvx9eMwlmWaFAnBV054Nwc
 xZs2NeRbDV603butZK8QX+b1Sap5Ubc=
Date: Tue, 23 Jul 2024 22:40:22 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Keybaords with arrays of RGB LEDs was Re: Future handling of complex
 RGB devices on Linux v2
Message-ID: <ZqAVNmyFOEmR0Ilr@duo.ucw.cz>
References: <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz> <20240222110457.71618f27@eldfell>
 <ZdeGiMf2npmzJidU@duo.ucw.cz> <20240223105328.38d3f8da@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="xGaUGIAiUu9bGTpI"
Content-Disposition: inline
In-Reply-To: <20240223105328.38d3f8da@eldfell>
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


--xGaUGIAiUu9bGTpI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

So... I got two gaming keyboards. One is totally unusable (and it
looks LEDs are not controllable from the host), and the second one is
=2E. HyperX Elite RGB. Needs 2 USB connections, very buggy, probably
needs repair, and I'd not recomend it to anyone. But that one seems to
be usable for RGB keyboard development.

(Unusable one is
https://www.trust.com/en/product/23651-gxt-835-azor-illuminated-gaming-keyb=
oard
Usable one is
0951:16be Kingston Technology HyperX Alloy Elite RGB
)

First step is to create some kind of driver, I believe. And I did
that, userland version works quite good, and I started hacking kernel
one. Version is below, and help would be welcome. Especially if
someone knows how to do the probing right (it binds 3 times, log
below). What is worse, loading this driver kills keyboard
functionality -- input is no longer possible. Is there simple way to
keep that functionality?

Best regards,
								Pavel

[ 9880.950973] input: HyperX Alloy Elite RGB HyperX Alloy Elite RGB System =
Control as /devices/p
ci0000:00/0000:00:1d.0/usb1/1-1/1-1:1.2/0003:0951:16BE.0045/input/input216
[ 9881.009994] input: HyperX Alloy Elite RGB HyperX Alloy Elite RGB Consume=
r Control as /devices/pci0000:00/0000:00:1d.0/usb1/1-1/1-1:1.2/0003:0951:16=
BE.0045/input/input217
[ 9881.013758] input: HyperX Alloy Elite RGB HyperX Alloy Elite RGB Keyboar=
d as /devices/pci0000:00/0000:00:1d.0/usb1/1-1/1-1:1.2/0003:0951:16BE.0045/=
input/input219
[ 9881.014528] hid-generic 0003:0951:16BE.0045: input,hiddev96,hidraw2: USB=
 HID v1.11 Mouse [HyperX Alloy Elite RGB HyperX Alloy Elite RGB] on usb-000=
0:00:1d.0-1/input2
[ 9886.017646] input: HyperX Alloy Elite RGB HyperX Alloy Elite RGB as /dev=
ices/pci0000:00/0000:00:1d.0/usb1/1-1/1-1:1.0/0003:0951:16BE.0043/input/inp=
ut221
[ 9886.218066] hx 0003:0951:16BE.0043: input,hidraw0: USB HID v1.11 Keyboar=
d [HyperX Alloy Elite RGB HyperX Alloy Elite RGB] on usb-0000:00:1d.0-1/inp=
ut0
[ 9886.218088] Have device.
=2E..
[ 9899.399088] input: HyperX Alloy Elite RGB HyperX Alloy Elite RGB as /dev=
ices/pci0000:00/0000:00:1d.0/usb1/1-1/1-1:1.1/0003:0951:16BE.0044/input/inp=
ut222
[ 9899.537173] hx 0003:0951:16BE.0044: input,hidraw1: USB HID v1.11 Keyboar=
d [HyperX Alloy Elite RGB HyperX Alloy Elite RGB] on usb-0000:00:1d.0-1/inp=
ut1
[ 9899.537194] Have device.
=2E..
[ 9912.691800] input: HyperX Alloy Elite RGB HyperX Alloy Elite RGB as /dev=
ices/pci0000:00/0000:
00:1d.0/usb1/1-1/1-1:1.2/0003:0951:16BE.0045/input/input223
[ 9912.751478] hx 0003:0951:16BE.0045: input,hiddev96,hidraw2: USB HID v1.1=
1 Mouse [HyperX Alloy
 Elite RGB HyperX Alloy Elite RGB] on usb-0000:00:1d.0-1/input2
[ 9912.751502] Have device.


// SPDX-License-Identifier: GPL-2.0-or-later
/*
 */

#include <linux/device.h>
#include <linux/input.h>
#include <linux/hid.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/hid-roccat.h>
#include <linux/usb.h>

struct hx_device {};

static unsigned char keys[] =3D {
	0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x=
14,
	0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x20, 0x21, 0x=
22,
	0x23, 0x24, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x=
30,
	0x31, 0x32, 0x33, 0x34, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3E, 0x3F, 0x=
41,
	0x44, 0x45, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x51, 0x54, 0x=
55,
	0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5E, 0x5F, 0x61, 0x64, 0x65, 0x68, 0x69, 0x=
6A,
	0x6B, 0x6C, 0x6E, 0x6F, 0x74, 0x75, 0x78, 0x79, 0x7A, 0x7B, 0x7C, 0x7D, 0x=
7E,
	0x7F, 0x81, 0x84, 0x85, 0x88, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E, 0x8F, 0x=
91,
	0x94, 0x95 };

struct hid_device *one_hdev;

static int set_direct_color(struct hid_device *hdev, int color, int val)
{
	const int s =3D 264;
	unsigned char *buf =3D kmalloc(s, GFP_KERNEL);
	int i, ret;

	/* Zero out buffer */
	memset(buf, 0x00, s);

	/* Set up Direct packet */
	for (i =3D 0; i < sizeof(keys)/sizeof(keys[0]); i++) {
		buf[keys[i]] =3D val;
	}

	buf[0x00] =3D 0x07;
	buf[0x01] =3D 0x16; // HYPERX_ALLOY_ELITE_PACKET_ID_DIRECT
	buf[0x02] =3D color; // HYPERX_ALLOY_ELITE_COLOR_CHANNEL_GREEN
	buf[0x03] =3D 0xA0;

	ret =3D hid_hw_power(hdev, PM_HINT_FULLON);
	if (ret) {
		hid_err(hdev, "Failed to power on HID device\n");
		return ret;
	}

	// ioctl(3, HIDIOCSFEATURE(264), 0xbfce5974) =3D 264
	// -> hidraw_send_report(file, user_arg, len, HID_FEATURE_REPORT);
	//
	printk(KERN_INFO "Set feature report -- direct\n");
	i =3D hid_hw_raw_request(hdev, buf[0], buf, s, HID_FEATURE_REPORT, HID_REQ=
_SET_REPORT);
	printk("raw: %d, einval %d, eagain %d\n", i, -EINVAL, -EAGAIN);
	msleep(100);
	return 0;
}

#define SIZE 128
const int real_size =3D SIZE;

static ssize_t hx_sysfs_read(struct file *fp, struct kobject *kobj,
			       struct bin_attribute * b,
			      char *buf, loff_t off, size_t count)
{
	struct device *dev =3D kobj_to_dev(kobj);
	struct hx_device *hx =3D hid_get_drvdata(dev_get_drvdata(dev));
	struct usb_device *usb_dev =3D interface_to_usbdev(to_usb_interface(dev));
	int retval;

	if (off >=3D real_size)
		return 0;

	if (off !=3D 0 || count !=3D real_size)
		return -EINVAL;
=09
	printk("read\n");
	set_direct_color(one_hdev, 2, 0xff);

	return retval ? retval : real_size;
}

static ssize_t hx_sysfs_write(struct file *fp, struct kobject *kobj,
			       struct bin_attribute * b,
		void const *buf, loff_t off, size_t count)
{
	struct device *dev =3D kobj_to_dev(kobj);
	struct hx_device *hx =3D hid_get_drvdata(dev_get_drvdata(dev));
	struct usb_device *usb_dev =3D interface_to_usbdev(to_usb_interface(dev));
	int retval;

	if (off !=3D 0 || count !=3D real_size)
		return -EINVAL;

	printk("Write\n");

	return retval ? retval : real_size;
}

static struct bin_attribute hx_control_attr =3D { \
  .attr =3D { .name =3D "thingy", .mode =3D 0660 },		\
	.size =3D SIZE, \
	.read =3D hx_sysfs_read, \
};

static int hx_create_sysfs_attributes(struct usb_interface *intf)
{
  return sysfs_create_bin_file(&intf->dev.kobj, &hx_control_attr);
}

static void hx_remove_sysfs_attributes(struct usb_interface *intf)
{
  sysfs_remove_bin_file(&intf->dev.kobj, &hx_control_attr);
}

static int hx_init_hx_device_struct(struct usb_device *usb_dev,
		struct hx_device *hx)
{
	//mutex_init(&hx->hx_lock);
	return 0;
}

static int hx_init_specials(struct hid_device *hdev)
{
	struct usb_interface *intf =3D to_usb_interface(hdev->dev.parent);
	struct usb_device *usb_dev =3D interface_to_usbdev(intf);
	struct hx_device *hx;
	int retval;

	hx =3D kzalloc(sizeof(*hx), GFP_KERNEL);
	if (!hx) {
		hid_err(hdev, "can't alloc device descriptor\n");
		return -ENOMEM;
	}
	hid_set_drvdata(hdev, hx);

	retval =3D hx_create_sysfs_attributes(intf);
	if (retval) {
		hid_err(hdev, "cannot create sysfs files\n");
		goto exit;
	}

	return 0;
exit:
	kfree(hx);
	return retval;
}

static void hx_remove_specials(struct hid_device *hdev)
{
	struct usb_interface *intf =3D to_usb_interface(hdev->dev.parent);
	struct hx_device *hx;

	hx_remove_sysfs_attributes(intf);

	hx =3D hid_get_drvdata(hdev);
	kfree(hx);
}

static int num;

static int hx_probe(struct hid_device *hdev,
		const struct hid_device_id *id)
{
	int retval;

	if (!hid_is_usb(hdev))
		return -EINVAL;

	if (++num !=3D 2)
		return -EINVAL;

	retval =3D hid_parse(hdev);
	if (retval) {
		hid_err(hdev, "parse failed\n");
		goto exit;
	}

	retval =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
	if (retval) {
		hid_err(hdev, "hw start failed\n");
		goto exit;
	}

	printk("Have device.\n");

	if (!hid_is_usb(hdev)) {
		printk("Not an usb?\n");
	}

	{
		struct usb_interface *interface =3D to_usb_interface(hdev->dev.parent);
		struct usb_device *dev =3D interface_to_usbdev(interface);
		struct usb_host_interface *iface_desc;
		struct usb_endpoint_descriptor *endpoint;
		char manufacturer[128];
		char product[128];

		// Retrieve manufacturer string
		retval =3D usb_string(dev, dev->descriptor.iManufacturer, manufacturer, s=
izeof(manufacturer));
		if (retval > 0)
			printk(KERN_INFO "Manufacturer: %s\n", manufacturer);
		else
			printk(KERN_ERR "Failed to get manufacturer string\n");

		// Retrieve product string
		retval =3D usb_string(dev, dev->descriptor.iProduct, product, sizeof(prod=
uct));
		if (retval > 0)
			printk(KERN_INFO "Product: %s\n", product);
		else
			printk(KERN_ERR "Failed to get product string\n");

	}

	retval =3D hx_init_specials(hdev);
	if (retval) {
		hid_err(hdev, "couldn't install mouse\n");
		goto exit_stop;
	}

	// Example call to set_direct_color function
	for (int i=3D0; i<20; i++) {
		set_direct_color(hdev, 0x01, 0); // Example values
		set_direct_color(hdev, 0x02, 0); // Example values
		set_direct_color(hdev, 0x03, 0); // Example values
		set_direct_color(hdev, 0x01, 0xFF); // Example values
		set_direct_color(hdev, 0x02, 0xFF); // Example values
		set_direct_color(hdev, 0x03, 0xFF); // Example values
	}
	one_hdev =3D hdev;
	return 0;

exit_stop:
	hid_hw_stop(hdev);
exit:
	return retval;
}

static void hx_remove(struct hid_device *hdev)
{
	hx_remove_specials(hdev);
	hid_hw_stop(hdev);
}

static const struct hid_device_id hx_devices[] =3D {
	{ HID_USB_DEVICE(0x0951, 0x16be) },
	{ }
};

MODULE_DEVICE_TABLE(hid, hx_devices);

static struct hid_driver hx_driver =3D {
	.name =3D "hx",
	.id_table =3D hx_devices,
	.probe =3D hx_probe,
	.remove =3D hx_remove
};
module_hid_driver(hx_driver);

MODULE_AUTHOR("Pavel Machek");
MODULE_DESCRIPTION("USB HyperX elite backlight driver");
MODULE_LICENSE("GPL v2");


--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--xGaUGIAiUu9bGTpI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZqAVNgAKCRAw5/Bqldv6
8vNZAJ9mm9swPzCB8WhiJQ8Vz27+2W/IgwCeN8iIbsvN79M16ZDXh9gsM7p7aSA=
=g3Jk
-----END PGP SIGNATURE-----

--xGaUGIAiUu9bGTpI--
