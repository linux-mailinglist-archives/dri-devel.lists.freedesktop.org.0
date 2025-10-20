Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35DBF1AFA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19410E446;
	Mon, 20 Oct 2025 14:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="bqGxSaqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563B110E446
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Y03xA7Ng90Zv7rPJFZd2rZufsHfanfSxM7BNF67ROLg=; b=bqGxSaqAf0w9beGtvWinA2y2ss
 FU23gOWX7w2931FlVeYwmm+cDJKbG3CXT1/qgW1WC3rgSaTPljnjOEVUzp+17+r+T7jLZO0FsTg43
 i42AI3QkcHz4V7fCbkprTfOB8wAa5+Pm0mnQCQVomPwnJ7foURPUztNvFI9TDEexqFeJuXqBWhxjh
 JmSlHwtLtThoZzPwr/JnLz4IUdRw0aMJ7lTnrWnBcQcIJtmpUfr9MV5KoramGYbDYmsAbg7hDQqGJ
 aRsOOgLOUzZFfHt+7S/la/3d+L9cRVGIACrZgIJsEltApENrJyRVB+xqwgbrljH9vEaI13y+2qFpU
 DyF7aMQw==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAqQe-0001wV-OQ; Mon, 20 Oct 2025 16:00:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Daniel Stone <daniels@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, andy.yan@rock-chips.com,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: Re: (subset) [PATCH 00/13] drm/rockchip: No more post-atomic_check
 fixups
Date: Mon, 20 Oct 2025 16:00:02 +0200
Message-ID: <176096879358.14956.5384922087403578386.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251015110042.41273-1-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
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


On Wed, 15 Oct 2025 12:00:29 +0100, Daniel Stone wrote:
> This series is a pretty small and consistent one for VOP2. The atomic
> uAPI very clearly specifies that drivers should either do what userspace
> requested (on a successful commit), or fail atomic_check if it is not
> for any reason possible to do what userspace requested.
> 
> VOP2 is unfortunately littered with a bunch of cases where it will apply
> fixups after atomic_check - doing something different to what userspace
> requested, e.g. clipping or aligning regions - or throw error messages
> into the log when userspace does request a condition which can't be met.
> 
> [...]

Applied, thanks!

[01/13] drm/rockchip: Demote normal drm_err to debug
        commit: f233921d988ae6a990e76d0532b241ce3dc57c12
[02/13] drm/rockchip: Declare framebuffer width/height bounds
        commit: 4bfaa85bb5f7880ff51be1d2a2e031fe4270411a
[03/13] drm/rockchip: Return error code for errors
        commit: 70e3f77cb568e229a59c5162be717bea2e22ffd8
[04/13] drm/rockchip: Rename variables for clarity
        commit: 33cbeea62fae844574e2121e4176963e68741a4a
[05/13] drm/rockchip: Use temporary variables
        commit: 4e39740d77e9cf6c20972fde14197db7aee36f35

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
