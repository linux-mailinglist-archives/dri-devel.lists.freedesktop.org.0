Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846A9C2FD2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 23:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3F10E0F8;
	Sat,  9 Nov 2024 22:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="wmCH83XV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A6310E0EC
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w8gBGyPTDJo8Wblkn6DK9LVzHMsd9X3M336TYhnbuuI=; b=wmCH83XV6CawKCBG+wBFbmq4qJ
 U+tEpY8FgwvM9/lF+DEae3CbhHS1ANMEGtDfnxsAgUk8XV0poeQzYLbRpGzQeT2gwLizmjSAwObte
 J+xi/zFNarxQae70PAfKGE8VqX/frWY/0TDgYDAwizyltIzH8YvAciiOetgodJDTekUqN9dkoCftY
 bO/mbg/agRoMdWtEL0VNkNuO3dH7o24rjOfJKxZMOuQmSVukUScXqaOYSqgBsubcqPqh6YwCpQslU
 60n8tX4dZsbrUdXK/DlQDgz8VHecI194PvUnj1fE9VK81QAKhv8tBMw6utWI/s+G+y4OBzaXHLvIM
 4XRiNUGQ==;
Received: from i53875b28.versanet.de ([83.135.91.40]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9uJP-0000NE-3s; Sat, 09 Nov 2024 23:52:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com, hjc@rock-chips.com, mripard@kernel.org,
 zyw@rock-chips.com, maarten.lankhorst@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 groeck@chromium.org, simona@ffwll.ch
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Use
 drm_connector_helper_hpd_irq_event()
Date: Sat,  9 Nov 2024 23:51:58 +0100
Message-ID: <173119266840.1201296.18042535241169632590.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105133848.480407-1-tzimmermann@suse.de>
References: <20241105133848.480407-1-tzimmermann@suse.de>
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

On Tue, 5 Nov 2024 14:38:16 +0100, Thomas Zimmermann wrote:
> The code for detecting and updating the connector status in
> cdn_dp_pd_event_work() has a number of problems.
> 
> - It does not aquire the locks to call the detect helper and update
> the connector status. These are struct drm_mode_config.connection_mutex
> and struct drm_mode_config.mutex.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
      commit: 666e1960464140cc4bc9203c203097e70b54c95a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
