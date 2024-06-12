Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD502904D40
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEC310E7BF;
	Wed, 12 Jun 2024 07:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OfEZzYgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F1F10E226
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:57:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 217C0CE17EA;
 Wed, 12 Jun 2024 07:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD37C3277B;
 Wed, 12 Jun 2024 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718179032;
 bh=XTVQR2ac1MYwS0u7pZMkc65E4iu25EWS1Jezi/Yis9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OfEZzYgiUcs4bCQ7UMjabqFtCV2bfe08l5NntE75U3iv6PWOwNe7n83BmeKNL42IF
 ING7PwvyamoidTtqZHSrlZl5Fz8gMISFnPZhSgGnz76PXOTUJ0qyLSGZW5gcAO9lSg
 XhQ+F89ISdvFZKux8dQ3Ga0A00xG5WmGBm3hwVcFgXLf+Qa1skICbR1ZGYoG8icTNi
 aTxPvVSGkjykcfimSXVSBw+1yElkDZj1dLMwp4ScMxgURsbc3lMMehei1segdzU2Dv
 YDZZbbBSG4PIe4Wrq8g/sEKijR3h//hrbhsAFemt8Bz9iPe6qIOKbzt0NCIcpstVRB
 6RMYA/9yt8u2g==
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: (subset) [PATCH v3] drm: renesas: shmobile: Call
 drm_atomic_helper_shutdown() at shutdown time
Date: Wed, 12 Jun 2024 09:57:00 +0200
Message-ID: <171817900322.766520.14073017611077959453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be>
References: <17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be>
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

On Wed, 12 Jun 2024 09:23:13 +0200, Geert Uytterhoeven wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_atomic_helper_shutdown() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
