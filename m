Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28243C1FE0E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 12:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B9910E145;
	Thu, 30 Oct 2025 11:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SJ4psI5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC96D10E145
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:50:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E88FF60459;
 Thu, 30 Oct 2025 11:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D596C4CEF1;
 Thu, 30 Oct 2025 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761825004;
 bh=moMPcJsHoh+D5tFeCvN/Eh1IJ6XaSFfSJQcEu0+Vvog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJ4psI5MuXqxCO245p9pGERpCQi5pHOVlT7DSYUE/R4AZa/VnB170AnM6D47963zL
 H7ilQkhTy9xoyz/JbV1n9FQzp2hjWkNHqtj1iq8zRYPg+BIefMMJetoKH80QG1JmnO
 JT+xhsXNTO53e95Gq/dgJyvDnQ9ICtITcXrSi5WiIfRBykNaMFHlUTWFqbKizHDtd2
 TAD1nYg1xr1HDhsI1Zvt9UTUGTWGoU1wvjHAlFGpAVPuK47N3Z20abhOA9xA28jVVK
 O6Bmr69H7I5bVwYirMdP7n7ALFwT9pMEWTetRVwDQUnd4s1k5MflOTV+ZtM2AX9qC4
 LTOXGvLmfxt6A==
Date: Thu, 30 Oct 2025 11:51:07 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Pengutronix <kernel@pengutronix.de>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <aQNRK5ksNDMMve0x@aspen.lan>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
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

On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
> Currently when calling pwm_apply_might_sleep in the probe routine
> the pwm will be configured with an not fully defined state.
>
> The duty_cycle is not yet set in that moment. There is a final
> backlight_update_status call that will have a properly setup state.
> However this change in the backlight can create a short flicker if the
> backlight was already preinitialised.
>
> We fix the flicker by moving the pwm_apply after the default duty_cycle
> can be calculated.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
