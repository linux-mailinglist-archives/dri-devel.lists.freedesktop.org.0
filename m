Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62266BD4BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68C310E0C1;
	Thu, 16 Mar 2023 16:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D0210E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:11:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7EC0BB8226B;
 Thu, 16 Mar 2023 16:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5FCC433EF;
 Thu, 16 Mar 2023 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678983094;
 bh=nC6VwuGgll5uSPQd5tpYFf3GFAKQzNdtgYCYHTpYLHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ba2ft+wB5oW9cQF7bI+om0lBfb30omtA6QOLI8seIHdkmSwYAk3zZzasNrfYGG7U1
 cNg56lfiDCD5j2Ab35KdAACUPJJtIpsinjigC01v/HMcOAiHhXR5ZgRTm6Pi53IlBw
 prlFMCSDwD2/JKtsfGWM7OL+S0lSCO+eGUUvmh9YMBttxms6IFbbvfZs+RKrAPs1nj
 fdPIY46zBtj8JVoKg5r1nJftJVlyq1ZCLPaC6SNaLstAwCLKVB39sfz6EIjUQ/JeJ1
 yggE+GtBhtZ3+k7YJbxSLkp+CQWYlczWo6HaajPxfjEcz9gy6BZvvVjm+NU54YUXep
 gam3RomN4ULJw==
Date: Thu, 16 Mar 2023 16:11:29 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] backlight: lp855x: mark OF related data as maybe
 unused
Message-ID: <20230316161129.GQ9667@google.com>
References: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Mar 2023, Krzysztof Kozlowski wrote:

> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>
>   drivers/video/backlight/lp855x_bl.c:551:34: error: ‘lp855x_dt_ids’ defined but not used [-Werror=unused-const-variable=]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/video/backlight/lp855x_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

--
Lee Jones [李琼斯]
