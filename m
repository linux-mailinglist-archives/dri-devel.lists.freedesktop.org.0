Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C125F7605
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 11:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39FB10E93D;
	Fri,  7 Oct 2022 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46AD10E0C6;
 Fri,  7 Oct 2022 09:18:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 10so6419871lfy.5;
 Fri, 07 Oct 2022 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XlatRhPPHvjakB3hqRULplqr0Jjuky9gnjEbVvmO4oY=;
 b=YQ46SxPfi7XjxzCwus7XXZd/82UuGEEwVURK4TC98xwOAOHeFSXev7HbJdww6uxHQU
 skaCl5ufl7V7eToP2p9JOd/mZVAwBM0XxCRdlOIifvJCCLyHCjAEPMGc+4OSc1oAo6dW
 vCx7oCswFFr3l+mIS3sxTWSg27CPIhiBGQyB6R3aakH/zsRWcC2hPROd1nWqUwouuIJD
 qmb3OgTTSJcpMRNqeS7HDXO7+EiTDXnvzqnMnVIJ3XQfPWtMulZZrtqlqq3ZrR1mqjnf
 MmKcAmZy4oUOCat4pDASHykWzNoKOm7icuH28RXvWhBWOlMo68LFi55QHSeuc4qbhQZB
 Jb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XlatRhPPHvjakB3hqRULplqr0Jjuky9gnjEbVvmO4oY=;
 b=uTK9H++ini7B6LVcF1zmWfMm9+9xiv2gMA8cdD/KVjR1DbuVYOUMYT3VyelpQNpWxd
 KjeOmH5aAq1NEKf9U4Rm8/BnxekHm8ayfcKE0ZdNyjNK8cLm5GY/QMCTEYN6WNlU9JjA
 SPmKx677IIylyhUgp3j3oMBwYqqtAkYxZTgSMHYod4UOctmQtZ7jSvTi3ifR3go0F39u
 uK1fnUlsXlteeTy5G27Vm7BzQG/LURprrRpfC/zRNHbq1nhGL4uDgRowNwGDxIe3H32j
 W7zM720qqOIeZ/7Sl/FENuv8i2GqDIG4YfvbOTY+XQBpQVD86jr5RcyobjPz13HJqYRX
 RjSw==
X-Gm-Message-State: ACrzQf22jS5FIZT8sv0v7rjAwPYEY8LIVG7vpPRjbwv8JSPcCK3KhHHS
 /ZKr/zu/1OqUPtLdet1TIK4=
X-Google-Smtp-Source: AMsMyM53KwWBWtUPIfPxQPZtW9RfTXhC2B923iEHltctvhLvkORbzBu8AkrG++f3IbOpl+OKAy5CKg==
X-Received: by 2002:a19:ca46:0:b0:4a2:7c86:3a10 with SMTP id
 h6-20020a19ca46000000b004a27c863a10mr1593791lfj.649.1665134328027; 
 Fri, 07 Oct 2022 02:18:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u13-20020a056512040d00b00494a1e875a9sm217842lfk.191.2022.10.07.02.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 02:18:47 -0700 (PDT)
Date: Fri, 7 Oct 2022 12:18:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
Subject: Re: Internal DRI subsystem locking and contention between connector
 commits
Message-ID: <20221007121836.61e573fa@eldfell>
In-Reply-To: <0607ee97b0af4b9fa8f17cb99388e214@garmin.com>
References: <0607ee97b0af4b9fa8f17cb99388e214@garmin.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cuuqWphze+kZ69v+reSSsEC";
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/cuuqWphze+kZ69v+reSSsEC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Oct 2022 12:03:56 +0000
"Hoosier, Matt" <Matt.Hoosier@garmin.com> wrote:

