Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD213211C0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 09:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5F6E90C;
	Mon, 22 Feb 2021 08:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AA76E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:07:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FF14AF59;
 Mon, 22 Feb 2021 08:07:46 +0000 (UTC)
Subject: Re: [PATCH] efifb: Ensure graphics device for efifb stays at PCI D0
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, pjones@redhat.com
References: <20210129084327.986630-1-kai.heng.feng@canonical.com>
 <CADnq5_MduzcezmAjEGK0X7bDiY98f68s8roXc6gOTWjcpNC9Rw@mail.gmail.com>
 <CAAd53p4y+A5Bv4nUKZw+kzrmxcYm8DXrY06QqkU4iopj0dRrzw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5f2dfeb9-7600-2426-bd50-0da48eb72b5f@suse.de>
Date: Mon, 22 Feb 2021 09:07:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAAd53p4y+A5Bv4nUKZw+kzrmxcYm8DXrY06QqkU4iopj0dRrzw@mail.gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0509205589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0509205589==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kkjvE4ePNJC9ui3YvsjoIitrxUNRBbqUE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kkjvE4ePNJC9ui3YvsjoIitrxUNRBbqUE
Content-Type: multipart/mixed; boundary="Wrd47MzSapqF5RXxa0t5fv0RaF2SAKqli";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, pjones@redhat.com
Cc: Alex Deucher <alexdeucher@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Message-ID: <5f2dfeb9-7600-2426-bd50-0da48eb72b5f@suse.de>
Subject: Re: [PATCH] efifb: Ensure graphics device for efifb stays at PCI D0
References: <20210129084327.986630-1-kai.heng.feng@canonical.com>
 <CADnq5_MduzcezmAjEGK0X7bDiY98f68s8roXc6gOTWjcpNC9Rw@mail.gmail.com>
 <CAAd53p4y+A5Bv4nUKZw+kzrmxcYm8DXrY06QqkU4iopj0dRrzw@mail.gmail.com>
In-Reply-To: <CAAd53p4y+A5Bv4nUKZw+kzrmxcYm8DXrY06QqkU4iopj0dRrzw@mail.gmail.com>

--Wrd47MzSapqF5RXxa0t5fv0RaF2SAKqli
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.02.21 um 08:08 schrieb Kai-Heng Feng:
> On Mon, Feb 1, 2021 at 11:21 PM Alex Deucher <alexdeucher@gmail.com> wr=
ote:
>>
>> On Sat, Jan 30, 2021 at 6:27 AM Kai-Heng Feng
>> <kai.heng.feng@canonical.com> wrote:
>>>
>>> We are seeing root ports on some desktop boards support D3cold for
>>> discrete graphics card. So when efifb is in use while graphics device=

>>> isn't bound to a driver, PCI and ACPI will put the graphics to D3cold=

>>> when runtime suspend kicks in, makes efifb stop working.
>>>
>>> So ensure the graphics device won't be runtime suspended, to keep efi=
fb
>>> work all the time.
>>>
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>=20
> A gentle ping...

Thanks for your patch. I've added it to drm-misc-next.

Best regards
Thomas

>=20
>>
>>> ---
>>>   drivers/video/fbdev/efifb.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.=
c
>>> index e57c00824965..19edd7206409 100644
>>> --- a/drivers/video/fbdev/efifb.c
>>> +++ b/drivers/video/fbdev/efifb.c
>>> @@ -16,6 +16,7 @@
>>>   #include <linux/platform_device.h>
>>>   #include <linux/printk.h>
>>>   #include <linux/screen_info.h>
>>> +#include <linux/pm_runtime.h>
>>>   #include <video/vga.h>
>>>   #include <asm/efi.h>
>>>   #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk *=
/
>>> @@ -575,6 +576,7 @@ static int efifb_probe(struct platform_device *de=
v)
>>>                  goto err_fb_dealoc;
>>>          }
>>>          fb_info(info, "%s frame buffer device\n", info->fix.id);
>>> +       pm_runtime_get_sync(&efifb_pci_dev->dev);
>>>          return 0;
>>>
>>>   err_fb_dealoc:
>>> @@ -601,6 +603,7 @@ static int efifb_remove(struct platform_device *p=
dev)
>>>          unregister_framebuffer(info);
>>>          sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
>>>          framebuffer_release(info);
>>> +       pm_runtime_put(&efifb_pci_dev->dev);
>>>
>>>          return 0;
>>>   }
>>> --
>>> 2.29.2
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Wrd47MzSapqF5RXxa0t5fv0RaF2SAKqli--

--kkjvE4ePNJC9ui3YvsjoIitrxUNRBbqUE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAzZlEFAwAAAAAACgkQlh/E3EQov+AM
pQ/+MQ9+NdTxfIS42DvbIjnne9Iax9MelwpXPZMiQiElOdu1sw6c+Ufzi6RONQZqonDvK07vRbAB
tyZwAkVTamrANyvZomtbVAWb4WVK1DdB939sB8UwA+PY6GPT/QIbFGJkoOfdvy3Frk6kf8cqq0Nk
CjipsDVkztfkwL2xRDd4Vg4vIVMsYTgVHBhszqCMGSDzDvLqcm44V2gyiV7Vg8MKwFmKVo/L8z3P
80OdFptq1JtxfvHYAau0r/wM5LyGDeSeisuSs30GSDHT9P4lZ+FbqLhK/xTWJm316CXgMtk2OA4f
5LyqN9OyAIXxSXylGtxoijZJExXltcub8tHNDZW3sESh4E1WJbVSU6SgpPwHWLuBStsZVYoHC4KO
N0w+MNSjXY2reoOmAuGyjL6kiWJYzS8B4LNrbyI8X+fV8nV7GBFfGqW7CKC3fkPRa0eXabX8UDYi
9MUN2TU3Ana6jObm7anUEYHuxNFv3U9Uka7mF2cRwXszt5evBNt3n6QKxgFO/UWM2P1GAaX1tAdJ
Ob3xax9W9/wtM2ZyH9FabbISS3aOwFdMz9QyJ3hWFPpcx21jK1AhovTTqV5L9SqMw8SdxCK0zX5K
LY9LSFAAmuMfnHKRcyj57Ohg4tYyHmbpVbYH3Qa6WrRQZELl7zUnRg1PYpW6TuuE0/FzuW7Q63ts
rAs=
=astH
-----END PGP SIGNATURE-----

--kkjvE4ePNJC9ui3YvsjoIitrxUNRBbqUE--

--===============0509205589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0509205589==--
