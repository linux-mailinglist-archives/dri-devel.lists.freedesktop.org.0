Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CC952C78
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 12:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5099710E106;
	Thu, 15 Aug 2024 10:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="gSWfRbD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FEB10E106
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JtSYMyjFwSHhr4JtGadybcU9/7LYdzxEw3v7M77JOOI=; b=gSWfRbD9AgJemxejQrnE4jm7Z+
 yogtanjJkf9uoZTJp1wo11bDeGrPq+AhivlTvFWYrkkOzMXbtQGDoYu2ZJDDTjOz5KoKCYG1IIhXz
 ma08MKO6MPdooJ/ppqXLN5l9cWnO2oFpDplHhm9pADOkD6ihvs7x/T5Vbq0sFjlb9jIFuUom0A6lC
 9zE2JiKvkXsqF5cXHFngitFfAYUgN5piYur+dqQPCbCpsFwlirbtJu6bOZpCNs0A7mKM1ERYxv+t7
 BVRDOH1DQAMAt7yCxSGOuPQCS5rv78T1DV9xHa/giPjTq3+XFz3NsPmzepr9gYPh7fKzFuLlK7LGV
 HuuY0YiA==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1seXuH-0000nZ-PS; Thu, 15 Aug 2024 12:40:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 0/2] drm/rockchip: vop: Support internal display on
 RK3066
Date: Thu, 15 Aug 2024 12:40:32 +0200
Message-Id: <172371788341.684432.2581958703388281846.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624204054.5524-1-val@packett.cool>
References: <20240624204054.5524-1-val@packett.cool>
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

On Mon, 24 Jun 2024 17:40:47 -0300, Val Packett wrote:
> This tiny patch series makes the changes required to enable the RGB
> display output on the Rockchip RK3066 SoC. Final version as discussed.
> 
> Val Packett (2):
>   drm/rockchip: vop: clear DMA stop bit on RK3066
>   drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: vop: clear DMA stop bit on RK3066
      commit: 6b44aa559d6c7f4ea591ef9d2352a7250138d62a
[2/2] drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066
      commit: 6ed51ba95e27221ce87979bd2ad5926033b9e1b9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
