Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8105904D39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCD410E1D0;
	Wed, 12 Jun 2024 07:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VirQKIzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EDF10E216
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:55:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C39FDCE1F59;
 Wed, 12 Jun 2024 07:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9807C3277B;
 Wed, 12 Jun 2024 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718178957;
 bh=DPxfwqw32UzG01diDS0TG9qPWmDaaLhYilwUhVS25/U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VirQKIzA8Si2u5Y+WDCr4RAezIVKUHMUpfvmAWO+355t3/gJFJhOx/aYn76B1YhxI
 10g7HZOZPDB0tM0TluMfK2+dfkSk2QS8VX4E4n8giVfOL1e+t/80A4MecLKSUN1zlf
 gZ0EJf8ejdnv/CRDfzF77455pTOKcOJ1/ko4Q5Oag9Ei0+iJipkVJ6RvySp6cOckI3
 1Yx6SOzQUuy1gnfWcsX477iXngeuvysJMwCttLw379fx8TVrpiCLcqqWceZSmp1DHR
 1Yg3bSQzDAeubyP8sGzhUJrQUWMHasll26/gleJ3YAXyjtq6D3U4enIJ4UFRoG5kxE
 J+7fc5+qkCJyQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Smitha T Murthy <smitha.tmurthy@arm.com>, 
 Deepak Pandey <deepak.pandey@arm.com>
In-Reply-To: <20240610102056.40406-1-amjad.ouled-ameur@arm.com>
References: <20240610102056.40406-1-amjad.ouled-ameur@arm.com>
Subject: Re: (subset) [PATCH] drm/komeda: check for error-valued pointer
Message-Id: <171817895441.766399.8225643832267707150.b4-ty@kernel.org>
Date: Wed, 12 Jun 2024 09:55:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Mon, 10 Jun 2024 11:20:56 +0100, Amjad Ouled-Ameur wrote:
> komeda_pipeline_get_state() may return an error-valued pointer, thus
> check the pointer for negative or null value before dereferencing.
> 
> 

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

