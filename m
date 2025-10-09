Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E110ABC9E13
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F4D10EA9D;
	Thu,  9 Oct 2025 15:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AbyX240I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A0910E1FA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760025365;
 bh=MLIYIoxH8YP7pPDntgftIv7qbi4NTy5OGuGcIFBRaCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AbyX240InzOwObKQHOWJsSTTi9qE6E4kQESS16iAGA+5rvUNBHCY2cWA5SgsgVFDu
 QnQ+/2rSOkb2Ba9dsRc5mIb8Cy2tnjtxqFgJZQSBT6JTnxKJ8OIsgU68GB1oP4VNhN
 5BSxEXM5tmypkQIbocrtUZ1LL+OlFXeX94y/wDnXf/BQyFa6V4Pv6wzDOQPO2ME6wd
 1aQdbb4bs8fxG5X0a7jEZpbMZ+QoXRdl2jnY6QTdTGVMKFFxK+WUQ1FZ2VuUzxZ8Ig
 o9haQi93C3AXJ7/s7olC1Bx5es4qRwq2o6cQBP8psQ5bguR/q46rx9g54R+Cz0qdhL
 u+xcrnaFKIazQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DF4417E108C;
 Thu,  9 Oct 2025 17:56:05 +0200 (CEST)
Date: Thu, 9 Oct 2025 17:56:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v5 12/12] MAINTAINERS: Add Adrian Larumbe as Panfrost
 driver maintainer
Message-ID: <20251009175601.0eeb27c5@fedora>
In-Reply-To: <971fd0e3-474a-4685-ade2-f4563372f74d@arm.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-13-adrian.larumbe@collabora.com>
 <971fd0e3-474a-4685-ade2-f4563372f74d@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Thu, 9 Oct 2025 16:47:26 +0100
Steven Price <steven.price@arm.com> wrote:

> On 07/10/2025 16:01, Adri=C3=A1n Larumbe wrote:
> > Add Adrian Larumbe as Panfrost driver maintainer.
> >=20
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
>=20
> Acked-by: Steven Price <steven.price@arm.com>
>=20
> Welcome! And thank you for helping out.
>=20
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5257d52679d6..cb68fdec3da4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2066,6 +2066,7 @@ F:	drivers/gpu/drm/arm/display/komeda/
> >  ARM MALI PANFROST DRM DRIVER
> >  M:	Boris Brezillon <boris.brezillon@collabora.com>
> >  M:	Rob Herring <robh@kernel.org>
> > +M:      Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> =20
>=20
> NIT: it looks like you've used spaces not a tab.
>=20
> Also while we're here...
>=20
> @RobH: Does it still make sense for you to be listed as a maintainer? I
> haven't seen you active on Panfrost for a while.
>=20
> >  R:	Steven Price <steven.price@arm.com> =20
>=20
> And given that I've been doing a fair bit of the merging recently I'm
> wondering if I should upgrade myself to 'M'?

Oh, I didn't notice you were only flagged as a reviewer. +1 on turning
this R into an M.
