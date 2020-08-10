Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BE9240386
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 10:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CA56E3A6;
	Mon, 10 Aug 2020 08:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hetgrotebos.org (a80-127-99-228.adsl.xs4all.nl [80.127.99.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5564C6E3A6;
 Mon, 10 Aug 2020 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org; 
 s=mail;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:Cc:To:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=yFExF2GJykRVTVC+GQaeRqvcy+W/RLZlgIDWu+EGxBE=; b=JCvRaQv3Iv6v0w6+lLRKKgVF7D
 Ubg1uCVlMnqcNe0KE9cX+//EzNP7hqRDfi62Kg31t/n5Qb5hV26qvAH70SrtnG6Z7VvdMkMotnneE
 hp6eVe9fqWb3f1MqkqC6JkBWxzRWsFJPZpb/tTdLZyfmmzpthJL54bAHuS46aOP9V2wYK9wUw2fXv
 vUaEAOzY8vOs7XqAbAPnhALnOfo2unwROpLg5VJzEHA+zJgMESwEOjcrekB1AQCrqaGEi1bS/MVMr
 Nkp3ANVd32ddPPacIfWrd2KMzD6RGr0uxpMFsjiDLqj4ttyZZeyGciQ/8iiV9ZXvHU0pUviLsVKXh
 jmFbEQiw==;
Received: from kgpe-d16.fritz.box ([192.168.178.75] helo=[0.0.0.0])
 by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <merlijn@wizzup.org>)
 id 1k53P5-0004s0-TG; Mon, 10 Aug 2020 08:43:36 +0000
Subject: Re: How to prevent input devices from unblanking the X screen when
 DPMS is on?
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <12302ae3-901f-7a13-975e-273fbda4e7b4@wizzup.org>
 <20200810104358.1d28e355@eldfell>
From: Merlijn Wajer <merlijn@wizzup.org>
Autocrypt: addr=merlijn@wizzup.org; prefer-encrypt=mutual; keydata=
 mQINBFESzAkBEACuLy46KxYl4IfKuNhz3UWXSlA1GqMwgOhGUJw/ineKS6T1FiRqcbhO/Zj8
 oWobO5Mu743AY8PQtH9eo28jnz6Pg0vQLC2y6+3mtO4Ud+z+l06RadvgCH5F/6ibUqAdU2Eu
 CoyN6dk01zCyh5VRWqoWQsNkN9n5jdcbq9ZNhpOsUIYTIX/JVqMiZuwYS/YodDCbuBRk7isT
 frXHfbrXRzb/Fm6RfoFNcfL+wlqX62S55uWJdmjgwFd5sK4D/n68wjrFObi2Ar8Q2AYgi5Ib
 Qh6GNS7jHyDm5rT5EdMmU54ZoHvm7Xme5piaI68u8P8Zye/A7KV6+21OKVOaY+htlAtdwQNX
 ING4hp2vOsHA5u5CAzJXlgg76H5N2u5I0UWjWiOBHIFdXTnKOeFal7vXn19bgr/0ENlrGC3w
 GKVXLRJ5awDOe/oCaNeLqsR5Gjx0KFbChAP81lQwBqeBBTgvI1PVxALlqI7gCIovX1zn9LOb
 g+3dufkhlHI2pZBskDgDe9BC6HGiGqnzmpU1W/XElkhAHM7SdUK3Y8G2/uB/NpilFAAfrnVV
 pu758l16EZK3u3IlrKqDxEc/SUQVCw1d1+TW0j578Y3dAQeORRW4xyq/cAEqlBG+bMOZIzIV
 a0U6ZhGtHus8rEjKDzNDNRHciucMWzOelo+gcDzglxCsxDktrwARAQABtCJNZXJsaWpuIFdh
 amVyIDxtZXJsaWpuQHdpenp1cC5vcmc+iQJWBBMBAgBAAhsDAh4BAheABQsJCAcCBhUICQoL
 AgMWAgECGQEWIQQYcKqLCwGZwniBFjU5zBw8bxLkyAUCXEN38gUJDvMS6QAKCRA5zBw8bxLk
 yA3lD/9gptHeZ64HBHBG/BFrsyOAfYBRr3CEK3hIAooXlmgyQlK3AK1TZCfS+u1P8ZoIGHT6
 mEFVoVfj1hHnpMv1TYaQOu7ZbmOpX+J96nP/35OOnAkbWorKuIppK/EF63Rujxe4NEMBlPdf
 Eh/bxGmsYfZYsq1pa53oLGGT52urRnfABVDqZYhAN00Mx64cmn+FI8QyC0qD9VzgyZClAB5R
 WH9DdBqoaOJanVYZPon8LRUkCKjKeoj4KvBO+f3VCz7yrLSxKdMAP6OcsanVBqMMOwLMvsy7
 n/ykI9HsWwJANStpZQyjlwMLK6i/HFZ8giQlw6p3x4O8oAZWvi9gh5RrD77Eqv014unGhu1H
 OKNNLSb1SgiJtowPYeTjRynvUV0awXrfUQQ2mB2msLzN0rF7qDJWdh+/UypKAQX6/AbI3Uz3
 ny5Dlb8ImM3rN2Ee/W/9g4A3OPGlg3aWw8A/av115ORRCkiraPRrW3i+0pyfIrddbTNMXH9q
 QLgWpxh8OVxpIHNJi9riis9JS7tMSHg2XWESGdJOCUvTPqosW+d6bwUtVQkzwBB3R5yXUihq
 nCRT9cCr1RL59zTTX8YDEet/j8oYNdjSTEuS5hcwYpZtm0eXJ1EocIBWM2AZ3k8dvcSmuF7O
 N5VVaWzo9rChWfBtLu18xTXJkM6yDntPTcRvHgMX4bQtTWVybGlqbiBCb3JpcyBXb2xmIFdh
 amVyIDxtZXJsaWpuQHdpenp1cC5vcmc+iQJTBBMBAgA9AhsDAh4BAheABQsJCAcCBhUICQoL
 AgMWAgEWIQQYcKqLCwGZwniBFjU5zBw8bxLkyAUCXEN39wUJDvMS6QAKCRA5zBw8bxLkyLWV
 D/0XiNlVgrZtXd7os1DQdbh0ruGCMDnr0GP8/ZI9tQgL5oxAaWnFMrTXTDfHj6jaV8wtCz59
 U7f78IzOR2RgbqrpEOpCCCPsLj1RHl19XNFb4oa/GeUBwWgUqhAyOsjfxVLleeZOIcNKItJI
 b8fOKAZLhxCom7jTMcEjgMy29+6zemZ5jLTN3zZYnaYtHNQpagqZI3AGY1Suhfs8Pqtne1Of
 ASgnZcR2/ZyAhKo3OQwjEE9pJQExl2hvyZiY+xUtNloHm5pqKHuW5C/9MdRuFf0QBSYYlXoK
 K11AS7fVRMDEWGFB0N4lKiTM+dFM1Zqxg4kDjVlLXoXUPTmTwcgen+ESFbXL98FR+br16Fay
 akDEYvsWrZIYIz3RVg+mc/3OqW3PzCClbYwN2oP2nTL3m6EzX2PuBib2s3NXB9zyyL8rtWkJ
 ESS9dRGRj/WSk81RSlN16Oe2mPpWj3kc/mhcH0dIjnM6MEyOMzmbWihfLR+zsmVt/tgk0aj8
 XGsCFGqIZUgqgL7JWr82iX4ybIgBQlX3gm8vJlOn3ABT1z6Y4sTKZmE4K+k06IJzN2Behcrz
 y57eXkBfYbVBwnLWDa8SSquT3e3D32IToSN6Jth1JLKpQyI0MKyQj9m9b/q3Z9zGjAdtNx2I
 ceJqThHa49uu+FmmAzhpxEr8XTGDm9ymCYS3dLg4BFpzJ4ESCisGAQQBl1UBBQEBB0BcvCMW
 Llc6uYCg7rFkzsdhJ9gZ3jGYsvmv/hbAaNbeZwMBCAeJAjwEGAEIACYWIQQYcKqLCwGZwniB
 FjU5zBw8bxLkyAUCWnMngQIbDAUJCWYBgAAKCRA5zBw8bxLkyEfVD/42KdrEd03e7FL4uDBJ
 AqCd+UT+KrzDR0bJ/swceoLscY/kaTVKeMARkRZXoQzoII8cuVPSp7Rby8TJfajpEALnJYZ6
 GeHo/39y9RXcrREymOhO60GN4vCcf6FE6/FSMLtJHCwmHf/9gqq+m6NfYb46zZZrKZHQHrim
 fisodLUo0YB4XEKoUmm3jSfV8U5QnjomD0c047yukgW0bhMSSXXebobwFHH9Wvp03v6wBWB0
 zCaJv8CsbeXaWU9qBZEFZBU+FOMWrKOzSQ+9928Tf4bBCK96lamt6OVkWlIlMg7wVtCZSs7V
 2iup9pCYbZmnqIaQ5Z4KsGOBmXcPcWg6Gg2zIZDZtJEndQQrYEN7Z1X2Fv3dfJdtTi4ASMR6
 jhOqCX16HdD6Le9XOpQQFwHp/lZ1W5Tu39qopYV0xdJ6Nf04LNRqPsDqRt0fFhHoWU7Etp1n
 9DaAlmrAZTXep1ykICbaTjzsVl1+8AV1X04is77FDYuszi3t3626AGDd1t9Wv5kVUzGyn09u
 CiROFNA1FxYtf+2/rk2FH31fs1GIpXHQiIzur1bsGixuCG69Mcg6vvaS6MmNUHNqu1y8+NVs
 aHpboQ7rwi7Wa1FFo7fOPpx3DYk97g7wer5LXYeiV0+YqWciORS0YGvEDau7s7fUAwg2jW2d
 CfeKkLdnxQmAjT6Ly7gzBFpzGIUWCSsGAQQB2kcPAQEHQHk/Nn/GlVbuKElETzabljAL7xwY
 KLyw2Y+kvYdtoU7yiQKzBBgBCAAmFiEEGHCqiwsBmcJ4gRY1OcwcPG8S5MgFAlpzGIUCGwIF
 CQlmAYAAgQkQOcwcPG8S5Mh2IAQZFggAHRYhBEzktPs1ssX3Jvpr9QY3T2vKcrxaBQJacxiF
 AAoJEAY3T2vKcrxaE/MA/iQqG4FEijC14eFos9H+c1spHnceXAa8navXJRCShbz9AQDeleOk
 zXwcuoJMF9/3NKPFmMnYqCmqcMqftnD1xzOID0pnD/0UeS7mT41dxzKMsacFqaSbraj3s7dg
 pZ3ApopOcgXZTS5DI3x7jCDj/jhltuAhZf7Vsz3PBLgNs0Ay9eYtBUbzUND165B7jjDKATfb
 vm/LJohftKYpLVMn/fWsH5XxzsjUHMHrmFQGcb3hwADeCmRM/1NUykdwI07pWwddyAI2wbqS
 HqyI2bHHZMPkuSnj5X/9zmWRYJPkYX4EWWK5Vyv3ynQdPZSn+fukNSVILV/ku7jtZ+NvsbdV
 YimlSKtxQL4Y+xcC2YKf9nhWDMn5ouckoTu9mHW30/da8Ta2sISmP28BzO1F+RJYcQ1L5Qmq
 heKFOvKG5phFgmuspZaJvB+0PZAJUA3hm9Zo0mSG+Hxf0U9Wc10dAKe4QnuPUedPPK7FeIlR
 Ahxr7uokP2QIjS6ZYbdVauSUop5w4nQvMp65NvvejeGnOTR4SDkwovQKSzvbyUpoulNPgkVO
 +q2smvVAO0X1gAu0TI13r/s0TUk0shKmPtjGxUocyNoX53FCOXyrqFFzfF0RR/kZyHqNvNun
 auuXY5GfVPDcxjPwzm4Yjj4YvbfRLpAiQOOciMgiJlbn4A+BhvSSS54scJMln1Jh7KkDgeqz
 aP0nj9EfQy1vMXGp1i0sYzhMKaM9nsmV/q1Iisqc8ojjpmR00jVnz/aSX3eHexXOlB3Y6Qs+
 /XslHw==
Message-ID: <8b51a5b0-f8ed-9567-d836-1f8016f5a3ba@wizzup.org>
Date: Mon, 10 Aug 2020 10:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200810104358.1d28e355@eldfell>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, xorg-devel@lists.x.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0782386341=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0782386341==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="C36DybS26TXpS1Y2WersDK5U9oFWtEaGf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C36DybS26TXpS1Y2WersDK5U9oFWtEaGf
Content-Type: multipart/mixed; boundary="tyF2t9CxZpv9PYJHgBRapglh2iY8LlDNp"

--tyF2t9CxZpv9PYJHgBRapglh2iY8LlDNp
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

Thanks for the reply -

On 10/08/2020 09:43, Pekka Paalanen wrote:
> On Fri, 7 Aug 2020 16:07:35 +0200
> Merlijn Wajer <merlijn@wizzup.org> wrote:
>=20
>> Hi,
>>
>> Is it possible to have X handle input events, but not actually unblank=

>> the screen upon input events when dpms is enabled?
>=20
> Hi,
>=20
> by "blanking", do you mean that the CRTC turns off (as opposed to the
> display turning off) so that it no longer produces a video stream
> regardless of whether the display is actually receiving it or not?

Right - the idea is that the LCD display of the phone turns off so that
it no longer draws any power. So I believe that would be to have the
CRTC turn off. We are using libX11 for this purpose [1], but I think the
same can be achieved with "xset dpms force off".


>> Our use case (in Maemo Leste, GNU/Linux+Debian smartphone OS) is
>> reporting physical volume buttons to X clients when the device is
>> locked. When the device is locked, the screen is blanked / turned off
>> (via DPMS), but pressing a volume button causes the screen to unblank,=

>> leading to significant power drain.
>>
>> I am aware that one can tell X to close certain/all input devices, but=

>> then the volume buttons (and others: like 'next') would not be sent to=
 X
>> applications.
>>
>> I have not tested this, but I assume the same would apply for "headpho=
ne
>> buttons": play, stop, pause, etc. Or if someone has a phone in their
>> pocket: pressing a button by accident shouldn't cause the screen to
>> unblank and cause significant battery drain. By design, the DPMS timeo=
ut
>> is set to 0, and an external program will dim the screen brightness, a=
nd
>> tell X when to blank and unblank.
>>
>> Turning off the screen with DPMS, and then disabling DPMS in an attemp=
t
>> to keep the screen blanked (and have input not affect it) also does no=
t
>> work - then the screen doesn't stay blanked - this is with the
>> modesetting driver.
>=20
> What does "disabling DPMS" mean?

I should have written "disabling the DPMS extension". It is possible to
disable the DPMS extension at runtime, if I understand correctly. This
is what the xset manpage says about it:

> -dpms   The -dpms option disables DPMS (Energy Star) features.
> +dpms   The +dpms option enables DPMS (Energy Star) features.

The idea was to use the DPMS extension to turn the screen off (say with
'xset dpms force off'), and then disable the DPMS extension (while the
screen is in the off mode) to workaround the DPMS always waking up the
screen upon any input.

But it seems like disabling the DPMS extension at runtime after the
screen is off turns the screen back on (at least looking at the power
consumption of the device).

>> Due to the way DRM works, X is the master of the screen, so it is my
>> understanding that there also cannot be another helper tool that blank=
s
>> the display via DRM, because X is still the master, even when DPMS is
>> disabled.
>=20
> There can be only one DRM master having access to KMS functionality at =
a
> time, yes. This is deliberately designed to prevent any "rogue"
> applications from touching the display state without going through the
> display server in charge.
>=20
> DRM is the wrong layer to look at. DRM only does what a display server
> tells it to, and has no connection to any input side at all. Your
> problem has to be solved in co-operation with the display server.

I understand - and I think the DRM design makes sense. I was wondering
if this (not being able to forcibly keep the display blanked with a DRM
backend while still processing input) is an oversight in X11 (since DRM
was introduced way later, and support for it was added to X11). I am
hoping to avoid having to ship/maintain a custom/patched X11 server, so
if there's potential workaround, I'd be very interested.

Perhaps it's also possible to extend the DPMS API in the X11 server to
disable waking up on input. That might be a relatively small change to
carry, and could be entirely backwards compatible. But I don't know what
it takes to get (any) new features into X11.

>> On older versions of Maemo, where DRM was not used (10+ years ago),
>> external tools can just blank the fb and everything works as expected.=

>> Then DPMS is simply disabled, and external tools control the blanking
>> behaviour, but it looks like with DRM, this is no longer possible.
>=20
> Have you tried using X11 RandR protocol to turn the output off? I'm
> not sure it fits your use case, but maybe worth a try.

I think this is a way to force the display off, but I also believe it
usually confuses a lot of window managers and clients - if this is the
only display, then what is the size of the desktop after the display is
turned off - etc.

> The ultimate solution in my opinion though is to ditch X11 and go for a=

> Wayland architecture. There you provide the display server yourself
> (with the help from any Wayland compositor libraries you may want)
> which means you are fully in control of the behaviour. Obviously that
> would be a huge change.

That would indeed be quite nice -- although I am afraid we are stuck
with X11 for a while until we get all the other bits working well. Only
then does it make sense to think about replacing X11.

Cheers,
Merlijn

[1]
https://github.com/maemo-leste/mce/commit/57786e7d26cb32fefc149d8d07ceee2=
39e0bdd08


--tyF2t9CxZpv9PYJHgBRapglh2iY8LlDNp--

--C36DybS26TXpS1Y2WersDK5U9oFWtEaGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXzEIwQAKCRAGN09rynK8
WsUAAP9Wz8MVn2yt8wG37wMofL/zOc1eunGKN6hkvFmUGUmknAD+KiktqB9ZePuH
/7FQCY5X/YsyGfY1bcnxcavmrg+8+QM=
=wm0V
-----END PGP SIGNATURE-----

--C36DybS26TXpS1Y2WersDK5U9oFWtEaGf--

--===============0782386341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0782386341==--
