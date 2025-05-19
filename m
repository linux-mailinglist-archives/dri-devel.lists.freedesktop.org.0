Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811DABC86B
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 22:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1C10E58C;
	Mon, 19 May 2025 20:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="CuKCu/if";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665C910E4E4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=lgc1mOORiC8HFkaMdvW9xX85kqMLmkBHdBu/nZcEIx8=; b=CuKCu/ifSJ0H3i3LkowTpcIUGR
 1p+wk74pfLBfZ6I681e9iiZHymozFIxIdm4I5XWIydfQPhBezlHnJ1aiGNDQ/+dTd6suyukIPHeIb
 FjUGkxeDG+N8o1X+3+a65XmfoHEIqRKmK6Sam0qThY6WLLcxabf1FhbvEpARG0y7m4KlHFssZAF4b
 +qZFbsTkj4OIufdQynOkXdAZaSE+o0Yn+OnpScdcCS9dNWYqb+jB/S4pcuMFXsXfwnhwFOMvLl6zW
 3QTYo7PQzZT8eaF+XPLe3AqUghxTyuttxOQjNzL8Z9y3oBS+R9gvj+R194SlNOgY+mv6TIoV5WOB0
 GqdD5J6g==;
Received: from i53875bdb.versanet.de ([83.135.91.219]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uH79R-0001JQ-OP; Mon, 19 May 2025 22:31:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, andrzej.p@collabora.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
Date: Mon, 19 May 2025 22:31:45 +0200
Message-ID: <174768669421.2818279.4158433368328822949.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509031607.2542187-1-andyshrk@163.com>
References: <20250509031607.2542187-1-andyshrk@163.com>
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


On Fri, 09 May 2025 11:15:59 +0800, Andy Yan wrote:
> In the function drm_gem_fb_init_with_funcs, the framebuffer (fb)
> and its corresponding object ID have already been registered.
> 
> So we need to cleanup the drm framebuffer if the subsequent
> execution of drm_gem_fb_afbc_init fails.
> 
> Directly call drm_framebuffer_put to ensure that all fb related
> resources are cleanup.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
      commit: 099593a28138b48feea5be8ce700e5bc4565e31d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
