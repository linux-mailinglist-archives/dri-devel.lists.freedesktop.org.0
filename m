Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E31DC772
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 16:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332FD6EB61;
	Fri, 18 Oct 2019 14:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2946B6EB61;
 Fri, 18 Oct 2019 14:34:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r22so4917767lfm.1;
 Fri, 18 Oct 2019 07:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bk12Jz6CO2TEep7aClieECJ5Hx90RwIh+IaSubynCJ0=;
 b=Kvg+sJIRkNSiXjxbvCVcQr55XjEuDuZYhaLk5E60QmBAiZghm39GU3G/vl4pntBkGq
 hcoLHp2DZpcU3hW81waf2wS9E/+DH/covg7rno07p/VxsP2W3MRl0mOFVzEidQbNnaV5
 jf/MZelg6+/DiHzljgv4PsojzIL89j2iXn0GRyA/DWd3SSczSG0Y5LLbzk0kPHq9Vrte
 5HQFayVvMofNFLBvUAEA3TZNGtq9msl/VzuAXrhIuEOKKOJox2804CVq1+PonvPEv5JH
 gx4NF5hCI9kRo39r1CLuf+qVg+0ijU3/9PX2qv+mS5duP9WTcId3/Bb0A29VJ3rKl9l3
 3hmg==
X-Gm-Message-State: APjAAAXMjGnq4c1/PTFk/Oaxn8pexEOIPheztKa4jZkK/gz3mdrCEyEd
 ZazbH4gYCAucTyAQQM43794=
X-Google-Smtp-Source: APXvYqwQETMI9nu9pupp1krvciWvYk+tw4zvF0Pn3PZiNdA1CrYF89NEBITX4JYUfFbamyQrwf+8Yw==
X-Received: by 2002:a05:6512:49d:: with SMTP id
 v29mr6252851lfq.161.1571409281375; 
 Fri, 18 Oct 2019 07:34:41 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q21sm2303260lfc.2.2019.10.18.07.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 07:34:41 -0700 (PDT)
Date: Fri, 18 Oct 2019 17:34:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-ID: <20191018173437.0c07c2db@eldfell.localdomain>
In-Reply-To: <CAKMK7uHw42R6m0UYrbWnaMRuQm7VQ7_0Ta8eqaGNGKtve43row@mail.gmail.com>
References: <20191018122130.0f880724@eldfell.localdomain>
 <BXSMP84X56T9.317VNFYFVMCWW@homura>
 <20191018164329.412b14ca@eldfell.localdomain>
 <CAKMK7uHw42R6m0UYrbWnaMRuQm7VQ7_0Ta8eqaGNGKtve43row@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=bk12Jz6CO2TEep7aClieECJ5Hx90RwIh+IaSubynCJ0=;
 b=u/l/LEnTbqVOKa4V7gPPNa7qxyn77p0pmRJkaAyvgu7XwUqMqyribqAKTdzEbwoA0i
 VtZ/GxhYuEZEL3dT1CocuFeuFOzZ0rr7iK1SJ90Tke42IoupHRyErPBNpJ1ovtIzkmFh
 sSMz6TS95uC94A0Zs8OAp4uJsi5NN1QgTcezY4M572ljUSQ3YJo5YDJDz3roxz55Fupg
 E8Q/2yQ0xgQlp5N9F74e9/ilc1YK4rrrMoIfsIubEE+6H+n6ArHM/IktHzP7dvygR+W3
 iAM0nR5ATw9XRNon3PEEKsSD72zC8fsl6YCZFzSCrUCbx+Ql3NnxISBw+aQS5oXgEaSi
 tkUA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Marius Vlad <marius.vlad@collabora.com>, Drew DeVault <sir@cmpwn.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0032476312=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0032476312==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5sBh_HL/bIqXwtESU+hjP6J"; protocol="application/pgp-signature"

--Sig_/5sBh_HL/bIqXwtESU+hjP6J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2019 16:19:33 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Fri, Oct 18, 2019 at 3:43 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Fri, 18 Oct 2019 07:54:50 -0400
> > "Drew DeVault" <sir@cmpwn.com> wrote:
> > =20
> > > On Fri Oct 18, 2019 at 12:21 PM Pekka Paalanen wrote: =20
> > > > One thing I did not know the last time was that apparently
> > > > systemd-logind may not like to give out non-master DRM fds. That mi=
ght
> > > > need fixing in logind implementations. I hope someone would step up=
 to
