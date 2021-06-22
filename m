Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720953AFEDA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655C36E0C8;
	Tue, 22 Jun 2021 08:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7576E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:12:44 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q23so18445832ljh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=l80hFXzIVguJ2ISI6NvoXUY8Ngy0ZHuL8PmMh8jl6og=;
 b=FAtsu82bSvKCc9BzPjAKU6upCOD8/CotbXoiLjuYIBWWv7A66ZjxWqsLPWkJZMsz8Z
 tuLi8xFXyaLrld8RhiaxbpIRqZhMpuh6M3i3W1g0BnR4AbFA58fl9YPXk9Vfv9jhus2Y
 o78sz7GI0GEybcqwBgio8xnaEHmwdK3MMJmgddNu9fisMg8hKYkRCeXwXSg0tIL+gCrz
 CqbMUSH2+klJDWY5myaySJTErd5/8TmLiLwrUcIo3mVXQPzjBEixYFRdRa9KkQoJQ7+0
 fGz4bBWBeDYnA6cFszLlG1nt2zIOHYzcokCOHQXHTgNC1tBiYZZYFm7NOZNFvIcgNp76
 pcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=l80hFXzIVguJ2ISI6NvoXUY8Ngy0ZHuL8PmMh8jl6og=;
 b=Aba1k5vIbngRYlCfhLb6vGIh7PS15DZiqDvFq4xD+mlKWE5nrkkNlEFglE7YI4bsG/
 ZBkPraryuya5QQULHj/qFNNbmJo2AN0sbVx+ymwwxPMPFP6V72BTa8f7znR3l3hXMayJ
 Ej8mtLNkPvAHaC8lRSseLAO5wG4c0GksgC21zYzrky0MPbff9Am9CTaDFFYehSeG9K4/
 BgElbTz9B0OXdTx3ifnzPVHrV384dwrCe3jFFQAu+0vqBRQuYLPVanebFkwZBACVF4J5
 e7+JirGrcOjNgOJ6qzgAQHOg/8PLdaacxJXBhFHOLoElTBcdcEXcbdof60+wkcAZvy34
 DAcg==
X-Gm-Message-State: AOAM5331NZypblIHJDiE8VWqhBevJz//DKAOieIvnikGLVOFiMpZZQIl
 V53s8hj9ylXbdYt82j6iguI=
X-Google-Smtp-Source: ABdhPJzTEya+DK/dLqz4GNf60M0oDM35gbd62pS5Hcq3OiM3+lZjB0AsJ69A5UWRga08aSjmBP+YAw==
X-Received: by 2002:a2e:b548:: with SMTP id a8mr2178007ljn.346.1624349562553; 
 Tue, 22 Jun 2021 01:12:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q6sm2127899lfj.88.2021.06.22.01.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:12:42 -0700 (PDT)
Date: Tue, 22 Jun 2021 11:12:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210622111239.73aa87aa@eldfell>
In-Reply-To: <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6Ioj+ZDqgcM+6oFIVX7Ffxl"; protocol="application/pgp-signature"
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
Cc: devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6Ioj+ZDqgcM+6oFIVX7Ffxl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jun 2021 13:03:39 +0900
Esaki Tomohito <etom@igel.co.jp> wrote:

> Hi, Enrico Weigelt
> Thank you for reply.
>=20
> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:
> > On 21.06.21 08:27, Tomohito Esaki wrote:
> >=20
> > Hi,
> >  =20
> >> Virtual DRM splits the overlay planes of a display controller into mul=
tiple
> >> virtual devices to allow each plane to be accessed by each process.
> >>
> >> This makes it possible to overlay images output from multiple processe=
s on a
> >> display. For example, one process displays the camera image without co=
mpositor
> >> while another process overlays the UI. =20
> >=20
> > Are you attempting to create an simple in-kernel compositor ? =20
>=20
> I think the basic idea is the same as DRMlease.

Hi,

indeed. Why not use DRM leases instead?

> We want to separate the resources from the master in units of planes,
> so we proposed virtual DRM.
> I think the advantage of vDRM is that you can use general DRM APIs
> in userland.

