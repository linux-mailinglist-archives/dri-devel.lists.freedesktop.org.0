Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433D3D0AAE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 10:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88A06E566;
	Wed, 21 Jul 2021 08:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6496E20E;
 Wed, 21 Jul 2021 08:44:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF3B81FE7C;
 Wed, 21 Jul 2021 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626857045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZC103whzQwrDrB98HUNqUFVuBTQ4fJENkEhlnkf8mro=;
 b=G38v/z5g0UKoMPgJcABxbjhcToBoCB03WoV2FnOzYikEApZtEaq62D6ZBUzW7MNi3xtnD8
 6/UggJQNHKuupbyIYMf4nRC4S7JMhsaisB4q0J49opsjMOg4b4Pw+uJMVh0lGRZ0jtXk3F
 bLIfaFa3G84/WWZGAo54RghbfypKQv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626857045;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZC103whzQwrDrB98HUNqUFVuBTQ4fJENkEhlnkf8mro=;
 b=i4a4fnQAvp7Wcd8nJ9AKKvsoj8btBPCophtbIf7y8IzSR8p1oqVBVofkXwJRa2V3MV8kkZ
 ZUrpwNjPAMBhKjAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A232613BC9;
 Wed, 21 Jul 2021 08:44:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id iVGOJlXe92CyKQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jul 2021 08:44:05 +0000
Subject: Re: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <444811c3-cbec-e9d5-9a6b-9632eda7962a@linux.intel.com>
 <CAPM=9twumCVtr+zFvy40GKt=6zFRsAMNYV+-5cUKfwV76RfBEw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <cc8832ce-f8f9-53c7-fa60-8274631a77b1@suse.de>
Date: Wed, 21 Jul 2021 10:44:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9twumCVtr+zFvy40GKt=6zFRsAMNYV+-5cUKfwV76RfBEw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KNuQ7x1jod3j6lutUiMXuyBEBretcx6RA"
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KNuQ7x1jod3j6lutUiMXuyBEBretcx6RA
Content-Type: multipart/mixed; boundary="vw9oMrxuWWuMFve4z7klTAxd0S58pUEwh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "DRM maintainer tools announcements, discussion, and development"
 <dim-tools@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Message-ID: <cc8832ce-f8f9-53c7-fa60-8274631a77b1@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <444811c3-cbec-e9d5-9a6b-9632eda7962a@linux.intel.com>
 <CAPM=9twumCVtr+zFvy40GKt=6zFRsAMNYV+-5cUKfwV76RfBEw@mail.gmail.com>
In-Reply-To: <CAPM=9twumCVtr+zFvy40GKt=6zFRsAMNYV+-5cUKfwV76RfBEw@mail.gmail.com>

--vw9oMrxuWWuMFve4z7klTAxd0S58pUEwh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.07.21 um 06:03 schrieb Dave Airlie:
> On Fri, 16 Jul 2021 at 21:07, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>>
>> Hi Dave & Daniel,
>>
>> Lots of stuff this time around.
>>
>> Enjoy!
>=20
> I've pulled this but there is an outstanding warning
>=20
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/hisilicon/hibmc/hibm=
c_drm_drv.c:
> In function =E2=80=98hibmc_unload=E2=80=99:
> /home/airlied/devel/kernel/dim/src/drivers/gpu/drm/hisilicon/hibmc/hibm=
c_drm_drv.c:252:28:
> warning: unused variable =E2=80=98priv=E2=80=99 [-Wunused-variable]
>    252 |  struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);=

>        |                            ^~~~
>=20
> Probably due to Thomas irq patches.

I'll take a look.

Best regards
Thomas

>=20
> Dave.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vw9oMrxuWWuMFve4z7klTAxd0S58pUEwh--

--KNuQ7x1jod3j6lutUiMXuyBEBretcx6RA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD33lUFAwAAAAAACgkQlh/E3EQov+CX
qRAAxROs6z0HlnbzpQMYd1KgfKp6g5UYcK752TQZJxzhCMdbufU0Bl/j+8s6Ly3yFAE8ANewrmVb
f5pxc6zjv1HFlGT1dJQb+JIwcRTOVuVR7S49XCUaBeWz5XEqXPYpiwVwHc+Ps+gpDtOG3OrGcPRg
t30yogNSf/YPj70y+BKGqjCGN3aP7TRYFRre2KlIvxlqzTC7KUjfFVUlz5E7pF17tZDxRg/LYQFR
7tscqvDYN4lNoz4HwKfkJhoctVFga2o7Wlon9Z6Q6yB7GNlwHTu5NLJugsLWqEsWl9J+7Gsx+YUz
PKytfnFjNy7e/ILlJMp5YKCCANn1hmdWHr5ycPwFF/yQCEz5VODC0h2dlONyhSvNkkPIHzsTbAjS
gawJwXYzlrfy0D2s9Rgto+kafbykSIdcxOg4QT3dkD3gYY1Ux6nCLvBFbTyLH3frI0qD9NAsght5
bXUvk70c1raUKZ4H9k7OZzFdUAxjiTFAzpgeWoS2Mp+z30jjAtj9YJLTbrYSa5r+ZbZhdiMeLuul
JQ4olEsQh9lIThr8D2IxRXqq1GLMn9LVxKh/IlSWQM7mUHI9hFIpBx0/OiGZmsVyVCw8uDUx9XeJ
xCekdIrseqHcOw8y2mWTFojY3CJD71EXdDWFaKvDOG2U91B33BZDDXq1IpdBU0YdBw01/+lKoh4n
MwU=
=+09S
-----END PGP SIGNATURE-----

--KNuQ7x1jod3j6lutUiMXuyBEBretcx6RA--
