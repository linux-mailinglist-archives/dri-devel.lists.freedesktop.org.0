Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64CA73631
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDD810E91D;
	Thu, 27 Mar 2025 15:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FP71873K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC5610E923
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:59:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D6035C574C;
 Thu, 27 Mar 2025 15:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C63C4CEE5;
 Thu, 27 Mar 2025 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743091146;
 bh=Krm6CknLwx+iHmzOtIZuwzrkbo5KwtW3IeEEu7Mqyi0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=FP71873KpBim8kOOn4vFXqHw/Hv3OCydscKR8G8mNNSd04Yv9rzYWq0mIWAvvmE1j
 n/uJQUc1R197VOWk+fO2y91gtr8ZPxXudGgFrRJckpfwSt2GK3hvWaTmsmQqF1q3op
 rx1rLzhtZqthp93Av0cCyK5/m/AeLyWAFDdT5CvkI9n6MSUTzHN0grdQZZd486NxIZ
 yl5RFA30NuIjx6Bn0aJBGWmwcaJha+NEBENAeZja5KDGRv2FOZFt/BEqAdmBQyxPLR
 n3Q4kpHl5a+mh7Dq32L2rebXrJTAEB/IBniRkTgy3PRTntnw0f3qoHPtlsWdITqSj3
 xLmTqR3o4SQaw==
Message-ID: <d94d67e3a5fbaaa7291ef3358eb5bb35@kernel.org>
Date: Thu, 27 Mar 2025 15:59:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation
 in place of devm_kzalloc()
In-Reply-To: <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
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

On Thu, 27 Mar 2025 10:55:42 -0400, Anusha Srivatsa wrote:
> Start using the new helper that does the refcounted
> allocations.
> 
> v2: check error condition (Luca)
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
