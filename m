Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47F9F88E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291910E4C8;
	Fri, 20 Dec 2024 00:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="RL++tx/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B53C10E4C8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:18:00 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1734653876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S/RK+iCwMDOjsz6qGHyrgosuNTC74b/O0wp4fma2qaQ=;
 b=RL++tx/GUnwLN9G3bQCBvzqbyINV1kneBL1xXtIsv/Kn9nBODpK6zMbUJIcvfASm1ZlFc5
 VtM3aR/JJkN+2RW1IuI1KnbudmdXs1kQjcyecZDgGytPV6s9wQqfKwITLly7LHBEqZulKj
 rD5AX57YauDEvqdc/SRum3I1y1KgTt0gTDDEqitA+iUXkalBDAGN7m5Fcc9ZLAScwTy39Z
 msnxadguluUjlinKAd4BwJ3oylD4gCTvIjnoyLQO6p2pVdKbW3ijZB1I0BG2AYZgWFTMSL
 P4nN9CSajxcslzBNFzmXXQWRUJUZerOLj4Lv1/25v0OJcTABH9Ccs825K0KveA==
Content-Type: multipart/signed;
 boundary=011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 20 Dec 2024 01:17:42 +0100
Message-Id: <D6G3H3AXXVAJ.3F1WMBTWLX2KV@cknow.org>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <algea.cao@rock-chips.com>,
 <rfoss@kernel.org>, <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <sebastian.reichel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <hjc@rock-chips.com>, <kever.yang@rock-chips.com>,
 <linux-rockchip@lists.infradead.org>, <vkoul@kernel.org>,
 <andy.yan@rock-chips.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <l.stach@pengutronix.de>
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Damon Ding"
 <damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
 <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
In-Reply-To: <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
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

--011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Dec 20, 2024 at 1:13 AM CET, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
> >  void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *co=
unt)
> > @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_d=
p_device *dp, u32 *count)
> >  void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
> >  {
> >  	u8 lane;
> > +	int ret;
> > =20
> >  	for (lane =3D 0; lane < dp->link_train.lane_count; lane++)
> >  		writel(dp->link_train.training_lane[lane],
> >  		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
> > +
> > +	if (dp->phy) {
> > +		union phy_configure_opts phy_cfg =3D {0};
> > +
> > +		for (lane =3D 0; lane < dp->link_train.lane_count; lane++) {
> > +			u8 training_lane =3D dp->link_train.training_lane[lane];
> > +			u8 vs, pe;
> > +
> > +			vs =3D (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
> > +			     DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > +			pe =3D (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
> > +			     DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > +			phy_cfg.dp.voltage[lane] =3D vs;
> > +			phy_cfg.dp.pre[lane] =3D pe;
> > +		}
> > +
> > +		phy_cfg.dp.lanes =3D dp->link_train.lane_count;
> > +		phy_cfg.dp.link_rate =3D
> > +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>
> This two should not be necessary, please drop them.

This too or These two (statements)?

> > +		phy_cfg.dp.set_voltages =3D true;
> > +		ret =3D phy_configure(dp->phy, &phy_cfg);
> > +		if (ret && ret !=3D -EOPNOTSUPP) {
> > +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret)=
;
> > +			return;
> > +		}
> > +	}
> >  }
> > =20
> >  u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, =
u8 lane)
> > --=20
> > 2.34.1
> >=20


--011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ2S3qwAKCRDXblvOeH7b
brvoAP9rdY+F/m1jGw+mxL5qmV8ze/WQGLInbKNxmBNiT7RnnAEAmpHkct6n5nur
t6M6q47PJP6EzzpfIfsmJOaAH0THJwM=
=RI0b
-----END PGP SIGNATURE-----

--011e6b374dd8cc6329fed8e851dfa8c3e80f3228d231932c98a778791d9f--
