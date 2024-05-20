Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604128C97ED
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 04:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E0F10E3C8;
	Mon, 20 May 2024 02:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="bw200Z2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic315-14.consmr.mail.bf2.yahoo.com
 (sonic315-14.consmr.mail.bf2.yahoo.com [74.6.134.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2513310E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 02:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1716171935; bh=YNW6r82HH5n1PPukKIPdgVDpVt5zn0f4t04piULZK6o=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=bw200Z2kAnOXRD9k7xUmpGL2MoGRgZJgTCIxgjPhdubC7LFRnVzW/lyGtaqEXsbpA7E5/T/WsmKQfttp9P2zdmk0GIAj6MRe5CwMSsTfVKJpfYxBP2e98mcRHXmz/+IBk77ObN4Xu/o2p+wperVEuyxn9EtbDcJXyou0Vm2HFnqDUSfyaeIjX7X4cJBE5TRqMzq2vPYlP0MjZlguwm0Kdwkby0UWjvMxSX9m+Hm00vZ8KH+4Un4e1fQKBIn49o2wyLWOTfN3HH5SEyWLE8nIQTouHgdQ6XzL/60ikt1V+5AX99S4GAIZiigKRB0z+L1sib2wIIXdheuovfcAuRFctA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1716171935; bh=+Y01WMVsCQ2xrMMKC6DXrkUjAbARpn5jN5Ri73GCtJw=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Vm9Xx7L9a7W/DgqgqyMHWxX6Hvz70K+haK8hMyxRGUOcK+aRkPrUByiqG1YiH//HAatOXOJrYYnZgGuZ8M09CO+C2vteUmQPr0Zfe8yI3aA28/BrQNyLv0kg7XAkixq3C8icUUu6wKBb8BdEJdBhVMQXWIGInT7/KW+aTVgi24DULUKL9ewLM2WfD0okKgizBg+lW32JiyjmaWt0cd4sxTt9lvt+3iKiWDgx/yYQCc6jqHvDDwtf8quuEJHw33kUo4ITfTmmVqN7TUTDck9npNCDfcdBO4mIe5RPkkHYdmfibeQ9sVRe3ov3kRYnAQDLfUd5O5v2J48DVrCoByWKzw==
X-YMail-OSG: sNUfgaYVM1kWqoF3296zob3ywMm.26XCJGA5ZRpWBqqu0of2G1Uq3j.dIX6646k
 Gr9TuXynjolwvR_FIZq1dIMLSTDeugLedptG82R2QinrJ5bagI.zpd77p.Kkh9E6JZ3sv4QUZofg
 9rT3ZZT2kpGsEm3FMeo2gNmickBa.jgUdgimN6ZU9I4yLoRdRV0BQ7c2ulLh_3Nsk_E0HBFQwtIL
 fPQtw_bmcdIrvoIi1_eHQQMeURMmvs.xNHsTIqFKAFiHZx441M_qychtbf.UcoA1CPe34xpid8MQ
 7qVeeFrIAt0KKbTIvLB.M.sh_0NpufwcP4NL5LK.bWKRpuE1C_55L_yNfRE7Xf9Tb2LY2X2RPqao
 kQzTvr91CF3ONibMCQcoDIJ74u2sYsrzSnm8AP7axeTXSRA26P.FhjPj2qkL.aLaYHmuMAtv7eNW
 DpakHpCsHSykVxxBcncLnuoSTi0jU7ELWOM6RId3OVxqTthbWPSsK2cIW2QxTPDbra4h5UdlgqFZ
 6xEkrISYcuu5k4Y9XtTq9EdWXC_OCCMmLszyVN6aS1Lq1_piIl3ruQy_1QH1xhT6YGU325zbVu7B
 yaTcPJLhQ0QFwEeNfwCC0McHKiK27qb4ZVYDrum8JiXO1kGKZPRjkl_3VvbqiQJRlC1cFvev6Qmf
 J4bqgb311vPn8AYVzPMCogAjW0EC6.zk1yE5Cw8hmD63jtCEwplw4s6wGkbRvUkJ.nuTehqF2Pjd
 thjGPvcEfWWKp8jgRN8Ay6YpVS0XvVeB0hKxCkhIRFXidyV.pItHU2P0ldQZKTacZFY0Zis60khG
 hKVR6kyCKv_Uw2XUnUdVUWSn2yq8kjgA64V78mbvo_EsGEDLiu8jW5S1r3Im.vXfL5ySv2bU10Nz
 a1IDBqSPvSaUdRKsElJKozoeKvJW_lTZDhURMgi19.veTkIvpnBEgDQF3KSUyq8Z2Kul42f9yDGR
 eiV5FPKmtFO_kR32zTXQe.7AhP3JYIg4rzZ1BkivtpoqW3TAFqbiNu5Cp1RzvRsWCEqYNORJUpxh
 86Xz0w4reekilnfBDxUiUma4W2ZDO.d3IYy4gS6Wtu35Ic81.N2PMXetrh39eG8PHpy_Mu2s4aku
 zK9adkWoYH5r.MmJ8vISx4ABwPtHOBB0JE9J6yCi1aqDQIK4dDP752V8vT51wQhqn70w8MmxtODE
 jVoNcT8HugxeDSzOZqHYjydcZOTQ9svS9u5JDl7gagy6Y73ybLdeYknf_GZEimPyJDbzyPxUbD.p
 kRhpgZ.TP15HJypT2v8whUVg1mYY_MjUboGxl8lZ_2UkoXw7I626P52T1Utlkj3jPH_LgFu37z3R
 38BQviFCuOpfhJZ2FAQ3jm4m2HzdkVAYqIiRrXvml.vP09d2SLLQljnpUz.lg9J2lVcd8RUCf4KF
 QC3.ot5EenNLVSRaFzpErAuY5QJSPTjRzD7ZOKMXMd8GhEpEUgtQx7weW74OO2TlJST7Idrzu6tb
 iCoxP4rcOBMo1fEKj0lXGZbh4peqIWsnCXZTkDN8D.EIBTQkd2CluLYn07zgzpH.DksbasXVDuJ.
 qc8yjCT76SsRQHvKdWJ7E4Bdl1LOV8oFJsxNg93CfNanonc_STcSGAdX3ipzcfaIfRHH1B3LmQL_
 o_7z7yaB0UKB9B48zs0ZyjsJBTDZFPVIrG.HjfwNP5Cx.sCOYkwiKcxbbzuTRWJe6Q6s9uDzzZAy
 m3FALGVGs4Y6TqQobaz0jp1MjXokkUSosN5rIus_3FnAqSz1ljRq_C.BBks9cJNOHymr1JX3aVsr
 HSkkVz5XPyaUBV3D1lCjrn1zXEyJ1iDFuokoraL.Mxu89Qon_xWve79.XgkwYCUeF6gNfR2BdQsn
 _X1g22WDac1jrbFwODwliV77vOZTcdutW49.jGHyESfSFcKObZFLFLs_KKcL0hd2NJdEc7BnUkED
 KPGhc3hX9YEF005PFDRaMuoAiqoFC5xO7ML5SMvwgXCJdtUgkxHB3.ACBwxMPgHqN.W35EeEwcNi
 akUxM6DiDCmoGslCovGY7a2I1lSmiFBKxXJNOCQtTC8sTq0GDhDq8NiZbKqocOEDNhVXtr1Hjaeo
 3bHvgpSoLpqz8KOw.Q5iq9dkhaJwhJFsXe7WaOnSl2lmlBJcrNLS5GN8gdyG33yDXMYjQCqxM.qq
 5kvXKsbK3KW5KBih6rDmK1_tpZHvO0AqpzWvHM4.miFmr5MCr8Ikr7Wos7_X0.pF53yiiSBV1dUm
 yvotoITrj6yjjQh5cY1kI0cjMt74VVimE1Udn8QNQMkzx3iqvj0zVRg--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 769a66a8-47dc-4a12-a032-b64ffe2a5682
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.bf2.yahoo.com with HTTP; Mon, 20 May 2024 02:25:35 +0000
Received: by hermes--production-bf1-5cc9fc94c8-jhq5c (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0cd27365219fafdc895e8bacf5d68102; 
 Mon, 20 May 2024 02:25:33 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Jonas =?ISO-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
Subject: Re: simpledrm, running display servers,
 and drivers replacing simpledrm while the display server is running
Date: Sun, 19 May 2024 22:25:33 -0400
Message-ID: <3397036.44csPzL39Z@nerdopolis2>
In-Reply-To: <Zj4c8Tk_zkzb9R48@gmail.com>
References: <9215788.EvYhyI6sBW.ref@nerdopolis2>
 <4710c7b9-d4e5-4eb9-9d69-d80c385deadf@suse.de> <Zj4c8Tk_zkzb9R48@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart8474610.T7Z3S40VBb"
Content-Transfer-Encoding: 7Bit
X-Mailer: WebService/1.1.22356
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

This is a multi-part message in MIME format.

--nextPart8474610.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday, May 10, 2024 9:11:13 AM EDT Jonas =C5dahl wrote:
> On Fri, May 10, 2024 at 02:45:48PM +0200, Thomas Zimmermann wrote:
> > Hi
> >=20
> > > (This was discussed on #dri-devel, but I'll reiterate here as well).
> > >=20
> > > There are two problems at hand; one is the race condition during boot
> > > when the login screen (or whatever display server appears first) is
> > > launched with simpledrm, only some moments later having the real GPU
> > > driver appear.
> > >=20
> > > The other is general purpose GPU hotplugging, including the unplugging
> > > the GPU decided by the compositor to be the primary one.
> >=20
> > The situation of booting with simpledrm (problem 2) is a special case of
> > problem 1. From the kernel's perspective, unloading simpledrm is the sa=
me as
> > what you call general purpose GPU hotplugging. Even through there is no=
t a
> > full GPU, but a trivial scanout buffer. In userspace, you see the same
> > sequence of events as in the general case.
>=20
> Sure, in a way it is, but the consequence and frequency of occurence is
> quite different, so I think it makes sense to think of them as different
> problems, since they need different solutions. One is about fixing
> userspace components support for arbitrary hotplugging, the other for
> mitigating the race condition that caused this discussion to begin with.
>=20
> >=20
> > >=20
> > > The latter is something that should be handled in userspace, by
> > > compositors, etc, I agree.
> > >=20
> > > The former, however, is not properly solved by userspace learning how=
 to
> > > deal with primary GPU unplugging and switching to using a real GPU
> > > driver, as it'd break the booting and login experience.
> > >=20
> > > When it works, i.e. the race condition is not hit, is this:
> > >=20
> > >   * System boots
> > >   * Plymouth shows a "splash" screen
> > >   * The login screen display server is launched with the real GPU dri=
ver
> > >   * The login screen interface is smoothly animating using hardware
> > >     accelerating, presenting "advanced" graphical content depending on
> > >     hardware capabilities (e.g. high color bit depth, HDR, and so on)
> > >=20
> > > If the race condition is hit, with a compositor supporting primary GPU
> > > hotplugging, it'll work like this:
> > >=20
> > >   * System boots
> > >   * Plymouth shows a "splash" screen
> > >   * The login screen display server is launched with simpledrm
> > >   * Due to using simpldrm, the login screen interface is not animated=
 and
> > >     just plops up, and no "advanced" graphical content is enabled due=
 to
> > >     apparent missing hardware capabilities
> > >   * The real GPU driver appears, the login screen now starts to become
> > >     animated, and may suddenly change appearance due to capabilties
> > >     having changed
> > >=20
> > > Thus, by just supporting hotplugging the primary GPU in userspace, we=
'll
> > > still end up with a glitchy boot experience, and it forces userspace =
to
> > > add things like sleep(10) to work around this.
> > >=20
> > > In other words, fixing userspace is *not* a correct solution to the
> > > problem, it's a work around (albeit a behaivor we want for other
> > > reasons) for the race condition.
> >=20
> > To really fix the flickering, you need to read the old DRM device's ato=
mic
> > state and apply it to the new device. Then tell the desktop and applica=
tions
> > to re-init their rendering stack.
> >=20
> > Depending on the DRM driver and its hardware, it might be possible to do
> > this without flickering. The key is to not loose the original scanout
> > buffer, while not probing the new device driver. But that needs work in=
 each
> > individual DRM driver.
>=20
> This doesn't sound like it'll fix any flickering as I describe them.
> First, the loss of initial animation when the login interface appears is
> not something one can "fix", since it has already happened.
>=20
I feel like whatever animations that a login screen has though is going to =
be=20
in the realm of a fade-in animation, or maybe a sliding animation though, o=
r=20
one of those that are more on the simple side.

llvmpipe should be good enough for animations like that these days I would=
=20
think, right? Or is it really bad on very very old CPUs, like say a Pentium=
 III?
> Avoiding flickering when switching to the new driver is only possible
> if one limits oneself to what simpledrm was capable of doing, i.e. no
> HDR signaling etc.
>=20
> >=20
> > >=20
> > > Arguably, the only place a more educated guess about whether to wait =
or
> > > not, and if so how long, is the kernel.
> >=20
> > As I said before, driver modules come and go and hardware devices come =
and
> > go.
> >=20
> > To detect if there might be a native driver waiting to be loaded, you c=
an
> > test for
> >=20
> > - 'nomodeset' on the command line -> no native driver
>=20
> Makes sense to not wait here, and just assume simpledrm forever.
>=20
> > - 'systemd-load-modules' not started -> maybe wait
> > - look for drivers under /lib/modules/<version>/kernel/drivers/gpu/drm/=
 ->
> > maybe wait
>=20
> I suspect this is not useful for general purpose distributions. I have
> 43 kernel GPU modules there, on a F40 installation.
>=20
> > - maybe udev can tell you more
> > - it might for detection help that recently simpledrm devices refer to =
their
> > parent PCI device
> > - maybe systemd tracks the probed devices
>=20
> If the kernel already plumbs enough state so userspace components can
> make a decent decision, instead of just sleeping for an arbitrary amount
> of time, then great. This is to some degree what
> https://github.com/systemd/systemd/issues/32509 is about.
>=20
>=20
> Jonas
>=20
> >=20
> > Best regards
> > Thomas
> >=20
> > >=20
> > >=20
> > > Jonas
> > >=20
> > > > The next best solution is to keep the final DRM device open until a=
 new one
> > > > shows up. All DRM graphics drivers with hotplugging support are req=
uired to
> > > > accept commands after their hardware has been unplugged. They simpl=
y won't
> > > > display anything.
> > > >=20
> > > > Best regards
> > > > Thomas
> > > >=20
> > > >=20
> > > > > Thanks
> > > > >=20
> >=20
>=20
>=20



--nextPart8474610.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="iso-8859-1"

<html>
<head>
<meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8">
</head>
<body><p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0=
;">On Friday, May 10, 2024 9:11:13 AM EDT Jonas =C5dahl wrote:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; On Fri, May 10, 2024 at 02:45:48PM +0200, Thomas Zimmermann wrote:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; Hi</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; (This was discussed on #dri-devel, but I'll reiterate here as w=
ell).</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; There are two problems at hand; one is the race condition durin=
g boot</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; when the login screen (or whatever display server appears first=
) is</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; launched with simpledrm, only some moments later having the rea=
l GPU</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; driver appear.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; The other is general purpose GPU hotplugging, including the unp=
lugging</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; the GPU decided by the compositor to be the primary one.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; The situation of booting with simpledrm (problem 2) is a special cas=
e of</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; problem 1. From the kernel's perspective, unloading simpledrm is the=
 same as</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; what you call general purpose GPU hotplugging. Even through there is=
 not a</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; full GPU, but a trivial scanout buffer. In userspace, you see the sa=
me</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; sequence of events as in the general case.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Sure, in a way it is, but the consequence and frequency of occurence is</=
p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; quite different, so I think it makes sense to think of them as different<=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; problems, since they need different solutions. One is about fixing</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; userspace components support for arbitrary hotplugging, the other for</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; mitigating the race condition that caused this discussion to begin with.<=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; The latter is something that should be handled in userspace, by=
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; compositors, etc, I agree.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; The former, however, is not properly solved by userspace learni=
ng how to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; deal with primary GPU unplugging and switching to using a real =
GPU</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; driver, as it'd break the booting and login experience.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; When it works, i.e. the race condition is not hit, is this:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * System boots</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * Plymouth shows a &quot;splash&quot; screen</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * The login screen display server is launched with =
the real GPU driver</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * The login screen interface is smoothly animating =
using hardware</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; accelerating, presenting &quot;advanced=
&quot; graphical content depending on</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; hardware capabilities (e.g. high color =
bit depth, HDR, and so on)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; If the race condition is hit, with a compositor supporting prim=
ary GPU</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; hotplugging, it'll work like this:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * System boots</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * Plymouth shows a &quot;splash&quot; screen</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * The login screen display server is launched with =
simpledrm</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * Due to using simpldrm, the login screen interface=
 is not animated and</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; just plops up, and no &quot;advanced&qu=
ot; graphical content is enabled due to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; apparent missing hardware capabilities<=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp; * The real GPU driver appears, the login screen now=
 starts to become</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; animated, and may suddenly change appea=
rance due to capabilties</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; having changed</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; Thus, by just supporting hotplugging the primary GPU in userspa=
ce, we'll</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; still end up with a glitchy boot experience, and it forces user=
space to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; add things like sleep(10) to work around this.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; In other words, fixing userspace is *not* a correct solution to=
 the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; problem, it's a work around (albeit a behaivor we want for othe=
r</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; reasons) for the race condition.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; To really fix the flickering, you need to read the old DRM device's =
atomic</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; state and apply it to the new device. Then tell the desktop and appl=
ications</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; to re-init their rendering stack.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; Depending on the DRM driver and its hardware, it might be possible t=
o do</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; this without flickering. The key is to not loose the original scanou=
t</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; buffer, while not probing the new device driver. But that needs work=
 in each</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; individual DRM driver.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; This doesn't sound like it'll fix any flickering as I describe them.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; First, the loss of initial animation when the login interface appears is<=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; not something one can &quot;fix&quot;, since it has already happened.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I f=
eel like whatever animations that a login screen has though is going to be =
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">in =
the realm of a fade-in animation, or maybe a sliding animation though, or <=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">one=
 of those that are more on the simple side.</p>
<br /><p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0=
;">llvmpipe should be good enough for animations like that these days I wou=
ld </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">thi=
nk, right? Or is it really bad on very very old CPUs, like say a Pentium II=
I?</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Avoiding flickering when switching to the new driver is only possible</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; if one limits oneself to what simpledrm was capable of doing, i.e. no</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; HDR signaling etc.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; Arguably, the only place a more educated guess about whether to=
 wait or</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; not, and if so how long, is the kernel.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; As I said before, driver modules come and go and hardware devices co=
me and</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; go.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; To detect if there might be a native driver waiting to be loaded, yo=
u can</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; test for</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; - 'nomodeset' on the command line -&gt; no native driver</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Makes sense to not wait here, and just assume simpledrm forever.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; - 'systemd-load-modules' not started -&gt; maybe wait</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; - look for drivers under /lib/modules/&lt;version&gt;/kernel/drivers=
/gpu/drm/ -&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; maybe wait</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; I suspect this is not useful for general purpose distributions. I have</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; 43 kernel GPU modules there, on a F40 installation.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; - maybe udev can tell you more</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; - it might for detection help that recently simpledrm devices refer =
to their</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; parent PCI device</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; - maybe systemd tracks the probed devices</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; If the kernel already plumbs enough state so userspace components can</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; make a decent decision, instead of just sleeping for an arbitrary amount<=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; of time, then great. This is to some degree what</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; https://github.com/systemd/systemd/issues/32509 is about.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Jonas</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; Best regards</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; Thomas</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; Jonas</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; The next best solution is to keep the final DRM device ope=
n until a new one</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; shows up. All DRM graphics drivers with hotplugging suppor=
t are required to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; accept commands after their hardware has been unplugged. T=
hey simply won't</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; display anything.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; Best regards</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; Thomas</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; &gt; Thanks</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; &gt; &gt; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; &gt; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<br /><br /></body>
</html>
--nextPart8474610.T7Z3S40VBb--



