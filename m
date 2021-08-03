Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F123DE86A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 10:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2E46E42C;
	Tue,  3 Aug 2021 08:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930BA6E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 08:27:30 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0BBC21CC5;
 Tue,  3 Aug 2021 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627979248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BthSGHx9hEuCwnm/5IfAqRuAVUrDc6D1eL+cHSnZh40=;
 b=u8hFDhGEYS+HRVGAzb8aF74OI9fw/qIWU9rO0WFVbb6hfZtVMmbNQ5slJ0yWnntZD1joIp
 Gz24ul2LQAQLoSFV93v5PzlwD4CZMRKaYhpJjJCFo9md80EGvhS6Rty7a4L4cJcxBDnS/c
 7vPkrFdXuGOiKOJ7ZxovR1hmAb+VNTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627979248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BthSGHx9hEuCwnm/5IfAqRuAVUrDc6D1eL+cHSnZh40=;
 b=ZnbO13S5F7fERe6zkk+OISkvADR/hy6uQqWw4K968cfVOGIIbgfp6cXEECXuzHp4eJEiM7
 W2++ni9WCxej9uDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 945E713709;
 Tue,  3 Aug 2021 08:27:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id IlzkIvD9CGGtbwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 08:27:28 +0000
Subject: Re: [PATCH] drm/vbox: Convert to Linux IRQ interfaces
To: Hans de Goede <hdegoede@redhat.com>, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20210706075011.9009-1-tzimmermann@suse.de>
 <12fb7f27-0e1c-5f35-ca2e-5a34e7977f80@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2708433e-c902-1117-22d6-21bf20160848@suse.de>
Date: Tue, 3 Aug 2021 10:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <12fb7f27-0e1c-5f35-ca2e-5a34e7977f80@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6UKuVvPL20h1J8GATJKKBkJBsfb7KUxvO"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6UKuVvPL20h1J8GATJKKBkJBsfb7KUxvO
Content-Type: multipart/mixed; boundary="ZMXhwszr9QuRo8wVou1DXbwOOH0QfkzCS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2708433e-c902-1117-22d6-21bf20160848@suse.de>
Subject: Re: [PATCH] drm/vbox: Convert to Linux IRQ interfaces
References: <20210706075011.9009-1-tzimmermann@suse.de>
 <12fb7f27-0e1c-5f35-ca2e-5a34e7977f80@redhat.com>
In-Reply-To: <12fb7f27-0e1c-5f35-ca2e-5a34e7977f80@redhat.com>

--ZMXhwszr9QuRo8wVou1DXbwOOH0QfkzCS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.08.21 um 13:52 schrieb Hans de Goede:
> Hi,
>=20
> On 7/6/21 9:50 AM, Thomas Zimmermann wrote:
>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>> don't benefit from using it.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Thanks, patch looks good to me:
>=20
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>=20
> And to make sure things don't regress I've also given this a test spin:=

