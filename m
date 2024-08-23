Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3695CABE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 12:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CD210E4A1;
	Fri, 23 Aug 2024 10:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="cL9Er7Yo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EF710E4A1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNbXOx598TDYgdA8NaIEZsBVSraU+CQsgIhi1d4qqCQ=; b=cL9Er7Yo/5KkgBw8fyyBzi8wrU
 XCc2z9xbbhkK5fhWM6Jj5Wzcza/+zd8fAcZcg7yCjAoxeO/vWqqh2QFSqwYkWlH0QhGnugHcvizYe
 r+6R1gmBabHMxT6fcZYEO83j41sM5fpRmFaFjrEiz/bvDQ0kS5oC82wStifK6Rv0PWQwr9v1+GVJk
 GfCuXCM62S2N5k5dHj4q5WHmtpd8eagMIKMTWNA9bWi/iXi0lueH4ngGgaanT4MHwrvAz8nutz/4d
 baOQFeg0ZgxP8jILyEjC9tXnFLNAO7RuC86h3rFow8eF+69lnZXch0wdzf22VV3b5MCLECps3z+du
 f4syM6Pw==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1shRoz-0004MQ-7M; Fri, 23 Aug 2024 12:47:09 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
Date: Fri, 23 Aug 2024 12:47:50 +0200
Message-ID: <3137870.U3zVgo479M@diego>
In-Reply-To: <20240822-pushchair-premises-f4055779216a@spud>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <4167579.6PsWsQAL7t@diego> <20240822-pushchair-premises-f4055779216a@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Donnerstag, 22. August 2024, 10:41:10 CEST schrieb Conor Dooley:
> On Thu, Aug 22, 2024 at 09:01:34AM +0200, Heiko St=FCbner wrote:
> > @Conor: just for me, did some shift happen in our understanding of dt-
> > best-practices in terms of syscon via phandle vs. syscon via compatible?
> >=20
> > Because Rockchip boards are referencing their GRFs via phandes forever
> > but similar to the soc vs non-soc node thing, I'd like to stay on top of
> > best-practices ;-)
>=20
> If IP blocks, and thus drivers, are going to be reused between devices,
> using the phandles makes sense given that it is unlikely that syscon
> nodes can make use of fallback compatibles due to bits within that "glue"
> changing between devices. It also makes sense when there are multiple
> instances of an IP on the device, which need to use different syscons.
> My goal is to ask people why they are using these type of syscons
> phandle properties, cos often they are not required at all - for example
> with clocks where you effectively need a whole new driver for every
> single soc and having a phandle property buys you nothing.

I guess I'm of two minds here.

=46or me at least it makes sense to spell out the dependency to the
syscon in the devicetree and not just have that hidden away inside the
driver.

But on the other hand, we already have the per-soc configuration [0]
defining which grf bits needs to be accessed, so adding a

	.lanecfg1_grf_compat =3D "rockchip,rk3568-vo"

would not create overhad, as the grf regs and bits and rearranged
all the time anyway.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c#n1652
taking DSI as an example, where this is even more obvious


