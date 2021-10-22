Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0B4375D3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 13:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129656ED10;
	Fri, 22 Oct 2021 11:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946DA6ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 11:04:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EA67D2B011AD;
 Fri, 22 Oct 2021 07:04:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 22 Oct 2021 07:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=R
 hOl0lHzC84L8O9/tU1HXPTdlO+gLkEg4xBzwJrEpBg=; b=dflJszuMTdoPPpLb4
 Z579y2cmGkicOcZ/eS7yznApNddspK5HtGFXSpxulv6CnlVA8lCmZtRvIhpVPJNf
 HH8Di/CFiib2rjJd8p8z7OV/pXDiDJyn5I5IYVKEHiSFEcJw/UIOH9q/lQ/H8zm5
 dj+Sg7mAPub5CgtqCq2n3FGiVp4lN/hqm9T/jlk39GwS4JgrX2Tiu6kD/c77qxV4
 ePZrriWPZwNNOWmet1QuFbehNazF6r+3vtpiwqxnZf5iYV/GpRxVDfXWlC7y8jTQ
 vDsM4lRVCzE5sjEBazXwWYWWPaoVnJxAc+S5XBTxIoMjFFngf65H9/zg438NrBKy
 NxzjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RhOl0lHzC84L8O9/tU1HXPTdlO+gLkEg4xBzwJrEp
 Bg=; b=ls4YL/Ol4nHeZ3DkYjh/uKQCRr+UbZOOjsz5NMHTKoxTRZRj6WIMCb5JD
 R5/kdV9w6C8dZHDJpMUE+6ai2KBxsZUSWVM4wUCu6JSHqCmqiS9Q+RWGm2wu04NR
 VEUtyGvK5v3LUOjUepqmmXFU0thC6QZ2qJXfDoJJInN8Klg4l+YYLbiahOrvL9N7
 ItsNaiNgTw+GmBhyF2cxmz3Bwv3ap+ZY8bzCAyVT1z3zC4wb3n8AhOw4srdNM3Wq
 mR5Ixw7Ou5bk5S0MhJnKzj7Cp7Hr2xjS9s1xRnINM4WHO58pHt0yNx0QHNxxLeEB
 RXhyHFNsouvOKaBEvr3MKcLqvEDgA==
X-ME-Sender: <xms:nppyYQmNDYW4bn_-hLWLGE-rTZ37vX_QKiQddXuU-mWpio8YvyPE3A>
 <xme:nppyYf0-ve1iGvS8z7iZInZpnVbNZBgis3yYkjVJQK0nJqOhHpF8tnUPNCSuV3LSd
 WosdgDTbFMrY8mS-Dc>
X-ME-Received: <xmr:nppyYep3x66XpauqkKc6YtOL1iGQYQ4fwpkhAm5nwEVsmrxRybZ1NFCy_qPgSuQXV3YVD2nd1kwgsEv5QFhcXandg0UXzANRkQ2Zf4Aj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvkedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nppyYcm2RV0zZBB41CDiG3P_hDo6-hkI6wbuWVOLcVJxqSuh3seM7g>
 <xmx:nppyYe0td2T0Mevwdw2FvhzroM9USM_iZbnv4j6uBu0y6yMUBER9BQ>
 <xmx:nppyYTsYZDcyd1MonCzMlae3b3TLwBUFXdHt4VryGQXNMyubGKn8DA>
 <xmx:oJpyYYWQe0wBt92zV1VspGP7hbk013hJniVu9YDMWfJXBQyeoSk5MFDRtAU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Oct 2021 07:03:57 -0400 (EDT)
Date: Fri, 22 Oct 2021 13:03:55 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 3/7] drm/bridge: Add
 drm_atomic_get_new_crtc_for_bridge() helper
Message-ID: <20211022110355.3q2yhlaygz4lgzhe@gilmour>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211020181901.2114645-4-sam@ravnborg.org>
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

Hi,

On Wed, Oct 20, 2021 at 08:18:57PM +0200, Sam Ravnborg wrote:
> drm_atomic_get_new_crtc_for_bridge() will be used by bridge
> drivers to provide easy access to the mode from the
> drm_bridge_funcs operations.
>=20
> The helper will be useful in the conversion to the atomic
> operations of struct drm_bridge_funcs.
>=20
> v2:
>   - Renamed to drm_atomic_get_new_crtc_for_bridge (Maxime)
>   - Use atomic_state, not bridge_State (Maxime)
>   - Drop WARN on crtc_state as it is a valid case (Maxime)
>   - Added small code snip to help readers
>   - Updated description, fixed kernel-doc and exported the symbol
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
>  drivers/gpu/drm/drm_atomic.c | 42 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  3 +++
>  2 files changed, 45 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ff1416cd609a..8b107194b157 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1134,6 +1134,48 @@ drm_atomic_get_new_bridge_state(struct drm_atomic_=
state *state,
>  }
>  EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> =20
> +/**
> + * drm_atomic_get_new_crtc_for_bridge - get new crtc_state for the bridge
> + * @state: state of the bridge
> + * @bridge: bridge object

I appreciate that the function name is fairly long already, but given
its name I'd expect it to return a drm_crtc, not drm_crtc_state.

All the other state related functions are named using the pattern
drm_atomic_get_(old|new)_$object_state.

Moreover, we already have a drm_atomic_get_new_connector_for_encoder
function that does return a drm_connector, so I think we should make it
consistent there and call it drm_atomic_get_new_crtc_state_for_bridge

Maxime
