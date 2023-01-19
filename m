Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E66744D4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 22:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2987810E262;
	Thu, 19 Jan 2023 21:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A7D10E262
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 21:39:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3449E61CBE;
 Thu, 19 Jan 2023 21:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902BBC433F0;
 Thu, 19 Jan 2023 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674164375;
 bh=yQT7vF8YUwj4dpk5uOYW6ZI2HJbDbf0PuVFcTzzBj/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pW/EJdAhnBZ70wuOAsx/7rczHPj006EtmoxDD+J6Ce2Zw+Nanrs7JqMej38VCsGfu
 w8x7ze74AHlVv7fjBNnd+nHIqwQuL4mKA/e17XE0iav6L8XfugKQp8l15PAIYhd8Ec
 WyCDvGyPoKvLRryTge0rzzAJqffxADf1pnrYgyfyBiAVhT34+Xek1K0eWTWns9lox6
 udROIv+bL+htcolekcNqfSdqWzsI7UFO0CG/DAP8eODuq360y+JjrPCZMQIT2uph05
 +q1i82sD8VBVDqp47gKyyb0CQmIzXAeOdmSVYY1Ltzws1lQr8EZxjHY625K13H1BFv
 R3+Uo/3FdQXHA==
Date: Thu, 19 Jan 2023 21:39:30 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 3/4] backlight: ipaq_micro: Use backlight helper
Message-ID: <Y8m4krH0nh6sh5NM@google.com>
References: <20230106164856.1453819-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230106164856.1453819-4-steve@sk2.org>
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
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 Jan 2023, Stephen Kitt wrote:

> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/video/backlight/ipaq_micro_bl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
