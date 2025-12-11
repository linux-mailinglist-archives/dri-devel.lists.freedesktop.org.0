Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F609CB5672
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 10:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C1310E7BF;
	Thu, 11 Dec 2025 09:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RGSe8UYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85B10E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 09:47:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2F27C1A20E3;
 Thu, 11 Dec 2025 09:47:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F16AA6068C;
 Thu, 11 Dec 2025 09:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 06BA9103C8C1E; Thu, 11 Dec 2025 10:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765446463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dEYtoHd6truLlW9dDvvW4TyZqvth1FwMIgnGkOwvmQk=;
 b=RGSe8UYmgqic1d7gzrTAi6DwwYIydD58RU8J6fsmdoC5KlSEJclSPhwA9hemgK7p7TAyxb
 hLGOsvfjj0bVM4vks4oO+w20GsZOAkXbMLifL0QCJxE1oGW36lyEa36v4grMx2+PRF63ir
 inqrCx4Q+I9cc4QXro9EtuXKF14xvgVDPbE8BbAs4ykm46UbcLZCz0AIqjAdpU+rNGnW+5
 0i4s2yiuKa/M8hfjtszF+uB89KxdDZiOmsrjUeeBMHPRyQWlww3fZvYT1Vhw7JTZII4k9P
 ML/tOQlh2X31xmjvB2bAR79Ojdv3x4BY0ox3b2l+56gDER59bOhtr2R0Lf9a3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:47:39 +0100
Message-Id: <DEVAJEYEL7SW.2F8RT465LAL5U@bootlin.com>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent" <kory.maincent@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
 <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
 <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
In-Reply-To: <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
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

On Thu Dec 11, 2025 at 10:40 AM CET, Kory Maincent wrote:
> On Wed, 10 Dec 2025 19:10:45 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>
>> Hi K=C3=B6ry,
>>
>> On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
>> > The tilcdc hardware does not generate VESA-compliant sync signals. It
>> > aligns the vertical sync (VS) on the second edge of the horizontal syn=
c
>> > (HS) instead of the first edge. To compensate for this hardware
>> > behavior, the driver applies a timing adjustment in mode_fixup().
>> >
>> > Previously, this adjustment was conditional based on the simulate_vesa=
_sync
>> > flag, which was only set when using external encoders. This appears
>> > problematic because:
>> >
>> > 1. The timing adjustment seems needed for the hardware behavior regard=
less
>> >    of whether an external encoder is used
>> > 2. The external encoder infrastructure is driver-specific and being
>> >    removed due to design issues
>> > 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk=
)
>> >    may not be getting the necessary timing adjustments
>> >
>> > Remove the simulate_vesa_sync flag and apply the VESA sync timing
>> > adjustment unconditionally, ensuring consistent behavior across all
>> > configurations. While it's unclear if the previous conditional behavio=
r
>> > was causing actual issues, the unconditional adjustment better reflect=
s
>> > the hardware's characteristics.
>> >
>> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
>> > ---
>> >
>> > Only few board currently use tilcdc not associated to a bridge like th=
e
>> > am335x_evm or the am335x-evmsk.
>>
>> Have you tested this change on any affected board?
>>
>> The change looks good to me but without some testing it would be risky.
>
> I have tested it on few boards but not these mainline devicetree as I don=
't
> have them.
>
> I have tested a tilcdc with tda998x bridge (BeagleBone Black), a tilcdc w=
ith
> ti,tilcdc,panel panel (BeagleBone with LCD cape), a tilcdc with it66121 b=
ridge
> (new Beagle Bone Green Eco board with HDMI cape).
> That's all the boards I have.

OK, thanks for the info. For future iterations, I think it's useful to
mention, for all patches that may potentially break existing hardware, such
info on which hardware you have tested.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
