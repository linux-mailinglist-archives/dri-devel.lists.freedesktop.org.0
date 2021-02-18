Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BF31EB6E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8D26EA24;
	Thu, 18 Feb 2021 15:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1686EA24
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:21:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CB24AD57;
 Thu, 18 Feb 2021 15:21:28 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>
References: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
 <20210218150746.GA18220@lst.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Regression: 6eb0233ec2d0 ("usb: don't inherity DMA properties for
 USB devices")
Message-ID: <ef51698a-cd93-47b3-b79f-8c86a4c215fc@suse.de>
Date: Thu, 18 Feb 2021 16:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218150746.GA18220@lst.de>
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
Cc: Greg KH <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1380127494=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1380127494==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VSWlDvtYdfOL7Tl8R4iE5C8FzFqKh6JnP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VSWlDvtYdfOL7Tl8R4iE5C8FzFqKh6JnP
Content-Type: multipart/mixed; boundary="mJWIti817m0Z6jMfS36ap1UGHc6CI4WQi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <ef51698a-cd93-47b3-b79f-8c86a4c215fc@suse.de>
Subject: Re: Regression: 6eb0233ec2d0 ("usb: don't inherity DMA properties for
 USB devices")
References: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
 <20210218150746.GA18220@lst.de>
In-Reply-To: <20210218150746.GA18220@lst.de>

--mJWIti817m0Z6jMfS36ap1UGHc6CI4WQi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.02.21 um 16:07 schrieb Christoph Hellwig:
> On Thu, Feb 18, 2021 at 03:56:00PM +0100, Thomas Zimmermann wrote:
>> I only have udl devices, but I expect that other DRM USB adapters are =
also
>> affected.
>=20
> Find where the driver calls dma_map_* itself instead of using the USB
> wrappers and fix that..
>=20

Sure, it's at [1]. For udl, the dmabuf would need to be in system=20
memory. The driver creates urbs from the framebuffer content and sends=20
them to the device for displaying.

My question is more: what's the best interface to do this? Is there=20
example code somewhere?

Best regards
Thomas

[1]=20
https://elixir.bootlin.com/linux/v5.11/source/drivers/gpu/drm/drm_prime.c=
#L630


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mJWIti817m0Z6jMfS36ap1UGHc6CI4WQi--

--VSWlDvtYdfOL7Tl8R4iE5C8FzFqKh6JnP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAuhfYFAwAAAAAACgkQlh/E3EQov+DA
6A//QdhPXebD7M+EzYUQ/FPnqUMNZAPP2uEP6VWwQQg1LkyhE45S3Cij4JD0ulGEvFZ63QMIAOz6
U+eHXkKSX8vum5Ns9lHXgaQLiF+30j+FeB47XKWNNyBGJwysN5lIe4RI63CA30fJC+PEZGsNGPnk
7wh1Fvp2mgo5SAe0OsZB/5D030s7sV48YQ2dU0z8vIdsNGWVseuRf12oq6jlB18KOW4Ypw5J6o0/
HSc+uMqAVhNyDDTUVNqkOQobgZ0uyjoaj0rdonUcCXOPQHDc6HeU2eeKMgAD87xrLw2h/Ghl2z+F
aQl8WTb7+NsE1sW8jjx0bhIBPj0K1A+v5HN2NdhycbUbnEHhaeVnzvO5sdn2hPVBc3rWfAl3+2Ax
pK/KtpSoqZv4dagLcLMVDwXbGOPKqCIGEizPXr58t2gKV7SrTTILb22FVQv9nTIu1foRKyyUaaSz
Y+djErr5PMrAf78kBAJ8UFFz6RZ5TxDypzkqSeifhZWziz9ZSf7MExV+ZHGQZ2lXonOp4RuK3+6p
89OHWkSdZL/SH0VcrbpZDiGh9Iyur1KMjo6kndylvXJPh31ZuBHEGglNSAPP6888XefHunWjlx/N
nw4l8F54ln8byP0IWJGJ7VVHRYWaxU6R+4FjhwWs/TJsoSZ/i4H/p7m5kFQRG8mqBMbRefVJtWfg
xQw=
=bR7v
-----END PGP SIGNATURE-----

--VSWlDvtYdfOL7Tl8R4iE5C8FzFqKh6JnP--

--===============1380127494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1380127494==--
