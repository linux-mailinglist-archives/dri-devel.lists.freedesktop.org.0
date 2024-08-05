Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAABB947A5B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 13:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDE310E149;
	Mon,  5 Aug 2024 11:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bmuqOyl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD210E149
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 11:30:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DB9FFCE0AB6;
 Mon,  5 Aug 2024 11:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB450C32782;
 Mon,  5 Aug 2024 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722857416;
 bh=8Z1pSg25/Oj1kOS1VJAI/o4U3DsNumKOXI+5DUXr2U8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bmuqOyl/OZHd2e7fzJ8Yle2rThjupSzExrUP3BTo3fuqs7HDMTOV/KMVymyNt+F5+
 xvsg5XGekR8loCllKC/lymrO/P181NuFZoqRmZr7KyU1Og37jlHgP221NvmlOr3VGW
 UZKFQtv1N7xdW5CPP7GhfHbEwHzK5AGTUHp8ChuwXEtwLZZF3dlzGasnCj9htDqZ8i
 aLNvE19Og+JfvV75rP57zJjeOd18X3/6M39bIyOfZWzSrqShB6KFDkd2Ofhh+MvoHf
 yU9+zBw/kKv3GHhc7AHi/oyqPvP5uo+JDvEnttvK/Qoq0yCjufcBd0QWF/FuuQ3sc3
 V7wLjVSKum6Nw==
Message-ID: <fea441df060ae1ed802980782f3e3d5d@kernel.org>
Date: Mon, 05 Aug 2024 11:30:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Alex Bee" <knaerzche@gmail.com>
Subject: Re: [PATCH] drm/rockchip: inno-hdmi: Fix infoframe upload
In-Reply-To: <20240805110855.274140-2-knaerzche@gmail.com>
References: <20240805110855.274140-2-knaerzche@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andy
 Yan" <andy.yan@rock-chips.com>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Mon, 5 Aug 2024 13:08:56 +0200, Alex Bee wrote:
> HDMI analyser shows that the AVI infoframe is no being longer send.
> 
> The switch to the HDMI connector api should have used the frame content
> which is now given in the buffer parameter, but instead still uses the
> (now) empty and superfluous packed_frame variable.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
