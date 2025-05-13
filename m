Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B1AB5666
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE48710E5A7;
	Tue, 13 May 2025 13:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gCT+qWEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163BA10E5AD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:45:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3AFDEA4D896;
 Tue, 13 May 2025 13:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A84C4CEE4;
 Tue, 13 May 2025 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747143922;
 bh=wyi1K/mQRKcgeOduClrr92m+zGYgb865V9MDCljrAU0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gCT+qWEnhoVeMeiAsPNKDC9o504ET0alM79BTkA7vosEN30Qr4j2W3/vRpl2DIpR8
 NkVFsHs0N1kuaj66z3NhbKh4XMjq6Yq0+knkmc2kgfnc0inWWF7kEf8rftILt6SGXT
 ipYCxmXLV2ltwpqzh4HhwQXH5MbwJAThrAI7/xts2PbMLMhDy3OUQkmSk83qnRMcg3
 4pexeA7ETGmrsUBnoB/q2AFQz26V88AF2cwQjo1KMUowCahiMZk8eVVQ0+ZJEihaoE
 8gHK0TSAh6n3aiPG3mcxVrsLvtSJq3NuiV1lAzdfsbWg/Tu9g21Wbgflr+K5AiNQYO
 V3xGDIq9K+FFQ==
Message-ID: <5f8954e7cf2aa2e2d61588ecb15c4c4b@kernel.org>
Date: Tue, 13 May 2025 13:45:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID setup
In-Reply-To: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:26:59 +0300, Cristian Ciocaltea wrote:
> Factor out the HDMI connector initialization from
> drm_kunit_helper_connector_hdmi_init_funcs() into a common
> __connector_hdmi_init() function, while extending its functionality to
> allow setting custom (i.e. non-default) EDID data.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
