Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5C62D9F4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADCC10E0E9;
	Thu, 17 Nov 2022 11:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AA210E5EA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:54:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C56A56126C;
 Thu, 17 Nov 2022 11:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69110C433D6;
 Thu, 17 Nov 2022 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668686097;
 bh=WX1FWx2cF2AM6qxLI/JRI3DYphuxTC736SeVco5ArOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcpxXSpU/6MGdIy4/UdvTwVesfdFJVIvX6SASQZT5tQM/KAQsk85zm7H0/fAizZYX
 w/jVFYK12QJZnNTUY6lQAo4wyo32XRQFNI2ul1/XBUbGdEj8AW5wdxBfPgaqasCbCK
 n+nCHTy3yjEnj8etlVFnL2uKE4oE3scLyDJhIhYdVn45Swl3tI50V/SKSLc8Jc3+Uh
 P7+iIIBRJZb/sFrDE8KDDn84kEA/PoturCLKlO1RX0lqnONRY32fJWLKUSjg4rep9o
 rMAiyMB4s+Evij0XT01fzNkplXD9561TaDtKOcwTot3iofbxH5UvqHj/AtzD2ajC9G
 5hr5yz1clrsIw==
Date: Thu, 17 Nov 2022 11:54:52 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Drop support for legacy PWM probing
Message-ID: <Y3YhDLwOSEQoSWrb@google.com>
References: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Nov 2022, Uwe Kleine-König wrote:

> There is no in-tree user left which relies on legacy probing. So drop
> support for it which removes another user of the deprecated
> pwm_request() function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/pwm_bl.c | 12 ------------
>  include/linux/pwm_backlight.h    |  1 -
>  2 files changed, 13 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
