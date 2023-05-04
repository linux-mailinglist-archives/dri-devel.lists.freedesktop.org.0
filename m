Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7706F6658
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7631E10E3C7;
	Thu,  4 May 2023 07:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FB610E3C7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:55:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC687631CB;
 Thu,  4 May 2023 07:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1EEC433D2;
 Thu,  4 May 2023 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683186899;
 bh=PV7wtzTFBd9oWpxWNQVKZvl2Ph+SG7I76rERT31/F0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cw0lXB70kJvzJJqeVAlW7prhmw7+OBSXiNGz8RcYS818xSTXuQy7Bsf46f7iU7pl9
 SZ2crZcH2ZsHkFHIDObgkKwBm9EuockA+lpEMp10TMXn08tC6gczEi9Hw+OWzTCKVO
 Dn48zrnG4eaZ88TiiikN2fR80NIxicfYO9DLPghvL6xnRtGWz1gQ0qcBZqwPFrm8+O
 hxEJVMZmVUg4yN6ZAfuVM6MpCITDLgT5IvlsTk+4XX3mLMr00vIFefLo4VlKxB6K17
 nxlDhz8n5AjXerB+G0wNiNsn7EvFtS+UB3Z74yIKhWr6teEhCg2UbHkG5D82ROfM7Z
 2O2UV8bSXHwZQ==
From: rfoss@kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Date: Thu,  4 May 2023 09:54:49 +0200
Message-Id: <168318687620.492998.9361858750949994053.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
References: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
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

On Thu, 4 May 2023 08:53:16 +0200, Alexander Stein wrote:
> If PLL locking failed, the regulator needs to be disabled again.
> 
> 

Applied, thanks!

[1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8a91b29f1f50



Rob

