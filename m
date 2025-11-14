Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AA6C5F8E4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 00:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EEE10E27B;
	Fri, 14 Nov 2025 23:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="MYGhofmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D611210E27B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 23:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=4mWX8nC+37T8o/o9eBw0iWWeRw7fTn1ANfKhrAv+Gm0=; b=MYGhofmkfT/U809Ya9KFWAbHa8
 ge18PeJ0KuqiWYOflhpoSTsy3BU3Y6rIL37dd5p0qHjXMGuiGOKuOLq/zz9QUXsKTYe6zd5xOerbv
 5Vd4+uer1CimtHVE3CX7WB2c9/eAaxtTH+s6DP6u22oqVdjHhEhlrgRPsbwHe/i2U+QXrC0MkhaDn
 nBcjGDY4mjw84+9a3FcOJQBSSNRjdOIZQqX2mPhJc9uFrWR/FJo7bzwuhA0k45lN1PZHfoMnF7iLL
 jb2jvbHrbmv4WieYVnYDa51UT85x0ctm1Jx2HLUo9IUj4saOmwj2oYMFQBxZ8IY1DnHaiiyGLjOp8
 Gy3ZhGwQ==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vK2pw-0008IQ-D5; Sat, 15 Nov 2025 00:04:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com, hjc@rock-chips.com,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/rockchip: analogix_dp: Use dev_err_probe() instead
 of DRM_DEV_ERROR() during probing
Date: Sat, 15 Nov 2025 00:04:07 +0100
Message-ID: <176316144241.624283.9273184537372082996.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251110075817.1159857-1-damon.ding@rock-chips.com>
References: <20251110075817.1159857-1-damon.ding@rock-chips.com>
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


On Mon, 10 Nov 2025 15:58:17 +0800, Damon Ding wrote:
> The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
> can be better. The other reason is that dev_err_probe() help avoid
> unexpected repeated err logs during defered probing.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing
      commit: 836b5e9c6dbd5e5ab82d0a153483048e355a79c1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
