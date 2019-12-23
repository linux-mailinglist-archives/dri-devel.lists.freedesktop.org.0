Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702812936C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 10:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AC16E22A;
	Mon, 23 Dec 2019 09:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F856E22A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 09:00:28 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r14so12024045lfm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 01:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=aa6Dpm6sR/qHUolT0Qp1hv5sK71IVF5Jg8qXnOnpGpA=;
 b=sTvyaCGa2znXHXcZ6qQWQMBzuVtK1jM4XvP0aOFm/iKh48upHNWWE5bj6EP5L65pRp
 eFku/+WIQPUfi8b7BsUixBQ7eRLXwIUZYA3B3+to9dGEFmeSPHMbW/VFSHqd+ESMzJ2X
 JnUXo86OihimbluKAFnVfRJCURkVlrblLwmWEadjobMM/IDPXj+MwSHmrU012zkx2amV
 qIy5gX3preJ9Wt4FHmDH8yrehUyGN9ca4TvszI0GPZtti3jhCsBi5zYXgwyEQ+O2Rmlh
 uBccUt9qGeX/4GbeCx/GgBsdrMQ+xPBrgl9+3TnBJQxQGe8t+19Gq0g5rDiNmBtICFJp
 oqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=aa6Dpm6sR/qHUolT0Qp1hv5sK71IVF5Jg8qXnOnpGpA=;
 b=Mb7rgmvemefgYTVqSaYfKVBis9a7nWyNgF8UNuSt5hiXgJB3rgtQuEifIi8TsHxOHR
 EwBHm3zwfJL08/9igSvS1H9bdcZXNib/TZ8toObDc4KdjyNlmXl7zRaiLF4cO/D49X13
 49jzC16tSWKPtgRPunuziBs7Y5Pi9Yrj0SsqGwE949IzyM91esiirUwg4sVTm2D9fS5S
 rYPqbNwbXFaQXzhz8B/mPLczmcecr7h6JuQRCzrLLuAKqobZ9eARGtMh04fo59f+PfZ3
 ElB3dC18Xr8TWgOZ8akBP/zLcvUr7y0r0Pocqv5+Z7VdBh1Xyo3fEX6wqALBfpj8y5ii
 LHnw==
X-Gm-Message-State: APjAAAWcIXDPt9L47wBrPQv8ZpEujN+7l+g4cJLUSO8zeRB7RqHwbVPg
 qDcdtdmy+tvIs5rJOYiIwiY=
X-Google-Smtp-Source: APXvYqy4489+nwxlz1EFTjFZy/ab2gVV0cuq1tz8F501j3asrgl8ycX7+kCaxsiFoP5Hc//dj0fLuw==
X-Received: by 2002:ac2:5147:: with SMTP id q7mr16189501lfd.87.1577091626673; 
 Mon, 23 Dec 2019 01:00:26 -0800 (PST)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id 138sm8019591lfa.76.2019.12.23.01.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 01:00:26 -0800 (PST)
Date: Mon, 23 Dec 2019 11:00:15 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: SIGBUS on device disappearance (Re: Warnings in DRM code when
 removing/unbinding a driver)
Message-ID: <20191223110015.0e04ea25@ferris.localdomain>
In-Reply-To: <CAKMK7uHEL3WzSHDM3XdLwOBtQUtygK6x-md8W1MVsAryDDgFog@mail.gmail.com>
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <f867543cf5d0fc3fdd0534749326411bcfc5e363.camel@collabora.com>
 <c2e5f5a5-5839-42a9-2140-903e99e166db@huawei.com>
 <fde72f73-d678-2b77-3950-d465f0afe904@huawei.com>
 <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
 <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
 <CAKMK7uE+nfR2hv1ybfv1ZApZbGnnX7ZHfjFCv5K72ZaAmdtfug@mail.gmail.com>
 <20191219113151.sytkoi3m7rrxzps2@sirius.home.kraxel.org>
 <CAKMK7uHEL3WzSHDM3XdLwOBtQUtygK6x-md8W1MVsAryDDgFog@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dbueso@suse.de, "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kongxinwei
 \(A\)" <kong.kongxinwei@hisilicon.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: multipart/mixed; boundary="===============0453982668=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0453982668==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oSOg+0g8SiapMgx3IUoxrFY"; protocol="application/pgp-signature"

