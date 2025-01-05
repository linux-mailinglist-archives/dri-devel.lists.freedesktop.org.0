Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB98A01A3E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 17:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF89310E07B;
	Sun,  5 Jan 2025 16:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="gjpX5IrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1810E07B
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+OeFSCd7YH38tPZ53li4XDnnHkIKso75p2alieFcW0=; b=gjpX5IrUdI3qTyw3bc1uw8tTQX
 35xwcckj7conxnuHM+jSiR4TyEjidGD8vQTaj0961SN7gCpPeTsfh8XxapbjsBR1y0rGVv/epKXeH
 Jf7JVWe8FyMyPEY1LPM4ztxMTtwIvF30P7Fd2AplVQXUu5bwI04RV+nCalblCn48IxFqxmUoCSgKF
 rusenmfHALE3wkl7jqliw+/zOxarMoi1Tm6rWUb4y3Ta4p+fLH2pZngm9xIqgok9e097SYKuTYQ76
 TLrMNBS5eUPBzNh4kjRUiRfPaYVp9CLPnC0WQV9RYwQ0Xhd90vAgDuHR8rJf4b4FT6QHs8bk7fF1K
 vNkAYlAQ==;
Received: from i53875aad.versanet.de ([83.135.90.173]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tUT9X-0006uS-DQ; Sun, 05 Jan 2025 17:06:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v8 0/9] VOP Support for rk3576
Date: Sun,  5 Jan 2025 17:06:48 +0100
Message-ID: <173609319909.2437943.5709822695475196700.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231090802.251787-1-andyshrk@163.com>
References: <20241231090802.251787-1-andyshrk@163.com>
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


On Tue, 31 Dec 2024 17:07:43 +0800, Andy Yan wrote:
> Here is the V8
> 
> Patches that have already been merged in V6 are dropped.
> 
> PATCH 1~7 are preparations for rk3576 support
> PATCH 8~9 are real support for rk376
> 
> [...]

Applied, thanks!

[1/9] drm/rockchip: vop2: Support 32x8 superblock afbc
      commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
