Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5999EDA53
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E5A10E986;
	Wed, 11 Dec 2024 22:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="H5C5SgtT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394BF10E986
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OW/h1nzh5CCUdT1ggvfwoQV+ob57thnT8N0UW6JciMQ=; b=H5C5SgtTpUoPxNljxNt0dAlg/y
 19ZPytRf2bY75YCC9NPv7ENYidtDC5leXflE409ZeBxxBaUves+A97Qsnne1obKS7Iogk4nZVk9Dm
 8UgXLDinq1682jgfwPrlYDV4bI5+paQTxJf6hg2XdWjT44akuyxz/lqaKijSK8uvFJTQLH/SEJAef
 vaPBjxHS4+OmKhGNbh52oFKDeS8ZhqhSJOIWkOk6ilCjE7IdVLj/ZbRKMOlymb8vDwYI+3et+K+DD
 pmEVT5YlfzYxbDwZ/rOySGbykhEZxZV/yoRgC4aJ4sFjfezw4u/ICfSBwTpzIJ6AWw+UuDXxb7uE1
 Lo9jg6hA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tLVSi-0000ON-If; Wed, 11 Dec 2024 23:45:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] drm/rockchip: Remove unnecessary checking
Date: Wed, 11 Dec 2024 23:45:40 +0100
Message-ID: <173395708760.2509957.4198864245551096465.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
References: <20241206114233.1270989-1-guoqing.jiang@canonical.com>
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


On Fri, 06 Dec 2024 19:42:33 +0800, Guoqing Jiang wrote:
> It is not needed since drm_atomic_helper_shutdown checks it.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Remove unnecessary checking
      commit: 8ddc8dfb8329349d5efb0418c9f20025333e2d98

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
