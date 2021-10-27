Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73743C3AD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AAB6E546;
	Wed, 27 Oct 2021 07:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DFE6E4AB;
 Wed, 27 Oct 2021 07:18:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9BE1158039D;
 Wed, 27 Oct 2021 03:18:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 27 Oct 2021 03:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zbIblgmtYNwpzwaZNwU9252HLEj
 HY066oOXTRFTs1zk=; b=TZdA9vDaemOXN0uPyqX7dcjxIztE4TRxfXlP6eAvCBB
 3PiZ1G4pbrgs3UwqBInD9mhwlTSsxoBlxak0Cta7Sp+RMiXkbZaQdkyZ4erifKls
 BmrDp8Zqyd0fMZ9liEabW5+PfS68Jxna3+yWOpDa9m27nVho6hTk3gGfSZITsa49
 lGgt2iYbvyTogJhCYwAVdpQ0DY64uATQg+mrKlJ3YgrcmoU9i0vN5K1qUiNgrHtC
 iaMb4md0ys2IDmF9yY/wAXmObYyWwuNfZxGCexwOzaL8eO92ZOvTgwt4RC05vzVG
 ehoDbexsLWtgJoJiCtGtRzFGUt9JX+k2CI5hxe4GxoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zbIblg
 mtYNwpzwaZNwU9252HLEjHY066oOXTRFTs1zk=; b=O0aZ92x7C+y+oJw8HAUTXv
 mT7r8oas2NUR4Dw/CzSp5hjH3gIjKPtVcFXfDPah34RJ3/q28r96g2vAw5jx1emG
 xOm72RL+X36LSeBEF6xMu7XaKuEnN+PiQ9O9VMoPnzBGEljmcd0UQGymgUZPAeon
 byRbiNKa5GNV7H4+dKuNX9hPST9WNy2TmL6tWqNNsYZ2lqonIoXUFhxytBpM3TMU
 l9NJBI9iV4QGN1pKYIhrh1WsmIneC5mLJS3NHLNNcupsyw67GdvMSYRYaDIqrJAT
 WD0QaC8dt0PoAUwpCKT8yMsBdiw9IYrQenh+rImqeundJCtJdwpk2gPPBTdrFgow
 ==
X-ME-Sender: <xms:O_14YQXRgBgNUJpKm0XMIlxprRpFSv_8yL_zSQaEoZtp81WSXab2ow>
 <xme:O_14YUmZNXlpM8-Xpf4vKeXJJ5axMudk8VnB85JmFMXSRklku6TcojjCSenMAX4XG
 keMAPhtkcRYSX89tCU>
X-ME-Received: <xmr:O_14YUYyNlid0T1wTInuoEjXXJEw6s_mCnY7xi4LsNpdg6ZrVXhZq1htud7StILe-nZPkOChOZCyNa3Tzsds0kJTnKIhzYH5V7MSEqc2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefledgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O_14YfW3qZF-CgOBJLrbajH9j4pfRGaYdJq4BYC-vqMxpGENbC5eyg>
 <xmx:O_14Yak1qcjOcph8ktiNgTUpGZiXSGH1dPuSrDSCSzqAFigFgVesPQ>
 <xmx:O_14YUdL9PxtxQ-eTIbGldPIxYNm09plknVDByyJk2tF3gpRGQwRWw>
 <xmx:PP14Yfi_oKcMIHE649GOCa-ExFo7KxsYEnRdxOZnECOsAGhMxE60Bw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 03:18:19 -0400 (EDT)
Date: Wed, 27 Oct 2021 09:18:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Lyude Paul <lyude@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: Re: [PULL] topic/amdgpu-dp2.0-mst
Message-ID: <20211027071816.64ntgyzdvnbotabb@gilmour>
References: <e0e3cb4ea8b6f2d08e8d07a2ad3b25a2dca4570e.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="37klhonfyyrkyte5"
Content-Disposition: inline
In-Reply-To: <e0e3cb4ea8b6f2d08e8d07a2ad3b25a2dca4570e.camel@redhat.com>
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


--37klhonfyyrkyte5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lyude,

On Mon, Oct 25, 2021 at 09:30:14PM -0400, Lyude Paul wrote:
> topic/amdgpu-dp2.0-mst-2021-10-25:
> UAPI Changes:
> Nope!
>=20
> Cross-subsystem Changes:
> drm_dp_update_payload_part1() takes a new argument for specifying what the
> VCPI slot start is
>=20
> Core Changes:
> Make the DP MST helpers aware of the current starting VCPI slot/VCPI total
> slot count...
>=20
> Driver Changes:
> ...and then add support for taking advantage of this for 128b/132b links =
on DP
> 2.0 for amdgpu

It's not really clear to me what branch it should be pulled in? is it
for drm-misc-next?

Thanks!
Maxime

--37klhonfyyrkyte5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXj9OAAKCRDj7w1vZxhR
xfIRAQDqiCgkgHfLC3zhkuseDumwLGo/iWaZdexBCfZH78Bx7wEAqbkiCNYIZQWp
FAF7+jkQY8XY5Fc7dcpVrFqwiPhusAc=
=mRFE
-----END PGP SIGNATURE-----

--37klhonfyyrkyte5--
