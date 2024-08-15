Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918A952C76
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 12:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D5310E105;
	Thu, 15 Aug 2024 10:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="uPemGt1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2E10E106
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5W9Wpx+Nnjyhf+vekam8upWRPfSyFjdBVs1M3EoZVFw=; b=uPemGt1/Ke+dHFyYvX18I4VYkm
 hSvvRaWdLH+nC42xtFH3zJza+93Ew4YaeWy2tx42RzGeQn20mak+fp+pT63yeDibTePn1+YjPaSlG
 Uq1CxO9MTcBPrFE3m74t7uPVPyVA5VMZY7fsS0RI+vWskFD07mT7LWgpTcjHWBqPFYWAElhBbuvXi
 aRITjN6snq5uruze94Jv5u4FTVlo3qHnKrLKxz73MN/7jXTuiOrA+jrdDRYXX9b5ZmFgliyQlvA0+
 cKOou6jerwlt6JLJJRLrpDRlG3kYn3hiG7bPizIFNiI262ptF0eWaZBcbE/R+wotCccH++Ug7Vvv2
 9cIzP/3Q==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1seXuH-0000nZ-7E; Thu, 15 Aug 2024 12:40:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, airlied@gmail.com, daniel@ffwll.ch,
 andy.yan@rock-chips.com, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Clean up a few logged messages
Date: Thu, 15 Aug 2024 12:40:31 +0200
Message-Id: <172371788340.684432.3183669049968037964.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <92db74a313547c087cc71059428698c4ec37a9ae.1720048818.git.dsimic@manjaro.org>
References: <92db74a313547c087cc71059428698c4ec37a9ae.1720048818.git.dsimic@manjaro.org>
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

On Thu, 4 Jul 2024 01:32:20 +0200, Dragan Simic wrote:
> Clean up a few logged messages, which were previously worded as rather
> incomplete sentences separated by periods.  This was both a bit unreadable
> and grammatically incorrect, so convert them into partial sentences separated
> (or connected) by semicolons, together with some wording improvements.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Clean up a few logged messages
      commit: f7f4df8851194d2635fb7989582014329dcffa12

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
