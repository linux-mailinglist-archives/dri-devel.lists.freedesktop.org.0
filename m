Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A36D4473
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7285610E46A;
	Mon,  3 Apr 2023 12:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19E610E456
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 12:32:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35894B81981;
 Mon,  3 Apr 2023 12:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D24C4339B;
 Mon,  3 Apr 2023 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680525151;
 bh=ulRUO8fEKtK/fjgnpqilfVtOG7bGfaNe2DcuHFEQvow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MxjHLqvp/wt7HJ/F9QbFK6KWaWwpZFxvvTYu/GSbf6mOMipizMMWyzbcIMGwIXbSa
 PA7vML9GO7CztqywOEP+WeOVjiAAur7/z1zx3mF43VjGkIZfA25ks/voXfgkwZ6fRw
 GnghkpJgKjaJ9I3NBW8afx61VWKSw20ogLBGp8CnntJCNF1plBybvSshB2KSBRDaLN
 OmMX5OfUqoWLkSCzgx4mIJ1TCHA9P7Q3B7wyMnSxvUGhjEkeBvG0p+BwxvTAqoZr9M
 fV1D7wbQGu0wM6NFeTeoWJDD1Arf42feCLn8Czf5ToXR7luCZBD117hs/X5KPQ3Rz5
 GX76CF3Ah8u9Q==
From: rfoss@kernel.org
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt8912b: Fix DSI Video Mode
Date: Mon,  3 Apr 2023 14:32:17 +0200
Message-Id: <168052510957.3322285.11626143716583284143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330093131.424828-1-francesco@dolcini.it>
References: <20230330093131.424828-1-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Robert Foss <rfoss@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Thu, 30 Mar 2023 11:31:31 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> LT8912 DSI port supports only Non-Burst mode video operation with Sync
> Events and continuous clock on clock lane, correct dsi mode flags
> according to that removing MIPI_DSI_MODE_VIDEO_BURST flag.
> 
> 
> [...]

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] drm/bridge: lt8912b: Fix DSI Video Mode
      commit: f435b7ef3b360d689df2ffa8326352cd07940d92



Rob

