Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4688E709
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F1910FD72;
	Wed, 27 Mar 2024 14:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G/+zYEUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B28410FD7D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 14:47:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D2716CE169E;
 Wed, 27 Mar 2024 14:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663D8C433C7;
 Wed, 27 Mar 2024 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711550858;
 bh=wdtVqbVIEGdHY/OZHy307yQ0kmARv1BuTL6ACiPT0Xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G/+zYEUOOu8gk+98NtaOlB1nxHj3TNkGPCO9rFI0e9fYcdMyD2ICJJRABjGt8jw4Q
 KZxFPG08PkglD9gtjsE8nrMn2z6D6kLiSsvq0whLk8wQ2eTc/cpZ+Lgx9J7LY2gl0W
 kd4jb/2gQRSJTs2QI2I6sNikSHCyrfnIVjCBAfoQaUlAbsJTTCVQCKZQaAYnZ/7YLC
 zW93e00Yj0G7Rt+RI3uEP1367e2fOXQeb4OCvVsnjs0C2Lq6ev+IZYHDpCcCIzo8FG
 wxG2sObOMpGILCQ0akw9xyWcJRmUYxzTRXwIBF7AkYK/4cLTDklvv1sDKchntCQcN1
 eUCEe8llwpsAA==
Date: Wed, 27 Mar 2024 14:47:33 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2] backlight: lp8788: Drop support for platform data
Message-ID: <20240327144733.GV13211@google.com>
References: <20240314113529.923708-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314113529.923708-2-u.kleine-koenig@pengutronix.de>
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

On Thu, 14 Mar 2024, Uwe Kleine-König wrote:

> The backlight driver supports getting passed platform data. However this
> isn't used. This allows to remove quite some dead code from the driver
> because bl->pdata is always NULL, and so bl->mode is always
> LP8788_BL_REGISTER_ONLY.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1 archived at
> https://lkml.kernel.org/20240313124828.861731-2-u.kleine-koenig@pengutronix.de:
> 
>  - Also drop struct pwm_device *pwm member from struct lp8788_bl
> 
> I'm surprised that this didn't fail to compile ...
> 
> Best regards
> Uwe
> 
>  drivers/video/backlight/lp8788_bl.c | 151 ++--------------------------
>  include/linux/mfd/lp8788.h          |  36 -------
>  2 files changed, 8 insertions(+), 179 deletions(-)

Does not apply.

Please rebase onto v6.9-rc1 or for-backlight-next.

-- 
Lee Jones [李琼斯]
