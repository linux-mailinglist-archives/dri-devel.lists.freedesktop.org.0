Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928FAAFE989
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1C410E7E0;
	Wed,  9 Jul 2025 13:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bhzqrMYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6FD10E7E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:01:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41A3D4477B;
 Wed,  9 Jul 2025 13:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F5FC4CEF4;
 Wed,  9 Jul 2025 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752066099;
 bh=9CiQYJbM4mHCAINxqqFVjLp1AFAVtras+g0R0MqykTw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bhzqrMYyK3kcHzUVAlYLoU38aR60SJ95eMraK9p1rp8dkIJlcMvcw6CWU2ZzlrFXM
 W6RnzPyvZ3Xsm7uhwPdLknbXHhqhFk4iyqUd2e+XPr1clFuZ+Jxx9hhJVFNlMEqpVn
 dvS3c6s+GakhE6QnVknP4bDK1mGfhrTFRHgoSQ1zNzsQlo8Tdzj5tKx/yDuS03ykkw
 w+btKYNP2aiglXwZh2KOIS256QsNEr1DkVWaA+7+Oo4XCnXbXVwl6mTogsq40HRXwN
 RRHVOyhETgxYjUdyNIR9jouqqPofruuPSIYvI0ftDY4eGOUfIq9m3IVH6YQ2pw/hBz
 5oscMrUcsJ5Dw==
Message-ID: <cf3e500ce80951cbade17555a3f549c6@kernel.org>
Date: Wed, 09 Jul 2025 13:01:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 1/6] drm/panel/visionox-g2647fb105: Use refcounted
 allocation in place of devm_kzalloc()
In-Reply-To: <20250708-b4-simple-panel-api-convert-july-v1-1-630902123ea1@redhat.com>
References: <20250708-b4-simple-panel-api-convert-july-v1-1-630902123ea1@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
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

On Tue, 8 Jul 2025 15:35:13 -0500, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel. In the call to the new API, avoid using explicit type and use
> __typeof() for more type safety.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
