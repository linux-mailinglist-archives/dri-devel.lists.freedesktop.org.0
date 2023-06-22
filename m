Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAF739911
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 10:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD4910E4F2;
	Thu, 22 Jun 2023 08:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2E10E4F2;
 Thu, 22 Jun 2023 08:12:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2b46b11051aso75425231fa.3; 
 Thu, 22 Jun 2023 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687421567; x=1690013567;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kRlylnnlrnTqTEP6Z7obJnbsABovx12jOSEH2GlALZc=;
 b=pPETHloY4bCrkHEhuO8C/pk3uVwxHJPbmsgB40ImiQLrKd6fYlecVCDPrcYnu9NDij
 GmhlVSA8qDGCoHgzCBKnBtGFSyOlzqiPwAjmsLHtSv7+pGXzLbPmJMqt7N1cYpurH2nK
 RmTTqc0BJh/K1QydulWvFPy3V6KNjtzN+dbCUTWN03vlZM+j8bsLAYW6hUQs7IRi2tCA
 GK+OqwJLdNDzjhCOUeSdvtupjteZcre8mo9XWqLZMGu9W8CoJJavkx41PcbDpKaErd0i
 xrWk1YXg9wxYc5lLxip7gZhqgJbJdg+eoTneAEf9OE+4tWsWqCMkfk4qbguJO1ptCb5D
 gaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687421567; x=1690013567;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRlylnnlrnTqTEP6Z7obJnbsABovx12jOSEH2GlALZc=;
 b=UD6eEG6P6KLCUpKFgCj7rwEqqhcue42tHyad+OeHDDuwsTPdHFYswnB6nnabCgU4eW
 buu0cTjRUN34OV5drbVVNytdxGiHOAy9ojtrdvrQbfbEbeDvIUKiI41ur0Xe6Z6taax4
 F/mZxrz5tjDxHMoWStJ3VFK1FFvk1V05a3txjN4ETJ4TWAHFx+ns+DoY9cYrQ9+4EQGr
 /P0aEHBr8IJvjvIpOXJ4/JJs3A6AAe9/IkrIYLThTt56CHyf3sKPatE7O4jHPZed7LHr
 nfRIwHuDdKs7zHvU7ajvtZl/UKldzeBqRKY03I50BY2no2CBck1KAIN9w1XEXbqES96/
 3DgQ==
X-Gm-Message-State: AC+VfDx6ucAP1n9LDZrpCuRPZthyDpNvEiTtPIwrw4L4l1iVsqbVWfk4
 tIiApoe4+qgWg3SjyWHv7WU=
X-Google-Smtp-Source: ACHHUZ6+nyv9cNMediST2QyNQ4tu4yAeNImYRJUJqc0EclUDdCbVl8VSA2JosPx4Hk+FoadVuPNeCQ==
X-Received: by 2002:a2e:9183:0:b0:2b4:6e21:637e with SMTP id
 f3-20020a2e9183000000b002b46e21637emr7398995ljg.16.1687421566629; 
 Thu, 22 Jun 2023 01:12:46 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2e9a8e000000b002b58eb44badsm204006lji.106.2023.06.22.01.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:12:45 -0700 (PDT)
Date: Thu, 22 Jun 2023 11:12:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [RFC PATCH v3 1/4] drm/doc: Document DRM device reset expectations
Message-ID: <20230622111234.71820ff8@eldfell>
In-Reply-To: <26a4f7f3-33fa-c28e-dd71-e44e61ffa229@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-2-andrealmeid@igalia.com>
 <20230621105842.0c21b161@eldfell>
 <26a4f7f3-33fa-c28e-dd71-e44e61ffa229@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U0kPyh_oeO=f4YN=rPynzPv";
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/U0kPyh_oeO=f4YN=rPynzPv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2023 13:28:34 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Em 21/06/2023 04:58, Pekka Paalanen escreveu:
> > On Tue, 20 Jun 2023 21:57:16 -0300
> > Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> >  =20
> >> Create a section that specifies how to deal with DRM device resets for
> >> kernel and userspace drivers.
> >>
> >> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com> =20
> >=20
> > Hi Andr=C3=A9,
> >=20
> > nice to see this! I ended up giving lots of grammar comments, but I'm
> > not a native speaker. Generally it looks good to me. =20
>=20
> Thank you for your feedback :)
>=20
> >  =20
> >> ---
> >>   Documentation/gpu/drm-uapi.rst | 65 ++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 65 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-ua=
pi.rst
> >> index 65fb3036a580..da4f8a694d8d 100644
> >> --- a/Documentation/gpu/drm-uapi.rst
> >> +++ b/Documentation/gpu/drm-uapi.rst
> >> @@ -285,6 +285,71 @@ for GPU1 and GPU2 from different vendors, and a t=
hird handler for
> >>   mmapped regular files. Threads cause additional pain with signal
> >>   handling as well.
> >>  =20
> >> +Device reset
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +The GPU stack is really complex and is prone to errors, from hardware=
 bugs,
