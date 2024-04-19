Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33948AAD91
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5FA10E4B4;
	Fri, 19 Apr 2024 11:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6751D10E324
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:19:08 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.intern)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rxmGm-0000RL-A6; Fri, 19 Apr 2024 13:19:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] drm/rockchip: cdn-dp: drop driver owner assignment
Date: Fri, 19 Apr 2024 13:18:58 +0200
Message-Id: <171352551023.2525344.17146432068876073812.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240330202754.83907-1-krzysztof.kozlowski@linaro.org>
References: <20240330202754.83907-1-krzysztof.kozlowski@linaro.org>
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

On Sat, 30 Mar 2024 21:27:54 +0100, Krzysztof Kozlowski wrote:
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.  Whatever is set here will be anyway overwritten by
> main driver calling platform_driver_register().
> 
> 

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: drop driver owner assignment
      commit: 0e353133816b3e3e4bf8a682de01506ebc2b1dee

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
