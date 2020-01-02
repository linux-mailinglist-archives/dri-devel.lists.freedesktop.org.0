Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFD12E52C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701DD6E04B;
	Thu,  2 Jan 2020 10:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9189DA2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 10:36:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 57A7349D;
 Thu,  2 Jan 2020 05:36:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Jan 2020 05:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=IM6AHSIeWAtjnEW25U4QauGRzja
 q1KRpfm+mTmZyzK0=; b=KXNY+8MzuUfm4/0hsfuJyxaDv0bTP6nk/RKwx5erooZ
 7OomV6nNeA0vB93T8Vf12cQ9skdDfR9Iyw6pOm/3iCNstEx1NdCtzMt5iumDUZN1
 BHGR2yzJiJ0w2+Uk7pY44BrbxzkoV8R3MrAR8K2SgZnIyP9e3yPbzvgfJlEMhT7f
 hqPlb3yaaoh8RbqsdEb1y3ANVjFtbndhcfI9VoZh8b/0Ste+cv0NqO/6tmL4/yLP
 6nqJgNxTAvWapLS2WUfl5IfzTTgupt5hu/REzPndTzMCnFdtfERpnRNyRJg7Skbc
 Tqabxlmu++0ASv+M0oQ3DlL89whhQ24+WS8xIdxWeeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IM6AHS
 IeWAtjnEW25U4QauGRzjaq1KRpfm+mTmZyzK0=; b=w/gXD3F6POwjCmTO7qthWE
 WC2UJqPH7i5dVPx3rOQ6+JQfP6jRjx/F+nZya7CLYngSnD2Txdd6TIX+Ux0o9n2N
 LrxIo2jbAGoozzSrQB5dxuUz7rqfU9kx+7djlhzvRhSrdaXcLfTooWrdn+u6tgXI
 covQdhMdXa/MDQdN5G0WDkPCZ7Jp56mIicwAkN38zgLLuetNiBGocUoVFEjNJZkv
 QSaVpdD2Xc7zxkwMQ4WogYW0OIt+B4paNLEOcgCkiRQPZ1dZ9o1+dcfeyEBHZnom
 Cb8xDBdKFGeW51rIlUxSs+suKgWUmy2AtS+wYhRDyY/xMLxgFxsfyTvMezykN/rA
 ==
X-ME-Sender: <xms:vccNXs464eBn5i-8iA-xoma9jY-gr4BMryz6tYVpxhQmNCXka1u71A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeguddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpehlkhhmlhdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedr
 jeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vccNXow5n2pSSR8XQa-lZy27Y_NN5wN5xtTJwqyC9UW7pEI8kKVvfw>
 <xmx:vccNXlqU9bmXFzuTNUPkrySNnWiqqGTupBTFlImoc74UwgA0aaFTqg>
 <xmx:vccNXi1E0G8Mecsulp--IivlGbhjKaKnmTmA68d_0GgnfWCqwgwL2g>
 <xmx:vccNXqVyaahjtAUMHbx9QSHx0LAGquoFRqs_fuvBixrucIwVO_IzKA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28E8780062;
 Thu,  2 Jan 2020 05:36:45 -0500 (EST)
Date: Thu, 2 Jan 2020 11:36:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Suresh Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v2] phy: Add DisplayPort configuration options
Message-ID: <20200102103643.5nsumruo7ixenoii@gilmour.lan>
References: <1577108473-29294-1-git-send-email-yamonkar@cadence.com>
 <20191223171849.yvofolswgvyfklry@hendrix.home>
 <BYAPR07MB51108A47A453B456F5F0D233D2290@BYAPR07MB5110.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR07MB51108A47A453B456F5F0D233D2290@BYAPR07MB5110.namprd07.prod.outlook.com>
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: Milind Parab <mparab@cadence.com>, "praneeth@ti.com" <praneeth@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jsarha@ti.com" <jsarha@ti.com>, "kishon@ti.com" <kishon@ti.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: multipart/mixed; boundary="===============1294967423=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1294967423==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c2loaiw6cvzf4s7e"
Content-Disposition: inline


