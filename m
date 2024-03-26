Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06788CB60
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B3D10F1A0;
	Tue, 26 Mar 2024 17:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R6JPLjeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029A410F1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:54:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9036B63B;
 Tue, 26 Mar 2024 18:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711475615;
 bh=sgeuX1RexIqR0RCTlrZICgibIh+lguB0TsW9JKRrFIQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=R6JPLjeDnfdC/vwnBqC99bj24VqZXW4/oaNxivB8y4o04/WQQvmOdv6Oq4EIR8B5L
 zMAGDmURtzENaSMCKyK/LK1bW/U+pSwmB1Fk0RQdN6wKROKmGAtYcq2TVrD+Y6wZx1
 R46/Y98wfO/2b8rnvO9KACFfjFCqCMTzX7MdKba4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7frycd5jnd674cily3xz3p2yl2bjc2yrn3z6sw3dzqdpl4widp@hrgyml6b7vh5>
References: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
 <7frycd5jnd674cily3xz3p2yl2bjc2yrn3z6sw3dzqdpl4widp@hrgyml6b7vh5>
Subject: Re: [PATCH 0/2] drm/fourcc.h: Add libcamera to Open Source Waiver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, libcamera-devel@lists.libcamera.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 26 Mar 2024 17:54:04 +0000
Message-ID: <171147564465.3566204.18099513875755978001@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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

Quoting Jacopo Mondi (2024-03-14 10:12:47)
> Hello
>=20
> gentle nudge for
>=20
> *) libcamera: are we ok being listed here ?

I think it's fine ...

Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> *) DRM/KMS: is it ok splitting the list of projects in the way I've
>    done ?
>=20
> Thanks
>    j
>=20
> On Wed, Feb 28, 2024 at 11:22:42AM +0100, Jacopo Mondi wrote:
> > As suggested by Sima, add libcamera to the list of projects to which the
> > Open Source Waiver notice applies.
> >
> > To maintain the paragraph readable, make a list out of the projects to =
which
> > such notice applies.
> >
> > Jacopo Mondi (2):
> >   drm/fourcc.h: List of Open Source Waiver projects
> >   drm/fourcc.h: Add libcamera to Open Source Waiver
> >
> >  include/uapi/drm/drm_fourcc.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > --
> > 2.43.2
> >
