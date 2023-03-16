Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA526BD15F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7646910E196;
	Thu, 16 Mar 2023 13:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274A10E196
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:50:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB981B8219F;
 Thu, 16 Mar 2023 13:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CC7C4339E;
 Thu, 16 Mar 2023 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678974655;
 bh=lXUl7La5cJcJdgZLmoOZmsmMW91Ldc6U+hd0ZTgsng8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ig9GWJb6NXq5yRP3ueSxciQWa7tpd/uiQwIrYL/9GSs0OOkGuG04h0P2XMqVFDA24
 A6CjmJu28EymnJXEHNrKUfP9B8CyMv0xJGsG43kRXLNR8QtZE/VdFTYfvN8ORTgCcb
 D8GL1jtvpFsTxP6GbOCMfuHABUBRcmZo/zWqYfkXTZi/LePFnfOCedLE0cTBVB7v24
 OZP7PQx+/7Wanoq7TCNtmV81HBzhjcajY++kGBmHtDOl3syQTZOfI4WellVgQ01cZh
 oYvc+uPZUwnt8UzWONxW2C1zb+WH3b7hLSQ+yM6G+xAXat+gIZ6L+sDF5x053rsMiP
 U270LzOAPLyNg==
Date: Thu, 16 Mar 2023 13:50:50 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 09/13] backlight: mt6370-backlight: Convert to platform
 remove callback returning void
Message-ID: <20230316135050.GX9667@google.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
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
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
>  drivers/video/backlight/mt6370-backlight.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]
