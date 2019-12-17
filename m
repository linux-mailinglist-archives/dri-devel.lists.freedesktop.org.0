Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526F122AC2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 12:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C76E9A6;
	Tue, 17 Dec 2019 11:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016EA6E9A6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 11:57:59 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E1ED207FF;
 Tue, 17 Dec 2019 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576583879;
 bh=4e+G10S/FO/9s5pwKDuay77jsJQF2GsOh3k8d0+BUzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RURNKPS4sbmp6fGE0V82D4fpoHPYb1KpU1XXY4gxROsxJb9pmtwXZlz2GAM1BNGBM
 Tzn8dBak5abMP9bbODmAIvxxn5f0dsTY4S/Ns+/GY++PdC0H/NaFoo4eQbRdsT2hI2
 7CdUU6EBF/9AXoTrWIXRadpwn56NZBoZPn1nBQ6c=
Date: Tue, 17 Dec 2019 12:57:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH 1/1] drm/sun4i: hdmi: Check for null pointer before cleanup
Message-ID: <20191217115757.ptoscpwuyv6tmwtc@gilmour.lan>
References: <20191216144348.7540-1-stefan@olimex.com>
 <20191216161258.lmkq2ersfm746t7q@gilmour.lan>
 <cebda755-2649-79a1-fd08-79b13edef1a5@olimex.com>
 <20191217114603.6cyrfx3sekn6uwmp@gilmour.lan>
 <20191217114906.lrjup35tngrjhwuj@gilmour.lan>
 <83088170-1753-6a2f-aa25-c4f6f54462d6@olimex.com>
MIME-Version: 1.0
In-Reply-To: <83088170-1753-6a2f-aa25-c4f6f54462d6@olimex.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1022963491=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1022963491==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dayinannzkrhuxa6"
Content-Disposition: inline


--dayinannzkrhuxa6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2019 at 01:54:56PM +0200, Stefan Mavrodiev wrote:
> Hi,
>
> On 12/17/19 1:49 PM, Maxime Ripard wrote:
> > On Tue, Dec 17, 2019 at 12:46:03PM +0100, Maxime Ripard wrote:
> > > On Tue, Dec 17, 2019 at 08:45:07AM +0200, Stefan Mavrodiev wrote:
> > > > Hi,
> > > >
> > > > On 12/16/19 6:12 PM, Maxime Ripard wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Dec 16, 2019 at 04:43:48PM +0200, Stefan Mavrodiev wrote:
> > > > > > It's possible hdmi->connector and hdmi->encoder divices to be NULL.
> > > > > > This can happen when building as kernel module and you try to remove
> > > > > > the module.
> > > > > >
> > > > > > This patch make simple null check, before calling the cleanup functions.
> > > > > >
> > > > > > Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 6 ++++--
> > > > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > > > > index a7c4654445c7..b61e00f2ecb8 100644
> > > > > > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > > > > @@ -685,8 +685,10 @@ static void sun4i_hdmi_unbind(struct device *dev, struct device *master,
> > > > > >    	struct sun4i_hdmi *hdmi = dev_get_drvdata(dev);
> > > > > >
> > > > > >    	cec_unregister_adapter(hdmi->cec_adap);
> > > > > > -	drm_connector_cleanup(&hdmi->connector);
> > > > > > -	drm_encoder_cleanup(&hdmi->encoder);
> > > > > > +	if (hdmi->connector.dev)
> > > > > > +		drm_connector_cleanup(&hdmi->connector);
> > > > > > +	if (hdmi->encoder.dev)
> > > > > > +		drm_encoder_cleanup(&hdmi->encoder);
> > > > > Hmmm, this doesn't look right. Do you have more information on how you
> > > > > can reproduce it?
> > > > Just build sun4i_drm_hdmi as module (CONFIG_DRM_SUN4I_HDMI=m). Then try to
> > > > unload the module:
> > > >
> > > > # rmmod sun4i_drm_hdmi
> > > >
> > > > And you get this:
> > > >
> > > > Unable to handle kernel NULL pointer dereference at virtual address 00000000
> > > > pgd = 6b032436
> > > > [00000000] *pgd=00000000
> > > > Internal error: Oops: 5 [#1] SMP ARM
> > > > Modules linked in: sun4i_drm_hdmi(-)
> > > > CPU: 0 PID: 1081 Comm: rmmod Not tainted 5.5.0-rc1-00030-g6ec417030d93 #33
> > > > Hardware name: Allwinner sun7i (A20) Family
> > > > PC is at drm_connector_cleanup+0x40/0x208
> > > > LR is at sun4i_hdmi_unbind+0x10/0x54 [sun4i_drm_hdmi]
> > > > ...
> > > >
> > > >
> > > > I've tested that with sunxi/for-next branch on A20-OLinuXino board.
> > > Yeah, you detailed the symptoms nicely in the commit log, but my point
> > > was that we shouldn't end up in that situation in the first place.
> > >
> > > Your patch works around it, but it doesn't fix the underlying
> > > issue. Is drm_connector_cleanup (or the encoder variant) called twice?
> > Answering myself, yes it is. It's both the destroy call back and
> > called in unbind. We should just remove the one in the unbind then.
>
> Should I do this or leave it to you?

You started that discussion, so it's only fair that you do the patch :)

Maxime

--dayinannzkrhuxa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfjCxQAKCRDj7w1vZxhR
xfLKAP9uC6OKBMcKNc6CYIMqeNfUrMweif6tfqGtZf8vZlp9lAD/RYm1F844WPIb
0gupK39Mzpkm6H5yDih2P1r7Xx5T6QA=
=KJ4f
-----END PGP SIGNATURE-----

--dayinannzkrhuxa6--

--===============1022963491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1022963491==--
