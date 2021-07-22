Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103C3D1F29
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A9F6EDA1;
	Thu, 22 Jul 2021 07:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE246EDA1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:42:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9D2505816CC;
 Thu, 22 Jul 2021 03:42:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 22 Jul 2021 03:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=v
 uZq0a+OMUd1soOo7W326W3NzchpzZAcVaI98OVEzX4=; b=M0BwsKI4vEVw61j0P
 /uaUaAiaXeFbJqbWJHfME/eiiSqnn7uE2IDjsf1Ba/GTHNZz+GVl99atm5/pZMqI
 8CFfw2ImdxQLBjDpyHt6QnofiBfiqWull5kXGFYsgzwENKPdAJFXRLYiWHLo2vFN
 Dk9Ma15UmZ0b+Fev5/9rLDA+XyhSllylkIV39SP1wRELRcoT/Y109z+bFvup+yX8
 rWM+76EoXklYxz9p7QTG+S6Zo7bKY2d0FxS37NAV66tpbMOX5DAE2+EmrRMqwK0L
 AfVuUZqQVrcWjcN/RHV419Lu8LUx7JmHJk2UgiEilSHV70qq2VW+4ooTUJWHz7pv
 LmqZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=vuZq0a+OMUd1soOo7W326W3NzchpzZAcVaI98OVEz
 X4=; b=MU7IrcR4M6oy+hGVA1r2Amoey7sa6stOWm1ksXXkUqASK8exmA8Hzs+qz
 eQBPY5Z/nYLELR9hhNfXEjR8qoPkVffJb3a39V65wi/SYL8fnh2FiNErgWxdVVAI
 CeUhtAUgxmvS9cVV9j79x4nbBoeZTzea1r2/A8ygDf/RkETBni/TsUTk8AIHobAM
 U9UHNns6jTW/d4PcpfH6CB+eSWfoPgrNQZE6QERuv2mbeN5wiA82APmveiFnOWSa
 /ROGn+VtRb7mGpGByJIlivTbltlHV585B6Snnp+8QZHsB0+9QfN75RoZ1Ie+y5DG
 lvimLEqP75Xg+zetacosmv1aan+Tg==
X-ME-Sender: <xms:SSH5YGx5ED3PKrYSkNiZtG5_53bbsm9emsGEUJ8txX6YZ6IbqlcYJg>
 <xme:SSH5YCTXoKzBXwb_Toqku4OSGENVS8CAYBxFEJ7SH-BBkNraXXXtdPe2vX97-47S1
 N-tT6lgr3nUoJGUa9c>
X-ME-Received: <xmr:SSH5YIVKVoZW9dIWVeh6368kdwoPGlgtFfIZ5gv_gUo_71wvRKUqp_6OL-pxFDzZgw5BuAh9PWU-AmrJ53PdR5poOER61mnE2GwP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevheeuheekkefftdduveevheetfffhudeghfevkeegkeehiefggfdvkeeh
 heeiheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:SSH5YMikMAcMp78Z6mDpchr-CH2b4be7U1a9ekRjW0KOdZYGVSGDEw>
 <xmx:SSH5YICdZVgBPDgvWWtU99izt9lPu2UACPRVn7LgjA41uHHirO8pHw>
 <xmx:SSH5YNKrq6GU8YXrpM9T-CK0iY0a3acObkNZ8vHDrIK0TCmCiyf6SQ>
 <xmx:TSH5YCzlZaI9-DMTqHMyZgb2ZNYgiUzFYqkQK2gquOviG5dsQROypA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:42:01 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:42:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/7] drm/bridge: lontium-lt9611: Use atomic variants
 of drm_bridge_funcs
Message-ID: <20210722074200.3pdgt63vmex76oug@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-5-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, linux-mediatek@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 22, 2021 at 08:22:43AM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
>=20
> Use of mode_set is deprecated - merge the functionality with
> atomic_enable()
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 69 ++++++++++---------------
>  1 file changed, 27 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index 29b1ce2140ab..dfa7baefe2ab 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -700,9 +700,17 @@ lt9611_connector_mode_valid(struct drm_connector *co=
nnector,
>  }
> =20
>  /* bridge funcs */
> -static void lt9611_bridge_enable(struct drm_bridge *bridge)
> +static void lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
>  {
>  	struct lt9611 *lt9611 =3D bridge_to_lt9611(bridge);
> +	const struct drm_display_mode *mode;
> +	const struct drm_crtc_state *crtc_state;
> +	struct hdmi_avi_infoframe avi_frame;
> +	int ret;
> +
> +	crtc_state =3D drm_bridge_new_crtc_state(bridge, old_bridge_state);
> +	mode =3D &crtc_state->mode;

So, yeah, it looks like you can't make the assumption that crtc_state is
going to be valid here.

I'm not entirely clear on how bridge states are allocated, but it looks
to me that they are through drm_atomic_add_encoder_bridges, which is
called for all the affected connectors in a commit here:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_h=
elper.c#L744

Then, the atomic_enable call is made through
drm_atomic_bridge_chain_enable(), which is called in
drm_atomic_helper_commit_modeset_enables only if the CRTC is active and
needs a modeset.

I guess this means that we won't have a null pointer for crtc_state
there, but wouldn't that cause some issues? I can imagine a property
like the bpc count or output format where it wouldn't imply a modeset
but would definitely affect the bridges in the chain?

Maxime
