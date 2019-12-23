Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C1112A24E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF45689B66;
	Tue, 24 Dec 2019 14:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7446E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 17:17:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7A5196C7;
 Mon, 23 Dec 2019 12:17:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 23 Dec 2019 12:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=f+9UQBBRmgVokBd7PkoZv7meaKs
 B0oijcq/dYQCJ+4o=; b=i7RWu5DFMSlRhx8XhmisAkEUWeUch7Qbxakw5VVp7f1
 HHWxlYJn9Cefkkxz/N1cGKr3vcArk4AWA+OD120DLS9saoA+v+6y6nBLPH1Z05xD
 UFWsiUe6xpoi94O5hmrajbKvJy6MyRpbJI/oIStRTlyKD5fRqeGh6oiWEXnMxdxc
 piUx4onCjrfkFX+yYDpwJAmtSVRoNaVs1O2wU4QlzJx8y0e3GAMGYQUc1g7dnwSj
 S9GkhKbud8drQS79x+N2wt+fBeyNUkmn2CQW7jJs6ybRf92aT4KiDD6b4E2rcj0v
 jCpw37Xm0kDGs7nHtPH3h90iWsV7i+j4xstWzPII3SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f+9UQB
 BRmgVokBd7PkoZv7meaKsB0oijcq/dYQCJ+4o=; b=ELNOdUqUdB4H4kkogtY4YU
 SjzpLzqw6jJ8Z1l4HWuwZclBeN6xLie9RjmJr8ncNzc99gRudhdnxhOEPgKSYVhF
 Gsys6HYVDM9b3mJSIDeYYMO1Bo+pVgbCegCCE75IBwQyRuButfJ2Tr7+29bPdf87
 Y4JUD9bNvLdtXM3Trrbj0IdmcaBPuYLRUlOq0Qbqh0D6kB+kqq7xa8YkogwQDoR4
 MgxFslFUyBhbOz5g2ygmY9Gl6fraxF61JcxBpK1+xphtbKUJJPaKgfx5AAs4f4K9
 rzF+lcWl67DlvGZ7CSP0KzIV8l4eDN3KgvDo6osrrNK//ZN+Xw5SHjcVesXP6K6A
 ==
X-ME-Sender: <xms:rPYAXtGMMvJEL8Oqa97XfAklA8U5gbu3oVw4FJgssqMhmwQOVJ25xA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvtddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpehlkhhmlhdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrudduledrvddt
 iedrvddtgeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhord
 htvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:rPYAXihAX2E7GQmJw8yn5hx_y2HFF6oRxJzMzRW6hcMIvZrPB_h1Pg>
 <xmx:rPYAXoqqsQpyV1zmOE7hc5yFF5Pwj_-W-o0i71C-RPjj0rt4_d3LCg>
 <xmx:rPYAXiJO7UV6kdSTwLeppnQM5T0JKeiIA9fQgRWEstmnRN89a25Qjw>
 <xmx:rvYAXttMg5qmDq8ipm6wvph_H1jn6LVjeYUvyfiVFMjOrldmNri83A>
Received: from localhost (lfbn-lyo-1-633-204.w90-119.abo.wanadoo.fr
 [90.119.206.204])
 by mail.messagingengine.com (Postfix) with ESMTPA id 864778005A;
 Mon, 23 Dec 2019 12:17:32 -0500 (EST)
Date: Mon, 23 Dec 2019 18:18:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v2] phy: Add DisplayPort configuration options
Message-ID: <20191223171849.yvofolswgvyfklry@hendrix.home>
References: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
In-Reply-To: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: mparab@cadence.com, praneeth@ti.com, linux-kernel@vger.kernel.org,
 jsarha@ti.com, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org,
 sjakhade@cadence.com
Content-Type: multipart/mixed; boundary="===============0961633174=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0961633174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubm5wycxpjmdrvol"
Content-Disposition: inline


--ubm5wycxpjmdrvol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please note that I don't have access to the displayPort spec, so I'll
only comment on the content of that patch, not whether it's complete
or not.

