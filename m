Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A1673CCC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB8D10E96B;
	Thu, 19 Jan 2023 14:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAEA10E975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:51:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D2316199A;
 Thu, 19 Jan 2023 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF61EC433D2;
 Thu, 19 Jan 2023 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674139885;
 bh=xtZhu85yI1u7Kgj39/pnsqD82RG/N8l/7M+Kp1PAgpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RBFMKN/XsXhcnvYft01O0rVKCwHsEGq1kUf5T2rFoUby4h2rVxesIEP3fvbTajexh
 zoH0+uZk5FUlk5XemnYvlyXu17UGn4jOFBKqzetLSt47LztUzTly9OumOoX4j+R5NY
 +8I2VpBkFPS11MUI9j440mjNm1z2V0/+XW1ub5hpN++J8VjD1D3oGLXF5a7T1479vg
 81C6Xs1X79dvW7XUOBrRvLqKokcLUiD27D9RULp8pLy+mMs1B1daBOECXW678jvolK
 C3rHNTsted3bQa12R4b8OOogiDyrtTSUIWpyhMWkeZArPNzKe38Z7M3PeICPyajEvx
 MZQizlgN8HIew==
Date: Thu, 19 Jan 2023 14:51:19 +0000
From: Lee Jones <lee@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] backlight: ili922x: fix kernel-doc warnings
Message-ID: <Y8lY56324WB3Shlo@google.com>
References: <20230113064108.29172-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230113064108.29172-1-rdunlap@infradead.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Jan 2023, Randy Dunlap wrote:

> Convert comments for START_BYTE() and CHECK_FREQ_REG() macros into
> kernel-doc notation to avoid these kernel-doc warnings:
> 
> drivers/video/backlight/ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * START_BYTE(id, rs, rw)
> drivers/video/backlight/ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/video/backlight/ili922x.c |   24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
