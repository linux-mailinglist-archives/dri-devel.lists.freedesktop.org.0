Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C87668B2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E482510E6BC;
	Fri, 28 Jul 2023 09:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31B10E6BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:22:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF4176208B;
 Fri, 28 Jul 2023 09:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FD8C433C9;
 Fri, 28 Jul 2023 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690536174;
 bh=AL6UUgG3FZVUbTmbZ9j5ob/iwxMoLlBtI6VOTuk7L3Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kV/4SwJSDxGPIFO9SqzBTr/WKfLl3fbG9+JtdkQ5g68+3qG+FbBQhGQhgyXFRxeuF
 x2TzzXv2KahqFkWG4DpisftoqyieCHUe/aScTwjmOLzH4trlPzjWGjVOgIAdBXCLZz
 cv3q4MTA/ZbxPvumqXarQGAB3+GV9C8T1M2xgDCgX7JWQy31xH5NGc7VSRUpHBgIBU
 FoALgxCfhFHAQcDe1SiRqZGt9BI2mvzCopjpifgAWFDuwOSwn2VPcyFBZS/bBt9s4B
 Y1xidOeK7t6p+21I5G+vW8zX7mbUs9WyPYsD8qBg/kESFYAs8FWgKC+o8NKWV77XUR
 KCMIjwEZZrYcw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230714121440.7717-1-aweber.kernel@gmail.com>
References: <20230714121440.7717-1-aweber.kernel@gmail.com>
Subject: Re: [PATCH 0/2] backlight: lp855x: Fixes after c1ff7da03e16
Message-Id: <169053617109.301530.1109574128133922072.b4-ty@kernel.org>
Date: Fri, 28 Jul 2023 10:22:51 +0100
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023 14:14:38 +0200, Artur Weber wrote:
> Two small fixes after commit c1ff7da03e16 ("video: backlight: lp855x:
> Get PWM for PWM mode during probe"), stemming from a review[1] by
> Uwe Kleine-König.
> 
> [1] https://lore.kernel.org/all/20230614083953.e4kkweddjz7wztby@pengutronix.de/
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> [...]

Applied, thanks!

[1/2] backlight: lp855x: Initialize PWM state on first brightness change
      commit: 4c09e20b3c85f60353ace21092e34f35f5e3ab00
[2/2] backlight: lp855x: Catch errors when changing brightness
      commit: 5145531be5fbad0e914d1dc1cbd392d7b756abaa

--
Lee Jones [李琼斯]

