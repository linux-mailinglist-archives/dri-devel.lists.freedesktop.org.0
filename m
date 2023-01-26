Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4F67CE0E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3898010E913;
	Thu, 26 Jan 2023 14:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A1910E911
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:27:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5166DB81DE6;
 Thu, 26 Jan 2023 14:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE03C433EF;
 Thu, 26 Jan 2023 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674743255;
 bh=kyg287jVxNn5KSlNEsVGJfYboudO4DBm+FJvwry/P14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWMMZa3enFGjyBvR2geXY/y1os9YbC/Uq6fvpBx147xoAci6F2dWQUwOp5qev7dqv
 sDFzMt7hO6YpQHUbi6UXLJq/caD9FXOsVNgrL+IcDeaytcggK82q8G4TPARg46UQvR
 qp4uxp3LOCVaFqBaaCiwljX3GBc1l6jZqUd5AJMLb2hOnEyztqjAXwXmyWbJDEosk5
 fuPKSnnu2l0tBH3n5rSQm/zULLwOhCLeU2BQcHzouuw4T2jv6+uHjM+0xXK+iTmSzm
 vld+2pv3ErucYbDOohg29FfZIjY619rILYR8g/bpIZoRx6/QTcILHFraOIiC5DP3WZ
 c4HaAqCJIpw1A==
Date: Thu, 26 Jan 2023 14:27:26 +0000
From: Lee Jones <lee@kernel.org>
To: sam@ravnborg.org
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y9KNziZJxMjCffbs@google.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
> 
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/backlight.c |  2 --
>  include/linux/backlight.h           | 22 ----------------------
>  2 files changed, 24 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
