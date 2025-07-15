Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E121BB05419
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAC610E552;
	Tue, 15 Jul 2025 08:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="htZRJLiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA48F10E552
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:07:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1443458F6;
 Tue, 15 Jul 2025 08:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023EEC4CEE3;
 Tue, 15 Jul 2025 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752566857;
 bh=IJ4vJVHoZ+A6xVMcRw0Zf4dAFdsqiBrU3kVHgWvPuYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htZRJLivaxtpPEH4d94f9u9mOUMp/HiK891ycTswqvGWFZoetaf+9+L1onVGxwbEC
 Y3u561Mb0XK3qHcPTIeEmS3s27DRIVFqxB+635zY5bRrm4eHP3L9lsy5G44eoxyO0i
 5PVi96HGTi1axxBpFgA4Y2vdz3Yjb0WVIekTM2WNWNfSJ7Z/LefxI8xK5gzl4NzPPJ
 lacs4rGYCs3dozWT8GOUvwvYzCX04y/xKDtEn2IYghC4CKMayct73zxQAVOObTYCZk
 GihvAZpaGuCuSyhF/7ebPBly70AdBc5taq4Vse/inCEyMbOAxwHXyx4o9aVRZmg/G+
 SlmqwoJfIpeFA==
Date: Tue, 15 Jul 2025 10:07:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Yao <richard@scandent.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akshay Athalye <akshay@scandent.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 3/3] drm/panel: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0 support
Message-ID: <20250715-tasteful-thoughtful-aardwark-1c2550@krzk-bin>
References: <20250714221804.25691-1-richard@scandent.com>
 <20250714221804.25691-4-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714221804.25691-4-richard@scandent.com>
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

On Mon, Jul 14, 2025 at 06:18:01PM -0400, Richard Yao wrote:
> +static const struct ili9881c_desc txw700100s0_desc = {
> +	.init = txw700100s0_init,
> +	.init_length = ARRAY_SIZE(txw700100s0_init),
> +	.mode = &txw700100s0_default_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO,
> +	.lanes = 4,

So you did not resolve build failure report? You need to address it,
one way or another. Not just ignore.

Best regards,
Krzysztof

