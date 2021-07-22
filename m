Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A213D1F07
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA576EB4A;
	Thu, 22 Jul 2021 07:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60756EB4A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:30:43 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B8A05817D6;
 Thu, 22 Jul 2021 03:30:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Jul 2021 03:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=l
 CzL6nCCz0DthGl/v5TT/y/xsq6qMkIvU1yNWqN9UT8=; b=4yVO7rQm9SL76ipba
 lbxmpxSrfdM2+7FW/Mk+OeKNfq9WMcKUlA7gafxgDVy0j3rnaQd2nWjyDe/fDA6S
 coX6igM5atY0kT9Dtlbe8Ezl0weyMDt9rz+12V1hN73FdU364txNxPa/KYOwRjH+
 cdRv3e5SombrtX9qXiUiMPBIUleCxumEWe5xd6sG7A0ieohqVJDFafiWTVt2dBsy
 IUDI7eC+as7M5c0mDBIhrtAnFBodAPd7LyR0P2k+8Ut4Gwh/v7ZMKabSAAyFKoM1
 Jbg1KeDlQBASrpWYfIgZR0UMFR8Cg/r/RJlGpA/+eZ629nViHlzrm0jDHD8iipYb
 GDXkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=lCzL6nCCz0DthGl/v5TT/y/xsq6qMkIvU1yNWqN9U
 T8=; b=o1sBs1b6ePbStupPEf92sWv0MAPcwMtX9nJL7AbO66rJ4sfaCn5SS0txA
 CdpTIpIk+bvveCibjuRFDPlHMnQdj+wfmquCgzi/hART2URUeXdhrDiummEChFe1
 g3HNuwhNXdnJk1u09Oah72kYx6r/vL28ols6Yv4v1uzQ4nFF3fPTmepo37Zy3VtU
 4Lndk8nJbiBQzxCy6/LS21yefGVGYkp1O1kiFblO0Ihu/udg9GgpwqUSYHiRqKr5
 Yq5Ja3NHCzlRhHjePAvdzFi7X0JJompFasg5LLhuSXYL1YPgiADS/zhOOef3st4F
 uvSNwonyhxTE9SnFzLo+OHJMoff9A==
X-ME-Sender: <xms:nx75YHbNVEuBpf8ip_u7UOjX-HmdsbFSIuZFFT1Wemq2yn6wwc63yg>
 <xme:nx75YGabcUhY2heUvUkDH7RUsFHQwV0XgGJT4WxBqiBhwcZEdOfe9ue4DrlKRXlUA
 eu9h17HNB6NjZDFOro>
X-ME-Received: <xmr:nx75YJ8mZZdTsIt90tFsTx_6PLhLggF6TYSKwWXxmyP8u4CoSQcRKLdt9TsiFs6pWkbT7QOEcik67N8n0pTwn-2VXMaASsC_T9_H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nx75YNq3OxiN4rWZ4YzXlYBDw5hHbNO4GovPRKLbZq62JO_Tv6YQaw>
 <xmx:nx75YCro1r3toQqolGWoFzD_pqag_Dxy6qXwI9Fc6hYDWx1xNyqbYg>
 <xmx:nx75YDQytdxfl_caUbo88uNS7QQF5TFGpkJ6jMogiuhTKHJDGvNlNg>
 <xmx:ox75YAZ1ustgda2jgzIdu1RPrNYMkosB3l01FZEEosT72MjbFylhmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:30:39 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:30:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 3/7] drm/bridge: Add drm_bridge_new_crtc_state() helper
Message-ID: <20210722073038.2heirjbk5md4oxip@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-4-sam@ravnborg.org>
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

On Thu, Jul 22, 2021 at 08:22:42AM +0200, Sam Ravnborg wrote:
> drm_bridge_new_crtc_state() will be used by bridge drivers to provide
> easy access to the mode from the drm_bridge_funcs operations.
>=20
> The helper will be useful in the atomic operations of
> struct drm_bridge_funcs.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  3 +++
>  2 files changed, 37 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index a8bbb021684b..93d513078e9a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1133,6 +1133,40 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_=
state *state,
>  }
>  EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> =20
> +/**
> + * drm_bridge_new_crtc_state - get crtc_state for the bridge
> + * @bridge: bridge object
> + * @old_bridge_state: state of the bridge
> + *
> + * This function returns the &struct drm_crtc_state for the given bridge=
/state,
> + * or NULL if no crtc_state could be looked up. In case no crtc_state th=
en this is
> + * logged using WARN as the crtc_state is always expected to be present.
> + * This function is often used in the &struct drm_bridge_funcs operation=
s.
> + */
> +const struct drm_crtc_state *
> +drm_bridge_new_crtc_state(struct drm_bridge *bridge,

Shouldn't we call this drm_atomic_bridge_get_new_crtc_state for consistency?

> +			  struct drm_bridge_state *old_bridge_state)

It seems odd to me to name it old_bridge_state, I guess it would make
more sense to pass in the new bridge state?

> +{
> +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> +	const struct drm_connector_state *conn_state;
> +	const struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->e=
ncoder);
> +	if (WARN_ON(!connector))
> +		return NULL;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state || !conn_state->crtc))
> +		return NULL;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return NULL;
> +
> +	return crtc_state;

You don't even seem to use the bridge state itself, so maybe we just
need to pass the drm_atomic_state? And thus we end up with something
like drm_atomic_get_new_connector_for_encoder, so maybe we should just
call it drm_atomic_get_new_crtc_for_bridge?

Also, can we end up with a commit that affects the bridge state but not
the crtc state (like a connector property change)? In such a case
drm_atomic_get_new_crtc_state would return NULL.

I'm not sure if it's a big deal or not, but we should make it clear in
the documentation and remove the WARN_ON.

Maxime
