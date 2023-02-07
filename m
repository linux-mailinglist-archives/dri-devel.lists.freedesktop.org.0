Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D268D951
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 14:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0410E505;
	Tue,  7 Feb 2023 13:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957310E4DD;
 Tue,  7 Feb 2023 13:31:08 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id q19so15510877edd.2;
 Tue, 07 Feb 2023 05:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GXHdokZjxa22DIUskiEjxAeqYnnbuCwx1pad8WkkQt0=;
 b=Pu59I4/YpbkpkjZH/5bkbKQaF4pzUSdXAS/N56d0hM9LH7jGKK3G4KwT2UMFGPTn81
 DCuIH3hkbiJZUYtwmXOJ4rHwFeLZbayBnMJdfWQkeMvBsKerWejqUodbwh8jAi47IqeV
 2ZgCeO2mNK2OiLm0nO2lZWrQyAleq9o23dsgzk1V8dbc2B10H61rtrND0wfElEpWm/uK
 LhVBhD10UbjmkmYikaLBQmyvXGry/SKUy5bav4QojyyJ9rZRQKwx7E3GQsPZLpaWx6ic
 nnIo2pzmDMcOwiNdmTgkgjs9GMvd9x1i9i7JyizzVRQdPYCFZ9JWosNjo0HdilSmGvML
 QPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXHdokZjxa22DIUskiEjxAeqYnnbuCwx1pad8WkkQt0=;
 b=KaN9gfkWC+BD+CkM85Tq13VQzeSppLOl6OrUhs8KqDOHO5SIPcQ1V+h/6WAMyPegji
 rT5UM8bSKrjBrKeq8z2GdUWNjvXf/fVoSqpFAvxjlftCFw0xpyRu6LazW5t0aJm5zlaS
 ykZLrXZsyqZBmp4c1FELrw9BSSMlpN4KuIcqgdqT9nTr/qL/RVCHhs0HMIYjSxoqSlQV
 8r6sNme/IuW2whC8PJzDzkqwrBm7idQIRzdotTl2s7ZRpuixvNH6NChRR3tCltBLhlHD
 nLZ9V4gJRDH+yxWkERZf0KpJFfaR6rVKq69/Sc2uvZdVxmwJtqSt8PLkvzVhwpD/qa23
 upVQ==
X-Gm-Message-State: AO0yUKVHjjxHXscEGbqgkHvVkmZPYQKP23u6TQR4AlRQJ1vMlSlIjQIq
 GqCfHQSXSXOP1yjYs7pkV2E=
X-Google-Smtp-Source: AK7set9CRl2gFywQcWXN2JDgcJVzQCjy0jwH3HUvkJBnNrmNFOP3fzrivPXSruCCM9+pRruw0QQSRg==
X-Received: by 2002:a50:d74c:0:b0:4aa:a4e9:fa28 with SMTP id
 i12-20020a50d74c000000b004aaa4e9fa28mr3494777edj.34.1675776666816; 
 Tue, 07 Feb 2023 05:31:06 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056402190e00b0045ce419ecffsm6443760edz.58.2023.02.07.05.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 05:31:06 -0800 (PST)
Date: Tue, 7 Feb 2023 15:30:48 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [RFC PATCH] drm: Create documentation about device resets
Message-ID: <20230207153048.78697e7b@eldfell>
In-Reply-To: <37e78013-5ed6-e80f-4a1c-1e61bed59735@amd.com>
References: <20230123202646.356592-1-andrealmeid@igalia.com>
 <20230123202646.356592-2-andrealmeid@igalia.com>
 <37e78013-5ed6-e80f-4a1c-1e61bed59735@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9db4WWm0I_X2MQvPfj4lskX";
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
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 amaranath.somalapuram@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9db4WWm0I_X2MQvPfj4lskX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Jan 2023 21:38:11 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 23.01.23 um 21:26 schrieb Andr=C3=A9 Almeida:
> > Create a document that specifies how to deal with DRM device resets for
> > kernel and userspace drivers.
> >
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > ---
> >   Documentation/gpu/drm-reset.rst | 51 +++++++++++++++++++++++++++++++++
> >   Documentation/gpu/index.rst     |  1 +
> >   2 files changed, 52 insertions(+)
> >   create mode 100644 Documentation/gpu/drm-reset.rst
> >
> > diff --git a/Documentation/gpu/drm-reset.rst b/Documentation/gpu/drm-re=
set.rst
> > new file mode 100644
> > index 000000000000..0dd11a469cf9
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-reset.rst
> > @@ -0,0 +1,51 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +DRM Device Reset
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The GPU stack is really complex and is prone to errors, from hardware =
bugs,
> > +faulty applications and everything in the many layers in between. To r=
ecover
> > +from this kind of state, sometimes is needed to reset the GPU. Unprope=
r handling
> > +of GPU resets can lead to an unstable userspace. This page describes w=
hat's the
> > +expected behaviour from DRM drivers to do in those situations, from us=
ermode
> > +drivers and compositors as well.
> > +
> > +Robustness
> > +----------
> > +
> > +First of all, application robust APIs, when available, should be used.=
 This
