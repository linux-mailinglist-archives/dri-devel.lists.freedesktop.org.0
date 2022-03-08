Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6C4D1613
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF88F10E60E;
	Tue,  8 Mar 2022 11:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773910E5F2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:21:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BCDDE3201C39;
 Tue,  8 Mar 2022 06:21:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 06:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=5HbQVSoZfC2g8i
 mgJywROtbxYE9kB3P5KRuBBNgtLgE=; b=Lj2UnHqYkOy7ZqTZG5bYNVgZcQ0NK8
 kZhPjus7CqWL3oMp5yuSydfpfFZLskkFcVVVEq5KYJhKqPZJ2uSMrun+klFwAVN8
 3PBRGvMTjx6nme+MIcdDvkLV8QIKQd4YJqd9W8yfSQl6ZmpuzDxqxd3WP+lYvoaY
 5cDnt5qIWOFV7MWfiqkw3HunSnHN/Am6TlGWyRP6MHvgeae+45ffaFx5RBvkBfUf
 SBQAxgsC098v6RhOGgvt97+zZfBF67CUpKf8wBOc1CdJcEHFeGJz+1MBHKTDi6qr
 7lmVd78zPVr36trw5m1EFF0RrXtxDSSR5Q1xQzBJihc0aUJOT3/Swq4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=5HbQVSoZfC2g8imgJywROtbxYE9kB3P5KRuBBNgtL
 gE=; b=AKmIQpRxC/zCPzHN30ohHnfI4N4wDIKaKY4OqRwS5hUBV4/Z6MWg0ZJ22
 /BcZ1FXwxfbjaRBGkSA9ZA5U++akE7rpYKdrGayjBIKdAKDUDF50woXL6UCUPlKQ
 JX5m/Ear4QdGnIJZ9jnm26ARkPQrdqJmFjacy2AuJJuqsFoUrNUz42qHPMb6yOth
 Yh66QCFHrjlx2+fEgfE/RmCzpfVRUtDKc2x5fo5dlDbnnP0SIRSQ3IGpVnWlTA13
 sGwY6Yh/SFPSTgT4G2oYTzUhps6N/lPc505gOvx2eQgiOoitkbYmdNkFKxVu91Fg
 nrFcmbEfqMl9iuHPahlYqej1hR1Og==
X-ME-Sender: <xms:MTwnYn1_nizn82316zOG2g7XMz94dmFNHw4hsEtsNk44uv_UeMzwIg>
 <xme:MTwnYmGyOJu2qwsseirNiNWOF94u1uDt9sS1IMn1mOmVwOi1Tx8WfOyj-u771lW8C
 _ptQYQ0tJTNq4Dcx3Q>
X-ME-Received: <xmr:MTwnYn5xM45vYw8VgPobqKqWA0rmCpnoxXoLpIhltQ_DuNVpZEnRBAJfsPmjOcMgy4078PqwB4AmpjoZrwZ0zbwv-R0AAO47Wl8ksuU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MTwnYs3y6ezLqAnCpnx2QqLuz666vpW5F0B6FbN_KcH_yjNMwFK3eA>
 <xmx:MTwnYqFTAOcGOcoYIlxlIz4YNbl9Ha-79kk3re95ZuYrGag8aNY_rw>
 <xmx:MTwnYt_dmN1Gn0R9rDFbqI_EyJiAnFXBzm93peyGegJk8YBgMuz0LA>
 <xmx:MTwnYi8QF31-A0_4YA2dNrJIp0XmV4CDhf_uOG0bdo3qOIv3gcHokQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:21:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Subject: Re: (subset) [PATCH] drm/bridge: tc358762: switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 12:21:04 +0100
Message-Id: <164673846305.2436174.14102817367925135198.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228183342.24129-1-jose.exposito89@gmail.com>
References: <20220228183342.24129-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 robert.foss@linaro.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 19:33:42 +0100, José Expósito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
