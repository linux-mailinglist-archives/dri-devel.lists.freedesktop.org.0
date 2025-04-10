Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9FBA83D4C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F53810E7DC;
	Thu, 10 Apr 2025 08:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="uVQOKEw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC24910E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=/lGNGBbyMCD75p6dCKO3apkP06sLNCHOySPvGUmT+7M=; b=uVQOKEw4d8WibbYYpCax6pBQvj
 rwa4ehZAeOcGxnNXZKddKIeD+I5ZOJbNAn2a6pd+TL+sbgMsDujSjG8lLLDstT7Jp12Z6SMWbSp3M
 LJiLaSzvVHegTRfdDpgV9KR2UbafL+oPuGOdZY7buhPfXPPAw6kng0J+CtFDEYQFAWB8GwTHPu+UU
 24TDQSw4k1X10YgTrxq/QGK0WAbKan+95jpiJhV+Z1v3obJk1otKgPObPW6JnMSlw/c2DwnanYUUh
 ThT1+2/BXfpbvv7lNOJ8BbVyeiN8+TAPxxck867kIr1g9w+Mw6xZQOFY6kSppDYOxsM8VxjCbS59I
 FJ5kVPgw==;
Received: from i53875b95.versanet.de ([83.135.91.149]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2nTv-0002qP-VF; Thu, 10 Apr 2025 10:41:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Konstantin Shabanov <mail@etehtsea.me>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] (drm/rockchip): Consistently use rk3399 registers
 consts
Date: Thu, 10 Apr 2025 10:41:44 +0200
Message-ID: <174427445691.820310.17501284948552457054.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250403064740.4016-1-mail@etehtsea.me>
References: <20250403064740.4016-1-mail@etehtsea.me>
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


On Thu, 03 Apr 2025 06:47:39 +0000, Konstantin Shabanov wrote:
> As rk3399 has its own registers definitions, update related structs to
> use them.
> There are no changes in behaviour as updated constants values are the
>  for rk3288/rk3368/rk3399 chips.
> 
> 

Applied, thanks!

[1/1] (drm/rockchip): Consistently use rk3399 registers consts
      commit: d74cc229cfbbc5a96139825c297f34accd670bce

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