> I have a DRM master implementing a purpose-built compositor for a
> dedicated use-case. It drives several different connectors, each on
> its own vsync cadence (there's no clone mode happening here).
>=20
> The goal is to have commits to each connector occur completely
> without respect to whatever is happening on the other connectors.
> There's a different thread issuing the DRI ioctl's for each connector.
>=20
> In the compositor, each connector is treated like its own little
> universe; a disjoint set of CRTCs and planes is earmarked for use by
> each of the connectors. One intention for this is to avoid sharing
> resources in a way that would introduce implicit synchronization
> points between the two connector's event loops. So, atomic commits
> made to one connector never attempt to use a resource that's ever
> been used in a commit to a different connector. This may be relevant
> to a question I'll ask a bit later below about resource locking
> contention.
>=20
> For some time, I've been noticing that even test-only atomic commits
> done on connector A will sometimes block for many frame-times.
> Analysis with the DRI driver implementor has shown that the atomic
> commits to A--whether DRM_MODE_ATOMIC_TEST_ONLY or
> DRM_MODE_ATOMIC_NONBLOCK--are getting stuck in the ioctl entry code
> waiting for a DRI mutex.
>=20
> It turns out that during these unexpected delays, the DRI driver's
> commit thread holds that mutex while servicing a commit to connector
> B. It does this while it waits for the fences to fire for all
> framebuffer IDs referred to by the pending connector B scene. So the
> commit to connector A can't be tested or enqueued until the commit to
> B is completely finished. The driver author reckons that this is
> unavoidable because every DRM_IOCTL_MODE_ATOMIC ioctl  needs to
> acquire the same global singleton DRM connection_mutex in order to
> query or manipulate the connector.
>=20
> The result is that it's quite difficult to guarantee a framerate on
> connector A, because unrelated activity performed on connector B can
> hold global locks for an unpredictable amount of time.
>=20
> The first question would be: does this story sound consistent? If so,
> then a couple more questions follow.
>=20
> Is this kind of implicit interlocking expected? Is there any way to
> avoid the pending commits getting serialized like that on the kernel
> side?

Hi Matt,

Ville actually mentioned something very much like that recently, see
the thread at:
https://lore.kernel.org/dri-devel/20220916163331.6849-1-ville.syrjala@linux=
.intel.com/

If even non-blocking commits can stall test-only commits, that could be
a problem for Weston too. Weston being single-threaded wouldn't help.


Thanks,
pq

--Sig_/cuuqWphze+kZ69v+reSSsEC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM/7uwACgkQI1/ltBGq
qqfR6RAApGvzombfW/d2+/jxNl4WRN3tCuKAjmQiQdUVch+3nm4hp0j8HtFNl+p/
FI+OhkmVM7AeWV2CHu6/SeDKtgxA3vaWMKtV+EBkMzjClEJOK3iR7iCUWNWZkwmz
jDgJAk+KEfPS5HtmNokbNoS9wkNI+PTOsFC9Jnn4fuBdUz195jfzr/ZqWvMnK5qt
HQ96yNTn6Z8jcD0dZ/dIroGCJSOMVPfDzAxRSIZ1HLo5wVI+Uv4VAOboY/zR134C
tD/VsztoBWlDqV5hXWZXff8nG/p3KiZon09Th0hrkZZzsnxuAJ8HhJqXLAlJSOfK
i6q0d/u320TjTInTZ6UqOem6Csq3bxUVFfPUdRhEulCPDyhBpOuXLRSCYe1RkUJC
kF8CeaSWBC4jz3es7GjEE5fqueHQHQdlZGIBGbrY4gCJXbDsTSbOnT97wNeBDNQT
uLq2lLc1onwAyhazRNu0pucSEyre3FYltGJpcVhyZ2O4NVqSaMmRnSm/ZmHfzkLj
NXN6a02ZppyXrylbt98at9gT/gwA9XWbvbnHB2qbyTEY031WsIV0XFwMn+PdBSDS
lffDryu9ixgO4QBrr0X8I0SIurlQ/nYDBZScpM674ACZByRn20Qm7NgT381eAeWZ
1tHVQ3LZVymavLRioG/8OIKLA1BafXe64hPvg03Q/ZzAuZkx4f8=
=U4ni
-----END PGP SIGNATURE-----

--Sig_/cuuqWphze+kZ69v+reSSsEC--
