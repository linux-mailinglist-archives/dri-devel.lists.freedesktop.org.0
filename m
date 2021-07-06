Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17763BC5D6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 06:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7C9896E4;
	Tue,  6 Jul 2021 04:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404C896E4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 04:59:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 500E122362;
 Tue,  6 Jul 2021 04:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625547548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNc6jJpAePcbiGkMSlR9zxkNMN7accGdbVwpIzmLnbk=;
 b=hm4J7ZgcblwKN7DRbb7rVqq8ChtRixzGwrONT5g4CYcTyiOP7BAw6oSAE8Oag5XfAl1D0V
 GpkdZ/ZBW5W/CiDXi3Sn6pWoRD6S96DYnNifndi6Qv0J+IGZSIoNAiIzLb5vsZjjI++abJ
 DC/mzxT0c8z/pxreXlSw+rm4bUBjCoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625547548;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNc6jJpAePcbiGkMSlR9zxkNMN7accGdbVwpIzmLnbk=;
 b=Yf6u1KCgwuHeLQ9Zv4I+oQiDTUqGdrDJzLjRCov7J9BIpAgetsqhJZ4tG/dA9LFGH8vYe8
 gMIcN7ZPvBsmyEDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21C4113480;
 Tue,  6 Jul 2021 04:59:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fi2LBhzj42D/SAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 04:59:08 +0000
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <38b8f733-7e76-a172-2d6c-c2e9bc192cb3@suse.de>
Date: Tue, 6 Jul 2021 06:59:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JUIqUmITPOzzGBwUXXDBhw9liuEUizAIf"
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
Cc: airlied@linux.ie, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JUIqUmITPOzzGBwUXXDBhw9liuEUizAIf
Content-Type: multipart/mixed; boundary="9kn9t599NewrQ8qfDOCYf8lDcu5ghZ7yb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, dri-devel@lists.freedesktop.org
Message-ID: <38b8f733-7e76-a172-2d6c-c2e9bc192cb3@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
In-Reply-To: <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>

--9kn9t599NewrQ8qfDOCYf8lDcu5ghZ7yb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.07.21 um 16:20 schrieb Daniel Vetter:
> On Mon, Jul 05, 2021 at 12:05:28PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 05.07.21 um 11:27 schrieb Daniel Vetter:
>>> On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
>>>> Vkms copies each plane's framebuffer into the output buffer; essenti=
ally
>>>> using a shadow buffer. DRM provides struct drm_shadow_plane_state, w=
hich
>>>> handles the details of mapping/unmapping shadow buffers into memory =
for
>>>> active planes.
>>>>
>>>> Convert vkms to the helpers. Makes vkms use shared code and gives mo=
re
>>>> test exposure to shadow-plane helpers.
>>>>
>>>> Thomas Zimmermann (4):
>>>>     drm/gem: Export implementation of shadow-plane helpers
>>>>     drm/vkms: Inherit plane state from struct drm_shadow_plane_state=

>>>>     drm/vkms: Let shadow-plane helpers prepare the plane's FB
>>>>     drm/vkms: Use dma-buf mapping from shadow-plane state for compos=
ing
>>>
>>> So I think right now this fits, but I think it'll mismit going forwar=
d: We
>>> don't really have a shadow-plane that we then toss to the hw, it's a
>>> shadow-crtc-area. Right now there's no difference, because we don't
>>> support positioning/scaling the primary plane. But that's all kinda s=
tuff
>>> that's on the table.
>>>
>>> But conceptually at least the compositioning buffer should bet part o=
f the
>>> crtc, not of the primary plane.
>>>
>>> So not sure what to do, but also coffee hasn't kicked in yet, so mayb=
e I'm
>>> just confused.
>>
>> I'm not sure if I understand your concern. Can you elaborate? The
>> compositing output buffer is not affected by this patchset. Only the i=
nput
>> frambuffers of the planes. Those are shadow buffers. AFAICT the compos=
er
>> code memcpy's the primary plane and then blends the other planes on to=
p.
>> Supporting transformation of the primary plane doesn't really change m=
uch
>> wrt to the vmaping of input fbs.
>=20
> Yeah that's the current implementation, because that's easier. But
> fundamentally we don't need a copy of the input shadow plane, we need a=

> scratch area that's sized for the crtc.

I stll don't understand. Are you talking about the whole patchset or=20
just patch 4? Because if you want to do anything with vkms planes, you=20
have to vmap the framebuffer BOs into memory. (right?) That's all that=20
shadow-buffer planes do. Patches 1 to 3 have nothing to do with memcpy.=20
Admittedly, Patch 4 does some minor refactoring, but only because it=20
became a low-hanging fruit.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9kn9t599NewrQ8qfDOCYf8lDcu5ghZ7yb--

--JUIqUmITPOzzGBwUXXDBhw9liuEUizAIf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDj4xsFAwAAAAAACgkQlh/E3EQov+BC
PA//SgHv6l9UlxOZHXV/El4k5XL22dD/s7njsBX8AYVaQIYAFLcn47KmksBsBPDquNxl/TVidajD
WAbnxB2r/cc4GuQ8sNs8Pw+p7AIST0QUG8MMREqKodrqa2NXm7Y/kYOmJa66ahJ131r52sZ1IOpW
x3yHSv07HAm4vbZBs37jQXs6Xvrvxh/tadXIx8EGOKw0+HnQObRv+zWHYFGN+GXveU2pDSsDJQYe
xJjIemYpDrT7jkMEVjg1J4HUZDEBpwUJePmbEKcexFPkVO314PG/xXZeQMXz3t/YRpz7hAq5M6du
1xdpKmoEBgwCnXS+EYfq8g8KvZdf0vFvVG5zyArHBJGyufqygZ5JhM75t403RPyV9zrBXORDz+FR
MxUTsiZAJveZrmWDi2CAWfEFtI8f1eo7S5AAhTqXoEA0sbjCR8SAENtkpw+j0J2OruHguiDIKxAI
un0s1TJged71/geGoq/k5zbmJCF34IZpvf6hcaDfRrHcrekfnGU/VRGmAqId2d5zoonMRZvK53IT
GHvVOeKqoPiCzotHqxl7rwOKF0ghLzVltAVvabGlZQafTcsIHe8dUEv9uR7LdtoCnICNOr/VEQkl
M1IctLzeYqgZgwDAHcTqCS2jJj4dfISRtubFMn3CoctksxzFwuCACbpd1TbOdElKm6HvNA5pWKp8
kWM=
=hD3N
-----END PGP SIGNATURE-----

--JUIqUmITPOzzGBwUXXDBhw9liuEUizAIf--
