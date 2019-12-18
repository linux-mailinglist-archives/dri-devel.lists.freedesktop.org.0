Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F7125C63
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39C6EABC;
	Thu, 19 Dec 2019 08:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp12.smtpout.orange.fr
 [80.12.242.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31308977A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 20:40:08 +0000 (UTC)
Received: from belgarion ([90.55.212.38]) by mwinf5d35 with ME
 id fYg02100C0qFw6q03Yg07G; Wed, 18 Dec 2019 21:40:07 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 18 Dec 2019 21:40:07 +0100
X-ME-IP: 90.55.212.38
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] backlight: pwm_bl: Switch to full GPIO descriptor
References: <20191213102346.9577-1-linus.walleij@linaro.org>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 18 Dec 2019 21:40:00 +0100
In-Reply-To: <20191213102346.9577-1-linus.walleij@linaro.org> (Linus Walleij's
 message of "Fri, 13 Dec 2019 11:23:46 +0100")
Message-ID: <87eex1xt9b.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
 Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> The PWM backlight still supports passing a enable GPIO line as
> platform data using the legacy <linux/gpio.h> API.
>
> It turns out that ever board using this mechanism except one
> is pass .enable_gpio = -1. So we drop all these cargo-culted -1's
> from all instances of this platform data in the kernel.
>
> The remaning board, Palm TC, is converted to pass a machine
> descriptior table with the "enable" GPIO instead, and delete the
> platform data entry for enable_gpio and the code handling it
> and things should work smoothly with the new API.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Located a missing removal of .enable_gpio in the Palm TC
>   board file, pointed out by Daniel.
> - Grepped to ascertain there is not a single instance of
>   the string "enable_gpio" in the affected board files.

For arch/arm/mach-pxa :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
