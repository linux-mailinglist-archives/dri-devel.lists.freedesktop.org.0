Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2991880D44
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 09:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2B610F0F3;
	Wed, 20 Mar 2024 08:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="lgaO33xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0610F0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQ7grTt5l/wl1ANb32y4ry1ULYSvaj54agNiIlVV4ko=; b=lgaO33xpAlAFm/337ZP4Mu4eXZ
 N0y+lURTrkSohWPnj2n/Pr99tlUijcQRKklL6bhRyrsX2a2CNLzCRplYeE/irWadT6oKQZwCpo57g
 jgvFYaMmYtXuP4yu90+4d5lJMsSMb36ntMGzrR6N1fAiY56wLAXyJNe9mmXNl3J6dbTOf+8oof+Zz
 qJ0C7fq4G+fNxHuCfho/9Ba1hC6hdwlo3w1TmWD9/WULg+5ewh1y2kEa60JZtiKw321r657hy34id
 1cgGoL7tJCQTfbYtx74uXxeVGHPIIOC3w87Hvg2cvR79iHiUTteDSyPQe4wmFBehMaxwH/5tZRtw1
 S0jm66yA==;
Received: from [194.136.85.206] (port=44554 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rmrWE-0004uD-0k;
 Wed, 20 Mar 2024 10:41:54 +0200
Date: Wed, 20 Mar 2024 10:41:45 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: dri-devel@lists.freedesktop.org, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel.daenzer@mailbox.org>
Subject: Re: Handling pageflip timeouts
Message-ID: <20240320104145.4ee337a9@eldfell>
In-Reply-To: <CAFZQkGznMXLXOPEOujk6DoY_BJZ1=t9GTCQoxNEvT9ndNa=Kyg@mail.gmail.com>
References: <CAFZQkGznMXLXOPEOujk6DoY_BJZ1=t9GTCQoxNEvT9ndNa=Kyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9_f7yTolI62lnTwGuMpnjlG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/9_f7yTolI62lnTwGuMpnjlG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 15:45:47 +0100
Xaver Hugl <xaver.hugl@kde.org> wrote:

> Hi all,
>=20
> This was already discussed on IRC, but I think this should be on the
> mailing list as well and get some more official conclusion that's
> written down somewhere.
>=20
> Recently I've experienced a GPU reset, which the system successfully
> recovered from, but the display was still stuck - because amdgpu hit a
> pageflip timeout, which causes the compositor to wait for a pageflip
> event that will never come. Some other experiments I did before showed
> that even if the compositor tries submitting new atomic commits after
> a timeout, those commits are rejected with EBUSY, presumably because
> the timed out pageflip is still considered "pending" on the kernel
> side.
>=20
> After restarting the compositor, everything continued to work
> correctly, so this state can be recovered from. Because of that I
> think it would be useful for the kernel to act on pageflip timeouts
> differently. It should
> - signal the pageflip's completion to userspace
> - maybe have a new event for "pageflip failed" to give userspace more
> correct information in the future
> - allow new commits to happen afterwards
>=20
> Another case discussed was when the device is completely removed.
> Right now, if a pageflip is pending when that happens, userspace never
> gets the event for pageflip completion, just like with the GPU reset.
> KWin ignores pending pageflips on hotunplug, because the device is
> removed it's not a big issue, but uAPI wise I would expect a pageflip
> event to arrive for all commits that request them, no matter what -
> and if that is not possible or desirable, uAPI has to be changed, for
> example by introducing the mentioned "pageflip failed" event.

I agree.

=46rom my point of view, after some serious failure in hardware or
driver, the main question is:

Can already open device fds continue to be used, or not?

If the intention is that they can continue to be used, then a page flip
event must be eventually delivered if one was expected under normal
circumstances. Otherwise userspace cannot continue. Or, if userspace is
supposed to employ its own timeout for waiting for the event, then
that's is new'ish UAPI, and the device must stop returning EBUSY for new
commits.

If the intention is that open device fds have become unusable, then the
kernel should follow the same policy as for hot-unplug, which is
documented at
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#device-hot-unplug

Specifically, EBUSY is an inappropriate error to return in that case.

This includes sending the udev event for device removal, and everything
that implies. The hardware can then come back as a new device.

The case at hand sounds like a driver bug to me.


Thanks,
pq

--Sig_/9_f7yTolI62lnTwGuMpnjlG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmX6oUkACgkQI1/ltBGq
qqc39BAAqivgFhWqavZXw+97y+uC/bRZcGqwJJcsS/AAoc7zT4q+eXtY1u0S64a9
sVdPO06jguKRMr+2RIzT8+a1YA4HLNzEYfJROvwgxrmiOjsynVDxyoHR5kBU9404
M8xV+ehNgyLe6nitdet3S0SZVQ85oTaXrlYlZsZq6Mk18oKnnBfdRr+IKgdsjSFp
3NYQSQokhMFt++ZLB5mcPFonzXgFsROsA1HHkHeCwB6g/C9N57jv5hWXcFrSUviJ
/TDxV7xBRhAKUCEbRmsqR0aAtXNdJddfpT6E9SvOY6x1K7K3mYqe8s7HWKsveDqe
KL+Q9883b5781xcR9laOZmERD5LXHRHVEGqUEChv7yxpWNzixBEW/neP3mpLZGDm
qFg2Ls5dZsWBvBPUefBnxT3OVLrDCcoQCwSP9UcqXJdr/gH7zac4fBH6CvSErgT1
aWCftgs8GpmPQs0aaxV0WYpaZs/TBZZDtpjf+4XvXBeJ3NYMeV9qDcImontdE6Mx
35BJVQeabIGuqqRV4dWzH6hWQdJwdaOSaRK4IoPPavm/R0spBvsc5eVzeyG1jW9x
1euTgUy4MbtTg8sqq5H/41dnHLFkH2c6k/TETXRZaGNal4h/GiB1241gOB4haR2J
4hu4H9DUW3EzkDJvGBg0Kyele60qpHY8J+n7fIniq2Zs04qUg+0=
=0pYz
-----END PGP SIGNATURE-----

--Sig_/9_f7yTolI62lnTwGuMpnjlG--
