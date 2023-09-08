Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8571798360
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 09:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B12810E878;
	Fri,  8 Sep 2023 07:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49C10E878;
 Fri,  8 Sep 2023 07:46:00 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 86FB96607258;
 Fri,  8 Sep 2023 08:45:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694159159;
 bh=fV0DKh3z2jKCRSXyW1osjnn+ihoB68u2q3KPKI8SrUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bdUwGdXaakgWqHAniM2vUuRRAc4Hc+P+kC8O4p8Oi9Ps/i0F5jIUU+uGM+r1oOo88
 BWY9AejHc0v8EbvC01YG4zKz/iWv76DgCkUEbL96rmeBzIdQ//0Qd6w16GeJkQj/ew
 XPL0l8/eFkGdv4OXqTR14O5hVHkDOwae5dZPG/4zxuxp1xT++Z8/UCS4xU9j17Qhb7
 w98fCQcN439jD3639vMNka77gGthEeIp3Ioed/ronCuqf4UUPuIR/nBlnXpeE3Vavq
 widYlkz/Uch7y7nA7LxOILiF3epaP0cvZp4WNrikaVf5yDlfNecpQFbymHk/ElGSUy
 2eJA2UiP57Gng==
Date: Fri, 8 Sep 2023 10:45:42 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Message-ID: <20230908104542.2ffa4845.pekka.paalanen@collabora.com>
In-Reply-To: <b8d1e0b8-61b5-4e6a-a95c-3095f97bb376@amd.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
 <20230822140242.162a843a.pekka.paalanen@collabora.com>
 <20230825141639.vurga52ysal37n2m@mail.igalia.com>
 <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
 <20230907104917.7cf8e22e.pekka.paalanen@collabora.com>
 <b8d1e0b8-61b5-4e6a-a95c-3095f97bb376@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u/Qtp_/tODm0.9DUJUhgJOu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/u/Qtp_/tODm0.9DUJUhgJOu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Sep 2023 10:10:50 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-09-07 03:49, Pekka Paalanen wrote:
> > On Wed, 6 Sep 2023 16:15:10 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2023-08-25 10:18, Melissa Wen wrote: =20
> >>> On 08/22, Pekka Paalanen wrote:   =20
> >>>> On Thu, 10 Aug 2023 15:02:47 -0100
> >>>> Melissa Wen <mwen@igalia.com> wrote:
> >>>>   =20
> >>>>> Instead of relying on color block names to get the transfer function
> >>>>> intention regarding encoding pixel's luminance, define supported
> >>>>> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
> >>>>> includes pure gamma or standardized transfer functions.
> >>>>>
> >>>>> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> >>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >>>>> ---
> >>>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
> >>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++=
----
> >>>>>  2 files changed, 67 insertions(+), 21 deletions(-)

...

> >> While I'm okay to move ahead with these AMD driver-specific properties
> >> without IGT tests (since they're not enabled and not UABI) we really
> >> need IGT tests once they become UABI with the Color Pipeline API. And =
we
> >> need more than just CRC testing. We'll need to do pixel-by-pixel compa=
rison
> >> so we can verify that the KMS driver behaves exactly how we expect for=
 a
> >> large range of values. =20
> >=20
> > Yes, please, very much, about the generic color UAPI.
> >=20
> > I believe IGT should contain the reference curve for all named fixed
> > curves computed with standard libc math functions in double precision,
> > and compute error statistics between that and hardware results.
> > The actual test image would iterate through e.g. 1024 (all 10-bit
> > values for integer format framebuffer) different values - 1024 is
> > nothing as a number of pixels. Then we decide on acceptable error
> > thresholds.
> >  =20
>=20
> 1024 isn't a lot of values and fine if we test R, G, and B independently.
> Unfortunately 1024^3 is about a billion pixels, so for testing 3DLUTs
> (or other cases where we need to test the combination of RGB together)
> we won't be able to cover all inputs with a single framebuffer.

Of course, runtimes need to be practical. That idea was for 1D curves,
and 3D mappings need a different distribution.

> > It should also be tested with a floating-point framebuffer format, FP16
> > or FP32, with a value distribution designed to be sensitive to typical
> > numerical problems. For example, an inverse EOTF should be carefully
> > tested with values near zero, since those are the most problematic and
> > likely cause the most visible errors.
> >=20
> > Once all that is done, we can be very sure of what curve any hardware
> > actually implements.
> >=20
> > I might even go far enough to suggest that any generic color UAPI with
> > named fixed curves cannot land without such tests.
> >  =20
>=20
> I tend to agree, though I think the same should on some level apply to
> custom LUTs or other custom transforms.
>=20
> The IGT tests I'm writing will each have a "transform" function that does
> the transform in CPU as reference.

Sounds good!

For testing optical-to-electrical kind of operations, one idea is to
sample the electrical target space, and reverse the reference transform
to come up with the test input values. That way one can test if the
output space is sufficiently covered, and the rounding behavior as well.

Electrical space usually tends to be integer encoded with not too many
bits, making even exhaustive sampling feasible for 1D curves.


Thanks,
pq


> >>> Then EOTF and inverse EOTF for PQ [2], and OETF and it seems an inver=
se
> >>> OETF but called EOTF for HLG[3]. But I'm an external dev, better if
> >>> Harry can confirm.
> >>>
> >>> Thank you for pointing it out.
> >>>
> >>> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/am=
d/display/modules/color/color_gamma.c#n55
> >>> [2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/am=
d/display/modules/color/color_gamma.c#n106
> >>> [3] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/am=
d/display/modules/color/color_gamma.c#n174
> >>>    =20
> >>>>
> >>>> The others seem fine to me.
> >>>>
> >>>>
> >>>> Thanks,
> >>>> pq =20
>=20


--Sig_/u/Qtp_/tODm0.9DUJUhgJOu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT60SYACgkQI1/ltBGq
qqd5uA//Y8Zy2pkhccJtwjRXXVSVWJAlD8gvcTSXqqW7bStjM+3VN9Qy0IPv7tZP
NEO5C0BoUASwjqHV7rVxvAipxtybv0+1jVs9TezhlQZWisx4prRYxJUt2r2Q63YT
+X8qqYGzsCRS/VoyWniVlY6WcvchF1NhMwba1d+m7Ck79QdhparU3qyJwQzAzuhW
Imyy9SDhuK8aZjLmhcGNq6yhesm4uXMB9O2jvnXRaTliG7YaDZ2Tny14sN+CJl86
1+dnnQwn/1yWxZMTbb1v0Ifsmln0cwViI6c7eHMYAc5D9u7bvrkl2HBzgYD+RbLJ
VhwLSQBj7UGn735SQqwzZNX54RdvwpyHv9JUXCb6K0/zO0tP5NzTGQImabv1wyq0
wTGz5EsADeX/7CmPwbioXW/1xAEfKHgCiNEaKjaASHuF3cFrdTETEwXB0XLaac0D
4wB4wjjCEgNoQo6bp316YyZUTtaEljRBuTtunuCvlxfetNFasMhVuP3bScRH/2rd
hzNics93aemZgs41id6l9XmezngiDJtMkCvpb9SuoGLvtZNH+mjkqZA3Y5id+8Rp
Thmt5YpJDa2PaPgv9bn0GUmvkc7YaFcF/m8OMxA4uP94X3/t/NqLgHxHVkTX9nZP
tYc08DsSdD9oxGFuzxtBnJ7L34byRrTxU828xsdob9TkZl6d+U8=
=xZrO
-----END PGP SIGNATURE-----

--Sig_/u/Qtp_/tODm0.9DUJUhgJOu--
