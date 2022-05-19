Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F252E6C3
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398211B7AE;
	Fri, 20 May 2022 07:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C094310EF75;
 Thu, 19 May 2022 18:18:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CD0C5C01FC;
 Thu, 19 May 2022 14:18:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 19 May 2022 14:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1652984299; x=
 1653070699; bh=p/ZcdHvmtB8X1rkCDJsKxIe35fAqtqdi3lNcAexvvSo=; b=P
 gZzioXTTzenseX65+yBfXdA8/uzdM3p94L6iHsPd3BJfqvwcboOTcO/BHCn0T/LN
 edSz1SM9MB+SyXd3ZTJ6pJRUTGKdZuBuqdUtzWyrDEjdYe+LwXcmvDrlSPpz1ygM
 38NJpPrU0kx2LeJVMyiQZxVl5BT0XloxnhrTuyi81zJxi6b5XiGdynYyFc2BWGXK
 vPnsfC0Enf0A0eq3/zJ6WJ+ioxEcvyw8ZVAsKXrUdLRpG7InuX/cIc6tI2TgxtPj
 VzD2rcpCFGmqTNSYziIEIHvrJItJ5gofJn4gRKch75hk4cBYVBnUrAQOda4mPjhk
 LH8ofMDuf6VF2id38XPjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1652984299; x=1653070699; bh=p/ZcdHvmtB8X1rkCDJsKxIe35fAq
 tqdi3lNcAexvvSo=; b=Evw7E5LD2FXeQTxFHCfso+lRe/JtkQrZYFw5W0mBCzqo
 MMV46hiPpAQX5q5iDScPgFexHo48yJEkBdfx7h109FGeQ8UAh2eU/L/wNac3P4Mp
 iRyW0LhqrjDQPnvZUl1LKkNWJIBXbCyfv5m/cq4N0hUXVcXeZH9hq94pU5VAim98
 9S3jmvi3bhIBMlYDi5ibNeuh9kDidt62ZjpYwuzO9+kTA+AiEC/KLXQR1gv40KSF
 /WSzmes4KTssmmceM16KeFaPxLqqBEsf+8O7rA0vToKTNm0gIyZFEezl8OJGYrmf
 n/UyMRRlWzZuq/+weMrtt7+5XIW4UVTkDGmS8+1wBA==
X-ME-Sender: <xms:6omGYkGbeux4b-4ZA-qTob4PcH-XanARcynrHAL2ybpZRtX4ZJMUXQ>
 <xme:6omGYtWckp2o4nNzepllyqk8mOkVi6XyrFJ1VEKekSSjW-5kPn_1AJOoNkvfLctss
 Ub4_mb3dcZk9zw>
X-ME-Received: <xmr:6omGYuJ8EBLp0RR9Js7tSqZkVqLoiq61-JJG9iHemxspt-YhUkWE2ldBRhwT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedugdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedthefhtddvffefjeejvdehvdej
 ieehffehkeekheegleeuleevleduteehteetnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
 vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:6omGYmGkc-Iu38g7NVj8l1LGP7UQNUt9uu7DXYC762occKCqP3goEw>
 <xmx:6omGYqXnmzTkMWNpp16j0SCXZQp_arxcQwnh3RZiYX1GS3GW4WUGgg>
 <xmx:6omGYpN7gpszV1ofG5-NptgXkroqLlKf0krVLwxrlKUwR9oVcinrew>
 <xmx:64mGYjOtj_p8aaEOarmLAwEhbbTMaIFxc9WUDPVPia1G3Q5f6pDDuA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 14:18:18 -0400 (EDT)
Date: Thu, 19 May 2022 14:17:46 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Hang in 5.17.4+ that appears to be due to Xen
Message-ID: <YoaJ6KB+GRXHG3Mv@itl-email>
References: <Yn/Tgj1Ehs/BdpHp@itl-email>
 <55436ae1-8255-1898-00df-51261080cd41@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ArJoZLmXtBnMmHx"
Content-Disposition: inline
In-Reply-To: <55436ae1-8255-1898-00df-51261080cd41@suse.com>
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Ostrovski <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2ArJoZLmXtBnMmHx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2022 14:17:46 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovski <boris.ostrovsky@oracle.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: Hang in 5.17.4+ that appears to be due to Xen

