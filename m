Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAADA83D8D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0710E7F8;
	Thu, 10 Apr 2025 08:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="yhL4ITJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3178B10E7EC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=2uSi0rBX6HJS7l/ixoRnzj1B4Bl35/AdR7/AHqL8734=; b=yhL4ITJtDKiM/Z08hJ0g582CaA
 V+aKPaaMX1AnJ55IN0fFECPh00KiNKjAF5C6nQgmTj+tQhpIIoOdHghXd3/OgtwLe3GoBWjvB+hla
 p80iVC7P1YIqpXgs5OGqBccorpN+pxG8gfk9bAWia0x/XU6HlkjWCh/sW6Zk+m1HP7pAU4R1t1MPV
 nX1kRRcWSCnvTK6fsUMc3Oj4m1BI2p52eaepV/MspllkQvmh1GtkJj0Qqs0pmTzhexnTdAhjrW35q
 loU9ioxkHLEQ9qf+x0RzqldZzmMeiXuZyVP/09SvPOV2in7RJkjo6mqpYFKGXhrEDYTp25w9gJELt
 MkbVFR5w==;
Received: from i53875b95.versanet.de ([83.135.91.149]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2nfG-00036h-JV; Thu, 10 Apr 2025 10:53:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 piotr.oniszczuk@gmail.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix interface enable/mux setting of
 DP1 on rk3588
Date: Thu, 10 Apr 2025 10:53:27 +0200
Message-ID: <174427520239.842175.8681778427919130994.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312064218.524143-1-andyshrk@163.com>
References: <20250312064218.524143-1-andyshrk@163.com>
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


On Wed, 12 Mar 2025 14:42:10 +0800, Andy Yan wrote:
> This is a copy-paste error, which affects DP1 usage.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk3588
      commit: 210db264cf87da8908c395b44170f04469009035

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
