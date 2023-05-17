Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D3706C70
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A3089A1E;
	Wed, 17 May 2023 15:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6199889A1E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:16:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B873463B9E;
 Wed, 17 May 2023 15:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F09C4339B;
 Wed, 17 May 2023 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684336608;
 bh=Agi7bF9riKG4HjMVrkVmVUJncTkwQNdSOh+P2Ogqy4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZKZrwNY772byh9PGVVSHrMhLVfipcxJWGhBqKpm848r8En0Yu12+ibeqyD3tTTM3b
 CW9P0aYaUpjre54f31PZKbdFNtHkehtkSrlYsw2d2xTrsKLwgT8Sk7/sOsJF4OF8Hv
 eAj5UT3bC3vTqIw2o3421G/chzqdNCpFlYBZqA45/3yv0Pq1lyrzH9AXLtiuHd9SfM
 v1ZWeJRJaRwhVHHkOsa55KxyRB9pny2DptjGN0Pmp7+j63bI/xIFeRxXO0w5s+to2N
 OM7pPEdIHCux4elczFAY+JM7GLXu83VNJUOoboYdTIAC5laXgcKXvBvtMiUKdQAmd0
 DZ3OYTTz9EQhg==
From: rfoss@kernel.org
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 1/1] drm/bridge: tc358767: Switch to devm MIPI-DSI helpers
Date: Wed, 17 May 2023 17:16:39 +0200
Message-Id: <168433658975.2832612.10062295569005523851.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517122107.1766673-1-alexander.stein@ew.tq-group.com>
References: <20230517122107.1766673-1-alexander.stein@ew.tq-group.com>
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
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Wed, 17 May 2023 14:21:06 +0200, Alexander Stein wrote:
> DSI device registering and attaching needs to be undone upon
> deregistration. This fixes module unload/load.
> 
> 

Applied, thanks!

[1/1] drm/bridge: tc358767: Switch to devm MIPI-DSI helpers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f47d6140b7a4



Rob

