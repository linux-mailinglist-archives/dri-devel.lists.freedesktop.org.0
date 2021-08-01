Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3CC3DCD81
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 21:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C310B6E0F6;
	Sun,  1 Aug 2021 19:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB146E0F6;
 Sun,  1 Aug 2021 19:56:20 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 002381FEA9;
 Sun,  1 Aug 2021 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627847779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+NnGC7CJLacokVANmN7ic2V4ps6/e94vckxcS1KJcA=;
 b=DK6buZSCQkrXdg1Vkj91UtFxATcaDM617qveaS24/kmVPLWtgaRYUDJgCC5tfoK3uLzoSE
 Dt/Z+m4YNZTVSkOGVWuGX0a5YTGMCSbxTBpgVzVbPsJYk3MCZjzSyBBXixAwIjlJGl8+YD
 IrU/vCzrNBTQvhlJyDiK41uZUBwi6DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627847779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+NnGC7CJLacokVANmN7ic2V4ps6/e94vckxcS1KJcA=;
 b=sYTLilX4dvmt8x4XRFujnRm6HLHKa7AtwW1QByKYYb3VdDR6Ydvc4gv1hYglPV9SThePvc
 m8c/xhKBsMzTziBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 43DAD1369B;
 Sun,  1 Aug 2021 19:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 3p2UDmL8BmHgBQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Sun, 01 Aug 2021 19:56:18 +0000
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <YQWbWjV5TYzp+5C4@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
Message-ID: <d50b3199-20fe-0ecb-ab7d-7425ad1d0f21@suse.de>
Date: Sun, 1 Aug 2021 21:56:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQWbWjV5TYzp+5C4@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MBU0Z03ywHqTmMHjoTTP5JnuitAObvxI4"
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
--MBU0Z03ywHqTmMHjoTTP5JnuitAObvxI4
Content-Type: multipart/mixed; boundary="ZWB90fKUSLppcAn3zi6q0dP71wt9gJEfo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <d50b3199-20fe-0ecb-ab7d-7425ad1d0f21@suse.de>
Subject: Re: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <YQWbWjV5TYzp+5C4@ravnborg.org>
In-Reply-To: <YQWbWjV5TYzp+5C4@ravnborg.org>

--ZWB90fKUSLppcAn3zi6q0dP71wt9gJEfo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 31.07.21 um 20:50 schrieb Sam Ravnborg:
> Hi Thomas,
>=20
> On Tue, Jul 27, 2021 at 08:27:07PM +0200, Thomas Zimmermann wrote:
>> DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
>> the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
>> IRQ interfaces.
>>
>> DRM provides IRQ helpers for setting up, receiving and removing IRQ
>> handlers. It's an abstraction over plain Linux functions. The code
>> is mid-layerish with several callbacks to hook into the rsp drivers.
>> Old UMS driver have their interrupts enabled via ioctl, so these
>> abstractions makes some sense. Modern KMS manage all their interrupts
>> internally. Using the DRM helpers adds indirection without benefits.
>>
>> Most KMs drivers already use Linux IRQ functions instead of DRM's
>> abstraction layer. Patches 1 to 12 convert the remaining ones.
>> The patches also resolve a bug for devices without assigned interrupt
>> number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
>> not detect if the device has no interrupt assigned.
>>
>> Patch 13 removes an unused function.
>>
>> Patch 14 moves the DRM IRQ helpers behind CONFIG_DRM_LEGACY. Only
>> the old non-KMS drivers still use the functionality.
>>
>> Thomas Zimmermann (14):
>>    drm/amdgpu: Convert to Linux IRQ interfaces
>>    drm/arm/hdlcd: Convert to Linux IRQ interfaces
>>    drm/atmel-hlcdc: Convert to Linux IRQ interfaces
>>    drm/fsl-dcu: Convert to Linux IRQ interfaces
>>    drm/gma500: Convert to Linux IRQ interfaces
>>    drm/kmb: Convert to Linux IRQ interfaces
>>    drm/msm: Convert to Linux IRQ interfaces
>>    drm/mxsfb: Convert to Linux IRQ interfaces
>>    drm/radeon: Convert to Linux IRQ interfaces
>>    drm/tidss: Convert to Linux IRQ interfaces
>>    drm/tilcdc: Convert to Linux IRQ interfaces
>>    drm/vc4: Convert to Linux IRQ interfaces
>>    drm: Remove unused devm_drm_irq_install()
>>    drm: IRQ midlayer is now legacy
>=20
> With the irq_enabled confusion out of the way I want to re-address two
> issues here that I know you have answered but I am just not convinced.
>=20
> 1) IRQ_NOTCONNECTED
>=20
> We do not have this check in drm_irq today and we should avoid spreadin=
g
> it all over. We are either carrying it forever or we wil lsee patches
> floating in to drop the check again.
> The current use in the kernel is minimal:
> https://elixir.bootlin.com/linux/latest/A/ident/IRQ_NOTCONNECTED
>=20
> So as a minimum drop it from atmel_hlcdc and preferably from the rest a=
s
> it is really not used. (Speaking as atmel_hlcdc maintainer)

