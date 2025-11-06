Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4614C3CA91
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDD910E987;
	Thu,  6 Nov 2025 16:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RQiUFSZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6DB10E987
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 16:59:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E89F43619;
 Thu,  6 Nov 2025 16:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DA6C116C6;
 Thu,  6 Nov 2025 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762448352;
 bh=snXPP2sPZlmwx9IoETc7vmai7mDjCry6M8ACC/gwYNI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RQiUFSZO7/QYncXJmZBRx8p0ksrpFY9UIbQeVlQC51Vea6u2Z6tiP4bxPv7CPT9Jw
 4jFx3C1xwNnfOoaWobWvvu3bNHIzzdIBefPkAgLg/lc6z5MLZ4huiiK1ozZO1/r0Ce
 Rl+NanvmpPu2eNPtLh+p8+HRbAWJ9MRlKz9rTYptV9vpnfwztVmxBsQxq5WNFEwEBZ
 dc9tVrfNnh3jFKmFLyNYje3sZrNpPtKf480rykGJ2DBlBQKTC7wyiGldPmrbD4G3T3
 27nTDDSbhrH1qttQJ3Mf/xHGQv5xyufINHRjqsZrGFem6x2EBtJXXuAd3qZ5/8Xbr9
 TIwh4Irf+32vA==
From: Lee Jones <lee@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Pengutronix <kernel@pengutronix.de>, linux-pwm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
Subject: Re: (subset) [PATCH] backlight: pwm_bl: apply the initial
 backlight state with sane defaults
Message-Id: <176244834994.1961871.13787969990090168625.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:59:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Thu, 31 Jul 2025 10:47:18 +0200, Michael Grzeschik wrote:
> Currently when calling pwm_apply_might_sleep in the probe routine
> the pwm will be configured with an not fully defined state.
> 
> The duty_cycle is not yet set in that moment. There is a final
> backlight_update_status call that will have a properly setup state.
> However this change in the backlight can create a short flicker if the
> backlight was already preinitialised.
> 
> [...]

Applied, thanks!

[1/1] backlight: pwm_bl: apply the initial backlight state with sane defaults
      commit: c596a53cb0c607ccff34aac30ada774aa28b7dc0

--
Lee Jones [李琼斯]

