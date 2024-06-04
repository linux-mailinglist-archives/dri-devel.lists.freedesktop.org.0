Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7238FB6DF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329F48933E;
	Tue,  4 Jun 2024 15:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CK5rYCLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506D610E23C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 15:22:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C575761315;
 Tue,  4 Jun 2024 15:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB23C2BBFC;
 Tue,  4 Jun 2024 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717514558;
 bh=NCBREcmQycJgJumDDQbifq28+lHb3bZCy38hq4htNak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CK5rYCLow58nfjHvikQIdrqa6Rp4AmE12XLaN42gmBFrMLrcHp7DX7QBnFpqijP/j
 4B6axJ8ZP/D+ED0FMq9DhmmE3pQ5VptmslV/fOqFERifKNfLU3szI8Q+bgsI2pqDRI
 z+lnsR7CzEZmxWA7X06iMYuzD6B0mALCMmvZaP9IJF5wsdW5vmpkHszYho4tlgRbIb
 jlotZuVt8hvdG08if9vioaoGXGvJIZqE5u8gKNJc8eLY8G52V+ofkWKCW/CkoO66/4
 6MQY/6zEMDfMCNcXI3bFcLOqIDtFrDKofd3y3OeZ/bFAUQjjGJuBjiHO8x1UHkJjv3
 FK01CEt81TJ8A==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Robert Foss <rfoss@kernel.org>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: properly handle zero sized
 AUX transactions
Date: Tue,  4 Jun 2024 17:22:31 +0200
Message-ID: <171751450834.3505797.15573980378031196868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240318203925.2837689-1-l.stach@pengutronix.de>
References: <20240318203925.2837689-1-l.stach@pengutronix.de>
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

On Mon, 18 Mar 2024 21:39:23 +0100, Lucas Stach wrote:
> Address only transactions without any data are valid and should not
> be flagged as short transactions. Simply return the message size when
> no transaction errors occured.
> 
> 

Fixed checkpatch --strict formatting suggestions and applied, thanks!

[1/3] drm/bridge: analogix_dp: properly handle zero sized AUX transactions
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e82290a2e0e8
[2/3] drm/bridge: analogix_dp: simplify analogix_dp_{set/get}_lane_link_training helpers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3747c9818954
[3/3] drm/bridge: analogix_dp: don't adjust further when clock recovery succeeded
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=35e7a72a6719



Rob

