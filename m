Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDD390299
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D209589C14;
	Tue, 25 May 2021 13:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39D389C14
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:34:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621949644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Al/BsxlKGykIFfO72jHkW1BQ+PspU9PFmXalxOkwwRQ=;
 b=ebfvEddhJCSo2q6KHV2zndE1H/cO9GVMiD8H/BPa2UsOWV+/cRs2XVtXFEokyjCM9k2WHq
 RSCkAOzJpRuh0XrSAS3/7s8veRJ2+7hy1rsuNP0I8+K/9Y+u+Rmcr54E4/Gias2oAXBAMG
 jmYEnpWaErboK4mwJpxRDhtSiPTc3UA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621949644;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Al/BsxlKGykIFfO72jHkW1BQ+PspU9PFmXalxOkwwRQ=;
 b=VlxOj/ncVvYJNKHKTRBMRv+WiDAJU6YkEzB0lWI7ah34aVEZrwFL950QFgk0aTwy3kFNhN
 8MzhGja0pJS1f6Cw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C083AE34;
 Tue, 25 May 2021 13:34:04 +0000 (UTC)
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
 <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
 <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
 <YKz2vbxYXSKQE1Ng@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4e81ab57-a240-952a-7423-22dc830bc62f@suse.de>
Date: Tue, 25 May 2021 15:34:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKz2vbxYXSKQE1Ng@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YZffmTAfrGNK6tGv0Qs6eeHA3zHiiR78q"
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
--YZffmTAfrGNK6tGv0Qs6eeHA3zHiiR78q
Content-Type: multipart/mixed; boundary="2sr49Okxdr8WiAt4gLrP1RMJ9v46WfIHb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <4e81ab57-a240-952a-7423-22dc830bc62f@suse.de>
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
 <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
 <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
 <YKz2vbxYXSKQE1Ng@phenom.ffwll.local>
In-Reply-To: <YKz2vbxYXSKQE1Ng@phenom.ffwll.local>

--2sr49Okxdr8WiAt4gLrP1RMJ9v46WfIHb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.05.21 um 15:08 schrieb Daniel Vetter:
> On Fri, May 21, 2021 at 08:53:56PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 21.05.21 um 19:18 schrieb Javier Martinez Canillas:
>>> On 5/21/21 6:53 PM, Thomas Zimmermann wrote:
>>>
>>> [snip]
>>>
>>>>>
>>>>> So what with all the drivers which do _not_ have drm in their name?=20
Also
>>>>> I'm never sure how much these are uapi or not ...
>>>>
>>>
>>> That someone could threat as an uapi is a fair point indeed.
>>>> Why do we need a suffix anyway?
>>>>
>>>
>>> Yes, I thought the same and was torn about posting a patch to just re=
move
>>> the suffix. I don't think users care that much if is a fb device from=20
a
>>> fbdev driver or a DRM driver using the fbdev emulation.
>>
>> Yup. I don't see how anything in userspace would depend on the exact n=
ame;
>> especially since fbdev emulation only provides basic features. (I'd we=
lcome
>> a counter examples that proves me wrong.)
>>
>> IMHO we can risk it to remove the suffix entirely. But that needs an a=
ck
>> from Daniel or Dave.
>=20
> If you guys with your distro hats on all think it doesn't matter, then
> yeah I'm all for dropping the somewhat silly -drm or drmfb suffixes. I
> think that was just way back so it's easier to know you've loaded the
> right driver, back when there was both drm and native fbdev drivers
> around. But now I think for new hw there's only drm, so should be all
> fine.

Suse doesn't use fbdev, except for some outliers; most notably hypervfb=20
and generic efifb/vesafb. Both are now being replaced with drm code.=20
 From what I've seen, it's the same for other distros. And X11 checks=20
for the existence of device files anyway IIRC.

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


--2sr49Okxdr8WiAt4gLrP1RMJ9v46WfIHb--

--YZffmTAfrGNK6tGv0Qs6eeHA3zHiiR78q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCs/MsFAwAAAAAACgkQlh/E3EQov+C/
+A//dBmebEPakdS6NEwmDRoRk+JrwGEgBvlmuySX+dZiUMMN/tNnKOyyxRQQJ9WBGwLageC9+vWe
fy1Q8CxztQWg7C8IMoHCVeGxcxQlU3GwO1ZNZkHACXtSiUokJKBxaG0E0in6eHvQ+oe8DGM5GpHG
arsbMmUY4YziG/084sMSikddQjDD81ctDizcRvnWFTNCYOdvFpBD0nSEEzznRb+HVz6FRwivrRgT
3sx+2k035qgLli5xajAO+3YNZwD4zUNcFe/1X/pOVqODqIrz1+DwWYFmezXtffQ29H69WruFi9z1
lkxgUbxj/LO3aDzrTXuBWhRO1eh4ZGE56lK8WGezQcG52TokDgKxI8s0mojUNqHzykxduw5QI80J
wO/dzy8GJaIq+AgQn9DGvusxICjK7KsWYVedS9a4kcUm5YMj9dLuDiWm7llO0aIq8jSnGp0f3I5T
BG34LR5ImyLKZUI2qlC3hp8YHopnqWeDsBpjC+6wuM+VWHHZ1IA+dz1g7DaEIPAXUs8S/rfYKG10
R8R+aN0nnEYATYAf6cQwrYAKCcbEYFDq43w9IYbH2m5h4GIbA0QCQDcS9vBPpBB9unTI8XsF+VPF
hoy+NpsKLw3OhLYUTb1rdG49HCSWuZaxNavVs4UrP00z2whdf1UL8Sv7Z2MI1sDDhyJM5n5GqOGe
kCI=
=AZYu
-----END PGP SIGNATURE-----

--YZffmTAfrGNK6tGv0Qs6eeHA3zHiiR78q--
