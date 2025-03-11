Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD9A5C72D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270C410E5BE;
	Tue, 11 Mar 2025 15:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DAqF6az2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557D810E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:31:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 607CEA45A43;
 Tue, 11 Mar 2025 15:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5D7C4CEE9;
 Tue, 11 Mar 2025 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741707115;
 bh=vBIIoUdY2jnOBh9TENywlRyR3Iz722r2sAB6WosjOnM=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=DAqF6az2NTDqpb/Y5Ff8KHol89GMopQ0aK8Vm/5zJ5e+IiedwLkZIr/NVPdy253aL
 34/s6P1LkOdmluMtDC3Y9Rb8hgULVO14tTzSr0hdmhAk0OvGtnrJDI+ZDci/SMgaiA
 dNo2FhiievmoQqg5Ux1GFWE6cwjNuhgZVb63zMbi0YKMnbo30Ne68Osne8+rMfbzgJ
 tdhGhwv7fFE49vjvXdbUU9RSYTSy9G2ophl9VSTsBJtoEdDrwEMf+gZqgepzE36lWl
 xI4i4R2X+xTLruIlFtquM/sDv/kfwe1XLDUgpHddv3Z5MhkiSHNwogwlo3bVg/b5uT
 p1mWDnEeOqN5w==
Message-ID: <8852bd6be2d3ddfb65d0ded2b1769d46@kernel.org>
Date: Tue, 11 Mar 2025 15:31:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v2 3/7] drm/connector: hdmi: Improve debug message for
 supported format
In-Reply-To: <20250311-hdmi-conn-yuv-v2-3-fbdb94f02562@collabora.com>
References: <20250311-hdmi-conn-yuv-v2-3-fbdb94f02562@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Tue, 11 Mar 2025 12:57:35 +0200, Cristian Ciocaltea wrote:
> Add the missing 'bpc' string to the debug message indicating the
> supported format identified within hdmi_try_format_bpc() helper.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