--c2loaiw6cvzf4s7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Dec 24, 2019 at 12:29:40PM +0000, Yuti Suresh Amonkar wrote:
> > -----Original Message-----
> > From: Maxime Ripard <maxime@cerno.tech>
> > Sent: Monday, December 23, 2019 22:49
> > To: Yuti Suresh Amonkar <yamonkar@cadence.com>
> > Cc: linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > praneeth@ti.com; tomi.valkeinen@ti.com; jsarha@ti.com; Milind Parab
> > <mparab@cadence.com>; Swapnil Kashinath Jakhade
> > <sjakhade@cadence.com>
> > Subject: Re: [PATCH v2] phy: Add DisplayPort configuration options
> >
> > EXTERNAL MAIL
> >
> >
> > Hi,
> >
> > Please note that I don't have access to the displayPort spec, so I'll only
> > comment on the content of that patch, not whether it's complete or not.
> >
> > On Mon, Dec 23, 2019 at 02:41:13PM +0100, Yuti Amonkar wrote:
> > > Allow DisplayPort PHYs to be configured through the generic functions
> > > through a custom structure added to the generic union.
> > > The configuration structure is used for reconfiguration of DisplayPort
> > > PHYs during link training operation.
> > >
> > > The parameters added here are the ones defined in the DisplayPort spec
> > > 1.4 which include link rate, number of lanes, voltage swing and
> > > pre-emphasis.
> > >
> > > Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> > > ---
> > >
> > > This patch was a part of [1] series earlier but we think that it needs
> > > to have a separate attention of the reviewers. Also as both [1] & [2]
> > > are dependent on this patch, our sincere request to reviewers to have
> > > a faster review of this patch.
> > >
> > > [1]
> > >
> > > https://lkml.org/lkml/2019/12/11/455
> > >
> > > [2]
> > >
> > > https://patchwork.kernel.org/cover/11271191/
> > >
> > >  include/linux/phy/phy-dp.h | 95
> > ++++++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/phy/phy.h    |  4 ++
> > >  2 files changed, 99 insertions(+)
> > >  create mode 100644 include/linux/phy/phy-dp.h
> > >
> > > diff --git a/include/linux/phy/phy-dp.h b/include/linux/phy/phy-dp.h
> > > new file mode 100644 index 0000000..18cad23
> > > --- /dev/null
> > > +++ b/include/linux/phy/phy-dp.h
> > > @@ -0,0 +1,95 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2019 Cadence Design Systems Inc.
> > > + */
> > > +
> > > +#ifndef __PHY_DP_H_
> > > +#define __PHY_DP_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +/**
> > > + * struct phy_configure_opts_dp - DisplayPort PHY configuration set
> > > + *
> > > + * This structure is used to represent the configuration state of a
> > > + * DisplayPort phy.
> > > + */
> > > +struct phy_configure_opts_dp {
> > > +	/**
> > > +	 * @link_rate:
> > > +	 *
> > > +	 * Link Rate, in Mb/s, of the main link.
> > > +	 *
> > > +	 * Allowed values: 1620, 2160, 2430, 2700, 3240, 4320, 5400, 8100
> > Mb/s
> > > +	 */
> > > +	unsigned int link_rate;
> > > +
> > > +	/**
> > > +	 * @lanes:
> > > +	 *
> > > +	 * Number of active, consecutive, data lanes, starting from
> > > +	 * lane 0, used for the transmissions on main link.
> > > +	 *
> > > +	 * Allowed values: 1, 2, 4
> > > +	 */
> > > +	unsigned int lanes;
> > > +
> > > +	/**
> > > +	 * @voltage:
> > > +	 *
> > > +	 * Voltage swing levels, as specified by DisplayPort specification,
> > > +	 * to be used by particular lanes. One value per lane.
> > > +	 * voltage[0] is for lane 0, voltage[1] is for lane 1, etc.
> > > +	 *
> > > +	 * Maximum value: 3
> > > +	 */
> > > +	unsigned int voltage[4];
> > > +
> > > +	/**
> > > +	 * @pre:
> > > +	 *
> > > +	 * Pre-emphasis levels, as specified by DisplayPort specification, to be
> > > +	 * used by particular lanes. One value per lane.
> > > +	 *
> > > +	 * Maximum value: 3
> > > +	 */
> > > +	unsigned int pre[4];
> > > +
> > > +	/**
> > > +	 * @ssc:
> > > +	 *
> > > +	 * Flag indicating, whether or not to enable spread-spectrum
> > clocking.
> > > +	 *
> > > +	 */
> > > +	u8 ssc : 1;
> > > +
> > > +	/**
> > > +	 * @set_rate:
> > > +	 *
> > > +	 * Flag indicating, whether or not reconfigure link rate and SSC to
> > > +	 * requested values.
> > > +	 *
> > > +	 */
> > > +	u8 set_rate : 1;
> > > +
> > > +	/**
> > > +	 * @set_lanes:
> > > +	 *
> > > +	 * Flag indicating, whether or not reconfigure lane count to
> > > +	 * requested value.
> > > +	 *
> > > +	 */
> > > +	u8 set_lanes : 1;
> > > +
> > > +	/**
> > > +	 * @set_voltages:
> > > +	 *
> > > +	 * Flag indicating, whether or not reconfigure voltage swing
> > > +	 * and pre-emphasis to requested values. Only lanes specified
> > > +	 * by "lanes" parameter will be affected.
> > > +	 *
> > > +	 */
> > > +	u8 set_voltages : 1;
> >
> > I'm not quite sure what these flags are supposed to be doing, or what use-
> > cases they cover. The current API is using validate to make sure that we can
> > have a handshake between the caller and its PHY and must never apply the
> > configuration, and configure must always apply the configuration. These
> > flags look redundant.
> >
> > Maxime
>
> These flags are used to reconfigure the link during the link
> training procedure as described in DisplayPort spec. In this
> procedure , we may need to configure only subset of parameters (VS,
> Pre-emphasis, link rate and num of lanes) depending on different
> phases. e.g. At one stage, we may need to configure only Voltage
> swing and Pre-emphasis keeping number of lanes and link rate
> intact(set_voltages=true), while at other stage, we may need to
> configure all parameters. We use the flags to determine which
> parameter is updated during link training. Using separate flags for
> this provides control to upper layer.

Ok, it makes sense then :)

> I am not sure how to use validate to achieve this. As per my
> understanding validate is used to verify if set of parameters can be
> handled by PHY.

That's correct :)

Maxime

--c2loaiw6cvzf4s7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg3HuwAKCRDj7w1vZxhR
xe3qAP9Gt30ilzQgxVlPHA+hb21dDpFwiel5DoSQR1O1uRxeRgEA4g+bnox1e5ku
FSt8Uy+PHTvPRJYnJXgkZPz0+dRDSQw=
=PtY4
-----END PGP SIGNATURE-----

--c2loaiw6cvzf4s7e--

--===============1294967423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1294967423==--
