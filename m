Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794356BD143
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9310E1F5;
	Thu, 16 Mar 2023 13:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35DC10E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:48:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD8C4B8219C;
 Thu, 16 Mar 2023 13:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B674CC433EF;
 Thu, 16 Mar 2023 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678974477;
 bh=pz8zb+x2OYq4JrfjJXg/dKlmVC8FlKsKdUjg+1Z/kWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6x84cG1sAJ0cRlDYOBu1byTdgayYKLUPQMoIU28XtvwB35Mgv74LkitpeLP+6nJF
 VXdT3OB2YxobiR0lC9cDklN2VCV2X6kyYs0TIz+opOukXYc8EKaKSuNf4Nb7WImCFd
 4qJICIWH/9vBdptQ9JGBy02PVVPGUrOIuS0ZE49+qrSMm8YA7KSaWFXUGnXI0CzZe6
 NP8MtmxBFu54/ZmpuDM8GzTHElRx4H/vUG0PR70CgFHezpokhBYXnUqYxI9iaW3x4X
 zLn/pfqo+nZjNYKmhFdzTKDvxFst3/JBHLz88F2qWHVB+7UY28tc1Mrs8cXVKcyZdc
 pbj5fpeeXhYDg==
Date: Thu, 16 Mar 2023 13:47:52 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 02/13] backlight: adp5520_bl: Convert to platform remove
 callback returning void
Message-ID: <20230316134752.GQ9667@google.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-3-u.kleine-koenig@pengutronix.de>
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
 Michael Hennerich <michael.hennerich@analog.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
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
>  drivers/video/backlight/adp5520_bl.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]