> >> +faulty applications and everything in between the many layers. To rec=
over
> >> +from this kind of state, sometimes is needed to reset the device. Thi=
s section =20
> >=20
> > It seems unclear what "this kind of state" refers to, so maybe just wri=
te "errors"?
> >=20
> > Maybe:
> >=20
> > 	Some errors require resetting the device in order to make the
> > 	device usable again.
> >=20
> > I presume that recovery does not mean that the failed job could recover.
> >  =20
> >> +describes what's the expectations for DRM and usermode drivers when a=
 device
> >> +resets and how to propagate the reset status.
> >> +
> >> +Kernel Mode Driver
> >> +------------------
> >> +
> >> +The KMD is responsible for checking if the device needs a reset, and =
to perform
> >> +it as needed. Usually a hung is detected when a job gets stuck execut=
ing. KMD =20
> >=20
> > s/hung/hang/ ?
> >  =20
> >> +then update it's internal reset tracking to be ready when userspace a=
sks the =20
> >=20
> > updates its
> >=20
> > "update reset tracking"... do you mean that KMD records information
> > about the reset in case userspace asks for it later? =20
>=20
> Yes, kernel drivers do annotate whenever a reset happens, so it can=20
> report to userspace when it asks about resets.
>=20
> For instance, this is the amdgpu implementation of=20
> AMDGPU_CTX_OP_QUERY_STATE2:
>=20
> https://elixir.bootlin.com/linux/v6.3.8/source/drivers/gpu/drm/amd/amdgpu=
/amdgpu_ctx.c#L548=20
>=20
>=20
> You can see there stored information about resets.

Hi Andr=C3=A9,

right. What I mean is, if I have to ask this, then that implies that
the wording could be more clear.

I don't know if "reset tracking" is some sub-system that is turned on
and off as needed or what updating it would mean.

> >  =20
> >> +kernel about reset information. Drivers should implement the DRM_IOCT=
L_GET_RESET
> >> +for that. =20
> >=20
> > At this point, I'm not sure what "reset tracking" or "reset
> > information" entails. Could something be said about those? =20
> >  >> + =20
> >> +User Mode Driver
> >> +----------------
> >> +
> >> +The UMD should check before submitting new commands to the KMD if the=
 device has
> >> +been reset, and this can be checked more often if it requires to. The
> >> +DRM_IOCTL_GET_RESET is the default interface for those kind of checks=
. After
> >> +detecting a reset, UMD will then proceed to report it to the applicat=
ion using
> >> +the appropriated API error code, as explained in the bellow section a=
bout =20
> >=20
> > s/bellow/below/
> >  =20
> >> +robustness.
> >> +
> >> +Robustness
> >> +----------
> >> +
> >> +The only way to try to keep an application working after a reset is i=
f it
> >> +complies with the robustness aspects of the graphical API that is usi=
ng. =20
> >=20
> > that it is using.
> >  =20
> >> +
> >> +Graphical APIs provide ways to application to deal with device resets=
. However, =20
> >=20
> > provide ways for applications to deal with
> >  =20
> >> +there's no guarantee that the app will be correctly using such featur=
es, and UMD
> >> +can implement policies to close the app if it's a repeating offender,=
 likely in
> >> +a broken loop. This is done to ensure that it doesn't keeps blocking =
the user =20
> >=20
> > does not keep
> >=20
> > I think contractions are usually avoided in documents, but I'm not
> > bothering to flag them all.
> >  =20
> >> +interface to be correctly displayed. =20
> >=20
> > interface from being correctly displayed.
> >  =20
> >> +
> >> +OpenGL
> >> +~~~~~~
> >> +
> >> +Apps using OpenGL can rely on ``GL_ARB_robustness`` to be robust. Thi=
s extension
> >> +tells if a reset has happened, and if so, all the context state is co=
nsidered
> >> +lost and the app proceeds by creating new ones. If robustness isn't i=
n use, UMD
> >> +will terminate the app when a reset is detected, giving that the cont=
exts are
> >> +lost and the app won't be able to figure this out and recreate the co=
ntexts. =20
> >=20
> > What about GL ES? Is GL_ARB_robustness implemented or even defined ther=
e?
> >  =20
>=20
> I found this:=20
> https://registry.khronos.org/OpenGL/extensions/EXT/EXT_robustness.txt
>=20
> "Since this is intended to be a version of ARB_robustness for OpenGL ES,=
=20
> it should be named accordingly."
>=20
> I can add this to this paragraph.

Yes, please!

I suppose there could be even more extensions with similar benefits, so
maybe these extension should be mentioned as examples. Right now the
wording sounds like these are the chosen extensions, and if you don't
use one, the process will be terminated.

>=20
> > What about EGL returning errors like EGL_CONTEXT_LOST, would handling t=
hat not
> > be enough from the app? The documented expectation is: "The application
> > must destroy all contexts and reinitialise OpenGL ES state and objects
> > to continue rendering." =20
>=20
> I couldn't find the spec for EGL_CONTEXT_LOST, but I found for=20
> GL_CONTEXT_LOST, which I assume is similar.

EGL Version 1.5 - August 27, 2014

