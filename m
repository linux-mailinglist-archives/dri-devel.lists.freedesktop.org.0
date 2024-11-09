Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A49C301D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 00:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED0810E06F;
	Sat,  9 Nov 2024 23:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="H/978Fnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534FD10E06F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 23:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=016vrT94/bq8tQxp/b2gIW1czft0k80o/4hbTxdIxBc=; b=H/978Fnle5t56DpgABn8CW6QG3
 mnFuTd4rA3gdjzQe2JWD3zRyikY4TNa1/Ym3JBzpNOpIsm2wjS5DIKkjmLsmZvWmzquLLGTgupwFp
 Kbmotp05jl7E2V0Vz5mJllbfX/J7VRSy37mFhxKsgFg/sKYPHb8BapKkKyxWktsZHmJkbkbl6jFBm
 tCNPU7fm93hVgdywDOIvgAf0rPiFqYEcHdnaB+uuozZtJ4Ij7ixQMCsgja19cLK0BODnIDQlfnEWs
 BdNw7XlVr6juh17f+8AKIYf7TAswoh40o/IBB8kDSBm5w//BHKXnxM72YQqE1PazM6/nIIr/yF7pV
 AasEFPFw==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9v2g-0000da-OF; Sun, 10 Nov 2024 00:38:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <eballetbo@kernel.org>, tzimmermann@suse.de,
 mripard@kernel.org
Subject: Re: [PATCH] drm/rockchip: vop: Fix a dereferenced before check warning
Date: Sun, 10 Nov 2024 00:38:55 +0100
Message-ID: <173119552201.5709.15637295819198976150.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241021072818.61621-1-andyshrk@163.com>
References: <20241021072818.61621-1-andyshrk@163.com>
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

On Mon, 21 Oct 2024 15:28:06 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The 'state' can't be NULL, we should check crtc_state.
> 
> Fix warning:
> drivers/gpu/drm/rockchip/rockchip_drm_vop.c:1096
> vop_plane_atomic_async_check() warn: variable dereferenced before check
> 'state' (see line 1077)
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop: Fix a dereferenced before check warning
      commit: ab1c793f457f740ab7108cc0b1340a402dbf484d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
