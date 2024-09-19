Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879A97CB01
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 16:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE3C10E724;
	Thu, 19 Sep 2024 14:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="tGA0UHve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EEA10E717
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m1kKdtQcHJV23d4r0PzJxxLgP4SECr7H28gdaL/ivo8=; b=tGA0UHveyFNjTcySmyThcr+q3L
 mKPBKAzU2vvK6UgTV5y1lvRZmnI4bAgALqqUjEWDRxAxwpRKWqxpnPEuneJYOgceW+BRYOANgkMUZ
 RGl3Uzsa5iJY2+seBz9WyefH4EgHAHg6vWuOUWhDIeiU9dKOwU2UD1aONAd+U/oOz9XRQT/gy1hZ/
 zDg0UBEA7G0qEQ1R3FB7HtlUAVv0d7Pq82PPxIrATd07UuNI+JWUsfyMvPuSLfH5mVbk6TXyZkEXt
 swjvuVqpRM840gd1vtz+mEzTrOC+K77TCTx+r2kg4CN86hpPOPQo4F2upTEeUkcjx06sfEdSf8v/T
 Y0aAPmmA==;
Received: from ip092042140082.rev.nessus.at ([92.42.140.82] helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1srIB1-0003XD-KQ; Thu, 19 Sep 2024 16:30:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Kreimer <algonell@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Matthew Wilcox <willy@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: Fix a typo
Date: Thu, 19 Sep 2024 16:30:23 +0200
Message-ID: <172675621368.1213843.17065893095023530764.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240915123943.105118-1-algonell@gmail.com>
References: <20240915123943.105118-1-algonell@gmail.com>
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

On Sun, 15 Sep 2024 15:39:43 +0300, Andrew Kreimer wrote:
> Fix a typo in comments.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Fix a typo
      commit: 87d45979140e49611696e97e2b33df572bf4fa24

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
