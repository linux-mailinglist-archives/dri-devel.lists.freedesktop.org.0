Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9070C4C2F41
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 16:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CDD10E9AD;
	Thu, 24 Feb 2022 15:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91B910E9AD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 15:19:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 06C6B32009F8;
 Thu, 24 Feb 2022 10:19:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 24 Feb 2022 10:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Z5qZ1CnaOPJuRO4buv744YaM6Y4hvgZ5goSCIs
 l012c=; b=ZeghmTbGUncTUenwIZNrw8trrOuhZGzM1sW6mCKsrgaKY4WhzD6QM6
 89lb+jl7CYGszGL9Y+9H2toD6zwxy9sIEtQd1kKFyApkvru0wjmi0so7FTmn0CuI
 FQEj6Xpn4Zn/T3RfuxTUBQNYYa5LkQVacAgjV6ssfNyDl4EF4tYHZW8WZ8ZIOyr9
 3OxmhT8dOkm1rAvSQwE6b8tj7KrKZlm/Oay3Z6jnWsS7oB1z78nGDIDo6xpEut3K
 CnRzI/AYZX6G9RKALz3xSwFw3ohEajN2bOhuYXNEjPtfdvzrejBYYe13Lp6o6At+
 Z9MJ/PEaOJbPzZ+vHphU7fKPc0ckEHew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Z5qZ1CnaOPJuRO4bu
 v744YaM6Y4hvgZ5goSCIsl012c=; b=K+cNLPEmM6tipWbin/9r2ykEyu1pw99nU
 RiUNaQQjTFCaiEvXN9BqhBMSisj41RT0ekFBz06AGgjwAMe7k2ZTALEniHsjml88
 JeSzDUD0ADO4a9F7kFijcnDuG9Ij14bd/qWOxeL3lgdY1/yynQj/Lez06fRZ+ZHh
 Wh1co/KaGIurVY76isvtLtvQAPpTh4yh4IJkYWZAtXQhap/gluW2xI+0wIYub4bO
 cNqSpKYtnkCP5Conq4ehHKUibBy5mkqscWUlvIP2bLu2Cn8mBZee7sLd6yfjjDRH
 rOAW+Cg2t1822vSpT+5ops5QqKHp8p5m4QqVF8oiqcnLNM5KDl76g==
X-ME-Sender: <xms:6KEXYnqttXQVvCptrvvz56wah9wHywl9A5y-zqBeU39D0JQheH8uUw>
 <xme:6KEXYhqVpOsxDBhQ2NzPs0_XEWQaC_NtaICwF_1VW5o75tAl53SH0HHqemF-w60gf
 nBuSktjlcLwfwQBKsY>
X-ME-Received: <xmr:6KEXYkMwYSoWyfeT3BJBxHQryfxVkHSYEB_3j2vMzgs7e8kcwdDlCXpdiY_o9I35Wcsvlemf8YClxLaA-FQJyRKd-6YWqELa2YMzcbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledvgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6KEXYq4qZTk6Tkl17wKy2VDe6oWM9RaCdYj2RLeORm9FZQeq83HZsg>
 <xmx:6KEXYm5EF832OiKDTZJrsRiLfZywbTnJEsGLe5lK2v7WXY3debe_Mg>
 <xmx:6KEXYiiTsTRVVek4FHXLV4oGXvwiyeEalquufE-BY37dq8_pY8Q3Ag>
 <xmx:6aEXYsk1uheJ3YrmSlv85nJWEzVrUlkRp7CPt0W0n-B78KugT-ywyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Feb 2022 10:19:04 -0500 (EST)
Date: Thu, 24 Feb 2022 16:19:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/7] drm/bridge: Extend struct drm_bus_cfg with clock field
Message-ID: <20220224151902.4qdgdxdufvmhwezm@houat>
References: <20220219002844.362157-1-marex@denx.de>
 <20220219002844.362157-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gkjintdkuypnkj4h"
Content-Disposition: inline
In-Reply-To: <20220219002844.362157-4-marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gkjintdkuypnkj4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Feb 19, 2022 at 01:28:40AM +0100, Marek Vasut wrote:
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 1701c2128a5cb..32455cf28f0bc 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1077,6 +1077,11 @@ struct drm_bus_cfg {
>  	 * @flags: DRM_BUS_* flags used on this bus
>  	 */
>  	u32 flags;
> +
> +	/**
> +	 * @clock: Clock frequency in kHz used on this bus
> +	 */
> +	u32 clock;
>  };

This is fairly vague. You were mentioning DSI: is it the pixel clock?
The HS clock rate? With or without counting the lanes? What about the
burst mode: would it be the lane or pixel rate?

It would be just as confusing for HDMI: is it the the TMDS character
rate? The TMDS bit rate ? TMDS Clock rate?

Maxime

--gkjintdkuypnkj4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYheh5gAKCRDj7w1vZxhR
xceDAQDh0DMEez71pEaTYEUqMePmCIeno7FTsQ+x4Ak/ZcRZRgEAmE3f/5wfizUf
btqSGr2hG4wobkisOWk22HPIKrG+4A0=
=Yuro
-----END PGP SIGNATURE-----

--gkjintdkuypnkj4h--
