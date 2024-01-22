Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AA836727
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F70710E6F3;
	Mon, 22 Jan 2024 15:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D925B10F300
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:11:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 44A2EB80C82;
 Mon, 22 Jan 2024 15:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D790C433B1;
 Mon, 22 Jan 2024 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936276;
 bh=EpD3Hr2IfNJU3ntd7txCiVWwAPZLOWeSenY1lv5uZyk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TYNJUWRi/wwuOWzb359CmvuJy0/3Vovd7lDGYeMVs9/Yz7w5bX1bfbNnvCTDrPdUN
 J7CHCB39hHdUeeTfVtZw6I7oahcmV/xs0lpbCEa53SJI+WWIKNFe+YlcKydN7kRNUc
 xWe/ep/uePaBWTrRQNZZBKiS7NV7jNRhIlLdELhjaVqK6bcNIYLnCoF4KfPbWWdO+O
 mLEck4ohmA1sPjgZtxDJXlgjA35uGRLbJD02m6q3UeuG09dbttcMPmQd+2vw29cEo2
 BzTtkGDa0NER1X74GemxlWolAkNTmIRMpzWvDZo5y1t5w7UvEGQ6p21wGBAH1pSyKw
 voZRikFouUGwQ==
From: Robert Foss <rfoss@kernel.org>
To: linux-kernel@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
References: <20231218084354.508942-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v9 0/2] Add displays support for bsh-smm-s2/pro boards
Message-Id: <170593627232.3096177.528282215481259710.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 16:11:12 +0100
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
Cc: Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com, David Airlie <airlied@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023 09:43:36 +0100, Dario Binacchi wrote:
> The series adds drivers for the displays used by bsh-smm-s2/pro boards.
> This required applying some patches to the samsung-dsim driver and the
> drm_bridge.c module.
> 
> Changes in v9:
> - Updated commit message
> - Drop [3/3] arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup
>   because applied.
> 
> [...]

Applied, thanks!

[1/2] drm: bridge: samsung-dsim: enter display mode in the enable() callback
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b2fe2292624a
[2/2] drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=72a0cfdc3ad7



Rob

