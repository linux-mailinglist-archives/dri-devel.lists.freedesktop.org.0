Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC8791DD7B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1DF10E3A6;
	Mon,  1 Jul 2024 11:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QqIAQ+Ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8E110E39B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 11:07:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-424a3ccd0c0so21069295e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719832026; x=1720436826; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V41EHoOA8oeYm9MwEGsDwJlgg36OM1Uo8B4nv2YSUdQ=;
 b=QqIAQ+IpMC3pROYPCuD49EOmNFNd+YEgI/0TyVb0L43I9hRFvlSIyBFy+giWF5DhcA
 hediCENA44nPtS6Iwn8wS9Ao/ntMU+tHnECIA6ATqeBfrGG+t7dkxdxDTzbilalNthFk
 inqlNR2OLnNadT7sHqF3GCnK1VLKiTkH0q7PO4DjsHL1XNMno0ajSgNcQM8ItzivyJbS
 7X8EuwqOy3SnGly2zTs5TmOnU1Qfjmna7L/Mu4w8OpABKzBsrr1Dk25ZZfr9zgMksA8r
 IfG8Q1KvbUDcDc597xCkH9iOWCgQL1v7SVSN/oK4cekNMWRjVQcDxRtw2lZcpU5zyPap
 45Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719832026; x=1720436826;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V41EHoOA8oeYm9MwEGsDwJlgg36OM1Uo8B4nv2YSUdQ=;
 b=jd2L8P8llKU9ApJ7/yn/9ER2gVUgw3uTuFFCi3J2azivQHSZU2R2YIEsxyi5kJTyn+
 DmAwdt2q8Y5D7mcXpBz2Eih7GrNTm5Nx+o4yrJqUztzC1uOywVTql/BPiwhvCXakHLJd
 MUQgsBFMCCSWN3mcYPWJWu8gZgGZjl+7Ti0gSx75+vyuV3weN251F5ZXJPaJTmRMaPRx
 tlGYk80adJohhb/+C6xIOU53kJkuLgCVpNLGDZJ9l+VUK4yqHKAGJeRpAExjEMZLTe+5
 jS5sN8SA8zQIjaRnFYV1/p1a9Q2VYuKNB+ahs+IfYEcLx1QLx+TE3pZbfp/AItLGdOH3
 rd/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv/pGqLFcYMntOeLHiiY+kJQ8ksE0ANT/vkqT93ViiPRuLPe/dd0wNd4mWT5/+cbF3yBfi6VdQaDtsGF7sbbcfqZ0xcfPv6f0xtbFqvQfl
X-Gm-Message-State: AOJu0YwHAgHq83mD7l6PHXEEa8YE1zmpqVf8/NfGuE6ujA0oItvlKsJl
 QwW31pnayNvaKO1LEd8VoC0/P5j2cGb4l5a8d16qoMeJ0DJckbpOmp1ogZsENAg=
X-Google-Smtp-Source: AGHT+IFrc5q/iQ835841xqoTCs84v4Tn4y6GVrTE/IwJP2R3sKwPXf4KgBB7h/5TJq9srkNcgP/PCA==
X-Received: by 2002:a05:600c:6a8d:b0:425:77b4:366d with SMTP id
 5b1f17b1804b1-4257a02f3f6mr35378515e9.11.1719832025941; 
 Mon, 01 Jul 2024 04:07:05 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b61bsm149932085e9.17.2024.07.01.04.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 04:07:05 -0700 (PDT)
Date: Mon, 1 Jul 2024 12:07:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, sam@ravnborg.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, f.suligoi@asem.it, ukleinek@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 00/17] backlight: Introduce power-state constants
Message-ID: <20240701110703.GA15322@aspen.lan>
References: <20240624152033.25016-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>
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

On Mon, Jun 24, 2024 at 05:19:55PM +0200, Thomas Zimmermann wrote:
> The backlight code currently uses fbdev's FB_BLANK_ constants to
> represent power states UNBLANK and POWERDOWN. Introduce dedicated
> backlight constants to remove this dependency on fbdev.
>
> Patch 1 introduces BACKLIGHT_POWER_ON and BACKLIGHT_POWER_OFF, which
> replace constants from fbdev. There's also BACKLIGHT_POWER_REDUCED,
> which is required by a few drivers that appear to use incorrect or
> uncommon blanking semantics.
>
> The rest of the patchset converts backlight drivers. The new
> constants' values are identical to the old ones, so the driver
> conversion can be done one-by-one.
>
> There are many more backlight drivers in other subsystems. These
> can later be converted when the new constants have been merged.
> Once merged, several include statements for <linux/fb.h> can be
> removed (specifically under drivers/platform/x86/).
>
> This patchset is part of a larger effort to implement the backlight
> code without depending on fbdev and ultimatively remove fbdev
> dependencies from the kernel.
>
> v2:
> - rename BL_CORE_ power constants to BACKLIGHT_POWER_ (Sam)
> - fix documentation
>
> Thomas Zimmermann (17):
>   backlight: Add BACKLIGHT_POWER_ constants for power states
>   backlight: aat2870-backlight: Use blacklight power constants
>   backlight: ams369fb06: Use backlight power constants
>   backlight: corgi-lcd: Use backlight power constants
>   backlight: gpio-backlight: Use backlight power constants
>   backlight: ipaq-micro-backlight: Use backlight power constants
>   backlight: journada_bl: Use backlight power constants
>   backlight: kb3886-bl: Use backlight power constants
>   backlight: ktd253-backlight: Use backlight power constants
>   backlight: led-backlight: Use backlight power constants
>   backlight: lm3533-backlight: Use backlight power constants
>   backlight: mp3309c: Use backlight power constants
>   backlight: pandora-backlight: Use backlight power constants
>   backlight: pcf50633-backlight: Use backlight power constants
>   backlight: pwm-backlight: Use backlight power constants
>   backlight: rave-sp-backlight: Use backlight power constants
>   backlight: sky81452-backlight: Use backlight power constants

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
