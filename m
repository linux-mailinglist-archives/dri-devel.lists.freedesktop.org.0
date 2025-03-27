Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3838A73625
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DD410E915;
	Thu, 27 Mar 2025 15:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qf5prpwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437B210E915
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:57:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63DB3A4056A;
 Thu, 27 Mar 2025 15:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EDBC4CEDD;
 Thu, 27 Mar 2025 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743091046;
 bh=25owD1XDTgKtLuzWJ5a0mUHuBkKrhhZhpX4PXAMJu14=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Qf5prpwU1OpR3ttKNpREsJZKJVq8S+IkyqNc5eNvQey/XQqcUYZEBci8wlHo2evFX
 QU5vxXHbj2vxq7iCfjdLet0adbUdTO4z1mtJf6XllDwT3PH9I3NxUpNZZJxK42VA12
 ebspxJsFEXrQ9+DydPkSLPb0QadQfRhybaTQtVyYiRcnXeqd6yligKV+bp/dbWGQSi
 yw+QcZZl3rMZLpACjJohnsV6TzMfGDpS+mhszkhqPcdj0WXBYrKXNx74qXR/vJcMbs
 sQdeq0dk+/1tmw3UbCU7wmXGfe8UsAe31xzHl8rPplhKuHrLveZK852va+zXHX5Ix3
 SMfMnizC03O9Q==
Message-ID: <46fb8e315f68369ebec2d3f211edac94@kernel.org>
Date: Thu, 27 Mar 2025 15:57:23 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
In-Reply-To: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
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

On Thu, 27 Mar 2025 10:55:39 -0400, Anusha Srivatsa wrote:
> Introduce reference counted allocations for panels to avoid
> use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> to allocate a new refcounted panel. Followed the documentation for
> drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> implementations for this purpose.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
