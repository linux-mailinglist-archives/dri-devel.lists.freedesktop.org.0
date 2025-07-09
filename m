Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F2AFE99D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BC610E7DE;
	Wed,  9 Jul 2025 13:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F1TyICAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4518010E7DE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:05:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C54A75C68B7;
 Wed,  9 Jul 2025 13:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2741FC4CEEF;
 Wed,  9 Jul 2025 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752066319;
 bh=Z7p+841eYGb4XxPknQoCYIPx6Qe5ZgqRD3mqnnq/HAI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=F1TyICAWgXYv2DYrJr4suF/35fGUquO1rd+Audoo2ieeq3HWK3NWWsovW5wPHVCLC
 FbYL/Q1pRYYHkk2F9+qaAmV13clIr3th+hJJE1yCUB31OVNaqMMv+j0D6KM1exPGcR
 Xbk1HzJClnRsxmKQ8DV6VndQYMxf20/NUE6fSGP5iiztzJa+nEl0Y+g27TqlKNSarc
 B++IhsaNpQV0vxR8OG6oQ97qPg9XS71FhsR9keelKtNlt4R4tK3GJvReZ6qLcXYMNK
 /hqDsAyocDB31YhA9z3Fy3Wi1ZCReGJE2YlidhWFezlZ7AH0M8v09QKtdnm9mMgnrx
 WTScCufpLeoRA==
Message-ID: <5538fbdd17113989bfee16b7e6587907@kernel.org>
Date: Wed, 09 Jul 2025 13:05:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 6/6] drm/panel/samsung-s6e63m0: Use refcounted
 allocation in place of devm_kzalloc()
In-Reply-To: <20250708-b4-simple-panel-api-convert-july-v1-6-630902123ea1@redhat.com>
References: <20250708-b4-simple-panel-api-convert-july-v1-6-630902123ea1@redhat.com>
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

On Tue, 8 Jul 2025 15:35:18 -0500, Anusha Srivatsa wrote:
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