Section 2.7 Power Management

	Following a power management event, calls to eglSwapBuffers,
	eglCopyBuffers, or eglMakeCurrent will indicate failure by
	returning EGL_FALSE. The error EGL_CONTEXT_LOST will be
	returned if a power management event has occurred.

	On detection of this error, the application must destroy all
	contexts (by calling eglDestroyContext for each context). To
	continue rendering the application must recreate any contexts
	it requires, and subsequently restore any client API state and
	objects it wishes to use.

It is talking about power management which is not quite GPU reset, but
I see so much similarity that I'd say it doesn't matter which one
actually happened. The only difference is that power management events
are not caused by application bugs, which means that the application
will simply re-initialize and retry, which may result in a reset loop.

You already wrote provision to handle reset loops, and I'm not sure
applications handling EGL_CONTEXT_LOST would/could ever infer that they
are the culprit without using robustness extensions.

I can see how EGL_CONTEXT_LOST could be deemed unsuitable for resets,
too.

>=20
> GL_CONTEXT_LOST is only returned in some specific commands (that might=20
> cause a polling application to block indefinitely), so I don't think=20
> it's enough, given that the we can't guarantee that the application will=
=20
> call such commands after a reset, thus not being able to notice a reset.
>=20
> https://registry.khronos.org/OpenGL-Refpages/gl4/html/glGetGraphicsResetS=
tatus.xhtml

Ok, another API for a similar thing.

So in that case, the app does not need to use a robustness extension if
it uses OpenGL 4.5 and bothers to check.

This makes the wording "If robustness is not in use" problematic,
because it seems complicated to determine if robusteness is in use in
any particular application. I suppose Mesa would track if the app ever
called glGetGraphicsResetStatus() before drawing after reset?


Thanks,
pq

> >  =20
> >> +
> >> +Vulkan
> >> +~~~~~~
> >> +
> >> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submi=
ssions.
> >> +This error code means, among other things, that a device reset has ha=
ppened and
> >> +it needs to recreate the contexts to keep going.
> >> +
> >> +Reporting resets causes
> >> +-----------------------
> >> +
> >> +Apart from propagating the reset through the stack so apps can recove=
r, it's
> >> +really useful for driver developers to learn more about what caused t=
he reset in
> >> +first place. DRM devices should make use of devcoredump to store rele=
vant
> >> +information about the reset, so this information can be added to user=
 bug
> >> +reports.
> >> +
> >>   .. _drm_driver_ioctl:
> >>  =20
> >>   IOCTL Support on Device Nodes =20
> >=20
> > What about VRAM contents? If userspace holds a dmabuf handle, can a GPU
> > reset wipe that buffer? How would that be communicated?
> >  =20
>=20
> Yes, it can.
>=20
> > The dmabuf may have originated in another process.
> >  =20
>=20
> Indeed, I think we might need to add an error code for dmabuf calls so=20
> the buffer user knows that it's invalid now because a reset has happened=
=20
> in the other device. I will need to read more dmabuf code to make sure=20
> how this would be possible.
>=20
> >=20
> > Thanks,
> > pq =20


--Sig_/U0kPyh_oeO=f4YN=rPynzPv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSUAnIACgkQI1/ltBGq
qqfk1w/+LUyDu0A5QysUvLstuEmS3JSLKjlmbd65TQGJDbG4TYpHLAJVYm4I1RMx
eQMf6Sc1NRdvLkzuAzKeJdqhOarDP8a9piLRe298HLIKk1IfOhhEwG4SBHEe3qsv
5Cs8Ms2nC+1FLc8awfCZw0lD2mg6Xor97N77v6SkMqJ3kKqRJy+0DwPC2iRr/6uH
ZCgFPj+Az+wBcmM7SaiW7qJvj3Q8CrnN+ei9Z51mg7u1LtBJtZ2P45eAQJj7FIV9
EDWk218J7x6oUQ93khX2L41VN8li84Gjs5rZ9Bkh0NpNwu5zCuXNnk/N4+f3z188
OIF25SYEXcuYls1apVCJpxIEzIOPQ8QeFPd7qX2BSBqYC3vJhXdll9p6pSWtevC6
tcDX/lsFsI36xxAhkYJLoLE88cHm6gb0lXbKCareNssqm6Z5LaiSNKyQ5+VHi2jt
I7brdrhnuWt9s6BQXFHqAGEyl8vToMD2l+xkMz/M/7d6gKaj3pGLosC/tq7ITblF
09uxp7ehi/InlmR/B5rt3u+gW0qCFcVdQV5QVQtLOxGBHFR1TXbrj3L0yV0HpWG5
siyeNove+Kr69kMx5ZwdS40ndp9lqpuBH01wBtezofX1qfDCoQmleLx2Ypt+Iv4c
Y+7DgDAcMWlmbJHEW2Hgm1dZ8kfXVhu4GHoNgqTWk3H7N9yXY/Q=
=0G+e
-----END PGP SIGNATURE-----

--Sig_/U0kPyh_oeO=f4YN=rPynzPv--
