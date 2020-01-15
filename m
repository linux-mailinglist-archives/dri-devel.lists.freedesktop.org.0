Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB413BB1E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4A36E890;
	Wed, 15 Jan 2020 08:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF336E890
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 08:32:36 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EDB62187F;
 Wed, 15 Jan 2020 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579077156;
 bh=AJyv1HZR4EHgQ2ATWhJRGP+gmuAx89Jzdjy+Kx5JWto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3T1oBaqDC6tntUQMYVvrQOVvm4PoNHLCcm6dT2c4bq9ngC9hqWnNpR0Djn//d779
 ZINmrLjH4ZlDVmIA+PN/HR6pE4dCNhE0xcnADbgKkQzaq334ms0vj9p66uDVhBNl5y
 f1Jn3Lo8LiQ2vnlPTcg2SpvCvjbUGXfPcg2w4THI=
Date: Wed, 15 Jan 2020 09:32:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH 2/2] drm: sun4i: hdmi: Add support for sun4i HDMI encoder
 audio
Message-ID: <20200115083233.7wedmnkj4ju4eccv@gilmour.lan>
References: <20200110141140.28527-1-stefan@olimex.com>
 <20200110141140.28527-3-stefan@olimex.com>
 <20200110162631.wbufz5h7nqfgd6am@gilmour.lan>
 <f4ad41ce-e3d0-33e4-1e85-d23e557b484d@olimex.com>
MIME-Version: 1.0
In-Reply-To: <f4ad41ce-e3d0-33e4-1e85-d23e557b484d@olimex.com>
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
 Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1626890868=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1626890868==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7lkei534qhur3fvp"
Content-Disposition: inline


--7lkei534qhur3fvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

