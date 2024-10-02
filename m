Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9C98E38E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 21:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDD210E283;
	Wed,  2 Oct 2024 19:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="E8AN09Lm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D6210E283
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 19:38:48 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1727897926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAuXe0O3NSF994mavqo25iaQ8hQ/ha0f9ecg/g2gJWI=;
 b=E8AN09LmfqrysbmhydRjpjdsAn3biTkK8f9dWRaCXFbaShjmP3vdUvdh7+NI9HN+hum8Gf
 QY4b4gEe91QUQch3pkiuf+5JWq0gnLi8nlwXTxdy1sof7IPvY/6ozjTawKHjjm7tc7ulWi
 2dQEeAtrJZzzPanAwI0ExrwkgT5QA/rAILkNY/XQ1hl0LxCMXAX6c8xbm7d96Tkfq5qVkb
 lRXY5+7z6zzycuieL5viwoCDFR/G4objF8+DhMmbWn7oE6My5nDatFoAurdN/zfYGt7HVi
 BPJ7jmdwrTrbde3C0l1ECyFc9Y7EC2xnJnpbv7v3A1cUV8aT0fx3REu9wFfJEw==
Content-Type: multipart/signed;
 boundary=3a883e580afd625faf3965ca5225d4c2652f66b4a902790343c6692e64f8;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 02 Oct 2024 21:38:32 +0200
Message-Id: <D4LKOUTND4C9.A02Z06OBACZE@cknow.org>
Subject: Re: [PATCH v2 00/10] drm: bridge: dw_hdmi: Misc enable/disable, CEC
 and EDID cleanup
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "Diederik de Haas" <didi.debian@cknow.org>, "Heiko Stuebner"
 <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Christian
 Hewitt" <christianshewitt@gmail.com>, "Christopher Obbard"
 <obbardc@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <D45C28ZF5US9.1BCL9HBVRERJB@cknow.org>
In-Reply-To: <D45C28ZF5US9.1BCL9HBVRERJB@cknow.org>
X-Migadu-Flow: FLOW_OUT
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

--3a883e580afd625faf3965ca5225d4c2652f66b4a902790343c6692e64f8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jonas and Laurent,

I may be showing my n00bness ... or I actually found something ...

On Fri Sep 13, 2024 at 7:30 PM CEST, Diederik de Haas wrote:
> On Sun Sep 8, 2024 at 3:28 PM CEST, Jonas Karlman wrote:
> > This series ensure poweron/poweroff and CEC phys addr invalidation is
> > happening under drm mode_config mutex lock, and also ensure EDID is
> > updated (when the dw-hdmi connector is used) after a hotplug pulse.
> >
> > These changes has mainly been tested on Rockchip devices together with =
a
> > series [1] that add HDMI 2.0 4K@60Hz support to RK3228, RK3328, RK3399
> > and RK3568.
>
> I did some tests with this series (together with the 4K60Hz one).
>
> ...
>
> I then went on the HDMI-hot-plug-swap-test and connected it to my 1080p
> monitor while the system was still online. That did not change the
> output of the previous command. As my monitor doesn't support 4K it
> seems to have chosen a 640p or 720p resolution.
> IOW the letters were rather big. With enough output on the screen, it
> went off the visible area, so all I could do then was 'blind' typing.
>
> If I booted up connected to the 1080p monitor then it reported a 1080p
> resolution and when swapping to the 4K TV, it kept reporting that value
> and displaying things in 1080p resolution, but ofc there were no
> abnormal big letters or output falling off the screen this time.

A DT validation on rk3328-rock64.dtb reported this:

rockchip/rk3328-rock64.dtb: hdmi@ff3c0000: interrupts: [[0, 35, 4], [0, 71,=
 4]] is too long

That's because `display/bridge/synopsys,dw-hdmi.yaml` dt-binding has
interrupts : maxItems : 1

and the rk3328.dtsi file has 2 interrupts in its hdmi node.

Easiest solution is to just remove the 2nd one and that makes DT
validation happy.

Looking at the rk3328 TRM, I found these hdmi related interrupts:
67  hdmi_intr
103 hdmi_intr_wakeup

Looking at the rk3399 TRM, I found these hdmi related interrupts:
23  hdmi_irq
24  hdmi_wakeup_irq

Looking at the rk3568 TRM, I found these hdmi related interrupts:
76  hdmi_wakeup
77  hdmi

So my thinking is:
- what if the dt-binding is incorrect? (-> maxItems : 2?)
- wakeup 'sounds like' Hot Plug Detection?

which makes it relevant for this series and it could mean that the
rk3399-base.dtsi and rk356x.dtsi are actually missing an interrupt
definition in their DT files?

Or I am completely talking nonsense, which is the most likely scenario.

Cheers,
  Diederik

--3a883e580afd625faf3965ca5225d4c2652f66b4a902790343c6692e64f8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZv2hPgAKCRDXblvOeH7b
bmmrAQD2mW1+acc5OPHMteyhoxMRMFD4vmCP/MBBFkFjRlytFQD+IdxwUTVUb7/e
RzIrjKLyw2w+vxRnrW5FZkj8vkS36QA=
=SYHq
-----END PGP SIGNATURE-----

--3a883e580afd625faf3965ca5225d4c2652f66b4a902790343c6692e64f8--
