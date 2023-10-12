Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193A7C69B0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980F510E471;
	Thu, 12 Oct 2023 09:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286EF10E471
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:32:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 798E861AD8;
 Thu, 12 Oct 2023 09:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00447C433C9;
 Thu, 12 Oct 2023 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697103129;
 bh=AxnUIDA/e9qLgCAiZD8tmnZjwfIJgA9SE3BJ38gxlj0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qp2LYErre2QxrdDzNBioN4uiVWPGAUp15Nl76JtJIahmNjk0Kf+bcPdT/BCsqJZtS
 Eclf7huwILdvxAU2VV0Q+9sbFpJYik2looPgWoF0f+jhk3tGcL0aY/evXGR8FyyswX
 4/rY0VGGnirVtJGBUzfXEtIaGH2yUO41PfXBv99m+whYHwyCECIUdtdW0ybcOFos8v
 p/BUwzHPaM+PD7IcnRYbOG+02wY8cvEIP13k810T0RfKu2nouSB711IZU2m377sOow
 JGb+5AVkFS7wxC86dq7sDAiqcMoHY9tZ10q8RWjY8UjYcVWwxOH94IVhzUZaftiljY
 FQYvCVI6SLyOw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009093223.227286-1-u.kleine-koenig@pengutronix.de>
References: <20231009093223.227286-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4] backlight: pwm_bl: Disable PWM on shutdown, suspend
 and remove
Message-Id: <169710312672.1151305.17287126942774002014.b4-ty@kernel.org>
Date: Thu, 12 Oct 2023 10:32:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 Oct 2023 11:32:23 +0200, Uwe Kleine-König wrote:
> Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> the PWM any more. However this is necessary to suspend because PWM
> drivers usually refuse to suspend if they are still enabled.
> 
> Also adapt shutdown and remove callbacks to disable the PWM for similar
> reasons.
> 
> [...]

Applied, thanks!

[1/1] backlight: pwm_bl: Disable PWM on shutdown, suspend and remove
      commit: 40da4737717b252fd01d92ff38d3b95a491167cc

--
Lee Jones [李琼斯]

