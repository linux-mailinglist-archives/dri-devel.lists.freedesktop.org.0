Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8702C629C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15996EB89;
	Fri, 27 Nov 2020 10:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0B6E9AA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 21:31:29 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k5so1691284plt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=a/Yr17tyVZOzPtpOMI6fU0OKHLM5WkCR0ljB5tvI8jA=;
 b=D8RjchmY2vqGT3P9AVhnqgY6EZOeq5cUgZpsHcPFeUzhReI1umerghInJIQ7fsZX7y
 jpcgvmy9kxP+ovXVLd6vlQcb7tBfZcmRSNhQcdDZyMFDsEvpOKhvDR/VVDMAMRFwKDgx
 Z/x5PB3DT65GTn10vW1G27KSi7ZjSQE9HQ5UqpZ78W7roIMluo5XD1smqy1kT72lEVih
 QoNP6BRnQVftg6p8tfQf+twOMTJWGBeVgjSDebHhMaAoZ85Wwt2MTOGQctjQOfcj3gS8
 jpLDxChoIVIZWoTQHdk/gzeeOeqjLlVmuVmtiZKhXN0VViCaBc754mBSpelZv9Bt35SG
 qyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=a/Yr17tyVZOzPtpOMI6fU0OKHLM5WkCR0ljB5tvI8jA=;
 b=Det9z+B0+jhE5nnMAFx5k48nUjYxG9lHHnJopoCsrib1+NYZh5T6qTZ5lZmQOtKLE5
 c6F6KlJhWp/+14TQB3xqUJHAWZq4Ob6Fp+FUfs2Ipxse2q9jksxEe9u/MsqdMsTBY3XA
 QvAtvPMWKX4fMzU81h7CWBlRHumkPLiQxoVitygSuWINBpr/+wAeItsn+xwx5SI4nWVp
 CB+/7QX8dER95lCDGSQ7ifAJXYO27A4ngd0QN3OHbsxAYc6UrIDmi/wg0niUQMyw3nYe
 Y+4UH9Wt5ZyrW8KFIa53zVQvk4ex4korpcx6gBfZqX9cfbQxWY189sYPHmcBQF3FWiYL
 oARQ==
X-Gm-Message-State: AOAM531A1Bdo4PAkWfRAbyfRULrqzkfIC0d2h62VG/MiND2fnG6CXcEZ
 kPuOm5/vp651UoPNeWVv0XaGoQVTYFw=
X-Google-Smtp-Source: ABdhPJwuTomeS7EFZhxZjn+m3VhPp+c1DdvHAF7qsX3/hB+phfqkRw3jbd2Tx7pvOzhRY+UkbU64mA==
X-Received: by 2002:a17:902:7606:b029:da:246c:5bd8 with SMTP id
 k6-20020a1709027606b02900da246c5bd8mr4236748pll.27.1606426288824; 
 Thu, 26 Nov 2020 13:31:28 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id o133sm5409402pfg.97.2020.11.26.13.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 13:31:27 -0800 (PST)
Date: Thu, 26 Nov 2020 13:31:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: locomo: make locomo bus's remove callback return void
Message-ID: <20201126213125.GG2034289@dtor-ws>
References: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, kernel@pengutronix.de,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 26, 2020 at 12:01:40PM +0100, Uwe Kleine-K=F6nig wrote:
> The driver core ignores the return value of struct bus_type::remove
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct locomo_driver::remove return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and ensures future
> users behave accordingly.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> =

> if desired the change to arch/arm/mach-sa1100/collie.c can be split out
> of this patch. The change of prototype then doesn't affect this driver
> any more. There is one locomo-driver that is already now unaffected:
> drivers/leds/leds-locomo.c. This driver doesn't have a remove callback.
> =

> Best regards
> Uwe
> =

>  arch/arm/common/locomo.c               | 5 ++---
>  arch/arm/include/asm/hardware/locomo.h | 2 +-
>  arch/arm/mach-sa1100/collie.c          | 6 ------
>  drivers/input/keyboard/locomokbd.c     | 4 +---

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

>  drivers/video/backlight/locomolcd.c    | 3 +--
>  5 files changed, 5 insertions(+), 15 deletions(-)

Thanks.

-- =

Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
