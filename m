Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C89D89E0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE9510E695;
	Mon, 25 Nov 2024 16:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="frwUvWjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5710E695
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:01:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97DB85C59CB;
 Mon, 25 Nov 2024 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C71C4CECE;
 Mon, 25 Nov 2024 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550482;
 bh=nOc3Xy7mhkWTw8qDkGMCJ3rROD2LNWSCNirVNpiwODg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=frwUvWjAT86MGYDE31mxgujfkohr2ef3K4nhK2HbJuEEMJjrBbhwlO8jDeCeKBr+h
 C2hzW+jG/wlwKgJ2s7UIhxhWAWykVR4hNVemAuy2gBl1kXoUbjDTsPwpzomUIhZdLC
 eh2vMbpMyNeUbxSJWLX/tGjNTuSwFMyAT10TpsrRV/sYMSuNeqZ2e2iHcDGjYvkOgs
 K3rfy1A6NPtU0CO//OjJ59wRRitpAxEHDAcdAeMLwnlxQzUPfAZrqOkonRz41u0zU6
 oXVv78t0UQsZZMydobXwafUq03sY/4SG7BxHadCaevt9YMMDVpoLB2CKCu15OAsz04
 dcOi1kLNnMMJw==
Message-ID: <08f3944d0330d17984641bb2cb94fb88@kernel.org>
Date: Mon, 25 Nov 2024 16:01:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
Subject: Re: [PATCH v2 2/3] drm/sun4i: use drm_mode_validate_mode() helper
 function
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@csie.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Philippe Cornu" <philippe.cornu@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>,
 "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
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

On Mon, 25 Nov 2024 14:49:27 +0100, Sean Nyekjaer wrote:
> Use new helper function for HDMI mode validation
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
