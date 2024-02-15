Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B42856214
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB1F10E229;
	Thu, 15 Feb 2024 11:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OGu/CFeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E16C10E229
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:48:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41211acfcfcso4955305e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707997714; x=1708602514; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DroRDiixIta52dRC0kBdYzbBsXfxkiN1Si4pySYG4VM=;
 b=OGu/CFeOonmLv3n8iyhjudHwaLzyZoE45gtX6r9XevjBgs2qTQF1flMMHWEyp27Fyz
 wESXv6G7eGDVr0ZG6z6N9GtbZH/28iIg40dSVCYhkiX04t7UkjrPqX8iRwt5Z4I+2ttT
 43aVKi27b8NT2vM6NqvaTv4GJxni/YDlVj/u5N3uwKcJLFPbLYzzsByoG0UuCmW53YVk
 OjKPuGlYOsueCuaXLylBmvpwbAQawlksDbxiyUoWov0s5JSLkfQvpip6TtLOANNXW4+d
 jop4QmfalV+/1r8hYBse0Xz3gGYePYXVl52xcPJlm2H1sKwjY9wr5b5dXXvEoHClqipi
 jqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707997714; x=1708602514;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DroRDiixIta52dRC0kBdYzbBsXfxkiN1Si4pySYG4VM=;
 b=d+A8fT164mkMt1292tOwCjStyJQR8zvyyw/lIFAocOTkMx1X2Jj5xv95c5uyUyN7aW
 vwkQyA0vR7pNBABnBKlhBbgNJ53af/DVb0K0YXQ3JeJYxqFo8/BQq6ewpxsndhBBkPpd
 Ia1+/8oR/rYJfc+genMJt5Gg9DWjVsDMmMv9k5mz0QneBpMzg8Y2/CoR2Ro/7SnLGPj/
 z/EVqdCwe8nLDr3hP7emYKBrlmonrC6WO4CbphN7od7STAx5GVJi8zvQ6P+0jEC5H6S4
 cTlS6sU4MHojbIoMx4CQ2naY6l0ZRgklDNILjSHdoydh+mQ7014oFiZ7OCblhiDOTe8D
 LqLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWICDn8Xsjw4ht7SaxBhGioxARCaHF4GKdPPeEgEr4iDluU3UXPSLeMFyZPIbW7Sg4RfPbl1THO+9fABTOBdVSBkdxBCvqIyfV8er9lTKi+
X-Gm-Message-State: AOJu0YxQvJuCFyrDtwjCIfso93/8/dUgYQ3a17NWm5GAm9RBrI4ZgjGn
 e47182kOi4SedWoftGqPFQ2VRFA23gAJZj3s7DCPLoYyenCiLJm3hViy30DG8Cc=
X-Google-Smtp-Source: AGHT+IGOdMVWbwspHZiG2UkONtI3ot5v2Yf7yd80zwMxWdUapC4d2kyA5ljlBgnTJ25oK0jtN78zUA==
X-Received: by 2002:a05:600c:45c6:b0:412:1500:beaa with SMTP id
 s6-20020a05600c45c600b004121500beaamr1042184wmo.40.1707997713895; 
 Thu, 15 Feb 2024 03:48:33 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d5344000000b0033ce214a97csm1543569wrv.17.2024.02.15.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 03:48:33 -0800 (PST)
Date: Thu, 15 Feb 2024 11:48:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Flavio Suligoi <f.suligoi@asem.it>,
 Hans de Goede <hdegoede@redhat.com>, Jianhua Lu <lujianhua000@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: expresswire: don't depend on NEW_LEDS
Message-ID: <20240215114831.GE9758@aspen.lan>
References: <20240212-expresswire-deps-v1-0-685ad10cd693@skole.hr>
 <20240212-expresswire-deps-v1-2-685ad10cd693@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212-expresswire-deps-v1-2-685ad10cd693@skole.hr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 12, 2024 at 09:03:26PM +0100, Duje Mihanović wrote:
> The ExpressWire library does not depend on NEW_LEDS and selecting it
> from a subsystem other than LEDs may cause Kconfig warnings:
>
> WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
>   Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
>   Selected by [y]:
>   - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]
>
> Move it out of the "if NEW_LEDS" block to allow selection from other
> subsystems (in particular backlight) without raising this warning.
>
> Link: https://lore.kernel.org/20240212111819.936815-1-arnd@kernel.org
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Fixes: 25ae5f5f4168 ("leds: Introduce ExpressWire library")
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
