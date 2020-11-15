Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BBD2B3A7B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 23:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D73B89FCA;
	Sun, 15 Nov 2020 22:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F489FCA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 22:56:01 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CE86820038;
 Sun, 15 Nov 2020 23:55:57 +0100 (CET)
Date: Sun, 15 Nov 2020 23:55:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] Samsung s6e63m0 improvements
Message-ID: <20201115225556.GA12643@ravnborg.org>
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110234653.2248594-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=heDIo351K4yTI-QMVKsA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Stephan Gerhold <stephan@gerhold.net>,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,
On Wed, Nov 11, 2020 at 12:46:48AM +0100, Linus Walleij wrote:
> These improvements to the Samsung s6e63m0 makes SPI
> writing and reading to the panel simpler, and add some
> support required by the Samsung GT-I9070.
> 
> Tested and working fine on the Samsung GT-I9070 mobile
> phone with the MCDE display controller in DPI mode.
> 
> Linus Walleij (5):
>   drm/panel: s6e63m0: Simplify SPI writing
>   drm/panel: s6e63m0: Implement reading from panel
>   drm/panel: s6e63m0: Add some explanations
>   drm/panel: s6e63m0: Support 3WIRE protocol
>   drm/panel: s6e63m0: Set up some display info

I have looked through the series - and all looks good.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Please commit patches yourself.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
