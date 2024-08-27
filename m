Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE691961467
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8310E396;
	Tue, 27 Aug 2024 16:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T6Vx6biO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D0410E396
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:42:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C630A4252E;
 Tue, 27 Aug 2024 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68A5C4AF1B;
 Tue, 27 Aug 2024 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724776967;
 bh=RMUnWmh7KaWXAIiVgIe3wZOOVqlaIt5VdHV35OZZHyU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=T6Vx6biOilPPMDlLnXju6vmhqTEP9p9ZH78C5DEGVT54eNtmzeQ3nFpFfYMLM7VDp
 GhRU/6G6VQgP1xi67zg/mQDRy81odFk2RDHt/DOPFTT9081tTBMOxmDzGbuR9LRaJx
 g2H9Pk1BmQxoKsKSx8/ybuenzlYAp94sO9o4NgwliRw4mUZzly541MeNwkmCzjMHqo
 jO5MffgD2xBVq/3xxhgZUepbrKeVb7WW8uXO3WodDT2/ZVokCQ5Tm1AndoUJIC+sVB
 hE9HCLNy98ShKTBMy+ga0gCzUJk6flovW/Q/iOqQ6IPdyjXgvxaFGanu0dN0Gj1ozD
 dqrbgxTL7v+TA==
Message-ID: <ece4d6c8888cecb4cd7c646cb0ec8d55@kernel.org>
Date: Tue, 27 Aug 2024 16:42:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Derek Foreman" <derek.foreman@collabora.com>
Subject: Re: [PATCH v4] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
In-Reply-To: <20240827163918.48160-1-derek.foreman@collabora.com>
References: <20240827163918.48160-1-derek.foreman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-fbdev@vger.kernel.org, "Helge
 Deller" <deller@gmx.de>, "Jani Nikula" <jani.nikula@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>
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

On Tue, 27 Aug 2024 11:39:04 -0500, Derek Foreman wrote:
> The largest infoframe we create is the DRM (Dynamic Range Mastering)
> infoframe which is 26 bytes + a 4 byte header, for a total of 30
> bytes.
> 
> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
