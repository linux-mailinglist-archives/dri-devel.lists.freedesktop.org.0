Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E742C34E3A4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 10:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9526E87C;
	Tue, 30 Mar 2021 08:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2326E87C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 08:58:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 56E105C0099;
 Tue, 30 Mar 2021 04:58:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 30 Mar 2021 04:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=a9UqojEtfp6yjahhezHn9vr25p8
 yj9GDDG7ODVtC6I0=; b=WtfHkpZyPzyMd0dVBsb9mqlCMlAxyAtoKwsiNhK8TGS
 tf9ePR4gW5Xx8QgO85s2TBB+Y8fzAnQjCaISxLfqzpAzIGb5IYyKPeBD30m666zR
 fEZQOSv/L29ChvpO0tcFV+Ff4K87kvX0AdGLJ3Gws36a7G6gyYCXT9Mh47/KBkWC
 VsZ2EmYZ8V6APBOfHTIJNME9kAWJvYdxBVCmuqgU0I9A5aO9StupxHxTljBQW7lu
 2PqqBEucYrTXQRBQtbYGotEoSslmpyuHfbih4nrX2VqmWt78xeSbgCN8O3NyJAZR
 CvnVG8kg37Wg4g3TVgvrw36RjgyqorcwPGhNfLCim5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=a9Uqoj
 Etfp6yjahhezHn9vr25p8yj9GDDG7ODVtC6I0=; b=rA8Hd/3tXkTxm2w74mS3U2
 tW4ltNxfBHIU4xWJrHtto2AhWj1AKZAcIjqCVBdXEYp9hO4DSALl9SkImscLFDiB
 Hm8sQcpBcOQh+1HoHNom6rGlzTS0nNLFRy5mQmxwwOiPO/DgjjhWh6yjvDpU/Eks
 ERNeItDbdUsKEy12e/i1xgMXwwjDISJ5lIwIa7mcQ1FOoQK9gimsSY+uSBo3O1gE
 QFZ+YUQgT6GgK7xx0vXX5zXpe1R3bIWK7SeOKlkgoqSGqlHFX5usmGV3Rw5Pbm3U
 Voqf03UvN+r3dWOO5krsZwaKv62tkt29jd0lhaykNhEYATRy2sh1SqhOiAYek0lQ
 ==
X-ME-Sender: <xms:HuhiYGcm2dg7Ss83h7B3L7_GsHBotYlyjTvpk6_S4Lh-9xUlCFfCjA>
 <xme:HuhiYAMA4G2YSELbbXvH_cngEIW4Fgz_MUYzTEEVt32vJph0LvCyOs6hG8craklbo
 Wf6AfgvwdYZurCKnEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeelkeeghefhuddtleejgfeljeffhe
 ffgfeijefhgfeufefhtdevteegheeiheegudenucfkphepledtrdekledrieekrdejieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HuhiYHgLh5zqLGvk12bax2XlxJFnS5RW7Et5D7z1zU8n7DamjJ7Y4w>
 <xmx:HuhiYD8eUeGobVF-nRJbekXroiDZkh65FfWV0VUfCMv2FjoG6Mz02w>
 <xmx:HuhiYCs_DpHoPwuhfdYcFSu6o7A0gw6hppsVG5r9Jgd2krNUvBRYrQ>
 <xmx:IehiYL7mEx9QUhYw1iuEpwzcfcdwQ5cxo5MW8V4zZgddM8U2KXsRFg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FCDF1080054;
 Tue, 30 Mar 2021 04:58:06 -0400 (EDT)
Date: Tue, 30 Mar 2021 10:58:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] dt-bindings: bcm2711-hdmi: Fix broken schema
Message-ID: <20210330085803.vcsdz43uinhodwn2@gilmour>
References: <20210218152837.1080819-1-maxime@cerno.tech>
 <20210223212624.GA89721@robh.at.kernel.org>
 <CAL_JsqKtGz3mtzc1KTASVtAcc7PSV7Z8Y-n8JjOzxua8EpQ5ZQ@mail.gmail.com>
 <20210327100026.53cc228c@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20210327100026.53cc228c@canb.auug.org.au>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1926780092=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1926780092==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ofgt3x6th5xd6lz"
Content-Disposition: inline


--6ofgt3x6th5xd6lz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Sat, Mar 27, 2021 at 10:00:26AM +1100, Stephen Rothwell wrote:
> Hi Rob,
>=20
> On Fri, 26 Mar 2021 15:01:34 -0600 Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Tue, Feb 23, 2021 at 2:26 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, 18 Feb 2021 16:28:37 +0100, Maxime Ripard wrote: =20
> > > > For some reason, unevaluatedProperties doesn't work and
> > > > additionalProperties is required. Fix it by switching to
> > > > additionalProperties.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml          | =
2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > =20
> > >
> > > Applied, thanks! =20
> >=20
> > Something weird is going on with this fix. linux-next doesn't end up
> > with the change even though 5.12-rc2 has it. I suspect it's because
> > the original commit is in 2 branches (drm-misc-next and
> > drm-misc-fixes), but the fix was applied by me. I'm not sure how
> > linux-next didn't have a manual merge for this.
>=20
> I think it goes like this:
>=20
> Commit a99163e9e708 ("Merge drm/drm-next into drm-misc-next") was merged
> into v5.12-rc1-dontuse and had "additionalProperties: false" and is the
> common base for all later changes to this file.
>=20
> Commit 6ff92deff711 ("dt-binding: display: bcm2711-hdmi: Add CEC and
> hotplug interrupts") changes to "unevaluatedProperties: false" and is
> merged into v5.12-rc1-dontuse.
>=20
> Commit a3cb15cda1b8 ("dt-bindings: bcm2711-hdmi: Fix broken schema")
> changes to "additionalProperties: false" and is merged into v5.12-rc2.
>=20
> Commit e7cbc68a28e1 ("dt-binding: display: bcm2711-hdmi: Add
> CEC and hotplug interrupts") changes (from a99163e9e708) to
> "unevaluatedProperties: false" in the drm-misc and then drm trees.
>=20
> When I come to merge the drm tree into linux-next, the merge base is
> v5.12-rc3 and the only change to this file since v5.12-rc3 is in the
> drm tree ...
>=20
> Another way to look at it is that one one side of my merge, the line
> goes from "additionalProperties: false" to "unevaluatedProperties:
> false" and back to "additionalProperties: false" (so no net change)
> and on the other side if my merge the line changes to
> "unevaluatedProperties: false".

So I guess the easiest fix for this would be to merge it through
DRM-misc? Or should we just wait until all the branches gets merged in
Linus' tree?

Maxime


--6ofgt3x6th5xd6lz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGLoGwAKCRDj7w1vZxhR
xcmwAP47LiptNIhBUxMg2mEFfPxgin3nCI19w3bKeljN5QSI3AEA2f6cuaCWbJb6
sJC+UEFraFFiisWPpQdnuO+KFCvnJww=
=dKbm
-----END PGP SIGNATURE-----

--6ofgt3x6th5xd6lz--

--===============1926780092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1926780092==--
