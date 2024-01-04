Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798DE823FFC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 11:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68F510E3FC;
	Thu,  4 Jan 2024 10:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88CC10E3FC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 10:57:25 +0000 (UTC)
Received: from i53875a56.versanet.de ([83.135.90.86] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rLLPQ-0003Kg-Tf; Thu, 04 Jan 2024 11:57:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Subject: Re: [PATCH v2 0/2] drm/rockchip: lvds: improve erroring out when
 drm_of_find_panel_or_bridge fails
Date: Thu,  4 Jan 2024 11:57:07 +0100
Message-Id: <170436581964.3241728.17762561185162139964.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120-rk-lvds-defer-msg-v2-0-9c59a5779cf9@theobroma-systems.com>
References: <20231120-rk-lvds-defer-msg-v2-0-9c59a5779cf9@theobroma-systems.com>
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Nov 2023 13:29:47 +0100, Quentin Schulz wrote:
> drm_of_find_panel_or_bridge may return a different error code than
> EPROBE_DEFER so let's not overwrite it.
> 
> At the same time, let's demote the DRM_DEV_ERROR message to
> dev_err_probe so that the scary message isn't shown (by default)
> whenever EPROBE_DEFER is returned to not mislead users.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: lvds: do not overwrite error code
      commit: 79b09453c4e369ca81cfb670d0136d089e3b92f0
[2/2] drm/rockchip: lvds: do not print scary message when probing defer
      commit: 52d11c863ac92e36a0365249f7f6d27ac48c78bc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
