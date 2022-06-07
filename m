Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B9D53FFA8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 15:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A510EE78;
	Tue,  7 Jun 2022 13:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 13:06:22 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AC710EE6F;
 Tue,  7 Jun 2022 13:06:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LHVpK6Ftcz4xD9;
 Tue,  7 Jun 2022 23:00:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1654606844;
 bh=mWFx87zXWLQDl7q7jrVe29eZihP1nivqaWchBWxV+Rk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ojcvXYrpYzRmGHGW/m7vcIq75WnW8Oqw6iR2ee4yxHgqSvO8fht8hguK/iU/G5gou
 hp8ShO1H0BWVarvP0ufdm8gVevr02sxgtZaEg/VugOnVHwTfyItvOOptOxzA5a5QN5
 70RwZbQo6QeTOx0zltYRI7BI0X9E1dQeWW86Lj6J3FCdEWAHmLzg9ylDHKTghZ52O1
 GueKlc+A8eQRa2z/t1J5x1if8edVC6DG/8suvhgc0hHJUfq0rvkRW3anshJlsil47N
 5i2ukl83fDFhfSZssAREgM2JCKA+bYlQGRFIwTWVqdZ0P1wBHTFoxtpZZMz0+AYym3
 DMEv2rntl+nOQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lyude Paul <lyude@redhat.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/nouveau/bios: Rename prom_init() and friends
 functions
In-Reply-To: <f6e72c6e6d9ae9019ad675081493372f745cbbf5.camel@redhat.com>
References: <7e0612b61511ec8030e3b2dcbfaa7751781c8b91.1647684507.git.christophe.leroy@csgroup.eu>
 <f6e72c6e6d9ae9019ad675081493372f745cbbf5.camel@redhat.com>
Date: Tue, 07 Jun 2022 23:00:41 +1000
Message-ID: <8735ggeih2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude Paul <lyude@redhat.com> writes:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will push to drm-misc-next

I don't see this patch in mainline or drm-misc-next, did it get lost?

cheers

> On Sat, 2022-03-19 at 11:27 +0100, Christophe Leroy wrote:
>> While working at fixing powerpc headers, I ended up with the
>> following error.
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/nouveau/=
nvkm/subdev/bios/shadowrom.c:48:1: error:
>> conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *, const
>> char *)'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0make[5]: *** [scripts/Ma=
kefile.build:288:
>> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1
>>=20
>> powerpc and a few other architectures have a prom_init() global function.
>> One day or another it will conflict with the one in shadowrom.c
>>=20
>> Those being static, they can easily be renamed. Do it.
>>=20
>> While at it, also rename the ops structure as 'nvbios_prom' instead of
>> 'nvbios_rom' in order to make it clear that it refers to the
>> NV_PROM device.
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: using nvbios_prom prefix instead of nvbios_rom. Changed structure na=
me
>> to keep things consistant.
>>=20
>> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 +-
>> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c=C2=A0 |=C2=A0 2 =
+-
>> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c=C2=A0=C2=A0 | 14 =
+++++++-------
>> =C2=A03 files changed, 9 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
>> index fac1bff1311b..cfa8a0c356dd 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h
>> @@ -19,7 +19,7 @@ struct nvbios_source {
>> =C2=A0int nvbios_extend(struct nvkm_bios *, u32 length);
>> =C2=A0int nvbios_shadow(struct nvkm_bios *);
>> =C2=A0
>> -extern const struct nvbios_source nvbios_rom;
>> +extern const struct nvbios_source nvbios_prom;
>> =C2=A0extern const struct nvbios_source nvbios_ramin;
>> =C2=A0extern const struct nvbios_source nvbios_acpi_fast;
>> =C2=A0extern const struct nvbios_source nvbios_acpi_slow;
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
>> index 4b571cc6bc70..19188683c8fc 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
>> @@ -171,7 +171,7 @@ nvbios_shadow(struct nvkm_bios *bios)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct shadow mthds[] =
=3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0{ 0, &nvbios_of },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0{ 0, &nvbios_ramin },
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0{ 0, &nvbios_rom },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0{ 0, &nvbios_prom },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0{ 0, &nvbios_acpi_fast },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0{ 4, &nvbios_acpi_slow },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0{ 1, &nvbios_pcirom },
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
>> index ffa4b395220a..39144ceb117b 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
>> @@ -25,7 +25,7 @@
>> =C2=A0#include <subdev/pci.h>
>> =C2=A0
>> =C2=A0static u32
>> -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
>> +nvbios_prom_read(void *data, u32 offset, u32 length, struct nvkm_bios
>> *bios)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_device *devi=
ce =3D data;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 i;
>> @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct
>> nvkm_bios *bios)
>> =C2=A0}
>> =C2=A0
>> =C2=A0static void
>> -prom_fini(void *data)
>> +nvbios_prom_fini(void *data)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_device *devi=
ce =3D data;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvkm_pci_rom_shadow(devi=
ce->pci, true);
>> =C2=A0}
>> =C2=A0
>> =C2=A0static void *
>> -prom_init(struct nvkm_bios *bios, const char *name)
>> +nvbios_prom_init(struct nvkm_bios *bios, const char *name)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct nvkm_device *devi=
ce =3D bios->subdev.device;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (device->card_type =
=3D=3D NV_40 && device->chipset >=3D 0x4c)
>> @@ -55,10 +55,10 @@ prom_init(struct nvkm_bios *bios, const char *name)
>> =C2=A0}
>> =C2=A0
>> =C2=A0const struct nvbios_source
>> -nvbios_rom =3D {
>> +nvbios_prom =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "PROM",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.init =3D prom_init,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fini =3D prom_fini,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read =3D prom_read,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.init =3D nvbios_prom_init,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fini =3D nvbios_prom_fini,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read =3D nvbios_prom_read,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.rw =3D false,
>> =C2=A0};
>
> --=20
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
