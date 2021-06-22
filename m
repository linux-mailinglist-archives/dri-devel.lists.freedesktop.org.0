Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547963AFE87
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 09:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5068C6E029;
	Tue, 22 Jun 2021 07:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692C6E029
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 07:58:02 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a16so7314340ljq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=u8GLty3tOXL1FdPiA/Irm6Dck8CZ9gdJPuMIDM8NO+g=;
 b=d7iFiJQ73FVsnECWrp/feRn6JQJRkwTvGErWNpA2d1IoBAezEyvzoYNpLC6ucfTCBu
 I6loo0sLSeysO9MpFd99ZcYndA3NYU2TqdipUr9scVYTOPsyA3KxxScRq0Wp9PmFfKrb
 cb3uDYYRjpauTOuB4ksrAX153C1jryvrvgR2b9PghLdwh5vqtUGgoKCrDZfBcOyYVDds
 qRj/rmJ4z44Qtx9Bxi9g0Z5z6i/dX+Gac9i5Ixc0Xw9u/cbJulJJ4CztAqPbODcH+bA7
 PA7MxdYWbvdXTBcvRay2UzNJNN6YUS/vqWBUHm1kYuccBeTrSMoLBHIy0O+IKNGN7CcJ
 jgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=u8GLty3tOXL1FdPiA/Irm6Dck8CZ9gdJPuMIDM8NO+g=;
 b=UargdQU+i/Ne3NqcKf2dg2SmlQ0c35k5NvKPmtZ5jTFShtegpa9WKT66c8XUuHDGLd
 5GOPGXfl/ClH74GMn5Ou2ACXa+XUMtFYkA97m4xoxLbx6HzohYDk4lmiGr1QgcKMw9iA
 NnrPYm88fULH8eclT+FbPJ/X2KYetxENlD2Z9bHavCl/OYFd4q2vhzpvfFEabQoPUDHr
 mAQMUtAvajzVHVo6P7i/jOaBlW1FeulY/mMaqnAFd5yaRqN8m9Dxg/BZeaAzGkGEgNs+
 sADqZfwTQe3dJTaULRrjVqMxsp3J8MsoIQok80bWMAd8NQtRCpcazlWsJwhBNGWWRfxh
 S11A==
X-Gm-Message-State: AOAM531ZWWvZlSYLf9TIPdfi/0mrbpB2vRCcYWwHBx7PA6YRf3tSMMCO
 Y8PpmeOfJ9yb3PhLWYJQqJQ=
X-Google-Smtp-Source: ABdhPJwpT7cg8PaaS+cBElIDaTgWonJwsRlSSCUx8dbqTLht5p2QNMd+5QPV5OR6nXmvC+gWz/IOsA==
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr2043374ljg.299.1624348680814; 
 Tue, 22 Jun 2021 00:58:00 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u2sm2521546ljg.134.2021.06.22.00.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 00:58:00 -0700 (PDT)
Date: Tue, 22 Jun 2021 10:57:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <20210622105757.2b9dec32@eldfell>
In-Reply-To: <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k_Ny_BZtmz_EeVKX1+Wmizg"; protocol="application/pgp-signature"
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/k_Ny_BZtmz_EeVKX1+Wmizg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jun 2021 13:02:59 +0900
Esaki Tomohito <etom@igel.co.jp> wrote:

> Hi, Thomas
> Thank you for reply.
>=20
> On 2021/06/21 16:10, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 21.06.21 um 08:27 schrieb Tomohito Esaki: =20
> >> Virtual DRM splits the overlay planes of a display controller into
> >> multiple
> >> virtual devices to allow each plane to be accessed by each process.
> >>
> >> This makes it possible to overlay images output from multiple
> >> processes on a
> >> display. For example, one process displays the camera image without
> >> compositor
> >> while another process overlays the UI. =20
> >=20
> > I briefly looked over your patches. I didn't understand how this is
> > different to the functionality of a compositor? Shouldn't this be solved
> > in userspace? =20
>=20
> I think when latency is important (e.g., AR, VR, for displaying camera
> images in IVI systems), there may be use cases where the compositor
> cannot be used.

Hi,

> Normally, when the image is passed through the compositor, it is
> displayed after 2 VSYNC at most, because the compositor combines the
> image with VSYNC synchronization.

This is not a universal fact. You can write a Wayland compositor that
consistently reaches app-to-screen latency of less than one monitor
refresh cycle, while also using KMS planes.

I believe Weston succeeds in this already if you write the Wayland
application accordingly.


Thanks,
pq

--Sig_/k_Ny_BZtmz_EeVKX1+Wmizg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDRmAUACgkQI1/ltBGq
qqdYpg//Tcc55meE4KCzD3QCdOiQc2prqhBvHDue3YiwQ0FlPdcACn6NwO+TayH6
DJbfxrv6K3VIPD81uw41OmvkE2Y5vcoFAruFI2garh5gZHY0b0PskyPookMUD4Vm
YZVrrfqM8fHqaWWlOXryniTB1EbfV5KFahNIXgPEGJdVDPDGPV/kUXCdg0iXZfE1
qvIzwzqQoHEN2uK9F0QTYmR7BkMISGFTzTdKYomBrbk5SlovGBxzBSOrsl7e5/ZV
oeO1rAGO4HN7DpKAUdyBK/bcPqsgA5G5UyMgtM917bVDh11bCML1uKAoy7fLBOsE
JfNT7etocMwkiDcDQnPPx7NiYE1+9H371IC5Dm5OBKt9zbZ2AVaq9ArArMmustcC
wqxS45KbeR2jlKjT5rEthLi3fKszweNIZqHmarO+RcyuKCoJHmkKLHOlof0w25y3
ximBQhYJWVJOqp2KDU/h7U5R9HfmofyzbjQRRqG1Hb2MOBK9UpdLeaGCKIdhyiFi
TBy4pUUgoHQCHgA+jFM7kdJk7yUAkZB1wNPbx+NawRRuh2yOM8fpDYupGw8SAUbL
pjjQv6C0cw9E8eLAHU1ovt8VnX4uD5ugh/V1WT63JxzqhSeCf4HxnQL2cyGNGsnS
3NHmKM+Uh8oU4CzGBNJjiyb77RCRan82wzBTx3pwJowBf9SRTXw=
=GNDC
-----END PGP SIGNATURE-----

--Sig_/k_Ny_BZtmz_EeVKX1+Wmizg--