On Mon, Dec 23, 2019 at 02:41:13PM +0100, Yuti Amonkar wrote:
> Allow DisplayPort PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> The configuration structure is used for reconfiguration of
> DisplayPort PHYs during link training operation.
>
> The parameters added here are the ones defined in the DisplayPort
> spec 1.4 which include link rate, number of lanes, voltage swing
> and pre-emphasis.
>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>
> This patch was a part of [1] series earlier but we think that it needs
> to have a separate attention of the reviewers. Also as both [1] & [2] are
> dependent on this patch, our sincere request to reviewers to have a
> faster review of this patch.
>
> [1]
>
> https://lkml.org/lkml/2019/12/11/455
>
> [2]
>
> https://patchwork.kernel.org/cover/11271191/
>
>  include/linux/phy/phy-dp.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h    |  4 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 include/linux/phy/phy-dp.h
>
> diff --git a/include/linux/phy/phy-dp.h b/include/linux/phy/phy-dp.h
> new file mode 100644
> index 0000000..18cad23
> --- /dev/null
> +++ b/include/linux/phy/phy-dp.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 Cadence Design Systems Inc.
> + */
> +
> +#ifndef __PHY_DP_H_
> +#define __PHY_DP_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct phy_configure_opts_dp - DisplayPort PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * DisplayPort phy.
> + */
> +struct phy_configure_opts_dp {
> +	/**
> +	 * @link_rate:
> +	 *
> +	 * Link Rate, in Mb/s, of the main link.
> +	 *
> +	 * Allowed values: 1620, 2160, 2430, 2700, 3240, 4320, 5400, 8100 Mb/s
> +	 */
> +	unsigned int link_rate;
> +
> +	/**
> +	 * @lanes:
> +	 *
> +	 * Number of active, consecutive, data lanes, starting from
> +	 * lane 0, used for the transmissions on main link.
> +	 *
> +	 * Allowed values: 1, 2, 4
> +	 */
> +	unsigned int lanes;
> +
> +	/**
> +	 * @voltage:
> +	 *
> +	 * Voltage swing levels, as specified by DisplayPort specification,
> +	 * to be used by particular lanes. One value per lane.
> +	 * voltage[0] is for lane 0, voltage[1] is for lane 1, etc.
> +	 *
> +	 * Maximum value: 3
> +	 */
> +	unsigned int voltage[4];
> +
> +	/**
> +	 * @pre:
> +	 *
> +	 * Pre-emphasis levels, as specified by DisplayPort specification, to be
> +	 * used by particular lanes. One value per lane.
> +	 *
> +	 * Maximum value: 3
> +	 */
> +	unsigned int pre[4];
> +
> +	/**
> +	 * @ssc:
> +	 *
> +	 * Flag indicating, whether or not to enable spread-spectrum clocking.
> +	 *
> +	 */
> +	u8 ssc : 1;
> +
> +	/**
> +	 * @set_rate:
> +	 *
> +	 * Flag indicating, whether or not reconfigure link rate and SSC to
> +	 * requested values.
> +	 *
> +	 */
> +	u8 set_rate : 1;
> +
> +	/**
> +	 * @set_lanes:
> +	 *
> +	 * Flag indicating, whether or not reconfigure lane count to
> +	 * requested value.
> +	 *
> +	 */
> +	u8 set_lanes : 1;
> +
> +	/**
> +	 * @set_voltages:
> +	 *
> +	 * Flag indicating, whether or not reconfigure voltage swing
> +	 * and pre-emphasis to requested values. Only lanes specified
> +	 * by "lanes" parameter will be affected.
> +	 *
> +	 */
> +	u8 set_voltages : 1;

I'm not quite sure what these flags are supposed to be doing, or what
use-cases they cover. The current API is using validate to make sure
that we can have a handshake between the caller and its PHY and must
never apply the configuration, and configure must always apply the
configuration. These flags look redundant.

Maxime

--ubm5wycxpjmdrvol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXgD2+QAKCRDj7w1vZxhR
xSfoAQDizGoETzWQHvYcOlfS5HaB5c3ti8SZuh8sNClfAq4RgwEA9QSo0Bt87EeD
HqPz2xWauzryHY7EKDkcv1FI11FmCg0=
=b/f7
-----END PGP SIGNATURE-----

--ubm5wycxpjmdrvol--

--===============0961633174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0961633174==--
