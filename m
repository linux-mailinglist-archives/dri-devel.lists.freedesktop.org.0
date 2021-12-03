Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F931467534
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8F36EDD6;
	Fri,  3 Dec 2021 10:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EE66EDD6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:38:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EE045801D1;
 Fri,  3 Dec 2021 05:38:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Dec 2021 05:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=rRzHlzSBjqtyvYL/4h3PntMy3Xe
 iCXlXwulLeCZvjIg=; b=gQYQYE8QFU+UUv9scGZxYeG4JesTX3bM6SNqyxpFTNK
 1pOrY8rgUECiIv7P6qyDRvRbaIl3vs+aleNXq8FwzXCYQ8zXw7hYzlkJsaml8pcU
 XptKF2KsXn0zrGk2FB/Ldj/AebVg2bjiscSm2MKF4ulG3lOMrbUp8AEezH1TzhDN
 6CzrhR5IlatxOey6Ah54D+9FAN1WWG4yo8H710+qWQH47fKHhLPvZLzlkH6UKZe7
 SUGClhBfWutx8ktQG4cuOeSrmqzsCx1p8m06EQA92YLYWbRldd1mwQTkaGszgeb9
 j6D/c0jEu/psySBk/beATs+QXfXeKTyyns9qZl+4GDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rRzHlz
 SBjqtyvYL/4h3PntMy3XeiCXlXwulLeCZvjIg=; b=bCyyyMx1zl9iVR/0IbA0U2
 wFGAyON+0nEtRr2kWfvA7qSMPf5tHJF6ij8oWVbpYGHLw4NGJuycn6bqVg4exBHX
 FpfCnwu3sz4iw948r9MRRG0oitQL/861MbixnDw9vTpSJiILRFH4ygh0KDJ516Bw
 OBEuPfjyGG7SJRuQZ787pPdsk2arwR55p8VDZtcvZVSVS16w4AOvOohm10GHWyO8
 FakMo4qvVXUNnLWssMZe8RndO9idK26BQyQ0lwfj0Ui5Y+HT8fq4cAbK2a+5Sh2h
 Ez9gb/f/jHLcQof6xKLs/YDyyXssFfLGVLh4+jf1fUAglJNXdI73T1CHc0ltJebw
 ==
X-ME-Sender: <xms:s_OpYUOzW24KbMmFPqRquZ5-wjMmdht_zQQgTs08vVAhTqa1R5--vQ>
 <xme:s_OpYa-h0wNjj7lafKFIo5WX7EDlLLtlkwRaEX_RTSRrImw_4I62fCPIMSH1aWmHi
 XYuXPtBpGdKXPqVD4g>
X-ME-Received: <xmr:s_OpYbRpE4upBA0lBXt7uXHtD0PSXXsGlsjIyHvwEr4wCW8DpKBNejk3ofN8eYI62j8w0dhJJBEBSPZGM1WT7He9LhnquLun9lib_AdOn4IXIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:s_OpYcslD3fKKJ45jXuwb1ujP6zsML88V3oSwXzCLQJBfeMy33Dlgw>
 <xmx:s_OpYcc9z2qiObBHhM9RYaUFkRLr013_9CAaKQ1wgYRToKlOiQKMUQ>
 <xmx:s_OpYQ20GLJJznWF20ZXPQFmE0Nj64X-o7meYDXwwMLPQ9RDLGZM2Q>
 <xmx:s_OpYQ3kJx4fvTmGwUQVoCharSkuOvBXNqebwDCWjRjIM44jpcOZEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:38:42 -0500 (EST)
Date: Fri, 3 Dec 2021 11:38:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v7 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <20211203103841.vkl3sjsbaohsviou@houat>
References: <20211025093418.20545-1-kevin3.tang@gmail.com>
 <20211025093418.20545-7-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ynqok2avqp6f7jvf"
Content-Disposition: inline
In-Reply-To: <20211025093418.20545-7-kevin3.tang@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 pony1.wu@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, zhang.lyra@gmail.com,
 orsonzhai@gmail.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ynqok2avqp6f7jvf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 05:34:18PM +0800, Kevin Tang wrote:
> @@ -618,9 +619,25 @@ static void sprd_crtc_mode_set_nofb(struct drm_crtc =
*crtc)
>  {
>  	struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
>  	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	struct drm_encoder *encoder;
> +	struct mipi_dsi_device *slave;
> +	struct sprd_dsi *dsi;
> =20
>  	drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> =20
> +	drm_for_each_encoder(encoder, crtc->dev) {
> +		if (encoder->crtc !=3D crtc)
> +			continue;

encoder->crtc is deprecated. You should be using
encoder->drm_for_each_encoder_mask, using the encoder_mask in
encoder->drm_crtc_state.

> +static int sprd_dsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sprd_dsi *dsi;
> +
> +	dsi =3D devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, dsi);
> +
> +	dsi->host.ops =3D &sprd_dsi_host_ops;
> +	dsi->host.dev =3D dev;
> +	mipi_dsi_host_register(&dsi->host);
> +
> +	return component_add(&pdev->dev, &dsi_component_ops);

component_add must be run in the mipi_dsi_host.attach hook.

Maxime

--ynqok2avqp6f7jvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYanzsQAKCRDj7w1vZxhR
xRe2AP99Mp7SYAZGjucY4sRI7q9PWgtA8VNJMZbPDvgid6+oNAEA4WA/RrSZs55v
1DqTNDjwtGIOSQy/IsSXdpZjjZq/ngY=
=++lK
-----END PGP SIGNATURE-----

--ynqok2avqp6f7jvf--
