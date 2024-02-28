Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30C86B35E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054B510EA0D;
	Wed, 28 Feb 2024 15:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nyAvpgaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F7C10EA0D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:40:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 84282618DC;
 Wed, 28 Feb 2024 15:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE28C43394;
 Wed, 28 Feb 2024 15:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709134836;
 bh=EdBXZWWZuhFQ2tBqeSWmQW8C9/3C6rfZGCgEINTeNPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nyAvpgawbjRhXN3/idGsieliKuBer1VZ4n5wUriSTJKwJKF5v4z6qteLWf9kwTt7S
 S3pjYTZZFoTyyx8U4OocIU5RbG8rpPhLwp3kEOnjggislmg9b8efSUJGaV0sOUmQUE
 hBYeEokykF1BjV5uWDsOYwM9UK0Ke1Mgr5TLXBeHwIgm37Wu+My+P/jWWcAOe/wlUx
 LkmgGkwW1txkgcjGcVCJEfNpUE3OPIr2DdJYtcCpIJY/fGzXsA+yKhGJurXVk6g/fk
 umk/ws+Zn43pmDM6KDbw6GKW8eof6L/aeqfuY/wwWb4TKxYekwi3QzvBappQ2F+nMR
 Nxkvw138GytBg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH v7 05/36] drm/tests: connector: Add tests for
 drmm_connector_init
Date: Wed, 28 Feb 2024 16:40:18 +0100
Message-ID: <170913481316.384117.11464006515273994691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-5-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-5-8f4af575fce2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 22 Feb 2024 19:13:51 +0100, Maxime Ripard wrote:
> drmm_connector_init is the preferred function to initialize a
> drm_connector structure. Let's add a bunch of unit tests for it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
