Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D3A8215D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 11:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A56210E82C;
	Wed,  9 Apr 2025 09:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q31xA2U4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A8510E82C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 09:53:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9A8168432;
 Wed,  9 Apr 2025 09:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CA8C4CEE7;
 Wed,  9 Apr 2025 09:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744192414;
 bh=3cQPyIkae8cWLjjEcRpQg8NmLh8Vkl6t2hjPRg3q/ZM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Q31xA2U4aNO/OXoCFbd/1rLSQ4CkT2fP6yI6o4fHsLS/jrb4FLDTkUgJLxeXjA5yi
 qd7Y1Rz4PXljUDs3yEiYer5OQ4nq9POm0iAfhj28JYo0wlkS2SxyhfuRrjPgYftgK6
 xovTGdOaSh0HU7bLNO8WyVaQXkH9ba8ox/25FOyJl+H6/NmF48D+uM3BuL+l3ExmCW
 t7X30skUtS3AtemVMAFClqhO9StVb/2EvSZN4AZwIZoqo+VhXYVKplJ2lOqka3Rg57
 pc9VL0Ne38kfpl3TJjSGdSSeq6JKiyUwQqKGEE7+dFEV9blDInSiPzwCIcPRwahvHs
 750+ZgtBG+mSA==
Message-ID: <92a0ae4b84b47e6bb3a0cef0d051ae53@kernel.org>
Date: Wed, 09 Apr 2025 09:53:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
In-Reply-To: <20250409061543.311184-2-vignesh.raman@collabora.com>
References: <20250409061543.311184-2-vignesh.raman@collabora.com>
Cc: airlied@gmail.com, daniel@fooishbar.org, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com,
 helen.fornazier@gmail.com, linux-kernel@vger.kernel.org, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 quic_abhinavk@quicinc.com, robdclark@gmail.com,
 sergi.blanch.torne@collabora.com, simona.vetter@ffwll.ch, tzimmermann@suse.de,
 valentine.burley@collabora.com, "Maxime Ripard" <mripard@kernel.org>
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

On Wed, 9 Apr 2025 11:45:38 +0530, Vignesh Raman wrote:
> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> exit with a non-zero error code while configuring them as warning in
> the GitLab CI pipeline.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
