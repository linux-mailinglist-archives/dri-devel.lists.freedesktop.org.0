Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3313BBAC9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 12:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC0589C9B;
	Mon,  5 Jul 2021 10:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3AF89C85
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 10:05:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A96522668;
 Mon,  5 Jul 2021 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625479529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+WRXxKia1dCxki/etY7yQFV/PO3bJep0OL+Co11aHQ=;
 b=e130UD+CC2LbMQRuWcsU8sDk4G/9tmw/VSlEoOp4iJUHp4tq7uWDk4NTPXqtCJ1duftd5l
 C5chpA2JofNgz30/gsjYGvF+PUPDkGKiB0wVvEKUaB39XA5dyWBhKHUuX2/NmNGOdp2D05
 YBpXnZZZUBzQt8BV7gZlYGOpDRBLGzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625479529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+WRXxKia1dCxki/etY7yQFV/PO3bJep0OL+Co11aHQ=;
 b=OTMdlUpqdsYRdHNp6Ir2Mj9N3XkvN3cfUV7Bi79LIkgj6jxNA/gv7abcCSdqIeFd2m8Irj
 Sg4jY0pc7ybO7ECw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B9A81340A;
 Mon,  5 Jul 2021 10:05:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZHfhEGnZ4mArOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 10:05:29 +0000
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
Date: Mon, 5 Jul 2021 12:05:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOLQbp7m7ggecg05@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F7BBOvOj2nb5UbLGPqNHvn7bfqCmRyt3o"
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
--F7BBOvOj2nb5UbLGPqNHvn7bfqCmRyt3o
Content-Type: multipart/mixed; boundary="vVSoUaNn8gVF256SorlGqc99TaTXqP0tT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, dri-devel@lists.freedesktop.org
Message-ID: <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
In-Reply-To: <YOLQbp7m7ggecg05@phenom.ffwll.local>

--vVSoUaNn8gVF256SorlGqc99TaTXqP0tT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.07.21 um 11:27 schrieb Daniel Vetter:
> On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
>> Vkms copies each plane's framebuffer into the output buffer; essential=
ly
>> using a shadow buffer. DRM provides struct drm_shadow_plane_state, whi=
ch
>> handles the details of mapping/unmapping shadow buffers into memory fo=
r
>> active planes.
>>
>> Convert vkms to the helpers. Makes vkms use shared code and gives more=

>> test exposure to shadow-plane helpers.
>>
>> Thomas Zimmermann (4):
>>    drm/gem: Export implementation of shadow-plane helpers
>>    drm/vkms: Inherit plane state from struct drm_shadow_plane_state
>>    drm/vkms: Let shadow-plane helpers prepare the plane's FB
>>    drm/vkms: Use dma-buf mapping from shadow-plane state for composing=

>=20
> So I think right now this fits, but I think it'll mismit going forward:=
 We
> don't really have a shadow-plane that we then toss to the hw, it's a
> shadow-crtc-area. Right now there's no difference, because we don't
> support positioning/scaling the primary plane. But that's all kinda stu=
ff
> that's on the table.
>=20
> But conceptually at least the compositioning buffer should bet part of =
the
> crtc, not of the primary plane.
>=20
> So not sure what to do, but also coffee hasn't kicked in yet, so maybe =
I'm
> just confused.

I'm not sure if I understand your concern. Can you elaborate? The=20
compositing output buffer is not affected by this patchset. Only the=20
input frambuffers of the planes. Those are shadow buffers. AFAICT the=20
composer code memcpy's the primary plane and then blends the other=20
planes on top. Supporting transformation of the primary plane doesn't=20
really change much wrt to the vmaping of input fbs.

Best regards
Thomas

> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vVSoUaNn8gVF256SorlGqc99TaTXqP0tT--

--F7BBOvOj2nb5UbLGPqNHvn7bfqCmRyt3o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDi2WgFAwAAAAAACgkQlh/E3EQov+D0
1Q//ZfXxh2XMDgvAfPLw4RmWfWfWHj9NqVr1abCjRTdLZiEfQnQw9tK2mjMn5yJ5EdKr+qbApn8l
/LcTB/cGOPNaT/M4akMzEk0LvMKxn3hsXSiCURepUr3DWTFc/hGKjWC5GXjMmdt4lybQmOCxuTe5
aS8pW8XReXnw8ww+KrHqs4kwAIfh+feB/O/f18cfMMjg29HrkliUhwsLwpzn9Dr+svazUUqqULa8
9yVFRmSBt0fenIcplBHJiEkDMO/asV9Vo2f4gRLGj8Q1p4lvbKWERZtq7gIULfcO6mJmal+oTfO1
NVqgzGyAm7DHa3uXt6SfFKH8mfvoJ5iKqx/5x0XphxB4wJWvGqfkGchb3JzDJGARJx2Ak4AoHIcb
tdF4n/b8jFbgXZ9T5BgnB5e9P8T/jD1+qKiJbjo6676p7vq9Doxl7hRsBcXWh2E1J2ZXVITO1vPU
BqKnx6hQ+2PsNsKZiQ6oAv7TAahrXZdxvJmtJq0FiYmP8IWf8PUQVLcfQoZJ8rxdnwt6YsDk/AFv
EWS/1Va/gQFSXQx+2pQiKhfdvzhZKJMZD1aePvfMhFvyBM2w5iHONvDeNvxFOLr6nsrrZP1hZKFt
PJ8pRv7UP40AVs3u7heWUBs65dUx1OEkgS2BtmqzM+01aixJ1iWBNCEJddApSESNY3UwGhP/D2qs
QeU=
=n9Bw
-----END PGP SIGNATURE-----

--F7BBOvOj2nb5UbLGPqNHvn7bfqCmRyt3o--
