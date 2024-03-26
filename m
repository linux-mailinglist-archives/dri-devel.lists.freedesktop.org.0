Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7B88BE0B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 10:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CB610EE22;
	Tue, 26 Mar 2024 09:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790CE10E849
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 09:40:23 +0000 (UTC)
Received: from i53875aaf.versanet.de ([83.135.90.175] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rp3Hw-0001HT-FA; Tue, 26 Mar 2024 10:40:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>, quic_jesszhan@quicinc.com,
 neil.armstrong@linaro.org, sam@ravnborg.org
Cc: tzimmermann@suse.de, klaus.goger@theobroma-systems.com,
 dri-devel@lists.freedesktop.org, Heiko Stuebner <heiko.stuebner@cherry.de>,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH 1/2] drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to
 LTK050H3148W flags
Date: Tue, 26 Mar 2024 10:40:10 +0100
Message-Id: <171144600424.1118335.2717050705855214232.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240320131232.327196-1-heiko@sntech.de>
References: <20240320131232.327196-1-heiko@sntech.de>
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

On Wed, 20 Mar 2024 14:12:31 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Similar to other variants, the LTK050H3148W wants to run in video mode
> when displaying data. So far only the Synopsis DSI driver was using this
> panel and it is always switching to video mode, independent of this flag
> being set.
> 
> [...]

Applied, thanks!

[1/2] drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to LTK050H3148W flags
      commit: 80cc8c0d09e6bab3bd016ddaccd0570cadbe1891
[2/2] drm/panel: ltk050h3146w: drop duplicate commands from LTK050H3148W init
      commit: 55679cc22e60e8ec23b2340248389022798416cd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
