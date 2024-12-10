Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D569EBF16
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 00:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21FA10E16B;
	Tue, 10 Dec 2024 23:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Fvt3fmai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4EF10E16B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6qMZJoDhXUbvrzz8pOdo34xzZMBBlZ49Lix3rFbxyQ=; b=Fvt3fmaiFWWht9AoPwUG+KIf0p
 12noGPd5E/Sp8r3lrbpNIs3BSUMyILLWEq33ywtYHA0n/dwVmueG/+vzSQBkYATKDHnEoCnXeZGla
 WTx26uZYi4XR1sRSr3EsLmYb++KbsTg+V9Raxn630JkmsFQstRXtJ9koraEs85oaD3ZqTTYKK8Lql
 P+9aySQBo6X2+OWyKwxuIivL8WJEgdScN6N1KnsJhmtdYrik8NessFkk5S8pFGhGUoANuh+713CZc
 26jjlvijLyPU6c4CeF3XQxOkL4QE+X4A66tLcngqctCnOH/IHr0bHaBboFFsaBaUHTgCIW++JftBy
 JZfuo+0A==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tL9PZ-0007R7-RF; Wed, 11 Dec 2024 00:13:01 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, krzk+dt@kernel.org,
 s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v5 00/18] VOP Support for rk3576
Date: Wed, 11 Dec 2024 00:12:58 +0100
Message-ID: <173387236508.2374456.8629854054013827389.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
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


On Mon, 09 Dec 2024 20:29:10 +0800, Andy Yan wrote:
> Thanks for the basic work from Collabora, I can bringup a HDMI
> display out on rk3576.
> 
> PATCH 1 is a carryover from the working when add support for
>     rk3588[0], is very usefull when some people want me
>     help debug some issue online, so I really hope it can
>     be merged at this round.
> PATCH 2~8 are bugfix of rk3588 alpha blending which report and
>     test by Derek
> PATCH 9~13 are preparations for rk3576 support
> PATCH 17~18 are real support for rk376
> 
> [...]

Applied, thanks!

[02/18] drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
        commit: 17b4b10a0df1a1421d5fbdc03bad0bd3799bc966
[03/18] drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
        commit: 6b4dfdcde3573a12b72d2869dabd4ca37ad7e9c7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
