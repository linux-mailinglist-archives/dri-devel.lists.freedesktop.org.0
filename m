Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F1AFE150
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE5510E750;
	Wed,  9 Jul 2025 07:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cqA8CTtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E0910E750
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:30:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C47D746931;
 Wed,  9 Jul 2025 07:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D779C4CEF1;
 Wed,  9 Jul 2025 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752046239;
 bh=/vwN5BWjTGOjFPP3j3cXPN3r/Q9oFqRrwLR4WmpHrDk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=cqA8CTtN9wSJ9EH6zpZU0iBEWTL5PfNeFx2yPUqPdDKCiSL9/kUE0EnW2F9rcBl7T
 D7YB3REFVtw3KggdfwfrsGhP4cIboaJFKPpRPtwOwNAoc0w5vjEpf7ZPy3FVtGLlzF
 KYHh1bs7LYg47rE/Dq74B/I9GuBk2c8S6abYlhCc2x/MdnULXw0GvF04UQb8gsCX8Q
 4W6q6soEqQu5mSN4wOoXEYNvHL55AzQBZY5KEE+DC69yDWd/o5OpanZRu7EYmiiKJe
 mjB7iUbbIsXareDyyIhIypP9WQ+16jcb9tmlhQeGNoRY2l9vQ0og4qWoqExvgtOqUZ
 6c3n2U6ssLvCg==
Message-ID: <c3fe3daf0a1e91d6ed8153a3a043eb5f@kernel.org>
Date: Wed, 09 Jul 2025 07:30:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/2] drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
In-Reply-To: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-1-6285de8c3759@bootlin.com>
References: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-1-6285de8c3759@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "David Airlie" <airlied@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 8 Jul 2025 17:24:42 +0200, Luca Ceresoli wrote:
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
> 
> This driver was missed during the automated conversion in commit
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