On Tue, Jan 14, 2020 at 11:04:55AM +0200, Stefan Mavrodiev wrote:
> On 1/10/20 6:26 PM, Maxime Ripard wrote:
> > Hi,
> >
> > On Fri, Jan 10, 2020 at 04:11:40PM +0200, Stefan Mavrodiev wrote:
> > > Add HDMI audio support for the sun4i-hdmi encoder, used on
> > > the older Allwinner chips - A10, A20, A31.
> > >
> > > Most of the code is based on the BSP implementation. In it
> > > dditional formats are supported (S20_3LE and S24_LE), however
> > > there where some problems with them and only S16_LE is left.
> > >
> > > Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> > > ---
> > >   drivers/gpu/drm/sun4i/Kconfig            |   1 +
> > >   drivers/gpu/drm/sun4i/Makefile           |   1 +
> > >   drivers/gpu/drm/sun4i/sun4i_hdmi.h       |  30 ++
> > >   drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c | 375 +++++++++++++++++++++++
> > >   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c   |   4 +
> > >   5 files changed, 411 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> > > index 37e90e42943f..192b732b10cd 100644
> > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > @@ -19,6 +19,7 @@ if DRM_SUN4I
> > >   config DRM_SUN4I_HDMI
> > >          tristate "Allwinner A10 HDMI Controller Support"
> > >          default DRM_SUN4I
> > > +       select SND_PCM_ELD
> > >          help
> > >   	  Choose this option if you have an Allwinner SoC with an HDMI
> > >   	  controller.
> > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
> > > index 0d04f2447b01..e2d82b451c36 100644
> > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > @@ -5,6 +5,7 @@ sun4i-frontend-y		+= sun4i_frontend.o
> > >   sun4i-drm-y			+= sun4i_drv.o
> > >   sun4i-drm-y			+= sun4i_framebuffer.o
> > >
> > > +sun4i-drm-hdmi-y		+= sun4i_hdmi_audio.o
> > >   sun4i-drm-hdmi-y		+= sun4i_hdmi_ddc_clk.o
> > >   sun4i-drm-hdmi-y		+= sun4i_hdmi_enc.o
> > >   sun4i-drm-hdmi-y		+= sun4i_hdmi_i2c.o
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> > > index 7ad3f06c127e..456964e681b0 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> > > @@ -42,7 +42,32 @@
> > >   #define SUN4I_HDMI_VID_TIMING_POL_VSYNC		BIT(1)
> > >   #define SUN4I_HDMI_VID_TIMING_POL_HSYNC		BIT(0)
> > >
> > > +#define SUN4I_HDMI_AUDIO_CTRL_REG	0x040
> > > +#define SUN4I_HDMI_AUDIO_CTRL_ENABLE		BIT(31)
> > > +#define SUN4I_HDMI_AUDIO_CTRL_RESET		BIT(30)
> > > +
> > > +#define SUN4I_HDMI_AUDIO_FMT_REG	0x048
> > > +#define SUN4I_HDMI_AUDIO_FMT_SRC		BIT(31)
> > > +#define SUN4I_HDMI_AUDIO_FMT_LAYOUT		BIT(3)
> > > +#define SUN4I_HDMI_AUDIO_FMT_CH_CFG(n)		(n - 1)
> > There's the issue multiple times in the headers, but you should wrap n
> > in parentheses to make sure we have no issue with precedence when
> > calling the macro.
> >
> > > +int sun4i_hdmi_audio_create(struct sun4i_hdmi *hdmi)
> > > +{
> > > +	struct snd_soc_card *card = &sun4i_hdmi_audio_card;
> > > +	struct snd_soc_dai_link_component *comp;
> > > +	struct snd_soc_dai_link *link;
> > > +	int ret;
> > > +
> > > +	ret = devm_snd_dmaengine_pcm_register(hdmi->dev,
> > > +					      &sun4i_hdmi_audio_pcm_config, 0);
> > > +	if (ret) {
> > > +		DRM_ERROR("Could not register PCM\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = devm_snd_soc_register_component(hdmi->dev,
> > > +					      &sun4i_hdmi_audio_component,
> > > +					      &sun4i_hdmi_audio_dai, 1);
> > > +	if (ret) {
> > > +		DRM_ERROR("Could not register DAI\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	link = devm_kzalloc(hdmi->dev, sizeof(*link), GFP_KERNEL);
> > > +	if (!link)
> > > +		return -ENOMEM;
> > > +
> > > +	comp = devm_kzalloc(hdmi->dev, sizeof(*comp) * 3, GFP_KERNEL);
> > > +	if (!comp)
> > > +		return -ENOMEM;
> > > +
> > > +	link->cpus = &comp[0];
> > > +	link->codecs = &comp[1];
> > > +	link->platforms = &comp[2];
> > > +
> > > +	link->num_cpus = 1;
> > > +	link->num_codecs = 1;
> > > +	link->num_platforms = 1;
> > > +
> > > +	link->playback_only = 1;
> > > +
> > > +	link->name = "SUN4I-HDMI";
> > > +	link->stream_name = "SUN4I-HDMI PCM";
> > > +
> > > +	link->codecs->name = dev_name(hdmi->dev);
> > > +	link->codecs->dai_name	= sun4i_hdmi_audio_dai.name;
> > > +
> > > +	link->cpus->dai_name = dev_name(hdmi->dev);
> > > +
> > > +	link->platforms->name = dev_name(hdmi->dev);
> > > +
> > > +	link->dai_fmt = SND_SOC_DAIFMT_I2S;
> > > +
> > > +	card->dai_link = link;
> > > +	card->num_links = 1;
> > > +	card->dev = hdmi->dev;
> > > +
> > > +	snd_soc_card_set_drvdata(card, hdmi);
> > > +	return devm_snd_soc_register_card(hdmi->dev, card);
> >
> > Out of curiosity, did you try to remove the module with that patch
> > applied? IIRC, these functions will overwrite the device drvdata, and
> > we will try to access them in unbind / remove.
>
> Actually I did not. Just tried that and you're right. The module
> crashes at the unbind call.  I use sun4i_hdmi struct only for
> regmap. Maybe create separate private structure and copy only
> regmap?

I think the issue is that:

  - In bind, we first call dev_set_drvdata on the bound device, with a
    pointer to struct sun4i_hdmi as the value. The driver_data field
    in struct device is now a pointer to our instance of struct
    sun4i_hdmi.

  - In audio create, you then call snd_soc_card_set_drvdata with a
    pointer to struct sun4i_hdmi as the value. The drvdata field in
    the struct snd_soc_card is now a pointer to our instance of struct
    sun4i_hdmi (so far so good).

  - Then you call (devm_)snd_soc_register_card. One of the thing that
    it will do is call drv_set_drvdata on the card->dev device,
    setting it to our pointer to the struct snd_soc_card we provided.
    However, since you set card->dev to the same device than the one
    initially bound, this means that you just overwrote the struct
    sun4i_hdmi pointer with a pointer to struct snd_soc_card.

  - The driver will operate properly, since we never really use the
    driver_data field, in the HDMI driver, except when...

  - At unbind, you retrieve the driver_data field, expecting a struct
    sun4i_hdmi pointer, except you have a pointer to struct
    snd_soc_card, and everything explodes.

I think the way to work around that would be to create a new
(platform_)device for the HDMI audio component, so that ASoC can work
on that device instead.

This seems to be what dw-hdmi is doing here:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c#L2812

(Except that they are also using platform_data, since they have
multiple drivers, we wouldn't, so we can just lookup sun4i_hdmi using
the parent's device driver_data).

> > > +}
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > index a7c4654445c7..79ecd89fb705 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > > @@ -114,6 +114,9 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
> > >   		val |= SUN4I_HDMI_VID_CTRL_HDMI_MODE;
> > >
> > >   	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> > > +
> > > +	if (hdmi->hdmi_audio && sun4i_hdmi_audio_create(hdmi))
> > > +		DRM_ERROR("Couldn't create the HDMI audio adapter\n");
> >
> > So you create the audio card each time the display is enabled? I guess
> > this is to deal with the hotplug?
>
> Yes. See below.
>
> > I'm not sure this is the right thing to do. If I remember well, the
> > ELD are here precisely to let userspace know that the display is
> > plugged (and audio-capable) or not.
> >
> > Also, you don't remove that card in the disable, which mean that if
> > you end up in a situation where you would enable the display, disable
> > it and then enable it again, you have two audio cards now.
>
> There is issue with the hotplug. When inserting the cable, the event
> is detected and the hdmi encoder is enabled. Thus the card is
> created. However further removal and insertions are not
> detected.

I guess we would need to fix that then?

> This is why I don't remove the card.
>
> Also I count on devm_snd_soc_register_card() to release the card.

I think you should really create the card all the time, and just
update the ELD to let the userspace know when something has been
created.

And yeah, we should have a working hotplug, but that's a separate
story :)

Maxime

--7lkei534qhur3fvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXh7OIQAKCRDj7w1vZxhR
xSGNAQCNXFtKsLB1nNmulxiyZXc/7/SfbpDPB/OKbkP52GqFbQEA63XlCs381oP3
sIQOwaZU0eGpZ8IU+Sse2PFWS9FNTgE=
=hGfC
-----END PGP SIGNATURE-----

--7lkei534qhur3fvp--

--===============1626890868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1626890868==--
