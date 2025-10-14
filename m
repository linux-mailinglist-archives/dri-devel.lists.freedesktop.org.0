Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEDBD8474
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3D510E58A;
	Tue, 14 Oct 2025 08:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Wggg5Hg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD3E10E580
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=GOKTEzxthTTOyJo5wyYsOApQpBkoR2xVJ5lgMd5eWf0=; b=Wggg5Hg2zrlFhRN75mqTEvO8h8
 0Eo4dwBq3NohXRqW/1cPCAKRZx001JFprEkea5bCzEL6bRfKdXhthD2wIUi0FWTn+hQs1+Z4BGnuf
 TVYE8i318rFNhU2EIN5uQurWG7DUnmIPkgKog23Dr0Yid45W9LbzxrYBAI5xG87XnDOtRcaZYK0OP
 q23gfnpn99lJiYA9dJmK1Swd/l8lsTuyOCytHEodg/UZu39NrqRwnVInjZoQYqiwF7AYEmWqcIZd2
 Aug2ylh/JR6Zywai6wDhUaBaLXCnI+s7iteXTF5YSUpffwyD4PS9jaR7XfW6rHjUEcbgaNWXbLn5S
 s3dVqvDw==;
Received: from i53875b75.versanet.de ([83.135.91.117]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v8ajr-0005hQ-Gr; Tue, 14 Oct 2025 10:50:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: christianshewitt@gmail.com, robh@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 Michael Riesch <michael.riesch@collabora.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] drm/rockchip: vop2: use correct destination rectangle
 height check
Date: Tue, 14 Oct 2025 10:50:25 +0200
Message-ID: <176043181223.1370357.8939972845329921599.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
References: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
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


On Sun, 12 Oct 2025 07:20:01 -0700, Alok Tiwari wrote:
> The vop2_plane_atomic_check() function incorrectly checks
> drm_rect_width(dest) twice instead of verifying both width and height.
> Fix the second condition to use drm_rect_height(dest) so that invalid
> destination rectangles with height < 4 are correctly rejected.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: use correct destination rectangle height check
      commit: 7f38a1487555604bc4e210fa7cc9b1bce981c40e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
