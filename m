Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4220776E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D594A6EB98;
	Wed, 24 Jun 2020 15:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29966EB98
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:32:20 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CF78F20043;
 Wed, 24 Jun 2020 17:32:17 +0200 (CEST)
Date: Wed, 24 Jun 2020 17:32:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200624153216.GA1814806@ravnborg.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=YMhH-mIloVz_U1S6btoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee.

On Wed, Jun 24, 2020 at 03:57:13PM +0100, Lee Jones wrote:
> Attempting to clean-up W=1 kernel builds, which are currently
> overwhelmingly riddled with niggly little warnings.
> 
> Lee Jones (8):
>   backlight: lms501kf03: Remove unused const variables
>   backlight: lcd: Add missing kerneldoc entry for 'struct device parent'


>   backlight: ili922x: Add missing kerneldoc descriptions for
>     CHECK_FREQ_REG() args
>   backlight: ili922x: Remove invalid use of kerneldoc syntax
>   backlight: ili922x: Add missing kerneldoc description for
>     ili922x_reg_dump()'s arg
I wonder why these warnings show up as nothing pulls in this .c file.
Anyway I would suggest to drop using kerneldoc syntax for single drivers
like this - and the benefit here is low.
Now they are typed, otherwise this ahd been fine in a single patch.

>   backlight: backlight: Supply description for function args in existing
>     Kerneldocs
>   backlight: lm3630a_bl: Remove invalid checks for unsigned int < 0
>   backlight: qcom-wled: Remove unused configs for LED3 and LED4

The other fixes looks good.
They are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

>  drivers/video/backlight/backlight.c  | 2 ++
>  drivers/video/backlight/ili922x.c    | 8 ++++++--
>  drivers/video/backlight/lcd.c        | 1 +
>  drivers/video/backlight/lm3630a_bl.c | 4 ++--
>  drivers/video/backlight/lms501kf03.c | 8 --------
>  drivers/video/backlight/qcom-wled.c  | 8 --------
>  6 files changed, 11 insertions(+), 20 deletions(-)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
