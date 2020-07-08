Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496F218A6E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210B96E282;
	Wed,  8 Jul 2020 14:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8C26E282
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:51:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3070AAE48;
 Wed,  8 Jul 2020 14:51:39 +0000 (UTC)
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
To: Daniel Vetter <daniel@ffwll.ch>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
 <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
 <CAKMK7uEuEaJmzooodx-wZgOK3rPT_r74dZic+UWGwT-GrE-Uww@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a70e10d9-6574-a4a1-28c6-fd1c3f367afb@suse.de>
Date: Wed, 8 Jul 2020 16:51:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEuEaJmzooodx-wZgOK3rPT_r74dZic+UWGwT-GrE-Uww@mail.gmail.com>
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
Cc: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0567486968=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0567486968==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7MXBYa2jMKh2M4WbLMOHQx3UQKcaFyNlL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7MXBYa2jMKh2M4WbLMOHQx3UQKcaFyNlL
Content-Type: multipart/mixed; boundary="NrfvJluOAPlVrNH405NIFhv12jWVvt0Rl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <a70e10d9-6574-a4a1-28c6-fd1c3f367afb@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
 <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
 <CAKMK7uEuEaJmzooodx-wZgOK3rPT_r74dZic+UWGwT-GrE-Uww@mail.gmail.com>
In-Reply-To: <CAKMK7uEuEaJmzooodx-wZgOK3rPT_r74dZic+UWGwT-GrE-Uww@mail.gmail.com>

--NrfvJluOAPlVrNH405NIFhv12jWVvt0Rl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.20 um 16:26 schrieb Daniel Vetter:
> On Wed, Jul 8, 2020 at 4:22 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi
>>
>> Am 08.07.20 um 15:46 schrieb Ilpo J=C3=A4rvinen:
>>> On Wed, 8 Jul 2020, Thomas Zimmermann wrote:
>>>
>>>> Hi
>>>>
>>>> Am 08.07.20 um 12:05 schrieb Ilpo J=C3=A4rvinen:
>>>>> Hi,
>>>>>
>>>>> After upgrading kernel from 5.3 series to 5.6.16 something seems to=

>>>>> prevent me from achieving high resolutions with the ast driver.
>>>>
>>>> Thanks for reporting. It's not a bug, but a side effect of atomic
>>>> modesetting.
>>>>
>>>> During pageflips, the old code used to kick out the currently displa=
yed
>>>> framebuffer and then load in the new one. If that failed, the displa=
y
>>>> went garbage.
>>>>
>>>> In v5.6-rc1, we merged atomic modesetting for ast. This means that
>>>> screen updates are more reliable, but we have to over-commit resourc=
es.
>>>> Specifically, we have to reserve space for two buffers in video memo=
ry
>>>> while a pageflip happens. 1920x1200@32 are ~9MiB of framebuffer memo=
ry.
>>>> If your device has 16 MiB of VRAM, there's no space left for the sec=
ond
>>>> framebuffer. Hence, the resolution is no longer supported.
>>>>
>>>> On the positive side, you can now use Wayland compositors with ast.
>>>> Atomic modesetting adds the necessary interfaces.
>>>
>>> Ok, thanks for the info although it's quite disappointing (not the fi=
rst
>>> time to lose features with kms, migrating to it made me to lose dpms)=
 ;-).
>=20
> kms still has dpms, not sure what you mean here? Maybe some driver
> doesn't implement it.
>=20
>>> As it's quite annoying to lose a high resolution mode (or be stuck in=

>>> some old kernel), would it be technically feasible to make the frameb=
uffer
>>> allocation asymmetrical? That is, the switch to high-res mode would g=
et
>>> rejected when it would be into the smaller of the two buffers but not=
 when
>>> the arrangement is the other way around?
>>
>> I'm not sure what you mean here, but generally, there's no way of fixi=
ng
>> this without performance penalty.
>>
>> The screen resolution is only programmed once. Later updates only
>> require pageflips. For each pageflip, atomic modesetting requires the
>> new and the old framebuffer in video memory at the same time. These tw=
o
>> framebuffers are typically allocated once by Gnome/KDE/etc compositors=
,
>> and compositors go back and forth between them. It's basically double
>> buffering.
>=20
> You can do high-res mode I think, maybe needs a driver option to allow
> it to avoid upsetting existing compositors. Roughly:
> 1. dpms off
> 2. allocate big buffer
> 3. dpms on in high res mode with that single buffer
>=20
> Pageflip will fail ofc with ENOSPC, but kms itself doesn't disallow
> this. We could even implement this fairly generic, with a setcap flag,
> which makes the probe helpers _not_ filter out modes which wouldn't
> fit at least 2 framebuffers at the same time.

Technically you can hack up something, but what's the benefit for the
overall ecosystem?

In my other reply, I was rather talking about replacing VRAM helpers
with SHMEM helpers. That would imply a memcpy from system into video
memory on each pageflip.

OTOH, ast currently recommends using a shadow framebuffer, so userspace
probably already does the memcpy somewhere. And now that SHMEM helpers
can easily do cached page mappings, the performance difference might not
be significant. Maybe I should give it a try.

Best regards
Thomas


> -Daniel
>=20
>> Best regards
>> Thomas
>>
>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NrfvJluOAPlVrNH405NIFhv12jWVvt0Rl--

--7MXBYa2jMKh2M4WbLMOHQx3UQKcaFyNlL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8F3XYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPmFAf/W8OHT2ex/0075sGye2uv6TUEfSS9
RznB1F5fKqvoNvoD3X0FyY419rvsQytr9ueEWgLwIkylXfSZ92q7kxz4AaVos+ou
+a+SsxOuYdjYUGiOwH+G1XP/8XnjUtgd1zUgVyjT9AgpKfRJXcKsDtHW7p603Oam
H8JHcPPgsxJeL1gqKzFZZiIcxRTMVznLSqzI3qxraI3gQurIf3uoKT3+hlkHp/pe
9zUdHNK644/J4b9Qur142GA74hRsqYMYnQFxx5iKPpAXRDozRAlL1tQxfOB36sR5
P7YUg0AyfEqdvpHEoDPRf6OP6l/qcWEJ4xTz2FO9QlMxTokBhFzI+Bp0gw==
=EUfT
-----END PGP SIGNATURE-----

--7MXBYa2jMKh2M4WbLMOHQx3UQKcaFyNlL--

--===============0567486968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0567486968==--
