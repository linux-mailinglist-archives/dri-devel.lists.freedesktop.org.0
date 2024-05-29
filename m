Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049848D308A
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9B410E129;
	Wed, 29 May 2024 08:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tx+KOvRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C3210E129
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:15:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A0821CE1694;
 Wed, 29 May 2024 08:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D55CC2BD10;
 Wed, 29 May 2024 08:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716970497;
 bh=VC3UjXI7D2G5dkdKB4ixGWaOkNC91j2qxxfpHj0I+yU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tx+KOvRItmznAA71Avs5DwY44fe2yPt29leoRRqRTA3csOy+xLJehhPlyqGoJSkKF
 sVjR805K5TGH549zF3RpmWA6P68CXQQGYi+6L/m8U3b5kPqsl93zdFfvG+xEmDXnyy
 1q7Nmtalcpp/KaUL398jAy+0x0VCiKzN0X0HIWx/Iwmg3nNdMz5d5xqGK02UompfzI
 Arwv50o12BVznhGs/FGQPxuQnfiC+5FArM7/A+eOxqdvFk7/uivItCm1fb02i57ty5
 qHMXUeZG5jDVEQ1zkdcpq2NUn8i+uBd1l5EPX6etU6suYptft92gbcPk828zcowSOw
 6ngHrZImYeikQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, kernel test robot <lkp@intel.com>
In-Reply-To: <20240528151056.2104153-1-mripard@kernel.org>
References: <20240528151056.2104153-1-mripard@kernel.org>
Subject: Re: [PATCH] drm/sun4i: Fix compilation error
Message-Id: <171697049522.2533828.193549550194715590.b4-ty@kernel.org>
Date: Wed, 29 May 2024 10:14:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Tue, 28 May 2024 17:10:56 +0200, Maxime Ripard wrote:
> Commit ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
> introduced a dependency that got renamed in a previous version, but
> wasn't properly updated in that driver. Fix the name of the function.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

