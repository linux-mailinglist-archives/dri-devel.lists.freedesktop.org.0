Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96914509A86
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BBD10F6EA;
	Thu, 21 Apr 2022 08:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3108810F6EA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:24:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4DE3D3202254;
 Thu, 21 Apr 2022 04:24:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 21 Apr 2022 04:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650529441; x=1650615841; bh=mr6/yNysRK
 Gd8H9fz/3NmMqTPBzrj57CSccM86kcPME=; b=VIma+8f/jMnVxvmpJBjeZS3wsE
 7WNCTDwHEgZOkcwzk2cs5sZDXVJbQ3OL/shhRoP9mDf+Mmm653jY3ztiTsyCjaCI
 OwchGtkQHzIcdvJx7k838oCmecexdkT4gfaSBkzGOWCSEHuFrc+T6OhgbjvxCjWo
 28sp4PAr8n5qwF/t/zqFRZZ3XPQYwrcUVZInviX6QtGKvwxCEiUFMXjUDk5Hbsms
 uT7qzOKdihSrkErhENc93iVajGjrhsJHpeq801SUQDArHHx1zm6Vf76EUin/Qmex
 z11krGVs0GYUPCujVlbfIRWeTKeKD/hf0/LcbODwbCpap9V3JxPmNuVwCF0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650529441; x=
 1650615841; bh=mr6/yNysRKGd8H9fz/3NmMqTPBzrj57CSccM86kcPME=; b=V
 YhUyeVImMDA1/5wVioG4M0Ip73hxGqOIR9HuXTpozM4wwsgo5I2K7RBLQXjuwiOc
 BvsOWUkjxxMmlfuMdJiSMLagNAS8Pup6ywJaqJ8MGY7H5r1+KG6UEX9YUHXtdiWh
 rqDOCpBLYnMaIJ0RUPaLqShwfdsq7/lv5soqpJrETzaB59bI8oR11i+uPlSh98m2
 urMsO855cv7vAz/8kaLk0xEUYhwOXL4FRgBTHXp7TlZmrLDLWLiyiCt5C/r4JC3C
 QJ8IfuMOTXFGztMgKmExbcuVNelPxD0o8Hh/F9FYTN0a8WJRD89EqKo/KRoLz16f
 sjzlE9GkvzlkNMEcmAr/Q==
X-ME-Sender: <xms:oRRhYrmnx6DbTxsGbIBrGungjD1IDW7X6yTgmv7WT1GHwClU8TCwxA>
 <xme:oRRhYu27NCpsHiskldqDd_ymYM6JBD8YkNvGcZmIPOWLpffmArezYQMzwPIfd8hYo
 Zo-jgccW_F0XarD4qU>
X-ME-Received: <xmr:oRRhYhpKJxXdNvxcupDa_WayLRZsenqqjmV9oNoqErpmXNrY8xrrdGR2v6JIYvMLakW5rfITBGBpUNogryxQH8s1ppt05v95WoIybko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddvgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oRRhYjlVKW8GIvD2MSSHdcPJYtLugQkhUcv1-IAygHTYCyryvepghg>
 <xmx:oRRhYp1D-rGd7-KK1SnjDz7YesPlA4Q-7YuYkenQ4SAtWmcdI_LBUQ>
 <xmx:oRRhYit08JuUeMP2ETa5TEzYk5OmhBd_spiZlMkcTracCV62cF9sZQ>
 <xmx:oRRhYo2Te-9IFb1XMn3gUfzqRUlxngGshtXVgGWqkVetPKyW0YT5VA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 04:24:00 -0400 (EDT)
Date: Thu, 21 Apr 2022 10:23:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <20220421082358.ivpmtak3ednvddrc@houat>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nuuowyjtkv725it4"
Content-Disposition: inline
In-Reply-To: <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nuuowyjtkv725it4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> + Linus
> + Marek
> + Laurent
> + Robert
>=20
> On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > bridge")' attempted to simplify the case of expressing a simple panel
> > under a DSI controller, by assuming that the first non-graph child node
> > was a panel or bridge.
> >
> > Unfortunately for non-trivial cases the first child node might not be a
> > panel or bridge.  Examples of this can be a aux-bus in the case of
> > DisplayPort, or an opp-table represented before the panel node.
> >
> > In these cases the reverted commit prevents the caller from ever finding
> > a reference to the panel.
> >
> > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > panel or bridge")', in favor of using an explicit graph reference to the
> > panel in the trivial case as well.
>=20
> This eventually breaks many child-based devm_drm_of_get_bridge
> switched drivers.  Do you have any suggestions on how to proceed to
> succeed in those use cases as well?

I guess we could create a new helper for those, like
devm_drm_of_get_bridge_with_panel, or something.

Maxime

--nuuowyjtkv725it4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmEUngAKCRDj7w1vZxhR
xcyNAQCQWG0wPTFJTHNnCb79v3w/0oq3K8NWFjJQdfhmMTMd0gEAluKjETuOog8r
01deImfsj34FpREypMQIqkuLR7Y8igw=
=cGpF
-----END PGP SIGNATURE-----

--nuuowyjtkv725it4--
