Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072D8FB0C6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 13:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7A010E410;
	Tue,  4 Jun 2024 11:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="izbV7xvb";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XYuyjREG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE80610E410
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1717499575; x=1749035575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uAqgm0AmQA7b9R4G9AkVqeeuavIfz2AGAJyzwpfO6xE=;
 b=izbV7xvbdMley/I9VETLj4pfc1a5mjBEsdMhIfhh3AVoSxKZvfZut67y
 IUNWvh9QfsylFHU4q84e49OcpEdDTD8+JS2gfGIzZyqliDNVuiyTQpZ43
 9HMBM/cHyo+Dbj4UkWJwzoGns/N2DluUMpNFJoy4Al6VtjFEgjJcAAKDn
 HNMmgf3ndQCJf7NFpo8ieysdayg+ouZnKi8n0SemPGThHzGpAY0NgiIZb
 XVqx9D3FVZ2f/wuFTb29oK4tcnt2cwa1aimJHUHIeJbvuKIRFSrHGs53y
 MQ4PZEANjDr6/FPLWvWtAFTHs4Rsr7gOVgFcXrNiLkejDnnymn/57Lbba A==;
X-CSE-ConnectionGUID: eqg1k6TQTSaY38F3jCf6lA==
X-CSE-MsgGUID: NCC3ip+jRfSHW4bqqzS8mw==
X-IronPort-AV: E=Sophos;i="6.08,213,1712613600"; d="scan'208";a="37211187"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Jun 2024 13:12:52 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8E321662AB; Tue,  4 Jun 2024 13:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1717499568;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uAqgm0AmQA7b9R4G9AkVqeeuavIfz2AGAJyzwpfO6xE=;
 b=XYuyjREGr8TFYRwOZwHHhnmd7V8WLfbd0Ur893TcwDazhAmib6JnMNCTniniixq2Y/YJW1
 IamHk7totzoTZi37zVQGLaWK6nLyusTjIqyJdN2Pr6ScYAYpO7I/XglN6X2ZiQ1SbtvigJ
 JFWMY/JVLVPeqPyMINLzU3UY9NfgoUdnNt6MlIqWaMugKVHoKCJiIYnnV/0kb0i2k1ClGc
 D1CuLrSr1ImR4W1tHjInjUl5eWrpudctuYLg1KimgerFFqBsQOhDeS+FCqG9WLEbkzZ+aR
 Ea51JXYGq9UPZPhvIkp5+u12pw8op/dED1weadvw4EVrPqopZsotO4bYcwTcqQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com
Subject: Re: [PATCH 3/6] drm/bridge: tc358767: Drop line_pixel_subtract
Date: Tue, 04 Jun 2024 13:12:45 +0200
Message-ID: <7673814.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e713607f-4927-435f-bac0-be3344e45ef4@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <6053649.lOV4Wx5bFT@steina-w> <e713607f-4927-435f-bac0-be3344e45ef4@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Marek,

Am Montag, 3. Juni 2024, 23:25:43 CEST schrieb Marek Vasut:
> On 6/3/24 2:18 PM, Alexander Stein wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> > Am Freitag, 31. Mai 2024, 22:39:49 CEST schrieb Marek Vasut:
> >> This line_pixel_subtract is no longer needed now that the bridge can
> >> request and obtain specific pixel clock on input to the bridge, with
> >> clock frequency that matches the Pixel PLL frequency.
> >>
> >> The line_pixel_subtract is now always 0, so drop it entirely.
> >>
> >> The line_pixel_subtract was not reliable as it never worked when the
> >> Pixel PLL and input clock were off just so that the required amount
> >> of pixels to subtract would not be whole integer.
> >=20
> > I think this is based on [1], no?
>=20
> It is.

Thanks for confirmation.

> > I was wondering because it was not stated.
>=20
> I thought [1] was already applied, but it seems it was only RBd.
>=20
> I can either apply [1] and then add this on top, so the two commits can=20
> be reverted separately if this one breaks something, or squash [1] into=20
> this patch and send V2. Which one do you prefer ?
>=20
> The [1] fixes a real nasty issue with DPI output which causes visible=20
> image corruption, so I would like to have [1] in, but it is obviously=20
> not perfect.

I can't use DPI anyway, but if [1] actually fixes something for DPI
I'm okay with having [1] in, which gets mostly reverted in this series.
But that's up to the maintainers.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


