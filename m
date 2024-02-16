Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F2858196
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80210EB3F;
	Fri, 16 Feb 2024 15:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="GoKfPnm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208D10EB3F;
 Fri, 16 Feb 2024 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yrmSopx2l89wJkQwr+erd3hVS7zVJnKpyVFPIyvtfbI=; b=GoKfPnm38gHh7bHnL1OBkb5Zos
 2T6ZJTbIh/eLoENNWmlbpiQEFIA40e5R5ZOaapkYHoSqIcT4T1/yAuX04D2/F638qIYx1mKsv1wo2
 WmpFu7M6/rxkhoQs9v3HAnyssUVScU9KL6TVZbcYpNgJbiXvPW+hVj4J33RbmM+SBnABuuqIuSeYt
 bMHeVN7hG3ZlSsE2yYTQbdrZCE3Lsf1am1X5ujxglQpRchx83f/T8lOV0NRihADZC5E3RjUtW05OL
 lkiHuDksDn6rkkafhnhV7GDNfo44/oe7qWbMJ9YYCJ0DHGx/7hdkVd19N5M70J1RZvIrFFOC1nAXa
 74092tag==;
Received: from [194.136.85.206] (port=54650 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rb0MU-0005eo-1j;
 Fri, 16 Feb 2024 17:42:50 +0200
Date: Fri, 16 Feb 2024 17:42:42 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Hung
 <alex.hung@amd.com>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Message-ID: <20240216174242.15d07657@eldfell>
In-Reply-To: <82280a39-4e1d-41ee-82fb-758ceed953e4@amd.com>
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <20240216101936.2e210be2@eldfell>
 <82280a39-4e1d-41ee-82fb-758ceed953e4@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0kTS.YsXNUeniYT0qC/j.ma";
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

--Sig_/0kTS.YsXNUeniYT0qC/j.ma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Feb 2024 09:33:47 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2024-02-16 03:19, Pekka Paalanen wrote:
> > On Fri, 2 Feb 2024 10:28:35 -0500
> > Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> >  =20
> >> We want programs besides the compositor to be able to enable or disable
> >> panel power saving features. =20
> >=20
> > Could you also explain why, in the commit message, please?
> >=20
> > It is unexpected for arbitrary programs to be able to override the KMS
> > client, and certainly new ways to do so should not be added without an
> > excellent justification.
> >=20
> > Maybe debugfs would be more appropriate if the purpose is only testing
> > rather than production environments?
> >  =20
> >> However, since they are currently only
> >> configurable through DRM properties, that isn't possible. So, to remedy
> >> that issue introduce a new "panel_power_savings" sysfs attribute. =20
> >=20
> > When the DRM property was added, what was used as the userspace to
> > prove its workings?
> >  =20
>=20
> I don't think there ever was a userspace implementation and doubt any
> exists today. Part of that is on me. In hindsight, the KMS prop should
> have never gone upstream.
>=20
> I suggest we drop the KMS prop entirely.

Sounds good. What about the sysfs thing? Should it be a debugfs thing
instead, assuming the below question will be resolved?

> As for the color accuracy topic, I think it is important that compositors
> can have full control over that if needed, while it's also important
> for HW vendors to optimize for power when absolute color accuracy is not
> needed. An average end-user writing code or working on their slides
> would rather have a longer battery life than a perfectly color-accurate
> display. We should probably think of a solution that can support both
> use-cases.

I agree. Maybe this pondering should start from "how would it work from
end user perspective"?

"Automatically" is probably be most desirable answer. Some kind of
desktop settings with options like "save power at the expense of image
quality":
- always
- not if watching movies/gaming
- on battery
- on battery, unless I'm watching movies/gaming
- never

Or maybe there already is something like that, and it only needs to be
plumbed through?

Which would point towards KMS clients needing to control it, which
means a generic KMS prop rather than vendor specific?

Or should the desktop compositor be talking to some daemon instead of
KMS for this? Maybe they already are?


Thanks,
pq

--Sig_/0kTS.YsXNUeniYT0qC/j.ma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXPgnIACgkQI1/ltBGq
qqcCuxAAg9Uyex5kx01Qlv5ieHS2BWyuaSql4cYBf6vA4kUftQMQfDIl1ZzdO0me
5aEfYrUFl2pSdBTgO2o2rdYHdZ3rUA2PYA6+wrIs7xrz+SwLRHZPQH3vE/DSMbOB
2XRzn6PuwVxB3V64Ai0TKttlG2jqdRdue34wrpBIDpvKM5VECp9FK7HAWZx2IfTt
bsmG79BWs9cHdb2P+jEPd/jXFLcj9KC+EEO69e1JXjptxXcnEmJOUsJHR8Mdr1za
vZFg6NexELbZyOWDOEHFBh/Xsdcb9YAadbcEPDuneLIIvSw6TOuhMb2hhGKg1aO1
IlhE/LSUCm35wG4YpMC1OfgyJjDnMH7zCZZ/UsoQ7jSa/35CD55k7JaG6gqV2RFM
7f8eYKcdfUxPyoRGZm3WCh7cESa634etbXQWPuX7cTz+bCuwVJHzb8NMPl7qf55M
XoZMte/SVjynOTshvstslKJIlbHk8lJPmGX70q0RCemSQeP2uF8F/sk/JFEWMeoW
Q1WWNya6ibAXkVWKpyprFnHoNwAodSRFyrcBfMc8+gmzlQgZm9KOOHUoanD2LrYS
iEJHEi2KN26m9oe5RH76crvTGA6ACxuKHq7SpNFooOeeUFKFLl0DKWaju/QzB9bd
tgiB4ezBVE+LSgmAp3foXNhsNINfTnxFHDiJ+1TxscGH9rlAAPI=
=FDiI
-----END PGP SIGNATURE-----

--Sig_/0kTS.YsXNUeniYT0qC/j.ma--