>=20
> Tested-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Note I assume that you will push this out do drmi-misc yourself
> (if you've not done so already given that this patch is somewhat old).

Although it's been merged already, thanks for testing the patch.

Best regards
Thomas

>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
>> ---
>>   drivers/gpu/drm/vboxvideo/vbox_drv.c |  1 -
>>   drivers/gpu/drm/vboxvideo/vbox_drv.h |  1 -
>>   drivers/gpu/drm/vboxvideo/vbox_irq.c | 16 +++++++++++-----
>>   3 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vb=
oxvideo/vbox_drv.c
>> index 879a2445cc44..2b81cb259d23 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> @@ -184,7 +184,6 @@ static const struct drm_driver driver =3D {
>>   	.lastclose =3D drm_fb_helper_lastclose,
>>  =20
>>   	.fops =3D &vbox_fops,
>> -	.irq_handler =3D vbox_irq_handler,
>>   	.name =3D DRIVER_NAME,
>>   	.desc =3D DRIVER_DESC,
>>   	.date =3D DRIVER_DATE,
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vb=
oxvideo/vbox_drv.h
>> index ac7c2effc46f..4903b91d7fe4 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
>> @@ -145,7 +145,6 @@ void vbox_mm_fini(struct vbox_private *vbox);
>>   int vbox_irq_init(struct vbox_private *vbox);
>>   void vbox_irq_fini(struct vbox_private *vbox);
>>   void vbox_report_hotplug(struct vbox_private *vbox);
>> -irqreturn_t vbox_irq_handler(int irq, void *arg);
>>  =20
>>   /* vbox_hgsmi.c */
>>   void *hgsmi_buffer_alloc(struct gen_pool *guest_pool, size_t size,
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vb=
oxvideo/vbox_irq.c
>> index b3ded68603ba..903a6c48ee8b 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
>> @@ -10,7 +10,8 @@
>>    */
>>  =20
>>   #include <linux/pci.h>
>> -#include <drm/drm_irq.h>
>> +
>> +#include <drm/drm_drv.h>
>>   #include <drm/drm_probe_helper.h>
>>  =20
>>   #include "vbox_drv.h"
>> @@ -31,7 +32,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
>>   	schedule_work(&vbox->hotplug_work);
>>   }
>>  =20
>> -irqreturn_t vbox_irq_handler(int irq, void *arg)
>> +static irqreturn_t vbox_irq_handler(int irq, void *arg)
>>   {
>>   	struct drm_device *dev =3D (struct drm_device *)arg;
>>   	struct vbox_private *vbox =3D to_vbox_dev(dev);
>> @@ -170,16 +171,21 @@ static void vbox_hotplug_worker(struct work_stru=
ct *work)
>>  =20
>>   int vbox_irq_init(struct vbox_private *vbox)
>>   {
>> -	struct pci_dev *pdev =3D to_pci_dev(vbox->ddev.dev);
>> +	struct drm_device *dev =3D &vbox->ddev;
>> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>>  =20
>>   	INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
>>   	vbox_update_mode_hints(vbox);
>>  =20
>> -	return drm_irq_install(&vbox->ddev, pdev->irq);
>> +	/* PCI devices require shared interrupts. */
>> +	return request_irq(pdev->irq, vbox_irq_handler, IRQF_SHARED, dev->dr=
iver->name, dev);
>>   }
>>  =20
>>   void vbox_irq_fini(struct vbox_private *vbox)
>>   {
>> -	drm_irq_uninstall(&vbox->ddev);
>> +	struct drm_device *dev =3D &vbox->ddev;
>> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>> +
>> +	free_irq(pdev->irq, dev);
>>   	flush_work(&vbox->hotplug_work);
>>   }
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZMXhwszr9QuRo8wVou1DXbwOOH0QfkzCS--

--6UKuVvPL20h1J8GATJKKBkJBsfb7KUxvO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEI/e8FAwAAAAAACgkQlh/E3EQov+BP
hA//WfN8TwD+5FwoV4OvqoJlXVqiUzM3Dx+hLYB5MrFX9hzK5IjJqAIw0VoISYxBsCWEcYJ458n2
IhdxAxVSFaK9gVB+zlKvoY42w14ysU3MkCxB3/AWe5SK0zfxZknZQnyk85SZgkdm9g8VCU7Vvjpu
5zPEtQgRkMa61T56zTxaQSsf1LRQt5bpNl3TfoX4VE5qzMs5UsZX6vWDLbzN3kl6jBA/tC92eM6D
Umx4bSnmSBGZvuqrrPNDIeuHfQUG+livz4eNWNs2qvKQuE8avQNafzSSpV8HcX78ONgFf9fzK3Zf
rgGmF0IGiycraYVuzT+cKH/YO033wqRzBEB5CFyHAdthOpVWFL//tcUwlynJSAEOFrBcWjwcOMUR
iR1+GM9S0gz3PRZgz5e1TBK6B6hQ8RyEnRSKqv3IgGOt+FV/AeoL1b28SpuRsICG26hpp8D4MrO9
7bOnE2r6h0l/KNhw503cZVpLxrZZ2QwAboVdE9V8CAnqD4GDuuoYFeHr9z487C1/2tvF81Sl/qp1
TiigIoA5n3R/iQ6H48K1vW9usn6oMMLmqshnX1vQC6AJeKXXicWq/Wxask8HoSLUmqXVAhcHc2sD
jD+4KgWeu5UYiaJPoHn9seDNmH10/ava7q0M6tJoItoSTFPJWjtz1x0Upyw5Hk6Ir7vXSyyrOSPz
YwE=
=1+yd
-----END PGP SIGNATURE-----

--6UKuVvPL20h1J8GATJKKBkJBsfb7KUxvO--