I'll drop it from atmel_hlcdc then.

But saying that it's not used is not correct. At least radeon an gma500=20
handle PCI-based devices and BIOSes often had the option of disabling=20
the rsp graphics interrupts.

>=20
>=20
> 2) devm_request_irq()
>=20
> We are moving towards managed allocation so we do not fail to free
> resources. And an irq has a lifetime equal the device itself - so an
> obvious cnadidate for devm_request_irq.
> If we do not introduce it now we will see a revisit of this later.
> I can be convinced to wait with this as we will have to do much more in=

> each driver, but I cannot see any good arguments to avoid the more
> modern way to use devm_request_irq.

I'll change this in atmel_hdlcd and maybe I can find trivial cases where =

devm_request_irq() can be used. But drivers that had an uninstall=20
callback before should not have the cleanup logic altered by a patch as=20
this one. I suspect that most of the IRQ cleanup
is actually a vblank cleanup and should be done in response to=20
drm_vblank_init(). But that's again not something for this patchset=20
here. We cannot change multiple things at once and still expect any of=20
it to work.

I welcome the use of devm_ et al. But these changes are better done in a =

per-driver patchset that changes all of the driver to managed release.

Best regards
Thomas

>=20
> 	Sam
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZWB90fKUSLppcAn3zi6q0dP71wt9gJEfo--

--MBU0Z03ywHqTmMHjoTTP5JnuitAObvxI4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEG/GEFAwAAAAAACgkQlh/E3EQov+A9
cw/+IEz+W6K/8wOb9uXueI0jm0rdu2FMaG5qIevMl+qQOSrRBnMsDPG4Hir4RQKzWH9JwyCL2es9
qAQ2tbU/89oubj3yOHCWY6/v1nxj92/DU86PJiPpwCUw6Q3p4WNRlChbZTB1DF2KlnSoGPNCuDwk
2r8N+PiVth2fZWsaYtGlkvVxxOKHVnUFxez5nIHujTJUDtMByL05iPXmM14MK7AEcFvbvdHDTxax
aWhfBU0CaZsS1yxyCiwF+pb9u4IxIZy/wMXVM4VtqxX9ambseEfRyxpIWqG+xMRUbGhcn0BScHZv
SWMr+tfebvA3xLFWlTq0F6mP4IRm2Bl0AQafOcQtDvzFplcBM9Ex0txc4tROzn10A1EXvs+TJj+O
6ovgrs/nRlsbusHlzH/tN3EPVj+LmyHa1lSbuP3yZ+wcInTlqzjVX/ssTqxV9iCbEu4zFtI8ZR5d
NkVungaeOZXy8Nd51G5NEEazGoAfTm0CCAqyy1h82mfRL6CsvL1MJZ0iU3Ez/EIy6zHF4mcaue+R
s1NlmsvUCefwsytdDwsVwA8FfDMu63FKgFLk3AecQMm9CkBcQT1YqPZpedNcIfeWpJd/it2v74vZ
guj/RtVASwTafoE/aI2TGYN7Gx+2fpztDc01ZfMjOsWrIA1Pu6Dv07lRlmnIeuftwCqsf3ZiHQbw
B24=
=mg4s
-----END PGP SIGNATURE-----

--MBU0Z03ywHqTmMHjoTTP5JnuitAObvxI4--