On Mon, May 16, 2022 at 08:48:17AM +0200, Juergen Gross wrote:
> On 14.05.22 17:55, Demi Marie Obenour wrote:
> > In https://github.com/QubesOS/qubes-issues/issues/7481, a user reported
> > that Xorg locked up when resizing a VM window.  While I do not have the
> > same hardware the user does and thus cannot reproduce the bug, the stack
> > trace seems to indicate a deadlock between xen_gntdev and i915.  It
> > appears that gnttab_unmap_refs_sync() is waiting for i915 to free the
> > pages, while i915 is waiting for the MMU notifier that called
> > gnttab_unmap_refs_sync() to return.  Result: deadlock.
> >=20
> > The problem appears to be that a mapped grant in PV mode will stay in
> > the =E2=80=9Cinvalidating=E2=80=9D state until it is freed.  While MMU =
notifiers are
> > allowed to sleep, it appears that they cannot wait for the page to be
> > freed, as is happening here.  That said, I am not very familiar with
> > this code, so my diagnosis might be incorrect.
>=20
> All I can say for now is that your patch seems to be introducing a use af=
ter
> free issue, as the parameters of the delayed work might get freed now bef=
ore
> the delayed work is being executed.
>=20
> I don't know why this is happening only with rather recent kernels, as the
> last gntdev changes in this area have been made in kernel 4.13.
>=20
> I'd suggest to look at i915, as quite some work has happened in the code
> visible in your stack backtraces rather recently. Maybe it would be possi=
ble
> to free the pages in i915 before calling the MMU notifier?

Honestly, I would rather fix this in gntdev, regardless of where the
actual bug lies.  GPU drivers get little testing under Xen, so if
something like this happens again, it is likely to remain undiscovered
until a Qubes user files a bug report.  This results in a bad experience
for Qubes users.  I would much rather code that works on bare metal work
in Xen dom0 too.  I have had random hangs in the past (with various
kernel versions) that might be due to similar problems.

Furthermore, similar problems can arise whenever a driver removes an
MMU notifier on userspace pages that someone else has references to.  It
is hard for me to see how this is the fault of the driver that removed
the MMU notifier.  I find it much more plausible that the correct fix is
on the Xen side: allocate the delayed work parameters on the heap, and
free them after the work is finished.  This eliminates this entire class
of bugs.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--2ArJoZLmXtBnMmHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKGiegACgkQsoi1X/+c
IsGnpg/+OOZRF3GOjff1/VSuGntrXoauU8RINbU98Rfv9GpTzq1h6l4EdlqIX7kX
OFO2d6uVwkuJNFWOu0TWf5Yqz9k/G0fK2q2GUTikDYq3YyTmvUbsClkKBtJVjGxY
mkHM21nJ/ao7ZET/UyKI8obwWeuC/VHIcTjjB2iKe4sYtltyWd9gfiJweJxt7Nd2
C/FqerrslTLEz42B/OO31qstbqxuXadl7L6kQhq3CIhtVl+ZEA8/8p92BKaEP/Wp
Lsv2jkfDGIEmAWvZuEvaTkS19yQCeKq3jBoUgXHuYwSdEIX0A7x+MblengVfqrFv
ZFYF5TVn7HSziGTVahYm/McAH2kCfmVsSh5DAB8v+k4EyDUsrbaPLSJGZboQsutb
yUeqSueUV+fPvnD6XyWORtIQvOmeF9ecUWH9AUcWEtDrC1DxCeJADYcmE+RuLYuv
t3t9OEo2SB55CmS28u9BIYFmlUDDKVvsQ3xUxDR9114HY++Dulj0W1R3ZrW0mWHH
49OrKp47DvmdaX1OyRhI/3RaPc4u+OTV8Z/1jWL0cHrybsimiTkjySKPXonIaO2E
emd+UWqLoYAyQLZ+u8alEI5s7IBjeXPcL8VEwh6K7nblCjK3yfqdOCyYRem+1lgx
JlHonk/YOiLPfZG1xN29p+/vRnzQBaZR28py7GpsVBsniWQQxS4=
=DHnk
-----END PGP SIGNATURE-----

--2ArJoZLmXtBnMmHx--
