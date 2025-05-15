Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B48AB8ACB
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D656F10E8F0;
	Thu, 15 May 2025 15:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VXlvOBAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4A010E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:35:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D0224A132;
 Thu, 15 May 2025 15:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4523C4CEEB;
 Thu, 15 May 2025 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747323318;
 bh=yIaYdnGb7FH8ol9fW1bB3l/X9nzS/lpn74RtpMpyRJE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=VXlvOBAiNA4eHrsJ56/TwfpgR2HV7028rjPhztE3H3UWXoFAeoCHsUA3oRcm9BJWY
 tH2Xo5z2VbDUD6FBMxOCnE+rQx6L+etAzFc7ju7ZYy8tnHNW9U/706D6c+W/aQXhLP
 SejnmY9kpz3134sldcC/QJRXHVaruFXswXsEYZcgp7JOU+OirARa4OhCbAVdJhJK/x
 aKeLzmwHxN2MBDMyRrr/5zkI40eT4n9l1QPSqus8WuxjJUuHfH+hxEPKH4SJEI9cnY
 lxWB7DVoJ5ju5y8U5MRVGi8e89rU9guWBDAkBxTleeK+l3MTF5DRKTRmOFdGekZJCu
 On/ZXHvuiCOuQ==
Message-ID: <b31473af5e37f9bccb3d6348ba63276c@kernel.org>
Date: Thu, 15 May 2025 15:35:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 09/23] drm/tests: hdmi: Replace open coded EDID setup
In-Reply-To: <20250425-hdmi-conn-yuv-v4-9-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-9-5e55e2aaa3fa@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona
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

On Fri, 25 Apr 2025 13:27:00 +0300, Cristian Ciocaltea wrote:
> Make use of the recently introduced macros to reduce boilerplate code
> around EDID setup. This also helps dropping the redundant calls to
> set_connector_edid().
> 
> No functional changes intended.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
