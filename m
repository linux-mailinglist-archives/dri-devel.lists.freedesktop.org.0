Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A19A3DEF6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5D110E9A3;
	Thu, 20 Feb 2025 15:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nMVxTLt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BA210E9A3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:42:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B2496151F;
 Thu, 20 Feb 2025 15:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945BCC4CED1;
 Thu, 20 Feb 2025 15:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740066165;
 bh=R42UsajzAxka9fkfebAW2aXGR8HYWr7WW8nJOx8+3gI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nMVxTLt+JiavuSx9hPa3q4kWPq8sBb/J713N980RuC3btMmABShM9NI/ATGd6uywn
 /ojK8eLd88IMTbCCHBA3/5DbWOOf6SK7lmmPFo1SD/8Pe4AEPaaz7mCf0IeQjNXUxY
 BlAAu0Ab+bbGdHj6FACtHKk++z79WaVz5WcizI9LIQ+NBeDqsYMcB8flEQyWkPt7EQ
 MzluHIM1ze9YQ3FtsQ1xHoQWZgQ5peK/tF49aM7qqGngBBwXTqRj6zfw7Ri0Md3cCw
 4veFkaF8rGxapJjnvLlAXZiPTTJWsZws01oER38CV+yw8ljG4hD/bgVxbGO6V8BiyF
 GxL2CdKFXTw/Q==
Date: Thu, 20 Feb 2025 05:42:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add entry for DMEM cgroup controller
Message-ID: <Z7dNdKLxEDqxkNmJ@slm.duckdns.org>
References: <20250220140757.16823-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220140757.16823-1-dev@lankhorst.se>
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

On Thu, Feb 20, 2025 at 03:07:57PM +0100, Maarten Lankhorst wrote:
> The cgroups controller is currently maintained through the
> drm-misc tree, so lets add add Maxime Ripard, Natalie Vock
> and me as specific maintainers for dmem.
> 
> We keep the cgroup mailing list CC'd on all cgroup specific patches.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Natalie Vock <natalie.vock@gmx.de>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
