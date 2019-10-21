Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BEDDE70B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500C589A8C;
	Mon, 21 Oct 2019 08:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95D189A8C;
 Mon, 21 Oct 2019 08:48:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x4so3077423lfn.8;
 Mon, 21 Oct 2019 01:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=a/NTPTmkGWRlcJqr+O69Sb03fY3y5azMiPY7JjjjffM=;
 b=ibR9XpeA35Yx8MZakeLmop9z/ilrmW+btCK2W7cgX6Ebmnu5oLxkId9cP4pJ/7f2Gb
 cDJhV85jy+WswFC4RD9mZfM5R78mEvrMMIzMd27X2RVPemrfZTLQDEitt9Q6zzy3PeqZ
 rcX7PkZ/S6dC484IJwDtobV6Hc7fo3LQyioDnLgT6mS1zRxGFw38a91p5P0P/bqyiAhk
 kXgYLaz5AgImLQvi7vCkNlysuHGNEiVLGGVwdk8sNcORu1H7RxKErfkECHSmxcJce3U8
 OSUJvx5Si2hujcRp0ug8dycArE72ko7+PeCW9wzEdh4mx92bjyd2D9di8GkT0YA6Moiy
 kTpg==
X-Gm-Message-State: APjAAAUOmlo9MQeyy0CQdr1/fSwIOVwhSYQzuRgiTFvapLsvaKbD8ffR
 DoX/o8XZOOcDeVTiM3ye2H0=
X-Google-Smtp-Source: APXvYqyN2Ub+ZZaA16++UIYwuNvkj/oIkcW9MLCYO9q1AqLsEFlDkaWbfJeEjTvAd11CWhLM9DLoMA==
X-Received: by 2002:a19:7b11:: with SMTP id w17mr14248416lfc.188.1571647720573; 
 Mon, 21 Oct 2019 01:48:40 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h3sm8542082ljf.12.2019.10.21.01.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 01:48:40 -0700 (PDT)
Date: Mon, 21 Oct 2019 11:48:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-ID: <20191021114828.0145741d@eldfell.localdomain>
In-Reply-To: <CAKMK7uFUOajmkBMUC0vUgiG1_qO8V4nSBb2wHe=tyRcskrVJig@mail.gmail.com>
References: <20191018122130.0f880724@eldfell.localdomain>
 <BXSMP84X56T9.317VNFYFVMCWW@homura>
 <20191018164329.412b14ca@eldfell.localdomain>
 <CAKMK7uHw42R6m0UYrbWnaMRuQm7VQ7_0Ta8eqaGNGKtve43row@mail.gmail.com>
 <20191018173437.0c07c2db@eldfell.localdomain>
 <CAKMK7uFUOajmkBMUC0vUgiG1_qO8V4nSBb2wHe=tyRcskrVJig@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=a/NTPTmkGWRlcJqr+O69Sb03fY3y5azMiPY7JjjjffM=;
 b=YOjvVcS1g7SqvGbZjd4wy0cLRjK7EY45tQq7jFyLjxiIb/ycZeesBbQgxr/SHccxM4
 qkiAeeotL1IrgOeCb6jQO9M1y2vOItyYp7sHMXhturo7XmyG+UGFCkoBGfGw0/3Islzw
 XNfphmwUfBxDh3vunD7dOJAADeyqOMiK2uPZkgabopmuIhTFsc+5j3lvIimrRbyuPTvx
 a2rNtaelWGcQ/ugBHNFkRnQYTH/V6dn0EqFLHvvjJb69kZfah9GkIgC32IJmM3eb5EIn
 yp8iFE54M1CSt4Tw7HkNj7gIZBraAK/VtAun1sRg0/KqXWFQ9UUtC2uMYJezifB9hHJz
 wN1A==
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
Content-Type: multipart/mixed; boundary="===============0418476264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0418476264==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Gy9aDQsK8/f7IbwuCToDa9_"; protocol="application/pgp-signature"

--Sig_/Gy9aDQsK8/f7IbwuCToDa9_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2019 17:47:49 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Fri, Oct 18, 2019 at 4:34 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Fri, 18 Oct 2019 16:19:33 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > =20
> > > On Fri, Oct 18, 2019 at 3:43 PM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > >
> > > > On Fri, 18 Oct 2019 07:54:50 -0400
> > > > "Drew DeVault" <sir@cmpwn.com> wrote:
> > > > =20
> > > > > On Fri Oct 18, 2019 at 12:21 PM Pekka Paalanen wrote: =20
> > > > > > One thing I did not know the last time was that apparently
> > > > > > systemd-logind may not like to give out non-master DRM fds. Tha=
t might
> > > > > > need fixing in logind implementations. I hope someone would ste=
p up to
> > > > > > look into that.
> > > > > >
> > > > > > This protocol aims to deliver a harmless "read-only" DRM device=
 file
> > > > > > description to a client, so that the client can enumerate all D=
RM
> > > > > > resources, fetch EDID and other properties to be able to decide=
 which
> > > > > > connector it would want to lease. The client should not be able=
 to
> > > > > > change any KMS state through this fd, and it should not be able=
 to e.g.
> > > > > > spy on display contents. The assumption is that a non-master DR=
M fd
> > > > > > from a fresh open() would be fine for this, but is it? =20
> > > > >
> > > > > What I do for wlroots is call drmGetDeviceNameFromFd2, which retu=
rns the
> > > > > path to the device file, and then I open() it and use
> > > > > drmIsMaster/drmDropMaster to make sure it's not a master fd. This=
 seems
