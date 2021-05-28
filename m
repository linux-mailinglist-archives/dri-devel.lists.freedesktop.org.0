Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD63943B3
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2F896EB;
	Fri, 28 May 2021 13:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70626896EB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:59:20 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9247D218B3;
 Fri, 28 May 2021 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622210356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1fRGHfHUb7/Zr0qPH9cVl7kztDPoQDyj6xfG+R+RW0=;
 b=vIZh1t5nZC1e1yj/QtAJ4gOMiA9Zm/bKb92WSOShDnCTQmI61XdQmp7e2kWpHhbxb4ufJL
 aJZ9AEQblJaTPC2YwP2lixP9P69x/g5foAB4O0tacRJo4ALtXJVwOM3oOG6v+EzigiijAU
 y47hkE7S4oiwqEAKJOxgbCs3GpuQVfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622210356;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T1fRGHfHUb7/Zr0qPH9cVl7kztDPoQDyj6xfG+R+RW0=;
 b=S5B32VFqbnt/woUhT0+zWZiuPlskYQVKbKgitfSHioI5fFzQjr73iIg1QH/NTjGiLY4HlP
 6y6YoSUurPDyspAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 52AA611A98;
 Fri, 28 May 2021 13:59:16 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id EHkXEzT3sGA2WwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 28 May 2021 13:59:16 +0000
Subject: Re: [PATCH v2] drm/rockchip: remove existing generic drivers to take
 over the device
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20210516074833.451643-1-javierm@redhat.com>
 <ef974dd8-5619-35b7-74de-4e270033a3c3@suse.de>
 <1f781f88-24ff-98b8-9c86-ae4db311843f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bc8ba42b-2fbf-ba95-d7a4-92f789142bd3@suse.de>
Date: Fri, 28 May 2021 15:59:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1f781f88-24ff-98b8-9c86-ae4db311843f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UQrFh0WQs4TtyMcOLbL1G5mbWOEXfTHtQ"
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UQrFh0WQs4TtyMcOLbL1G5mbWOEXfTHtQ
Content-Type: multipart/mixed; boundary="7Xhf3qKEvoJB4vdb8HBr3oauPUsd3OcmZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <bc8ba42b-2fbf-ba95-d7a4-92f789142bd3@suse.de>
Subject: Re: [PATCH v2] drm/rockchip: remove existing generic drivers to take
 over the device
References: <20210516074833.451643-1-javierm@redhat.com>
 <ef974dd8-5619-35b7-74de-4e270033a3c3@suse.de>
 <1f781f88-24ff-98b8-9c86-ae4db311843f@redhat.com>
In-Reply-To: <1f781f88-24ff-98b8-9c86-ae4db311843f@redhat.com>

--7Xhf3qKEvoJB4vdb8HBr3oauPUsd3OcmZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.05.21 um 09:38 schrieb Javier Martinez Canillas:
> Hello Thomas,
>=20
> On 5/16/21 12:30 PM, Thomas Zimmermann wrote:
>>
>>
>> Am 16.05.21 um 09:48 schrieb Javier Martinez Canillas:
>>> There are drivers that register framebuffer devices very early in the=
 boot
>>> process and make use of the existing framebuffer as setup by the firm=
ware.
>>>
>>> If one of those drivers has registered a fbdev, then the fallback fbd=
ev
>> of
>>> the DRM driver won't be bound to the framebuffer console. To avoid th=
at,
>>> remove any existing generic driver and take over the graphics device.=

>>>
>>> By doing that, the fb mapped to the console is switched correctly fro=
m the
>>> early fbdev to the one registered by the rockchip DRM driver:
>>>
>>>       [   40.752420] fb0: switching to rockchip-drm-fb from EFI VGA
>>>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>=20
> Thanks for the ack.
>  =20
>> Ping me if no one else merges the patch.
>>
>=20
> I would really appreciate if you merge this patch.

It's merged now. Thanks for the patch.

Best regards
Thomas

>  =20
>> Best regards
>> Thomas
>=20
> Best regards,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--7Xhf3qKEvoJB4vdb8HBr3oauPUsd3OcmZ--

--UQrFh0WQs4TtyMcOLbL1G5mbWOEXfTHtQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCw9zMFAwAAAAAACgkQlh/E3EQov+DB
PxAAgQw6Sy8VeAvlmd26pFV2YhWs10y6WMjsg4NvDGqBatXW6P4BuazWX2k9CkhOWs4IUGkAL7KE
Sbp+iWS4sqjIlTJj26NS36ktC4VluIb9gQhR6eAimuqdUqY3HxMtM4k1txdKtH7IftqNYFh/lY1B
lORl9390SZrvcrxEhAvWrbffNFasiG4aX2DuRj1wyg1wSecW7VqY2BMFcHDrHSaeg3zlHldj+sn+
/rTk/iqd+2VdmyoDR1SYxNuNgDku5aS68B6aPYWqXlbMxlwtpQFkc5DSfhr5E8WzG0dSElIrQdcw
+PRrFIDMlWbWZnn/NNn8oXNNM15tXdM6lsT07R4qxbk0CZlyR4MRyGQaK8I/mEsW+FT9FxiOiYvL
YCPCg/4PaysA9Yq91qO34ASYbO0moP59U7p0NBeWFMFcx8sq1dyLNXUZgctusmkGzLdRCc9tfGzy
pWzRXYaYSBteuUy5bwGIwVFtQS/CkGQy6uOyaXP979hhW+adJOJjP7IA61TZpee+QUf/izSW0VPt
xFZ+Ufo14G6bNbmgRagk/dyDSkf/AXZ1GNprKtfWNPiS+TRqbMGERHZlrcChANOIeMi/7s6UMn0i
UV2fKfOfHoHbZceUbfdIQZxUzWN25nTNyth0MmnO8VYHBJy2WyIG/BltaDX8TtJanq5dlnnlpukT
YDc=
=mqhb
-----END PGP SIGNATURE-----

--UQrFh0WQs4TtyMcOLbL1G5mbWOEXfTHtQ--
