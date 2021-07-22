Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1603D1F13
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512466E869;
	Thu, 22 Jul 2021 07:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9155A6E869
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:34:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9E2F65817B4;
 Thu, 22 Jul 2021 03:34:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 22 Jul 2021 03:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=l
 FZVxS7iBfV66LqMyyxylgHFDfEUNJwOBRNBLqq9zA0=; b=I2OPNrVF6mCwf1U28
 zX7vw71bFwSRHnu7mPBS66F0OxK5yKkLmktLODfnV1LXrAHhuetIx+V9PI6FuDPF
 hSHnQ9c2822TWQIZSm6CHrb2CxlPhCgp9gS8AGRjVOwn5fnXsxqMnEdeYbfYkBnx
 hsVMmyQjFnwABsf0/5NtSdVzOq++rrlogxjqWHvT0Z4/L5vH2DxLZ1a+TYkUa9aJ
 j44r+LPWygICv4jFncFYwoO1IuU6b4HylIP3kUzNlzD+SI4WBxBWFFchxOKUTYLw
 qJ9JylUiFZ+o/p7N1xoMi+xagsq5cc6DOkp6Ah6aeOqHmMiNDLAFuRxut+i6Xmw3
 xNRwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=lFZVxS7iBfV66LqMyyxylgHFDfEUNJwOBRNBLqq9z
 A0=; b=oBW+wGLCUw9iZK1be5UY5Nh1j8IvFhUfy+05XNraEoj1D0+ekPE2fJaHv
 nbTLrQlDkI5Vk+gQQWKui9a70xRc5EcIUeMvh6pcuCZCO5rPGtGzUkGXarX4GV8o
 Luvwhlt5YjBKpUE7tQxCfxPKib1+Nw9unkm2e/x/kRLs3oNPliO4LkR5++Ac+jjZ
 wgi7aUQ41WdpitjtsRj8RvbU0feZYysNq1JWgPvWOs0T5sprl2ECTvpo4tkhF1kv
 PHdiynpG2iQ7VEdrReLU+WOraGyWahM4H/YoGc1J3QzioD8FMArDFc/kbSlz+2o/
 KemF7qPtJ2yPHKN6vbgwOTwHIbt4g==
X-ME-Sender: <xms:hB_5YBAdLx_QbUSYlm0hSXhs--79juDsY1dq9y3gwfS1S_F1YFbmlA>
 <xme:hB_5YPjb4Y0d3ICFxChZJxesFo1JoqmYg9kiwLeFCF2OT5f8FnAo4KKlX4xLM1pWL
 iVAmI77iYcG9PysU8g>
X-ME-Received: <xmr:hB_5YMnQyyQ6CbUTwpa-k6KBSjDfvfnPvL5uUF_25trCh6V5jHu1__4fthkHNwmNaCG0ZsiGsrps9w9qRr3ByQKuWtydOMO2taV2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hB_5YLzni9QgxKRYxfsZuE9_Ar5xtApc-A87PGpUby9iJr1QGplXWA>
 <xmx:hB_5YGRXWBff0vCiBlHguE0Rdn5oPwMCd7GiRPHqoLE9sXxpA679FQ>
 <xmx:hB_5YOapNxhhyJv4ZXKj2wESdjvEcQ9G6ZjyhyvosVm6xA6uJ1j7Jg>
 <xmx:hh_5YPCoTKftD-Z6G3v_R8XsBl_un2X_bgViCrMYjEnhzBTv14oSSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 03:34:27 -0400 (EDT)
Date: Thu, 22 Jul 2021 09:34:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 7/7] drm/todo: Add bridge related todo items
Message-ID: <20210722073426.dyuytcoqstxoksbk@gilmour>
References: <20210722062246.2512666-1-sam@ravnborg.org>
 <20210722062246.2512666-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210722062246.2512666-8-sam@ravnborg.org>
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

On Thu, Jul 22, 2021 at 08:22:46AM +0200, Sam Ravnborg wrote:
> - deprecated callbacks in drm_bridge_funcs
> - move connector creation to display drivers
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime
