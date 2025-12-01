Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F367C98339
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB8789CA4;
	Mon,  1 Dec 2025 16:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VYIvbo3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E1289CA4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 16:15:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 442A143A23;
 Mon,  1 Dec 2025 16:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79C3C4CEF1;
 Mon,  1 Dec 2025 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764605759;
 bh=KMpNii9f1ysxkehwWWbCSPq9fB5hHf3WRe2rpemaKNQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=VYIvbo3ZIIexTpOO8p3DxitBrcyDdPAGFgD0rKeooEiuv263cHykr5qHXXyLnb+QB
 FbqpdNZmFJiFD+EJr5ehGvL+gQ8mcbAOOJWrLCRngPiOaXIKPy46W0iEy+EW4loSA0
 ZBpmc2NzTpfWeB8oGTVQ/vS7pkTvOhUw8YD/A7JYj+r803ZiZPvLqHz0IVtpM5fy4F
 rLa8OoFhfe+ts3nazq7wHwaPrPy4loKyi23AvRS8KSgHosEQ3GNE6F5/1aX9BbLGho
 vdHpKYTXbo+0/s4r923Y0NdOyzZEfxzo34SIGUI16w7dr0O+dWxwt5osjlxMq7dpsV
 0/I8uLx7V/Phw==
Message-ID: <3fefc78f97adc63c7ce6526049e58133@kernel.org>
Date: Mon, 01 Dec 2025 16:15:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v5 1/3] drm/atomic-helper: Export and namespace some
 functions
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-1-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-1-aed71a32981d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 "Aradhya
 Bhatia" <a-bhatia1@ti.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Vasut" <marek.vasut+renesas@mailbox.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
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

On Sun, 30 Nov 2025 13:11:17 +0100, Linus Walleij wrote:
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
> 
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