--Sig_/oSOg+0g8SiapMgx3IUoxrFY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Dec 2019 13:42:33 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Dec 19, 2019 at 12:32 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > While being at it:  How would a driver cleanup properly cleanup gem
> > objects created by userspace on hotunbind?  Specifically a gem object
> > pinned to vram? =20
>=20
> Two things:
> - the mmap needs to be torn down and replaced by something which will
> sigbus. Probably should have that as a helper (plus vram fault code
> should use drm_dev_enter/exit to plug races).

Hi,

I assume SIGBUS is the traditional way to say "oops, the memory you
mmapped and tried to access no longer exists". Is there nothing
else for this?

I'm asking, because SIGBUS is really hard to handle right in
userspace. It can be caused by any number of wildly different
reasons, yet being a signal means that a userspace process can only
have a single global handler for it. That makes it almost
impossible to use safely in libraries, because you would want to
register independent handlers from multiple libraries in the same
process. Some libraries may also be using threads.

How to handle a SIGBUS completely depends on what triggered it.
Almost always userspace wants it to be a non-fatal error. A Wayland
compositor can hit SIGBUS on accessing wl_shm-based client buffers
(regular mmapped files), and then it just wants to continue with
garbage data as if nothing happened and possibly send a protocol
error to the client provoking it.

I would also imagine that Mesa, when it starts looking into
supporting GPU hotunplug, needs to handle vanished mmaps. I don't
think Mesa can ever install signal handlers, because that would
mess with the applications that may already be using SIGBUS for
handling disappearing mmapped files. It needs to start returning
errors via API calls. I cannot imagine a way to reliably prevent
such SIGBUS either by e.g. ensuring Mesa gets notified of removal
before it actually starts failing.

For now, I'm just looking for a simple "yes" or "no" here for the
something else. If it's "no" like I expect, creating something else
is probably in the order of years to get into a usable state. Does
anyone already have plans towards that?


Thanks,
pq

--Sig_/oSOg+0g8SiapMgx3IUoxrFY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl4Agh8ACgkQI1/ltBGq
qqcrog//Yo3U/N4JzdLnUqmXy6bf0cwQqwkriI658FNiERT8OtbBwU8JSg90qaMi
4BHz5mE4LFFbhX4f4Tb2g+4ELbNa5K217o8izPC9vAp5jUsaJo6L7z8fZrHzvcWC
WaIwlNEuP27sEeQoyhhKY2lfxIaQJNjPS9IpYHxGi13xdBvOO5CRfjVDpRrY7Fzk
qCHyBgLK1dxaP1dGO5KT63KrMFTdePWYgJ3mS3ZA20GM00gxEgHvlcCR/4LY+Vn8
owwybWTojC8ozFpA4RdQgm5pXRMrEcIb+Z1raDzDs6iYK8lDUAhKocsnVVxpTHmv
OXyqI3faRtmWnIkDa6e8Yge0V18VmKavJc6BRvXO2trVYuXz0mV4HggSmgL5pbcE
bSo7qahDfWL0Td1SgJ6hN3hbmCkENhkZcs6K/oFnq2rOszDB9v8apkQhl/nprNfT
Vl6d+YeIZbLz/vhKFk4qLs03x1xRxvP4tbcCrAcWM15DXkTzYF5w1lBNoC7lu8vY
rJgZBYkv3v4dVpdJKY0sSQ0mY9uDeukaiGItMoJTjejR+XZnkZU5iXf93MOCa+O+
/3tA2VJzsBPfqhf752FMsYkoXaOPGYmEuPhpIukeuGuPGaack0GV8LG5Mq2WJz4m
NZ+4vnkZom83dH9yeLccZEK1GUxJgAZ/CrxQ/8nZygtdmVQjkgU=
=KwQo
-----END PGP SIGNATURE-----

--Sig_/oSOg+0g8SiapMgx3IUoxrFY--

--===============0453982668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0453982668==--
