Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA7C193AF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C0C10E774;
	Wed, 29 Oct 2025 08:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bezlEPpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ACB10E774
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:55:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5580D4186F;
 Wed, 29 Oct 2025 08:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5435C4CEF7;
 Wed, 29 Oct 2025 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761728124;
 bh=phEg2pXqRD3Io5OWcNnG6saaAlBTyp0EzBzi9+EOrK0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bezlEPpRBkgqkc10mB7ahmvPgLeCkHYle2USV/V0UykGaC6vHavgDhl/tslGl4m6N
 wX0l2QxaAyfoLf3oCNEyNGaonRbOeRfVTbTHMVaMCeiX6PSsawdp6zC11ksjyM2WbN
 lRYF/JsHo7IvMp6CYqdYtqfDE9X7MCQaSQEQjZ6LM29P+vEeyVLvvKdYzZhyEM1kKd
 Xh+tXYLJjeBaNJNWiE4X4HMTVEvrY724HGD3XOj7tTM0bavnt5Z8nT+lW88JRjpOME
 DHAzcPHyjHDz3O/VgQgyWRrlpNCSCtCkqOuNiByEg0w7QH75+0AL+ogMfc9Qsb4muv
 7gAjUZa5FMGNg==
Message-ID: <0c0b84319f96b5d2a32bbae473e5758e@kernel.org>
Date: Wed, 29 Oct 2025 08:55:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 7/7] drm/bridge: prevent encoder chain changes in
 pre_enable/post_disable
In-Reply-To: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-7-c90ed744efec@bootlin.com>
References: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-7-c90ed744efec@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 9 Oct 2025 13:39:02 +0200, Luca Ceresoli wrote:
> Take the encoder chain mutex while iterating over the encoder chain in
> drm_atomic_bridge_chain_pre_enable() and
> drm_atomic_bridge_chain_post_disable() to ensure the lists won't change
> while being inspected.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
