Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D453710AE4
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BE310E059;
	Thu, 25 May 2023 11:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F0110E059
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:28:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DEAA6394F;
 Thu, 25 May 2023 11:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A968C433D2;
 Thu, 25 May 2023 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685014108;
 bh=80WjExu69YZ2z4Yx+TkUK0wPnz4HeaoTG1bwDpjeRRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlD8ees5bAkKLqFjBq3iW6EmUYXa30dyvHZGzMelEuKFDt3HVxCS7ZhSpNAjfsNrO
 vvnfts2gv5AnkHr+gMbXj2yNp1brxD+qLu3jcIq5xt3Og8KApYozFl8UWN1oDLWi2+
 D4R1yvBvWN+4Yb4KMgJ6hxDiJqv+cY0fht6hV62oPJaCxHNP+uIqwah6ySmb0MeN+Z
 xQxtzcCzQHOSBXrNDTbgViXxAUWA7DWQQKkPiAO/CIIDq9KoBaHuKX0FKRdlOVaX+r
 mllGzWqvSch7UE14Rt/J0r9+XZ+bvQO1gOfOEbgnaTVfmFud2OYhWOmOajqwwdsCRs
 xTXPRsLXo0Zjw==
Date: Thu, 25 May 2023 12:28:23 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] backlight: pwm_bl: Remove unneeded checks for valid GPIOs
Message-ID: <20230525112823.GB423913@google.com>
References: <00be8237e0e2bc9b179177b5490f175d657261a2.1684856337.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00be8237e0e2bc9b179177b5490f175d657261a2.1684856337.git.geert+renesas@glider.be>
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
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023, Geert Uytterhoeven wrote:

> All of gpiod_set_value_cansleep() and gpiod_direction_output() handle
> NULL GPIO pointers just fine, so there is no need to check for that in
> the caller.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/video/backlight/pwm_bl.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
