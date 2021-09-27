Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5094198C2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5EB89DC7;
	Mon, 27 Sep 2021 16:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA1C89E38
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632759506;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=g2indfiR/jZDlYxjjZkEZkE7oAQ92vUodc4qSJ3YJjc=;
 b=Yln5ZK7ecw/dpFPlXymVcHMiFw1FlovIo14amHEIdHeoDq9fy+5YJhD6PCdN3uyZxo
 M08iDkxNZE/Sg7kBE/yygTD5XEB6p6IPzOhylmIn+IcWD9APBtpIGjD8YOXFdOyZa06/
 +pPuA1v0pidTm+Ic4qAOd7IuE2woqAPQha5aibSmeFktDzebjH4hiCVT7nvKBO0e5N3o
 m9IwxXLMPjeBrnBPRrkXHlmSxAAq40LRrOuvEbwm8j0KJ3lVb8HdYV2TNEwqA50G+xS/
 xs1DxL1BZFIwL9YcGsP5dDXt0sb4EC40X56rb7F38i70APDmwZcRCauQeMzuMKnIepl1
 TOLQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8QW3w=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8RGIQarb
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 27 Sep 2021 18:18:26 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <L9900R.05DOH2MOR3V93@crapouillou.net>
Date: Mon, 27 Sep 2021 18:18:25 +0200
Cc: Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <044C92DA-EF88-4738-BF60-885906588408@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <4366739.KZ8Jxz7LyS@jason> <EKJXZQ.6VJ0UDHV3T3W@crapouillou.net>
 <2094991.ScV2v2meXk@jason> <HU700R.NAHL5IU3NRE81@crapouillou.net>
 <96585ED9-B707-4AF1-8417-E03DE6414965@goldelico.com>
 <L9900R.05DOH2MOR3V93@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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

Hi Paul,

> Am 25.09.2021 um 21:39 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>=20
>=20
> Le sam., sept. 25 2021 at 21:26:42 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 25.09.2021 um 21:08 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi Paul & Nikolaus,
>>> If you spent some time debugging the issue
>> we did ...
>=20
> By saying that you didn't debug,

We did - but sometimes you don't see the wood for the trees.

> (null) means you're printing a NULL pointer. So I could see that =
hdmi->next_bridge was NULL.

I remember we did find this, but did not understand that it should be =
initialized by dw-hdmi.
And because we though that dw-hdmi has it its own connector, it is ok =
that way.

> The place that sets it is dw_hdmi_parse_dt, which will return early =
with code 0, before next_bridge is set, if plat_data->output_port =3D=3D =
0, which was your case.

Well, we were still at 5.14 when we did these initial attempts to use =
hdmi-connector with synopsys.
Back then, there was no dw_hdmi_parse_dt and no output_port.

IAW: we did not even have a chance to make it work on top of 5.14 the =
hdmi-connector way. And were sucessful.

I just noticed this when trying to backport the last puzzle piece...

Well, it is always difficult to hit a moving target.

> Since your hdmi-connector is wired at port #1, then .output_port =
should be 1 as well.

Anyways it works now for 5.14.8 (our internal test) and 5.15-rc3.

And v4 of the jz4780 hdmi stuff will follow.

BR and thanks,
Nikolaus

