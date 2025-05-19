Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BFABB61C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F0010E1B6;
	Mon, 19 May 2025 07:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DlMYPq2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D44B10E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:23:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0ED92A43611;
 Mon, 19 May 2025 07:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F95C4CEE4;
 Mon, 19 May 2025 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747639410;
 bh=SHc0Nb1St8jt+FbVbFJo4ZDsCFKIWSKrtl56Bf8Qa9M=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=DlMYPq2odZFjGkfdqR6pIpKSlqASYxR+dpTCDkIpB1ipKwpjwGwmf03DLkaIqBxFf
 Qjy56bWZdYOC8nDoMGs+2NKU6Q8E/lfELZOs8/w5cbXx35EZvC3C+0oqdnTcy3Cs/C
 ef3f34mJxw8U6mHUAR10S6o/MqTzOHmjfcJJbcQvrJb/F/JVOGKSSDDeJmsGXbm3a1
 PDCDIy4ph/xidYJe/oxPP5q/Aa8EdzbnKYY1dvmnAKGGzw63CWvjg8iv97n+dpihkh
 ls6RUctIt/2p1hZPb9FkhE/3946TgPd1JB31/ThM5sonvnKs+oUyfOLq3S0WpnR3JS
 iO0QqoMaKllvA==
Message-ID: <820007abbd94a483350ffe0023b58043@kernel.org>
Date: Mon, 19 May 2025 07:23:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 16/23] drm/tests: hdmi: Switch to
 drm_atomic_get_new_connector_state() where possible
In-Reply-To: <20250425-hdmi-conn-yuv-v4-16-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-16-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:07 +0300, Cristian Ciocaltea wrote:
> Replace the calls to drm_atomic_get_connector_state() with
> drm_atomic_get_new_connector_state() for cases which do not require
> allocating the connector state, e.g. after drm_atomic_check_only() when
> the intent is to only read the new connector state.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
