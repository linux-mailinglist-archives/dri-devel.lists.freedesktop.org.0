Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8A23B5DF6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D622F89FE3;
	Mon, 28 Jun 2021 12:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049A89FE3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:28:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 968F05C0160;
 Mon, 28 Jun 2021 08:28:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Jun 2021 08:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=85l5wyrKT7thqq8um5ZxxJC1O9K
 GWQen9qitnDrdMUE=; b=SrdZLVw0sbHy38Gs4HG9zHRxEAQQVqyhls84fV42gJe
 RYiFrbbHVbrp9cS+s2WCwSVyCqUDzJy1WXMScOVU+ap/TmSz+qqTAE284eeVaiZ2
 8v9bsvKFUQGG+2pS1ntzbCNXfvWG2cOhLYu6eTCrp2eKUIJDeUvkydIRUWEDHLK2
 +6R2pb8vAI6DGqnRmyAQQCH2N5DoEoUeYEkPt5pHOxRCJ2TpUHI13djEfiZ0hJq5
 BmC74CyuCLzvv0NjJDK6RaYBgyFuhjxKkw7fzRuigJGyfPzz1aAVeZ8PyLIVs4F3
 f4Hp6/2KQw4F1fiAMPMQuBkb0m8p7LYMbvqnfbytsag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=85l5wy
 rKT7thqq8um5ZxxJC1O9KGWQen9qitnDrdMUE=; b=TNBcQBgSapO1QLA1i4f13H
 19V2o9s1OXVL4nB4LdR2yyw6leNjxGxfQVSLEqm73ECt7hBN+PXZnWcrCr0bKxHT
 x2Qmcc9i8zFGVt20v/fjloLm2VSL3gnRVzYJnaUlOV40oUgetJ+27xqcmsphs4E7
 uxQynicN9vpChRrY4UPv+SY0qVS69Min5c2+zQsEefTYyIY2bKhJkiZCTB4pyap4
 dkkESYgXHzVqDa9ZPR+lGGcUR+XPIl5JhxojRO1FPQiZwiPGdpd2vgTSxRE775DR
 nVyOzjkx4RFTVO+ZMF5fRlajnDkpIWGhSFSvYfYlYYa3PS5KKWRqGa0BRrfmyQ9Q
 ==
X-ME-Sender: <xms:dsDZYAszrChy3YByhmGFilWAPbqkejF94pcdSLRiJTtaCGnFIR8LMw>
 <xme:dsDZYNe5R-fP6qxh6_xJ213-k9zF9M2AU-jQ08tiOlYYsn39JOkroe0A42telywTE
 SsYP_BkZWjDx6S-w2E>
X-ME-Received: <xmr:dsDZYLyiFabnG_jG71tFZAgwVJ79S62nmECgLyyIc0l6jnFcDCxRJoCIAO9HHxW_Hwkbkx38P43fpOwOn3aLgvs5Q1GXw5G-ylVW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueevtdetjeevkedtledtheffvdektdeljeeffeefudeikefhudelueekjeff
 ueeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdroh
 hrghdpshhpihhnihgtshdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dsDZYDOennnrMAruRpXZ7wSUgnONn7wAY5MKezWndoZG2Sh74C46kQ>
 <xmx:dsDZYA_y8pecE2Y9ax_ieCgYE3AKDQ-OnpaX9qxvy8s7nmEj9l8pCA>
 <xmx:dsDZYLUmpaAkTkWysRjMFr2hE79dCDAaDgTvYrGxWaQeUfRZFoIMnw>
 <xmx:d8DZYCKSnoTWavQcdfo-JxOPjSQyQC8bCcwP5Vf8LxrVMd3rXc-Jfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:28:38 -0400 (EDT)
Date: Mon, 28 Jun 2021 14:28:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: vc4: hdmi: audio: ASoC: error at snd_soc_dai_startup on
 fef00700.hdmi
Message-ID: <20210628122836.opxopzf7wtvurzhd@gilmour>
References: <612b134c-d356-f027-46d7-322bdaff37a4@i2se.com>
 <20210604090215.cpvoryvwrfzj5ikx@gilmour>
 <c5290159-89a3-3128-c54f-e1174212a893@i2se.com>
 <20210617152545.slgm5r7y2pur7mv3@gilmour>
 <45e55e16-6bb7-5d82-1031-db5deaee68ab@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6bkz65ocgd2olssr"
Content-Disposition: inline
In-Reply-To: <45e55e16-6bb7-5d82-1031-db5deaee68ab@i2se.com>
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
Cc: alsa-devel@alsa-project.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6bkz65ocgd2olssr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 07:41:09PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 17.06.21 um 17:25 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > On Sat, Jun 12, 2021 at 12:04:08PM +0200, Stefan Wahren wrote:
> >> Hi Maxime,
> >>
> >> Am 04.06.21 um 11:02 schrieb Maxime Ripard:
> >>> Hi Stefan,
> >>>
> >>> I would assume it's due to this:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/vc4/vc4_hdmi.c#n1083
> >>>
> >>> It pre-dates my time working on the vc4 driver so I'm not really sure
> >>> what this is supposed to prevent, but my guess is that it's there to
> >>> avoid someone using the audio card before we have a display detected =
and
> >>> connected, and its capabilities known (the first and more obvious one
> >>> being does it support audio in the first place).
> >>>
> >>> It's nothing new though, maybe it's the error printing itself that is?
> >> i'm sorry, i forgot about this discussion here:
> >>
> >> https://lists.freedesktop.org/archives/dri-devel/2020-December/292701.=
html
> > It looks like there's no discussion on that link, is it the link you wa=
nted to paste?
>=20
> it was the right patch, but the discussion get lost because of turn of
> the year. Next try:
>=20
> https://www.spinics.net/lists/dri-devel/msg284535.html

It looks like Mark wasn't particularly on-board with that change though :/

I'm not really sure what to do with it, really. The only issue I'm
seeing is that there's some logging that doesn't look too nice. Is there
anything else?

Maxime

--6bkz65ocgd2olssr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNnAdAAKCRDj7w1vZxhR
xSt0AQDwlBfQs+NVVCbsSsCtAkc/UA+EeBR2cqs+Jd7mF9x68wEAuTvFlfADMxHO
fhxC5a9pqRPXf0MFBR9x5bAN2EbEwAU=
=wrZD
-----END PGP SIGNATURE-----

--6bkz65ocgd2olssr--
