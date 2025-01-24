Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CACA1B947
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 16:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEA510E9C5;
	Fri, 24 Jan 2025 15:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uigEQoiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741FE10E9C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 15:29:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AF3F5C4B92;
 Fri, 24 Jan 2025 15:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6EFC4CED2;
 Fri, 24 Jan 2025 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737732568;
 bh=ChQwyx9ou1MQai7Seraqgab5uZ5KJv/6Tgq7MNDhUhw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uigEQoiIjkXxJ20JO73f87y2KEY+jWTS8X1vjt8pER827MglxF5IMH33+3bGy+JL6
 n9nMNmpn8j5rdsfpqGfSZk+NehQRvvOKQWYqfQVfInpv1SGkj6L+Df/g8D5R/x2WOZ
 VvMinIZozTpRqG6M1+nFyaXlp7Ykjp6dxNA90RPyZxOs4JfMPZeTZ3+dRU1mJ5R8gc
 Gkmg4wo0tVVMeq8KsOIuswC2HCqQKZAZhoMyH5ScOUYJ2SGHNV5T3rmt6d9NboL2pM
 moLcc63NclEZBlBxEsO7Lwo07F5wNnnzm7VVgqOcKDZZBT8uU14rQl2AGkfnihpGTt
 Vz+4sm62k4lnQ==
Date: Fri, 24 Jan 2025 16:29:16 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Jarkko Sakkinen	
 <jarkko@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Leonardo =?UTF-8?B?QnLDoXM=?=	 <leobras.c@gmail.com>, Vignesh Raman
 <vignesh.raman@collabora.com>, kernelci@lists.linux.dev,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, louis.chauvet@bootlin.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 Tim.Bird@sony.com, broonie@kernel.org, groeck@google.com,
 rdunlap@infradead.org, geert@linux-m68k.org, michel.daenzer@mailbox.org,
 sakari.ailus@iki.fi
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20250124162916.38e5c6a0@foz.lan>
In-Reply-To: <b3af62d3565d2d60218520d2ebace6f1a0368c17.camel@collabora.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <D7AAOSNDJV11.AXVF80Z934BK@kernel.org>
 <298675d0-ba19-4c87-b00d-57a5e31b05b6@redhat.com>
 <b3af62d3565d2d60218520d2ebace6f1a0368c17.camel@collabora.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Em Fri, 24 Jan 2025 09:26:33 -0500
Nicolas Dufresne <nicolas.dufresne@collabora.com> escreveu:

> Hi,
>=20
> Le vendredi 24 janvier 2025 =C3=A0 15:00 +0200, Nikolai Kondrashov a =C3=
=A9crit=C2=A0:
> > On 1/24/25 2:16 PM, Jarkko Sakkinen wrote: =20
> > > On Fri Jan 24, 2025 at 10:12 AM EET, Laurent Pinchart wrote: =20
> > > > Gitlab as an open-source software project (the community edition) i=
s one
> > > > thing, but can we please avoid advertising specific proprietary ser=
vices
> > > > in the kernel documentation ? =20
> > >=20
> > > I don't think we should have any of this in the mainline kernel.
> > >=20
> > > One angle is that "no regressions rule" applies also to the shenaniga=
ns.
> > >=20
> > > Do we really spend energy on this proprietary crap to the eternity? =
=20
> >=20
> > This is not getting included into the kernel itself, the contributed co=
de is,
> > of course, open-source. And yes it would execute just fine on the fully
> > open-source community-edition GitLab.=20

> > I don't think "no regressions rule" should apply here.

It doesn't, as this is not a Kernel userspace API. It is just some
facility to integrate Kernel builds using a CI infrastructure. This can
change with time as needed.

Still, once people start using it, developers need to take some care to
avoid regressions that would cause CI builds to fail for the ones using
such facilities.

Also, ideally, this should be completely independent of the Kernel version,
e.g. if one sets up an infra using the version that was there when, let's
say, Kernel 6.14 is released, the same CI scripts should work just fine
with stable Kernels and even future Kernels.

Due to that, I'm not convinced that such kernel CI files should be
hosted at the Kernel tree.

IMO, this should be stored on a separate repository hosted at
kernel.org, using Semantic Versoning (https://semver.org/) - e. g.
when there are incompatible changes, major version number will be
increased.

> > This is for developers only, and is a template for making
> > your own pipeline mostly, with pieces which can be reused. =20
>=20
> Perhpas worth clarifying that Media and DRM subsystem have opted for the
> Freedesktop instance. This instance is running the Open Source version of
> Gitlab, with hundreds of CI runners contributed and shared among many pro=
jects
> (which includes Mesa, GStreamer, Wayland, Pipewire, libcamera, just to na=
me
> few).

It doesn't matter much what git forge some projects are currently using, as
things like that could change with time.=20

Starting with supporting just one type of git forge sounds OK to me,
but long term goal should be to make it generic enough to be used with as
much CI engines as possible - not only forges developed by companies that
provide paid services like Gitlab/Github, but also completely open
source forges and even Jenkins.

Thanks,
Mauro
