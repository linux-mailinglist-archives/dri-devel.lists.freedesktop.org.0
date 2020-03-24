Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B5192259
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45FD89B06;
	Wed, 25 Mar 2020 08:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C2789B20
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 15:36:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6EEF388B;
 Tue, 24 Mar 2020 11:36:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 24 Mar 2020 11:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ey6ezPmPMaFgVvNxPoggC0JkyMH
 IxDXhR6IcAX+U6aA=; b=fJ31mfSc7adxHOZK4W+MnOgd9hIgs5ks1T/cTcU5+4Y
 Et3OI2qzFtjXZclKPQ/YbDrqfAJhz9McMFo5uLbFTTVDg346dhXcPuQfqeOKYfC8
 xNX5PnLrbjlAAqfpDqaaHqwUcNJKUOccrdbq8xAfyeceQ49bafxI069u71znWNC0
 /jCN3FCFjDic/etAR4RCPxL2MRuKoH8nJTBHONNyn5BUdlDymZTJ+C2gvbSxIKUI
 qPzKC7C+tfv13S7t/lEkKZk4mHHQrK+Xz6cmqOHJERVnvrnuv04vLhWO7XsnTEEz
 ZoTzNhgllnZcVKdlRLO1KrnsKw5j32dJ3KeHTaa27rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ey6ezP
 mPMaFgVvNxPoggC0JkyMHIxDXhR6IcAX+U6aA=; b=ovIGcrrCcsEyK2ppIfv5Uq
 jik3pR9HU2lWBXmbmB1W9bXT/sZdqxIMiRuESBfXNWotpv8p2Ek6xuLhdxZf/+Nv
 Evm6wcHEr1Eaa+X9DJriaJb6wygXstKQG929k+atlO6qKlsOVFqMkyt9Q5xbTkYi
 MGCOBZrTXdV4QqmREXZ12JvjMOH6uf9ZtppuDQfsl7iv+KiCBrEr1thiVsuOrm4Y
 2NTDTjX5ODxiO0hsLLMNrx6+3skk9bB1PERr07atUGtrIk6XzdRI7Ju2rHoVdkPc
 tCOjzJ8yhj/plcRB4NZl5P4AqCorymOMplmzbvVPJyLErjd6yffM0EdwDfJ0njng
 ==
X-ME-Sender: <xms:6ih6XtXVSOq43UO0FDOpgLJ18ttTtEIsM7QiB_QaILv4xodIpZBbIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6ih6Xld0JyIQmOZpiwYz5EoM49Rx27fWfUcjbq0tXzW0Xhl5cXdQCw>
 <xmx:6ih6XowSOmMeHITMFY9Dc62vLfOnwn4yygSHFRUC2rwjl7XXPVUYuQ>
 <xmx:6ih6XoE1xQEBpYtGSZmlNG6Z0eE72hPN6OYQBHnHMXjpOF9GyHK5qA>
 <xmx:7Sh6Xuz-u5DZ_tiu-AknL7VKYfMOUAVjvE67zNPWHtV7Lxw4Xj5QDg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CCA2328005E;
 Tue, 24 Mar 2020 11:36:10 -0400 (EDT)
Date: Tue, 24 Mar 2020 16:36:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v4 4/4] RFC: drm/sun4i: Process alpha channel of most
 bottom layer
Message-ID: <20200324153608.6whowf2b77k75uhj@gilmour.lan>
References: <.> <20200302103138.17916-1-r.stratiienko@gmail.com>
 <20200302103138.17916-5-r.stratiienko@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200302103138.17916-5-r.stratiienko@gmail.com>
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0326260654=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0326260654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="adiczxgoolyaz7j5"
Content-Disposition: inline


--adiczxgoolyaz7j5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2020 at 12:31:38PM +0200, Roman Stratiienko wrote:
> Allwinner display engine blender consists of 3 pipelined blending units.
>
> PIPE0->\
>         BLD0-\
> PIPE1->/      BLD1-\
> PIPE2->------/      BLD2->OUT
> PIPE3->------------/
>
> This pipeline produces incorrect composition if PIPE0 buffer has alpha.

Why? What happens in that case?

> Correct solution is to add one more blending step and mix PIPE0 with
> background, but it is not supported by the hardware.
>
> Use premultiplied alpha buffer of PIPE0 overlay channel as is.
> In this case we got same effect as mixing PIPE0 with black background.
>
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
>
> ---
>
> v4:
> - Initial version, depends on other unmerged patches in the patchset.
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index dd6145f80c36..d94f4d8b9128 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -106,7 +106,7 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
>  	regmap_update_bits(mixer->engine.regs,
>  			   SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
>  			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> -			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos));
> +			   zpos ? SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 0);

Can you really use the zpos here? What happens if the zpos doesn't
match the pipe?

Maxime

--adiczxgoolyaz7j5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnoo6AAKCRDj7w1vZxhR
xQ3qAQDi1pvffHHMR3iuY4S1QReEhrb2tXea5b4qGXQRNlFXLgEAoSrDjZzD7BFx
uqqs3+pIlvIeZFNloU3TyvpOGtTEowo=
=WfNJ
-----END PGP SIGNATURE-----

--adiczxgoolyaz7j5--

--===============0326260654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0326260654==--
