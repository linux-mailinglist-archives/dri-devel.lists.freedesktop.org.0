Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675F31D778
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 11:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391F289296;
	Wed, 17 Feb 2021 10:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC8889296;
 Wed, 17 Feb 2021 10:23:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B120B141;
 Wed, 17 Feb 2021 10:23:42 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-10-kraxel@redhat.com>
 <5baf096f-b1ee-46ba-5ee9-1c829b96e088@suse.de>
 <ab21d782-2627-7a68-8fab-0acfba416c86@suse.de>
 <20210217100206.fh5422uz4gnixyif@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/10] drm/qxl: map/unmap framebuffers in
 prepare_fb+cleanup_fb callbacks.
Message-ID: <e46a8494-b3f2-40ba-2625-05c13c47e769@suse.de>
Date: Wed, 17 Feb 2021 11:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217100206.fh5422uz4gnixyif@sirius.home.kraxel.org>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1879570815=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1879570815==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h0WnoFNYi1f9XmooDNTQLjyMjFkKtPyL9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h0WnoFNYi1f9XmooDNTQLjyMjFkKtPyL9
Content-Type: multipart/mixed; boundary="LnSnfig26KmIAW6LDR29DlBQ6koKWqp5s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>
Message-ID: <e46a8494-b3f2-40ba-2625-05c13c47e769@suse.de>
Subject: Re: [PATCH 09/10] drm/qxl: map/unmap framebuffers in
 prepare_fb+cleanup_fb callbacks.
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-10-kraxel@redhat.com>
 <5baf096f-b1ee-46ba-5ee9-1c829b96e088@suse.de>
 <ab21d782-2627-7a68-8fab-0acfba416c86@suse.de>
 <20210217100206.fh5422uz4gnixyif@sirius.home.kraxel.org>
In-Reply-To: <20210217100206.fh5422uz4gnixyif@sirius.home.kraxel.org>

--LnSnfig26KmIAW6LDR29DlBQ6koKWqp5s
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.02.21 um 11:02 schrieb Gerd Hoffmann:
> On Tue, Feb 16, 2021 at 02:46:21PM +0100, Thomas Zimmermann wrote:
>>
>>
>> Am 16.02.21 um 14:27 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> this is a shadow-buffered plane. Did you consider using the new helpe=
rs
>>> for shadow-buffered planes? They will map the user BO for you and
>>> provide the mapping in the plane state.
>>>
>>>   From there, you should implement your own plane state on top of str=
uct
>>> drm_shadow_plane_state, and also move all the other allocations and
>>> vmaps into prepare_fb and cleanup_fb. Most of this is not actually
>>> allowed in commit tails. All we'd have to do is to export the reset,
>>> duplicate and destroy code; similar to what
>>> __drm_atomic_helper_plane_reset() does.
>>
>> AFAICT the cursor_bo is used to implement double buffering for the cur=
sor
>> image.
>>
>> Ideally, you can do what ast does: pre-allocate/vmap 2 BOs at the end =
of the
>> vram. Then pageflip between them in atomic_update(). Resolves all the
>> allocation and mapping headaches.
>=20
> Just waded through the ast patches.

I just received your ack. Thanks a lot for looking at the ast patches.

>=20
> It is not that simple for qxl.  You have to send a command to the
> virtualization host and take care of the host accessing that memory
> when processing the command, so you can't reuse the memory until the
> host signals it is fine to do so.
>=20
> But, yes, it should be possible to handle cursor_bo creation in
> prepare_fb without too much effort.

I've been thinking about this issue and here's an idea:

If you take the ast code as a blueprint, you'd store two cursor bo in a=20
cursor-plane structure. Aditionally each of these BOs would have a=20
pointer to a fence associated with it.

One idea for the fencing code would be to allocate each new fence in=20
prepare_fb and store it in the cursor plane state. In atomic_update,=20
pick the unused BO in the cursor plane and wait on its fence. This=20
should guarantee that the BO is available. (?) Then swap the BO's fence=20
with the one in the cursor plane state. Setup the new fence for=20
synchronization with the host. Next time you pick this cursor BO, the=20
fence will be there for synchronization. The old fence from the cursor=20
BO will now be stored in the cursor-plane state and can be freed in=20
cleanup_fb().

My main interest here is to move all fail-able/locking calls out of the=20
atomic_update function. I might be missing some crucial corner case, but =

this should resolve the issue. (?) In any case, it's maybe worth a=20
separate patchset.

Best regards
Thomas

>=20
> take care,
>    Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LnSnfig26KmIAW6LDR29DlBQ6koKWqp5s--

--h0WnoFNYi1f9XmooDNTQLjyMjFkKtPyL9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAs7q0FAwAAAAAACgkQlh/E3EQov+DV
7g//UOrMSWgXBRPsci1jInSlvHBHkSG+Nszzjkh4QC5ipANPk4Too/BNFHrXMMM2Ase+jthizq7I
1pxbiXRfg6sY/6oqieukJpvDLWx/DYZyhLVISr978Wbr/5ZKqDdf1bm0xQwCmnGqTxQM2qyoXhKr
+uXr64a9oaUFZar1jfEJ2GLqQc5PDhk52pZck49EGnasfg9XBk/CWvLq5qXp4YdQz4eZeBQCHtGP
R9jFPA6tWWGTFO8ozLPDoyaA34z741aFTDWgFPjxWb2uhooprmVONEwfAUBHNYw7rqRhXXHTxZXc
SO8jzJKu5+0gvvfQaE2qF1x7pxDHPJwqqcfYYOvzPXq9iHfEoIiBUvhtn3bjyvoBgahsY9LG/GUJ
hR3DsuMNledIR/V9Qr6n/Fcui2ZivVkgSVhxrwaTUSzKYfzR1yxgZUay4Cq7teL26P2J4V96fnAj
94wQCxyp+p0osecAtsdkEAYswUzsYyRgSK3vnA17DVAnHWHHojH8yPr2Rf0PiMfXqPsZ93g8l7my
5xretITk7n8a4E1I00SHKwM+TW3jZcZil6czWkPaosV00KNnnJWqPe+0ole8dx9vhlf7av5ql7iD
QVVZPQEWhHONTKCYH+Oql9maQLyL8PUWBrRbmHEdfj5cMyxKbuW6MKLCITYr98XL1RCKTZLNiR25
aMk=
=i3Bx
-----END PGP SIGNATURE-----

--h0WnoFNYi1f9XmooDNTQLjyMjFkKtPyL9--

--===============1879570815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1879570815==--
