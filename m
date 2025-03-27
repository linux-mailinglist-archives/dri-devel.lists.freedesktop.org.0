Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D7A7362F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3D10E918;
	Thu, 27 Mar 2025 15:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qXp7GcCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45A510E918
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4639CA42C21;
 Thu, 27 Mar 2025 15:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2252CC4CEDD;
 Thu, 27 Mar 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743091135;
 bh=pbYDjAvFxfxYjSsyWNc3U0OkBb1vljVHhfPna0F5/CU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=qXp7GcCBhiEhqVw/470D400rKFS4IAGASJhIduIstfzFVGPi3lo+wKbxvVHZ/A8wb
 V5YSDNrqAwvWrDuerZRuxtY8bMD89AiQD7Y+GPplLM5hgR//zTWS4yJiN56wuva6eW
 zQBYLYFg3ziCcwYdyp/rfQmgtfnuwKPLrqHW+TRuuBfbYFDDhPvD+ph032gvtH9bnc
 NBPkbC7PPouWVG8ucDmqUUh2mpFY5HGi5gfG9aKvQq6biPXPMBniBD3bI0tBj0EipA
 oou6rWIiHcYAomMrhb1+/XP0NJckPEIVDD2cj4g5qevZ4TXu+yhmeQSWRW/ayJuBVy
 skXD6Yrrg2ntw==
Message-ID: <6515c8cba3cbc66d0b93deea3e4b45a5@kernel.org>
Date: Thu, 27 Mar 2025 15:58:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 3/4] drm/panel: deprecate old-style panel allocation
In-Reply-To: <20250327-b4-panel-refcounting-v2-3-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-3-b5f5ca551f95@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 27 Mar 2025 10:55:41 -0400, Anusha Srivatsa wrote:
> Start moving to the new refcounted allocations using
> the new API devm_drm_panel_alloc(). Deprecate any other
> allocation.
> 
> v2: make the documentation changes in v1 more precise (Maxime)
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
