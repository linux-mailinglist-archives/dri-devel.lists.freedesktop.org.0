Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B95A88641
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593C010E60C;
	Mon, 14 Apr 2025 15:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+2r/FEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1D410E60C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 15:05:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4421C5C56D2;
 Mon, 14 Apr 2025 15:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA81C4CEE2;
 Mon, 14 Apr 2025 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744643107;
 bh=Je/04BYunCBJyCO6JqJ32/u1fHw2UcgBh6bgtkxZqoo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=E+2r/FElhiDqHQYxEWKEcjz1d5Au0GeWyBZVejfDh+QKo7pSurp4twDj+g7b+3tnJ
 G2ylvjTLBurENn4z5lIUf9gk+MNbuOPHOmeDqidiQDp1c5MW5J7NcoDcKyL08Tdqf/
 oQZXcaQ00F20WDLbpoLRyJHve2Ml3FmSojDWClLb8TEZrlDVN0Ir3MGxCE9nQybMqp
 hYIqTKlGyhzbEtqJIcXHvOYKI/3j0D3CZzZRUvLelXMvtIOddfzBc6GIO5JCdOe6wx
 Ki9dAjWaoJ1rn8nFVjdkEXCx6mIosQG+Xyo190Vrea2PK6+eQuPR1USkGwQwgyqdex
 oJ3uXOQJmLuaA==
Message-ID: <b11aaa3ca9e2273441124800bbda1f52@kernel.org>
Date: Mon, 14 Apr 2025 15:05:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/11] drm/display: bridge-connector: handle CEC
 adapters
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-10-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-10-04809b10d206@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Mon, 7 Apr 2025 18:11:07 +0300, Dmitry Baryshkov wrote:
> Implement necessary glue code to let DRM bridge drivers to implement CEC
> adapters support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
