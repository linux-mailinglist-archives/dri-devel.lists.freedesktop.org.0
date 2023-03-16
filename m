Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFE6BD162
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9932710E229;
	Thu, 16 Mar 2023 13:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34810ECEB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:51:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EABDBB8219E;
 Thu, 16 Mar 2023 13:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC016C433D2;
 Thu, 16 Mar 2023 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678974676;
 bh=GKMOZkwRhkwO4hhXO1753J3aDhOKMxlPzOi8m0NOY1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VGSy+oIBY5KiJiItId6IIOS1h39A6HcA2LYrNnFVq+SI2QbozAqoYwW3kOQJNsWYs
 Tj0R8MJ0dlaRNXoHuL4mQZtE1O6zIwCdeJ0HsAXzQR4xR7akYG6ydtryIwVGCmU7Ug
 LUgRFImWA3dvJT3GW1Q292DfR65JN3aYBKJ2QQGzcSDH+1RL3XhK5jWmEHafzrlZjJ
 eDBdjEpFDORmPOfdGgMgvZQQrcOeXvHXHYAV8yiQ4bIEiGv2ocvptEkfgPPudyC2pS
 tPmONTnPfqLY/zH7QmKzfh/nsTJucj3ygZ/1ajyxc2mnoxJjeFoX66TXq+X97M+55r
 TVmB87XhzwOzw==
Date: Thu, 16 Mar 2023 13:51:11 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 10/13] backlight: pwm_bl: Convert to platform remove
 callback returning void
Message-ID: <20230316135111.GY9667@google.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-11-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-11-u.kleine-koenig@pengutronix.de>
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
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Mar 2023, Uwe Kleine-König wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/pwm_bl.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]
