Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82BAB9CE3
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 15:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B71E10E162;
	Fri, 16 May 2025 13:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FJu47Bgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F093610E162
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 13:07:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 448FCA4E444;
 Fri, 16 May 2025 13:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4BDC4CEE4;
 Fri, 16 May 2025 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747400815;
 bh=8oSKT1zoGGaJt0Y1QF5tV3uqLZ+JpzchfT2QI3rX9+g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=FJu47Bgx0HDih+jvseKzeex5F1rU8xofJngFv5YOWafYRZc5/Sv9pH8wDVTvFEqmE
 7LoAsE1nhqwwohMadn031e1Oy9oGzAq+aA6yFln5JuKZtiZu+HBdyezKqrzKv8gtFe
 vyvlZgRFHtZP+1Sho062+czBW4hKZ1wxy60iuMrWSOoR3/VwwTfe0FcNJYsgsnjUne
 kbJbARNtskBawzkGTkkNhP9/y/ySs0xCwtVDfQfw8uFzdgkQ3TRN6PUX5SUBL7H3Mg
 q+70HYGf6We3EgK+2rIf5M1YdlxWnFB7E+8ctNdVHGfzD4kgRPv28el3rYCFnZwXBT
 VZtBDqNpVGVrQ==
Message-ID: <053e88b7f6416750e303480d996c3245@kernel.org>
Date: Fri, 16 May 2025 13:06:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 10/23] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
In-Reply-To: <20250425-hdmi-conn-yuv-v4-10-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-10-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:01 +0300, Cristian Ciocaltea wrote:
> After updating the code to make use of the new EDID setup helper,
> drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
> it.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