> > +allows the application to correctly recover and continue to run after =
a reset.
> > +Apps that doesn't use this should be promptly killed when the kernel d=
river
> > +detects that it's in broken state. Specifically guidelines for some AP=
Is:
> > + =20
>=20
> > +- OpenGL: During a reset, KMD kill processes that haven't ARB Robustne=
ss
> > +  enabled, assuming they can't recover. =20
>=20
> This is a pretty clear NAK from my side to this approach. The KMD should=
=20
> never mess with an userspace process directly in such a way.
>=20
> Instead use something like this "OpenGL: KMD signals the abortion of=20
> submitted commands and the UMD should then react accordingly and abort=20
> the application.".
>=20
> > +- Vulkan: Assumes that every app is able to deal with ``VK_ERROR_DEVIC=
E_LOST``,
> > +  so KMD doesn't kill any. If it doesn't do it right, it's considered =
a broken
> > +  application and UMD will deal with it. =20
>=20
> Again, pleas remove the "KMD kill" reference.
>=20
> > +
> > +Kernel mode driver
> > +------------------
> > +
> > +The KMD should be able to detect that something is wrong with the appl=
ication =20
>=20
> Please replace *should* with *must* here, this is mandatory or otherwise=
=20
> core memory management can run into deadlocks during reclaim.
>=20
> Regards,
> Christian.
>=20
> > +and that a reset is needed to take place to recover the device (e.g. a=
n endless
> > +wait). It needs to properly track the context that is broken and mark =
it as
> > +dead, so any other syscalls to that context should be further rejected=
. The
> > +other contexts should be preserved when possible, avoid crashing the r=
est of
> > +userspace. KMD can ban a file descriptor that keeps causing resets, as=
 it's
> > +likely in a broken loop.
> > +
> > +User mode driver
> > +----------------
> > +
> > +During a reset, UMD should be aware that rejected syscalls indicates t=
hat the
> > +context is broken and for robust apps the recovery should happen for t=
he
> > +context. Non-robust apps would be already terminated by KMD. If no new=
 context
> > +is created for some time, it is assumed that the recovery didn't work,=
 so UMD
> > +should terminate it.

Hi,

what Christian said, plus I would not assume that robust programs will
always respond by creating a new context. They could also switch
to a software renderer, or simply not do graphics again until something
else happens.

> > +
> > +Compositors
> > +-----------
> > +
> > +(In the long term) compositors should be robust as well to properly de=
al with it
> > +errors. Init systems should be aware of the compositor status and rese=
t it if is
> > +broken.

I don't know how init systems could do that, or what difference does it
make to an init system whether the display server is robust or not.
Display servers can get stuck for other reasons as well. They may also
be live-stuck, where they respond to keepalive, serve clients, and
deliver input events, but still do not update the screen. You can't
tell if that's a malfunction or expected.



Have you checked
https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device-hot-unplug
that you are consistent with hot-unplug plans?


Thanks,
pq

> > diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> > index b99dede9a5b1..300b2529bd39 100644
> > --- a/Documentation/gpu/index.rst
> > +++ b/Documentation/gpu/index.rst
> > @@ -9,6 +9,7 @@ Linux GPU Driver Developer's Guide
> >      drm-mm
> >      drm-kms
> >      drm-kms-helpers
> > +   drm-reset
> >      drm-uapi
> >      drm-usage-stats
> >      driver-uapi =20
>=20


--Sig_/9db4WWm0I_X2MQvPfj4lskX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPiUogACgkQI1/ltBGq
qqelTQ//fJlGZa8DbtsnhMjlSHNEkUscr33DsHa67lB+rVgH5IlOLmaTRryrc/Cm
FKNPaSxM8ejQWj5ROl4t1h5uNfK3u5nt15nzg44yOOs2FcCHKHeDsEWqKpznt//q
QH198JFUnEHv0+HJCLEwo7FPnooQlXKZlx77s6NgOCy3BLolv9I2+hOSw5Mvl7Ld
rrwXkfpWeRfqz0ILViEa4t37om4qNZxbcCikmOeckqQcPagWjiLNCRG3UJY2oIGU
eCPrw/eOt1pAPFiYWeKJ3Y3HMIFvLo+/yCQnPYjq69Oufy5UtyXPZMI5JFSUZN2/
9fi6MBDFh7WUbMp5iAcvFtOm4msQq6629RrGgYAuV2xkaTb5ifx+f69wHuuq9TZh
6vyLiBTZhT80U+hd9r5atf0Gm0lACaufEl57OuCPFE6UlQ1WFD0Rg/AurWoPI5Or
LIBfoxU6ZPSJOnhDfh0oDZmyCrJjlvY9ty5geFrxjOzvqD450ckzX/TtHzMfQokg
ELGdSvOLhlsMJBV4I+HdvXqVZm5GxS0BPnhnrHXN684y6SWn/P3MZLEU2buCtA3M
LefRCdXUPB1OR9b/cWSdw8XSKggmuGTqKkbYora4pW2L2t15kkTSdPoewavQJGPI
qOzgQ0GNyJ+wNKW2LLRMdF+N5kQs+uO6h2SgCQaOwdINKg3hZZo=
=7m4W
-----END PGP SIGNATURE-----

--Sig_/9db4WWm0I_X2MQvPfj4lskX--
