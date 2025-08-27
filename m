Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16251B383C3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D7410E81B;
	Wed, 27 Aug 2025 13:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y+DEheKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E67A10E81B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:38:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D297240A96;
 Wed, 27 Aug 2025 13:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA97C4CEEB;
 Wed, 27 Aug 2025 13:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756301893;
 bh=ZvkD1iZHP8f7Zj7y83bmWIu90M9RBBdjGme4A0RgZV8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Y+DEheKbmvLXnafSi+/Ba4g6nC0gywuOxSiBbJmwzQl4ja3q2CBHU86Nl0Z/dmLrG
 gzeEdSh4b0vATLvDidVWE7K5/XKOAEmWkf2zCAeB1F+WNV1GDT4q0+2zw8TcTOAHs/
 XL5R8PsWSw9lf8KNmS8YGR4/bkk04yzW9+WyCapH8IjU4Bi49NZpIV0VHQixE5vrH5
 SZ0Mk42XaaunnWTwFPwqKreuMx6DqaD+0qwMVJit8qynDywQsPuriv8NSni/em+JfG
 ErZxu/LNU4pKaERgxkWAIu3dlXKpRioCJ/4BTKgOlbte4FDMMtWwNJvVxViJNSJqEy
 Xp30sRnrLxSsQ==
Message-ID: <56453203e188ecc563c58d6e9deedbce@kernel.org>
Date: Wed, 27 Aug 2025 13:38:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: adv7511: provide SPD and HDMI infoframes
In-Reply-To: <20250827-adv7511-infoframes-v1-1-f89b9690f89c@oss.qualcomm.com>
References: <20250827-adv7511-infoframes-v1-1-f89b9690f89c@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert
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

On Wed, 27 Aug 2025 16:29:04 +0300, Dmitry Baryshkov wrote:
> ADV75xx hardware supports sending SPD InfoFrame over the HDMI link. Also
> it provides support for two generic (Spare) InfoFrames. Use those
> capabilities to be able to send SPD and HDMI Vendor-Specific Infoframes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
