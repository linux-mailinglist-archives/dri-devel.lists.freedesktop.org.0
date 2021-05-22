Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F7638D3CD
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 07:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9B86E030;
	Sat, 22 May 2021 05:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057AA6E030
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 05:14:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621660467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fE0DYmrm9SxpZYdTHC8iCMREL4dmAA5TTbNe80rzyKI=;
 b=dyswBoL09pf/e3t8Xn6tbAtVB2GFnAELtpQwp9alptrlr+Q8uaitdfYjXHS+9zTkR5aa/V
 /zqkwMAeNqRLKZMsc79az2riu5QknFBLNbdDQ4l6JWbPiMNqyelW4Gwm4Qz5gzx8lYAat3
 UexIb4asXmRFPcZxyyCCDXi/b2Y8R6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621660467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fE0DYmrm9SxpZYdTHC8iCMREL4dmAA5TTbNe80rzyKI=;
 b=oZpTW1j1zGwpEeSEuClOLupKR40dJykDS3YZ0DHQNmN43SqmUnOQucMJB4LXRABGIEfg7w
 +Kjygicj77dnJCDQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B63DAAFD;
 Sat, 22 May 2021 05:14:27 +0000 (UTC)
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20210521193704.3042024-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
Message-ID: <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
Date: Sat, 22 May 2021 07:14:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521193704.3042024-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1"
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1
Content-Type: multipart/mixed; boundary="IkKD6gurUFm5U0BsW26VqMVD5IckojXuq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
Subject: Re: [PATCH 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
References: <20210521193704.3042024-1-javierm@redhat.com>
In-Reply-To: <20210521193704.3042024-1-javierm@redhat.com>

--IkKD6gurUFm5U0BsW26VqMVD5IckojXuq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.05.21 um 21:37 schrieb Javier Martinez Canillas:
> The register_gop_device() function registers an "efi-framebuffer" platf=
orm
> device to match against the efifb driver, to have an early framebuffer =
for
> EFI platforms.
>=20
> But the Generic System Framebuffers (sysfb) already has support for thi=
s.
>=20
> Instead of having duplicated logic for x86 and other architectures usin=
g
> EFI, consolidate the two in sysfb and remove it from the EFI init logic=
=2E
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>   arch/arm/Kconfig                  |  1 +
>   arch/arm/include/asm/efi.h        |  5 +-
>   arch/arm64/Kconfig                |  1 +
>   arch/arm64/include/asm/efi.h      |  5 +-
>   arch/riscv/Kconfig                |  1 +
>   arch/riscv/include/asm/efi.h      |  5 +-
>   drivers/firmware/Kconfig          |  7 ++-
>   drivers/firmware/Makefile         |  2 +-
>   drivers/firmware/efi/efi-init.c   | 90 ------------------------------=
-
>   drivers/firmware/efi/sysfb_efi.c  | 77 +++++++++++++++++++++++++-
>   drivers/firmware/sysfb.c          | 40 +++++++++-----
>   drivers/firmware/sysfb_simplefb.c | 29 ++++++----
>   include/linux/sysfb.h             | 28 +++++-----
>   13 files changed, 145 insertions(+), 146 deletions(-)
>=20
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24804f11302..30ba195ca72 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -127,6 +127,7 @@ config ARM
>   	select PERF_USE_VMALLOC
>   	select RTC_LIB
>   	select SET_FS
> +	select SYSFB

Don't select this as part of the architecture. Rather make an option for =

SYSFB that depends in the architectures that supports it.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IkKD6gurUFm5U0BsW26VqMVD5IckojXuq--

--JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCokzEFAwAAAAAACgkQlh/E3EQov+Am
OQ//Qi8H2p0Hk15vY3ajQsg465AoKPe35Vm5k/maVXwrOTqvV2TpRdL3IAy5IOhvaV9VPsbibLLk
JDP7fvy1loqvwPGA5iiSfANQIqTEtlFySY7OZx5QFXV+Sl9Cp5Y4fJ3pl+GY0IzcbvMeWsiEet8h
OdQfvHc/aH63OVs97BayrdUtikbKcp339FZ73Ewj4ORXWAiKw/NwumOR7nQEwKxYtNQbATH7XdDG
cK5RP4pFRsUZQsy0YLZfsV6gqzoX/QoLtfd5yDQ5e0O4g3m2TOAgCHX5eTsDXIUjocU0uOXwXGYi
A0gyh+soRIrMkMaUwVTeke5xsd2TEz+In3ZasbAOW+q6eLUjXpE3lnjCqusOeB9Aefe4RrwtVeAp
VLRIJnykqONYXLVAvpmBodPYuji7AYBgdtSstdZ7eggwjzu0cvgM+OBkPwNFOTUz/RO13lGi7gGW
DE3aTiZCHCFU5w4wy1NcI9uFTw75YWZY6n5biCmrMWzlX1MgXd5ICgniRXtQ3V04hlsZpB3bKDGK
OX4sJbFdQUVPra6zTfeYrcxVJGHBNf4rAP9ugQab7QDaFPS42gSiqPY4nccWAPs9PIadUcz7nd/y
4Wm2mwlhUg7RxjanrgrrD/yXjbD5Id0ms0y96dkO+BIlP9DSj56w1WAR+QVFqvYwu2GXlQJlbOwV
vVs=
=RRb+
-----END PGP SIGNATURE-----

--JtNxE1TITTUjh336w2OlWq1BXvBZPIZL1--