You do that with DRM leases too.

> > I don't think that's not the way to go, at least not by touching each
> > single display driver, and not hardcoding the planes in DT. =20
>=20
> Thank you for comment. I will reconsider about DT.
>=20
> > What's the actual use case you're doing that for ? Why not using some
> > userland compositor ? =20
>=20
> I think when latency is important (e.g., AR, VR, for displaying camera
> images in IVI systems), there may be use cases where the compositor
> cannot be used.
> Normally, when the image is passed through the compositor, it is
> displayed after 2 VSYNC at most, because the compositor combines the
> image with VSYNC synchronization. On the other hand, if we use vDRM, the
> image will be displayed at the next VSYNC, so it will be displayed after
> 1 VSYNC at most.

As I said in my other email, this is false in the general sense.

> Also, since the compositor is a single point of failure, we may not want
> to make it dependent on it.

This... I'm not quite sure I buy it. If any of all the programs using
virtual KMS crashes, you still lose some crucial components from your
display. Maybe that program, while crashing, uploads such a bad state
to its very own KMS plane, that it causes other KMS planes to
malfunction. Then you need to detect this situation and still restart
everything, not just the crashed program.

I would think a userspace compositor approach is actually more
reliable. You write the compositor to be extremely robust. Exactly
because the compositor is in control of the complete display device and
not just little pieces of it, it can see what is happening and it can
mitigate problems. If you have more unreliable components needing
access to display, make those clients to the compositor, so they can
crash and malfunction on their own without potentially killing the
whole display device. If you are as concerned about latency as XR
people are, then use DRM leases.

Also, what if your virtual KMS driver has a bug? Restarting the kernel
is much harder that restarting a userspace compositor that hands out
DRM leases.

The userspace compositor could even be such that it does nothing more
than handing out DRM leases. However, DRM leases have the problem that
there is no single entity responsible for keeping the display device
working, but that responsibility is split between several processes and
none of them sees the whole picture.


Btw. VKMS is an existing DRM driver, so your name choice is conflicting.


Thanks,
pq

--Sig_/6Ioj+ZDqgcM+6oFIVX7Ffxl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDRm3cACgkQI1/ltBGq
qqdYIRAAja56P3aL+jh8qcOULrgGk62ujpwQF8VBpOOdE7mT5c3nR4kvTk233Yde
LSzSECRrIiVFMCdPwt0J27DtT/2NSkwT5tTRr4Rl0uA+TdNYdcnVpLUjFMXKQl0W
WOQoOIGCK7evGbY0v5nzQBTCuOQ5va6/1yUWLjsPl57/fmNwCrppmynWIf+m1nPJ
jSqrMdbkisAkMcnVR/s9cZWj2x0mUs6xV7OIgtAkrI6gnbPejGHmPXz/a3Atmg25
hc9FzwOZk/zTR7GeMsZjjRTMKsutbHTR7SSIcV6D6cYVxyro4aRRxHmAIr5q43qM
VjKM0XZFNvCt+TPkmUeMgG/LyiqjgRD6iqIpZjt2nGmMwPTXq4r7qDsKf0kWeLh4
bjZ6JqfwD6JM+qInpjTycefcrerWip+debLK3m87HzVxUogFWrR1+SyhESzMVL3f
bGVBdiDkRf8p/lkNuDF7c1F1NDipbzB9z2HYl9hGHplpZGVkN8r4FmJkdHv/Cv9p
XfUNLhvBvHwgvWnCC20TLws3LFRs/Uq2gEYG+4hHZE3EuFsP00i+/zBCwzLtE829
4v/m32+BJivsy7HGJS+JM4hd2LkMpLxLxKHdxlolw++m5J05YQyMjmSD3LGuDneE
WxQsX/R8PwKe2FOAxVGqnDJ+bnfl8OT0XTYorm4fRWh1qk+oq4I=
=UJJD
-----END PGP SIGNATURE-----

--Sig_/6Ioj+ZDqgcM+6oFIVX7Ffxl--
