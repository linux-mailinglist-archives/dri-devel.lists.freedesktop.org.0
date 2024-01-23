Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17B838D57
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 12:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E99C10E159;
	Tue, 23 Jan 2024 11:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD1D10E159
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 11:23:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 26E9661CE6;
 Tue, 23 Jan 2024 11:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F80C433F1;
 Tue, 23 Jan 2024 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706008985;
 bh=Y3T+L0qJ8+9487Y0uYPPEs/J+H3fDa/ntJpYnuUtspU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZWoY9vmDeR3HqA2rXbVbVcp7jpK9AHnQuZeILoNBHHqXkKhFMojrT8IwInDiOmSL7
 jqynczUQMjJ+knVOcMrhe2mkQKGhUYH3iKDJIyzotKeqgP4PMU8OEXgQH2e1qcIYz4
 10wxHIMcDqIXgJVKmFlnJn/C2EXBCZjD0hHwMIJay7pdpOM3024lcXZ8jzgQr8BabW
 mBJNGTn1Xpfs6iu+CB2M3v4wC+bH9LXIGuZR7/9Hlprp+jLWVeLpBT4DC8FpeSyGXz
 lNEu/EXUdJ+f4NjJKQ7byV7QicMSwb5uqu3j8dzGo7fPjd1vjcLmClIQKpU6px3u9j
 0KK/6PTyAyChg==
From: Robert Foss <rfoss@kernel.org>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
In-Reply-To: <20240118220243.203655-1-marex@denx.de>
References: <20240118220243.203655-1-marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Limit the Pixel PLL input range
Message-Id: <170600898347.3231262.8755015856047118708.b4-ty@kernel.org>
Date: Tue, 23 Jan 2024 12:23:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Jan 2024 23:02:31 +0100, Marek Vasut wrote:
> According to new configuration spreadsheet from Toshiba for TC9595,
> the Pixel PLL input clock have to be in range 6..40 MHz. The sheet
> calculates those PLL input clock as reference clock divided by both
> pre-dividers. Add the extra limit.
> 
> 

Applied, thanks!

[1/1] drm/bridge: tc358767: Limit the Pixel PLL input range
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f86ae204bec4



Rob

