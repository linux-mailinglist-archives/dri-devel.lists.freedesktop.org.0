Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A4907700
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 17:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6582410E00B;
	Thu, 13 Jun 2024 15:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DekLwn8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A2810E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:40:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EAA6161BC4;
 Thu, 13 Jun 2024 15:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A279C4AF4D;
 Thu, 13 Jun 2024 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718293223;
 bh=bA3t750aLVe9+kIvYa78qWA/d7Nucom/3lQQGHdYrOI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DekLwn8JNT4JQ5q8mjiYg5MEqhVrqr8EX0gHPo/9Foy15v21VeCsBRf6g44VmHFaZ
 FuUS4dk9vhT0HG8Kqbmuu61WjrB+oiAaD1rMaY+OjNobK4smH1K8IDKgF0/8yfqMVA
 yPF0kAOJJ0i+gOXOGLoFJZFO5Qry+z8OMNS1adDhiOC1I98jJh25UtNwSAm9UK+5ij
 pXjX0z5NdJa14su4CU9Jf6Wn+MZUaLStoiwrijiS2XMdT6Morcm+yoGShbUN8BnL3L
 sCtZjDrnSzS5wFwQ195mGSQAe6UnSMlaP3e4tjKQmoNxb4sq3k7m9sxK0hUSc9ZAm8
 tJEKXP74llFAg==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 sui.jingfeng@linux.dev, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, a-bhatia1@ti.com, dri-devel@lists.freedesktop.org
In-Reply-To: <20240613083805.439337-1-j-choudhary@ti.com>
References: <20240613083805.439337-1-j-choudhary@ti.com>
Subject: Re: [PATCH v5 0/3] SII902X HDMI Bridge fixups
Message-Id: <171829322089.1494794.15521482935825350505.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:40:20 +0200
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

On Thu, 13 Jun 2024 14:08:02 +0530, Jayesh Choudhary wrote:
> - Move the mode_valid hook to drm_bridge_funcs structure to take care
>   of the case when the encoder attaches the bridge chain with the
>   DRM_BRIDGE_ATTACH_NO_CONNECTOR flag in which case, the connector is
>   not initialized in the bridge's attach call and mode_valid is not
>   called.
> 
> - Also add this check to the atomic_check call as suggested by Maxime in
>   v1 patch.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

