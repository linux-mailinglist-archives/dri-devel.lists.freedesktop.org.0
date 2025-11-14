Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3243C5F9E2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 00:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F004710EB46;
	Fri, 14 Nov 2025 23:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="qNRCd6yS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9CB10EB46
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 23:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=7ug/+WQGznHQZFspx4hzvIao2Fd8H3zJoZId+XewBIw=; b=qNRCd6yS5HX00LwExIo925glXh
 4o0R5xoxfFlwXcPNovP06vCdw7SU/kflvJbjsMf7Yc3ObzFHVNXo7tTR16P55y97zysgu5pn0ZEnK
 d5Sp+FyM4FFGKqkm+8ZmSI1gBPgr6ML2kgGEEAAr7MQ8RCF/5Gm6JOUOcN3VOVzQmVJbr3VzTAug2
 0GOvH5bV0XnYpvRSek5zINcGYKiVw2k3e6hukzUm8VGuCwwqrDwxUn3BW609fD5IWfUoakZ2jQv2w
 zBnUd/Tv4tDB9tDMYqXjrVbjlT2BrLjJ9CDaFbO9Pe3qRJtZIt42aeH49glKudLaApRThjsW1PeT3
 AXE+CIxw==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vK3Tu-00009U-4m; Sat, 15 Nov 2025 00:45:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 diederik@cknow-tech.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration
 instead of use win_mask calculate used layers
Date: Sat, 15 Nov 2025 00:45:27 +0100
Message-ID: <176316391967.677170.7889906780839490279.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251112085024.2480111-1-andyshrk@163.com>
References: <20251112085024.2480111-1-andyshrk@163.com>
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


On Wed, 12 Nov 2025 16:50:23 +0800, Andy Yan wrote:
> When there are multiple Video Ports, and only one of them is working
> (for example, VP1 is working while VP0 is not), in this case, the
> win_mask of VP0 is 0. However, we have already set the port mux for VP0
> according to vp0->nlayers, and at the same time, in the OVL_LAYER_SEL
> register, there are windows will also be assigned to layers which will
> map to the inactive VPs. In this situation, vp0->win_mask is zero as it
> now working, it is more reliable to calculate the used layers based on
> the configuration of the OVL_LAYER_SEL register.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers
      commit: d3fe9aa495854f8d88c69c41a4b31e69424656ad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
