Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B136545FF98
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 16:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE626F5A3;
	Sat, 27 Nov 2021 15:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180CC6F584
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 15:16:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5241FB829FD;
 Sat, 27 Nov 2021 15:10:35 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 98F7AC53FBF;
 Sat, 27 Nov 2021 15:10:30 +0000 (UTC)
Date: Sat, 27 Nov 2021 15:15:30 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 03/15] iio: buffer-dma: Use round_down() instead of
 rounddown()
Message-ID: <20211127151338.35e9d347@jic23-huawei>
In-Reply-To: <J4XY2R.1WOGAOGR6ITU2@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-4-paul@crapouillou.net>
 <20211121140823.6b2922f6@jic23-huawei>
 <J4XY2R.1WOGAOGR6ITU2@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Nov 2021 10:00:19 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
>=20
> Le dim., nov. 21 2021 at 14:08:23 +0000, Jonathan Cameron=20
> <jic23@kernel.org> a =C3=A9crit :
> > On Mon, 15 Nov 2021 14:19:13 +0000
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >  =20
> >>  We know that the buffer's alignment will always be a power of two;
> >>  therefore, we can use the faster round_down() macro.
> >>=20
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net> =20
> > *groan*.  I don't want to know where the naming of these two came=20
> > from but that
> > is spectacular...
> >=20
> > Anyhow, happy to pick up 1-3 now if you like as all are good cleanup=20
> > of
> > existing code. =20
>=20
> I think you can pick 2-3 now; I will do some changes to patch [01/15]=20
> in the V2.

Applied, 2+3 to the togreg branch of iio.git and pushed out as testing for =
all
the normal reasons.

Thanks,

Jonathan

>=20
> Cheers,
> -Paul
>=20
>=20

