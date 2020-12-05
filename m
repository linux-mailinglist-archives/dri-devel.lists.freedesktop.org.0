Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE62CFB6D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 14:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BEB6E41D;
	Sat,  5 Dec 2020 13:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7196E41D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 13:26:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9125420026;
 Sat,  5 Dec 2020 14:26:51 +0100 (CET)
Date: Sat, 5 Dec 2020 14:26:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: s6e63m0: Fix init sequence again
Message-ID: <20201205132650.GA301178@ravnborg.org>
References: <20201205122229.1952980-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205122229.1952980-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=yPNgNHY9eFfn3e6HJCwA:9 a=CjuIK1q_8ugA:10 a=A2jcf3dkIZPIRbEE90CI:22
 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus

On Sat, Dec 05, 2020 at 01:22:29PM +0100, Linus Walleij wrote:
> The DSI version of the panel behaved instable and close
> scrutiny of the vendor driver from the Samsung
> GT-S8190 shows a different initialization sequence for
> the DSI mode panel than the DPI mode panel.
> 
> Make the initialization depend on whether we are in
> DSI or DPI mode and handle the differences.
> 
> After this the panel on the GT-I8190 becomes much more
> stable.
> 
> Also spell out some more custom DCS commands found in
> the vendor source code to cut down a bit on magic
> where we can.
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Fixes: f0aee45ffc8b ("drm/panel: s6e63m0: Fix init sequence")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Looks good - the extra defines reduces the magic a little which is good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
