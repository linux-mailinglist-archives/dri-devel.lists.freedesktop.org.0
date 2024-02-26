Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CE7867637
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 14:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F4810EF5F;
	Mon, 26 Feb 2024 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jOF2Yaia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B910EF5F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 13:14:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86C1BCE094C;
 Mon, 26 Feb 2024 13:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEE6C433F1;
 Mon, 26 Feb 2024 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708953286;
 bh=e7b9+FvYYnnAM6oz91raoC63TNSAjVd7P8myQZUYpXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jOF2YaiaUpjb+ZCr2pTH7tt3sVcgoPpXqUAKgntwPohCzLsnQTVKsycI9RNYO6nf9
 FVdCieXLwAKgh1ITZ5vqgPd/gDP2Uo5UACkNcenHLl8uNxoOFVD2x/nbdBe3tWbjd+
 rKOUf7IBKb4cbDPKgMWEIpYBuBMMU2GxTPrOHjP4NeFmcRFoHwBrCLPrjisl4pNCFb
 r74U9RQysGgVNFrCKBrfM9waV2mcO+YTD6wVDPF4nkV7uXj/BmT+KcU7w+YVtQO7yC
 P8ni6TRVjsHOAc0M/tTr6VCB2FvtQnZwvz0wavxzHxp048cioBGagosyDpU+OD4rwC
 sjjzpJpvixxOA==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Subject: Re: (subset) [PATCH v2] drm/edid/firmware: Remove built-in EDIDs
Date: Mon, 26 Feb 2024 14:14:42 +0100
Message-ID: <170895327600.64618.18221275236031391237.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221092636.691701-1-mripard@kernel.org>
References: <20240221092636.691701-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Feb 2024 10:26:36 +0100, Maxime Ripard wrote:
> The EDID firmware loading mechanism introduced a few built-in EDIDs that
> could be forced on any connector, bypassing the EDIDs it exposes.
> 
> While convenient, this limited set of EDIDs doesn't take into account
> the connector type, and we can end up with an EDID that is completely
> invalid for a given connector.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
