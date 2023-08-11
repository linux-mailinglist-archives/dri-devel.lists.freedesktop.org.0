Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31543778F6C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 14:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92510E0B0;
	Fri, 11 Aug 2023 12:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A121C10E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 12:27:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 096B066F55;
 Fri, 11 Aug 2023 12:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD9DC433C8;
 Fri, 11 Aug 2023 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691756846;
 bh=fygssrO+FnKtzq3xoa7kSkTg46od+znrPnZnnVQU2q4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Go63POwGMXOMEcAAzpwTVfEzC/mqla8WHwoWOI0+UKlAxeV9lZPOXZ7+y/wroxpVr
 PD6mWWtg6t5Mk4QIT9Fe5ISBG/JX7vYTHjLTfPbIQ5jz2Dy69ly5UQ4j+Ei5TeaLUZ
 nhmjG38uovVX6JjYIRacg/Hl0PhjxQ0H719l3kZL/vGc8kf+30mAVv9XIjsJ/WfwHv
 NUaHGJ566ETTiXiCzaMjSnF4pPtE0c6KMd6jVEc2HQM5sCddp/jn2WIfLjjtqkMKN4
 9J5kcFSpdHBXIXYgHC81xMttNMqHfegrmXwLIWe/WV4vOO9RaC+GaWece5RY0n/O1v
 iiMCxmxIAZIOQ==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Initialize ULPS EXIT for
 i.MX8M DSIM
Date: Fri, 11 Aug 2023 14:27:12 +0200
Message-ID: <169175678535.277033.15732106366546909746.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230709134827.449185-1-marex@denx.de>
References: <20230709134827.449185-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 9 Jul 2023 15:48:27 +0200, Marek Vasut wrote:
> The ULPS EXIT is initialized to 0xaf in downstream BSP as well as older
> revisions of this patchset, in newer revisions of the DSIM patchset it
> was left out and set to 0. Fix it.
> 
> 

Applied, thanks!

[1/1] drm: bridge: samsung-dsim: Initialize ULPS EXIT for i.MX8M DSIM
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=192948f6a923



Rob