> > > > look into that.
> > > >
> > > > This protocol aims to deliver a harmless "read-only" DRM device file
> > > > description to a client, so that the client can enumerate all DRM
> > > > resources, fetch EDID and other properties to be able to decide whi=
ch
> > > > connector it would want to lease. The client should not be able to
> > > > change any KMS state through this fd, and it should not be able to =
e.g.
> > > > spy on display contents. The assumption is that a non-master DRM fd
> > > > from a fresh open() would be fine for this, but is it? =20
> > >
> > > What I do for wlroots is call drmGetDeviceNameFromFd2, which returns =
the
> > > path to the device file, and then I open() it and use
> > > drmIsMaster/drmDropMaster to make sure it's not a master fd. This see=
ms
> > > to work correctly in practice. =20
> >
> > That is nice.
> >
> > Personally I'm specifically worried about a setup where the user has no
> > access permissions to open the DRM device node directly, as is (or
> > should be) the case with input devices.
> >
> > However, since DRM has the master concept which input devices do not,
> > maybe there is no reason to prevent a normal user from opening a DRM
> > device directly. That is, if our assumption that a non-master DRM fd is
> > harmless holds.
> >
> > (Wayland display servers usually run as a normal user, while logind
> > or another service runs with elevated privileges and opens input and
> > DRM devices on behalf of the display server.) =20
>=20
> So the rules are (if I'm not making a mistake)
> - If you're not CAP_SYS_ADMIN you can't get/drop_master.

Hi,

not able to drop, yikes. So if someone pokes the Wayland DRM leasing
interface while the display server is VT switched away (does not have
DRM master), and maybe no-one else has DRM master either (you're
hacking in VT text mode), then a new DRM fd would be master with no way
out?

So Wayland display servers should make sure they have master themselves
before sending a supposedly non-master DRM fd to anyone else. I wonder
if the Wayland protocol extension needs to consider that the compositor
might not be able to send any fd soon. Being able to defer sending the
fd should probably be mentioned in the protocol spec, so that clients
do not expect a simple roundtrip to be enough to ensure the fd has
arrived.

> - This is a bit awkward, since non-root can become a master, when
> there's no other master right at this point. So if you want to be able
> to do this, we should probably clarify this part of the uapi somehow
> (either de-priv drop_master or make sure non-root can't become master,
> but the latter probably will break something somewhere). Plus igts to
> lock down this behaviour. Note that if logind does a vt switch there's
> a race window where no one is master and you might be able to squeeze
> in. So perhaps we do want to stop this behaviour and require
> CAP_SYS_ADMIN to become master, even accidentally.

That would close the loophole that Ville mentioned, too, otherwise
distributions should aim to not give permissions to open the DRM device
node.

> - I thought you can always re-open your own fd through proc? Which
> should be good enough for this use-case here.

We can? And that creates a new file description the same way as open()
in the original device node?

Does that avoid becoming master in the above VT-switched-away scenario?

> - Non-master primary node should indeed give you all the GET* ioctls
> for kms, and nothing else useful or at least dangerous (you might be
> able to render with that thing). Just make sure you dont authenticate
> that new fd. Again maybe we should clarify our docs a bit to make this
> use case official.

Awesome, thanks,
pq

--Sig_/5sBh_HL/bIqXwtESU+hjP6J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2pzX0ACgkQI1/ltBGq
qqfNOg/+PReDi7ENyLQ5bW6Elf7STqLLKtct35jhLGA30NtvnfZANsQWaqlNL2ao
6TB5736zr7RPWLw+GV5VMSR3Blc1XGxV49/D8DWezqMcNE6a/GgTOzpaZGQJMXsv
xtEPAe/IneBEnNSpn+cu8vZ4g2DOx6xNSsyUTAqA7vEkPftHqiINtqSbmHYFmRcM
52njm+YGFxYXwVzkDrwxGb6cPbqCd5qFN1kSckGe3SEOUMn/LWqJxyKqpvRIkFj2
Yft3IRNX9OxUdD98KioktarjDgv3mZehpysKFdkW7VSpdr5CPtR3Rq6MFuJGjvR5
7MUWriFlbJU2vGHfRkbrHoelcsf0U4oBY9boUbgeM2uNEaBH3yufd3P1L6+BJalM
1IMseqRlkme3eFA7EoRSmJnSjqfMsG/PfELNtLxsq1lLqITYTra6fLFPkqsDx+Bc
WFn74H9hnB79aT1+pPYREwBD4lWK9i6XIdQcWthCjXu5OX3Hvrd3R67ll7U4P/Ls
anQAAf4vcaRwQzlo0JrYOEuufTkqIp5cBbqV+hmn/h9VjU9i/rdsIMh1I2aIAzfZ
CtUSwkL0pDIetCw/wcVN4QyE/MjQpPfgvLk3cDqYdrYv/gGwb5ozhlEHyPVSjmQs
f7nOX9gJFReozZ/uM7MN1dybTcL3wckPO7o8k+I1J0PbsnoT7bY=
=NdqO
-----END PGP SIGNATURE-----

--Sig_/5sBh_HL/bIqXwtESU+hjP6J--

--===============0032476312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0032476312==--
