Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC6ACAB03
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003E410E4D1;
	Mon,  2 Jun 2025 09:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2BHSymk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836E710E4D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 09:00:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0D41A4FED3;
 Mon,  2 Jun 2025 09:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F469C4CEEB;
 Mon,  2 Jun 2025 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748854848;
 bh=0hBwvoxh3BG0lGW2hjquqO/cNNQ8t/KhdZFDOIIiOrM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=s2BHSymkg0sfbq1HuhUf/k2UUWXkEwRFYYSriQyrtIrYIoDGfV2kBrSzRGscBwpOe
 jMAUadFkWKIAV2EinZfU17LkVhQRs0RdFs7bduKhXoXJJap8xFcI8pTWp4+pOOTngb
 YvDy57+XIDyICTQE6hJyRCS7D6T9ysoe7+TsUTjv014BGO5lpAPzzwbE9UKhXwcnPh
 q7kENBmaoOgFUB+oqmyD/oyDCEy9KS9+3Idxfotmz+JcLRk9HTAu66pUJpaAyLL+5i
 j/5ztFLC9+iI2QMHn5/Jp/izTflVFJsPQ3iPJZ4dZBEBMdX3GFILXn8F4I0CJRKTY7
 LRWAfR3I6b8WQ==
Message-ID: <6423ca1050404aaa9ae3f9964ba98fc8@kernel.org>
Date: Mon, 02 Jun 2025 09:00:46 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 06/19] drm/connector: hdmi: Use YUV420 output format
 as an RGB fallback
In-Reply-To: <20250527-hdmi-conn-yuv-v5-6-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-6-74c9c4a8ac0c@collabora.com>
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

On Tue, 27 May 2025 15:11:14 +0300, Cristian Ciocaltea wrote:
> Try to make use of YUV420 when computing the best output format and
> RGB cannot be supported for any of the available color depths.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
