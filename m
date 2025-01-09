Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF755A08394
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 00:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674210E4A7;
	Thu,  9 Jan 2025 23:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="iNotGkzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360810EF7B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 23:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q6uLJ4LISvFEeyya6O/0OdgM/2F3FosaJ8avibEUP1s=; b=iNotGkzkCDk1NX+bHOMVjTv9Dg
 utUSBPQ8G3VcwHP9GssoaOarRozmTDM7zxwWPuFiUbgvggZM17MnLXm9YPJXcM9M17G84IMDseXpe
 45cVbRg8rlFM6gSnZ0qIu7cKWi8C650ernP+ViQ5qW48lItAfMnH22lZ7BEsB/hKC1I+CsSFblK6m
 vquYSm4u8T7/a7s4HI86DYBTVxFXy6Kcf1Hzq1ej4k0SzOf+LJ7c/HrkVOOfpcmKLcASZw0XQKQCh
 5aVsa5QErLPdgqb4VO9DeHf48Kfi4BNqColLyoC4NymBftLa6QeARz0cLYMXG4U4rz5zrQpB3wHlt
 wUhxPHdA==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tW23l-00063C-W9; Fri, 10 Jan 2025 00:35:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Algea Cao <algea.cao@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Derek Foreman <derek.foreman@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: Don't change hdmi reference clock rate
Date: Fri, 10 Jan 2025 00:35:19 +0100
Message-ID: <173646570326.2987843.9070979804122130287.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217201708.3320673-1-derek.foreman@collabora.com>
References: <20241217201708.3320673-1-derek.foreman@collabora.com>
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


On Tue, 17 Dec 2024 14:17:07 -0600, Derek Foreman wrote:
> The code that changes hdmi->ref_clk was accidentally copied from
> downstream code that sets a different clock. We don't actually
> want to set any clock here at all.
> 
> Setting this clock incorrectly leads to incorrect timings for
> DDC, CEC, and HDCP signal generation.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Don't change hdmi reference clock rate
      commit: 1854df7087be70ad54e24b2e308d7558ebea9f27

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
