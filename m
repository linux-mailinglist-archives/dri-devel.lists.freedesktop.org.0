Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECF707DCE
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 12:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE0010E04E;
	Thu, 18 May 2023 10:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9605810E04E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 10:15:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BA6661DA1;
 Thu, 18 May 2023 10:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57737C433EF;
 Thu, 18 May 2023 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684404950;
 bh=uBbt+WuNwyKBCJiUPk2UbCj3sGzTHUx1o8GlXmVog6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFOoiG43ev/5LiFXeTp54x5mxeSbp/84SkcrtrOYIGBZObh7KtuoIydPvoK4TOcHq
 DgIvjyxHRdkMZ2pgLWQU/wXRlt/J4mBaQmkF+soR6EmO0+hMhBRZOVxhQMUogQWduT
 K/3ISJbCnBAIyUq/yIhW7gjOJY9ldQD/D2G4Qt2nOC8y45LPDxdqdtyb4QfavU4j/a
 zdyTFgzW6DW0MWHcaNDRS4TeQ87VYPo9clOsrJKP8bm5AjVPnu6YObgc/E1B2vfkUR
 E88CMHM34+OOfpmTLvgX+azrr4oGis/3+njqdwJ3MGtIiOYIaS1fw2dDtyueHjQWsY
 ZIeSeGJ0dkMJg==
Date: Thu, 18 May 2023 11:15:45 +0100
From: Lee Jones <lee@kernel.org>
To: Maximilian Weigand <mweigand2017@gmail.com>
Subject: Re: [PATCH v2] backlight: lm3630a: turn off both led strings when
 display is blank
Message-ID: <20230518101545.GF404509@google.com>
References: <20230510085239.1253896-1-mweigand2017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230510085239.1253896-1-mweigand2017@gmail.com>
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
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maximilian Weigand <mweigand@mweigand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 May 2023, Maximilian Weigand wrote:

> From: Maximilian Weigand <mweigand@mweigand.net>
> 
> Use backlight_is_blank() to determine if the led strings should be turned
> off in the update_status() functions of both strings.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

I moved this tag to the correct place and ...

> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
> ---
> Changes in v2:
> - fix description, replace display_is_black() with backlight_is_black()
> - use backlight_get_brightness() instead of accessing the property
>   directly
> 
>  drivers/video/backlight/lm3630a_bl.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
