Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3DAFD57D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703010E088;
	Tue,  8 Jul 2025 17:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="PwuF4QA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C82810E088
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=yQS8VbuYYVS614FlKxzbsWxX6m7fPV/cmPrhGKnwTY0=; b=PwuF4QA9yJ09dovOrDVvtn1+cm
 +DlPfjtIKVaNx0fq39O8q7Dhx9kiqZPa41AwkGPEmJ+WK6px2HB+o9w+uFfBkzl6uJaS752Q2G0cw
 wfAMdv/YJnGRlqmIVFPs2L06qRQ4YFYh+L6pasZgfW85WJt4pWK/XJBOS3S4elU5exdpwNjS/dRH0
 7jAIC49DaRGcS7l7AacuflnedPYjZ/TmOOsV80kCfIR6SyFSltAwuek22kazm75g2+u2izyRA91KF
 +WhtcMeg9NwfJfku3PuQBvcZX51Xq16OSlWR9SXM90izajUzKYoN/ITtyFJ2+RBavvVYyiRm9VpP2
 6hckBmqQ==;
Received: from i53875a8d.versanet.de ([83.135.90.141]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZCE6-0005cC-Jd; Tue, 08 Jul 2025 19:35:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: lvds: Convert to drm bridge
Date: Tue,  8 Jul 2025 19:35:15 +0200
Message-ID: <175199006056.1731917.11933930833923830101.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526015834.102-1-kernel@airkyi.com>
References: <20250526015834.102-1-kernel@airkyi.com>
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


On Mon, 26 May 2025 09:58:34 +0800, Chaoyi Chen wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: lvds: Convert to drm bridge
      commit: 40a382aae1d4a4ca07fe19b0d16b4fbc1eeace9f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