> > > > > to work correctly in practice. =20
> > > >
> > > > That is nice.
> > > >
> > > > Personally I'm specifically worried about a setup where the user ha=
s no
> > > > access permissions to open the DRM device node directly, as is (or
> > > > should be) the case with input devices.
> > > >
> > > > However, since DRM has the master concept which input devices do no=
t,
> > > > maybe there is no reason to prevent a normal user from opening a DRM
> > > > device directly. That is, if our assumption that a non-master DRM f=
d is
> > > > harmless holds.
> > > >
> > > > (Wayland display servers usually run as a normal user, while logind
> > > > or another service runs with elevated privileges and opens input and
> > > > DRM devices on behalf of the display server.) =20
> > >
> > > So the rules are (if I'm not making a mistake)
> > > - If you're not CAP_SYS_ADMIN you can't get/drop_master. =20
> >
> > Hi,
> >
> > not able to drop, yikes. So if someone pokes the Wayland DRM leasing
> > interface while the display server is VT switched away (does not have
> > DRM master), and maybe no-one else has DRM master either (you're
> > hacking in VT text mode), then a new DRM fd would be master with no way
> > out?
> >
> > So Wayland display servers should make sure they have master themselves
> > before sending a supposedly non-master DRM fd to anyone else. I wonder
> > if the Wayland protocol extension needs to consider that the compositor
> > might not be able to send any fd soon. Being able to defer sending the
> > fd should probably be mentioned in the protocol spec, so that clients
> > do not expect a simple roundtrip to be enough to ensure the fd has
> > arrived.
> > =20
> > > - This is a bit awkward, since non-root can become a master, when
> > > there's no other master right at this point. So if you want to be able
> > > to do this, we should probably clarify this part of the uapi somehow
> > > (either de-priv drop_master or make sure non-root can't become master,
> > > but the latter probably will break something somewhere). Plus igts to
> > > lock down this behaviour. Note that if logind does a vt switch there's
> > > a race window where no one is master and you might be able to squeeze
> > > in. So perhaps we do want to stop this behaviour and require
> > > CAP_SYS_ADMIN to become master, even accidentally. =20
> >
> > That would close the loophole that Ville mentioned, too, otherwise
> > distributions should aim to not give permissions to open the DRM device
> > node. =20
>=20
> I'm kinda wondering whether we have to do this as a security fix, with
> maybe a module option to get the old behaviour back for those who
> need/want that. But I don't even know whom/where to ping for logind
> folks ...

I would guess https://lists.freedesktop.org/mailman/listinfo/systemd-devel

It's fairly low traffic nowadays.

> > > - I thought you can always re-open your own fd through proc? Which
> > > should be good enough for this use-case here. =20
> >
> > We can? And that creates a new file description the same way as open()
> > in the original device node? =20
>=20
> I dreamed, it's just a normal symlink, nothing fancy.

D'oh.

So we have two options: ensure logind is happy to deliver also
non-master DRM fds, or prohibit an open() on a DRM device node from
becoming master without CAP_SYS_ADMIN or something, right?

Drew does have a point though: if a non-CAP_SYS_ADMIN process gains DRM
master, it has no way to drop master, does it? Which means it's
impossible to VT-switch away from it and have something else gain
master?

Still, I can see how someone could rely on gaining master via open() and
as non-root.


Thanks,
pq

--Sig_/Gy9aDQsK8/f7IbwuCToDa9_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2tcN0ACgkQI1/ltBGq
qqdQ4RAAsW6ck8DEQ2Tq+ga9fvOaCPqddF/P4DNgMtLnCQGtAb8NPduvd1aVTXtC
UNn1wB4L2UxrtZZg9b3Engn3itRIBnXl9l/xqhrDxCHfuA2a/04iyuZuPc7wZ2b5
nULJYIJtKBXIgbvf8l+oVgpbrbbp1NALk28fimOFZE2O0F2RkLMMIcpUnV0zL1U8
vBZwdhfjaPtSIujt/S/+jPWPG1ajwkVSu7Rzf//ri6X2Oi99/9vphEl9USMHyVuI
HsMkUWI894L16B9F7U57Wd4J3tZ6VLfcp4RxJ/WVlR9H1fViVJxpgQr0vAhn5MNU
wYDBBXcHnqkAK3ACE/5T1/qCj8xXKuIcMJ5pEYiyEPi+pcJMujZT66B8Ii9gC8zj
p9e0DJLQRn8e+cCUisOBtdpOXkgzp9WbnAwvgwl2h12wKAoGvEDU1NGw4TnIC9cx
QwHfHuUy1NaCjgGrfrKvFkGofTosC/aZd3wl5U3r0uGk1frEpbJqZ0qii27LwooA
x7CQQnTA8HQcAxs/oASLK9ZrKDHosaANToEO/Hnvad5ZPYfxyPW1f6pU5NDOOZ3C
357W8Vowt8Q6R/mjr7nuny7c+pzS2cL6KVrBg/Yr3m/DGEXEDVAs9nFMl0MFofx2
erBVKRyVKev4x/ww4i1SJoJa11gMefheoTOrO4tad2TP01vtTSc=
=82Dd
-----END PGP SIGNATURE-----

--Sig_/Gy9aDQsK8/f7IbwuCToDa9_--

--===============0418476264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0418476264==--
