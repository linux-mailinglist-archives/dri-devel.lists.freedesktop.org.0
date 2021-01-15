Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3122F7422
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B6E6E175;
	Fri, 15 Jan 2021 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AC46E175
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:16:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEB59AB7A;
 Fri, 15 Jan 2021 08:15:58 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
To: kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
 <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
 <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
 <fe8c3a4f-24cc-8a78-1162-addadcd0f79e@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1c1e4df6-006b-f631-7f0a-0a11b546bf8e@suse.de>
Date: Fri, 15 Jan 2021 09:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fe8c3a4f-24cc-8a78-1162-addadcd0f79e@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0085203122=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0085203122==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Z1Vmp2DJmmPcU5Hbu7TztMW9VSXTZi4yh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Z1Vmp2DJmmPcU5Hbu7TztMW9VSXTZi4yh
Content-Type: multipart/mixed; boundary="4SMfsDSRy9oRo45qeK3KFv7zGjvngFvtL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <1c1e4df6-006b-f631-7f0a-0a11b546bf8e@suse.de>
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
 <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
 <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
 <fe8c3a4f-24cc-8a78-1162-addadcd0f79e@ideasonboard.com>
In-Reply-To: <fe8c3a4f-24cc-8a78-1162-addadcd0f79e@ideasonboard.com>

--4SMfsDSRy9oRo45qeK3KFv7zGjvngFvtL
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.21 um 17:28 schrieb Kieran Bingham:
> Hi Thomas,
>=20
> On 14/01/2021 15:15, Thomas Zimmermann wrote:
>>>>> On 23/11/2020 11:56, Thomas Zimmermann wrote:
>>>>>> The new GEM object function drm_gem_cma_mmap() sets the VMA flags
>>>>>> and offset as in the old implementation and immediately maps in th=
e
>>>>>> buffer's memory pages.
>>>>>>
>>>>>> Changing CMA helpers to use the GEM object function allows for the=

>>>>>> removal of the special implementations for mmap and gem_prime_mmap=

>>>>>> callbacks. The regular functions drm_gem_mmap() and
>>>>>> drm_gem_prime_mmap()
>>>>>> are now used.
>>>>>
>>>>> I've encountered a memory leak regression in our Renesas R-Car DU
>>>>> tests,
>>>>> and git bisection has led me to this patch (as commit f5ca8eb6f9).
>>>>>
>>>>> Running the tests sequentially, while grepping /proc/meminfo for
>>>>> Cma, it
>>>>> is evident that CMA memory is not released, until exhausted and the=

>>>>> allocations fail (seen in [0]) shown by the error report:
>>>>>
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fbs.append(pykms.DumbFramebuf=
fer(self.card, mode.hdisplay,
>>>>>> mode.vdisplay, "XR24"))
>>>>>> ValueError: DRM_IOCTL_MODE_CREATE_DUMB failed: Cannot allocate mem=
ory
>>>>>
>>>>>
>>>>> Failing tests at f5ca8eb6f9 can be seen at [0], while the tests pas=
s
>>>>> successfully [1] on the commit previous to that (bc2532ab7c2):
>>>>>
>>>>> Reverting f5ca8eb6f9 also produces a successful pass [2]
>>>>>
>>>>>  =C2=A0=C2=A0 [0] https://paste.ubuntu.com/p/VjPGPgswxR/ # Failed a=
t f5ca8eb6f9
>>>>>  =C2=A0=C2=A0 [1] https://paste.ubuntu.com/p/78RRp2WpNR/ # Success =
at bc2532ab7c2
>>>>>  =C2=A0=C2=A0 [2] https://paste.ubuntu.com/p/qJKjZZN2pt/ # Success =
with revert
>>>>>
>>>>>
>>>>> I don't believe we handle mmap specially in the RCar-DU driver, so =
I
>>>>> wonder if this issue has hit anyone else as well?
>>>>>
>>>>> Any ideas of a repair without a revert ? Or do we just need to subm=
it a
>>>>> revert?
>>>>
>>>> I think we might not be setting the VMA ops and therefore not finali=
ze
>>>> the BO correctly. Could you please apply the attched (quick-and-dirt=
y)
>>>> patch and try again?
>>>
>>> Thanks for the quick response.
>>>
>>> I can confirm the quick-and-dirty patch resolves the issue:
>>>  =C2=A0=C2=A0 https://paste.ubuntu.com/p/sKDp3dNvwV/
>>>
>>> You can add a
>>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Great! If you don't mind, I'd also add you in the Reported-by tag.
>=20
> Certainly!
>=20
>>>
>>> if it stays like that, but I suspect there might be a better place to=

>>> initialise the ops rather than in the mmap call itself.
>>
>> I think that's the fix, basically. We could put such a line as a
>> fall-back somewhere into the DRM core code. But I don't know if this
>> really works with all drivers. Maybe there's one that requires vm_ops =
to
>> be NULL.
>=20
> Ok, that's reaching beyond code I've explored, so I'll leave it to you.=


Daniel asked for a fix in the DRM core, so I'll go with the alternative=20
approach. If you have the time, I'd appreciate another test run.

Best regards
Thomas

>=20
>=20
>> Thanks for reporting this issue and testing quickly.
>=20
> Thanks for fixing so quickly :-)
>=20
> Regards
>=20
> Kieran
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4SMfsDSRy9oRo45qeK3KFv7zGjvngFvtL--

--Z1Vmp2DJmmPcU5Hbu7TztMW9VSXTZi4yh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmABTz0FAwAAAAAACgkQlh/E3EQov+CV
xA/+PoKFAj2XjMj4k6um1i/stJIlU8XfqnXWd2QV0TvhmeUkW9XsDLSn4NGcJzCeDqfZAMu6o8xB
t38plEFr9gOI2fKxKOntbxN+OID1BPRgJ0hjuuqHiNxv4fyOozfsHJIq8vTZYOZ1RmNHJcWqGTy2
7OjyNQqGk1AXbBNjPBITMX8Eq78YJ/acqGaCoTIRNI4HNV6RcKP/1phXrqwMeLu9E8k+iiQXDwFQ
gR3RClr9R3F+YFW6gXI81arcevOXtvM9dG4XzIRht5EYHO4c+pFxqiRsphDC3UIskMcvlsf7JvNX
2DM94E6Z2JdEvYflEHwD4j8MFG8ryJzR2AGtQwirxg60SImcH8vljSMTNswH7gE28S/iOXD0R23k
dQd2/qE2I7frg+o0/JAKi45frK7eTKqO3SBBYP1OYdjTAVGkvaEG4YZV4DGObUO5veA5njMdVkTP
l0/RRfYwZhr+gFWXi+vPV8AyyAKaeKqJOIaLOqVijwvy7MN0911ePGQEs4+JTlu3WmSbwPjBeB/J
U2CuzziziRGPrygQGBVh2odeVo0XBuIasyrXMGz+nFDUcY6o3zDE2cvT2c1Yah4U7eYQ/M2QCm68
WpbBrHELD45ARuibozMh2G1iobh721vRNTCBtRpltuWrMtleg7s/Ob2RCvQxH25mpH4cHFjS8Wk/
UNs=
=hO8Z
-----END PGP SIGNATURE-----

--Z1Vmp2DJmmPcU5Hbu7TztMW9VSXTZi4yh--

--===============0085203122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0085203122==--
