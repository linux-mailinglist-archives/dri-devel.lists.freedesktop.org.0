Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A24388C68
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDB86ED1E;
	Wed, 19 May 2021 11:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD166ED1E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 11:11:34 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ljK6u-0005xm-OW; Wed, 19 May 2021 13:11:32 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ljK6t-0005rv-W6; Wed, 19 May 2021 13:11:31 +0200
Message-ID: <5fa57996a30a43fffaed4a0493f098927205816e.camel@pengutronix.de>
Subject: Re: [GIT PULL] drm/imx: fixes, dma-fence annotation, and color
 encoding/range plane properties
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 May 2021 13:11:31 +0200
In-Reply-To: <CAPM=9tzQM1E9sdPugNhAdiu75bkFvUDqY9zLX9tAF3szNcdmzg@mail.gmail.com>
References: <858310d193e10fc17221418dee6172af367eb046.camel@pengutronix.de>
 <CAPM=9tzQM1E9sdPugNhAdiu75bkFvUDqY9zLX9tAF3szNcdmzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-05-19 at 09:19 +1000, Dave Airlie wrote:
> On Wed, 12 May 2021 at 23:33, Philipp Zabel <p.zabel@pengutronix.de> wrot=
e:
> > Hi Dave, Daniel,
> >=20
> > The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad6=
27b5:
> >=20
> >   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2021-05-=
12
>=20
> Is this for 5.14 or 5.13-rc3?

This is for 5.14, I'd like these to have a full round of testing.

regards
Philipp
