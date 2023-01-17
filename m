Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557ED66E5E4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C74710E31A;
	Tue, 17 Jan 2023 18:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265410E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:22:29 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v19so29264373ybv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 10:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KF9AKpkAxWwg0xVgeRn/67i1A0RE9KBlodHuzQUHQSM=;
 b=Z3Wf5ASEIqE+DbBueGhMdvcGSU78P7HzIzeIRVYpVetAQK9S2qlzCqDxmm6Sdo/mqm
 wsZrEEGnOHLpxgo4TDBlO+MQo8deLeY6q+lahvr3js2+SOyRTLqx3bP8cw6tUVfKTMNS
 5IrMe2xp5rH6dm80aDWwF8ITg6o8m7wbinw/NSufZz036Vp4sCD/GC2LfrGKMK65CGu7
 5oKWFP/iSHTcgtO0VKXn7hxIfVmmgQz2YKPFLJhzLShmDGvuZ7WTeJP4l/LIuKHBkTNv
 VEnjIMFtxRzmmJmM74jfRrcoNxhT704tgqQ3P4tiPBjqdfRvbr8/KFyFhBbLiuFi8+Xs
 04zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KF9AKpkAxWwg0xVgeRn/67i1A0RE9KBlodHuzQUHQSM=;
 b=wWOTfEYNhBSMJVNg+6NrR0O61nOEc2YiWR0ZBevDCdhL16hsxrm7ecza6hQxLI0j/f
 Zc3A0QOnJOEUtQACP7YT6A3v1Gy9tyB2oxI4/Y+S1SJSs5UHqmXJrxoJPGln0Qo4brly
 edQo1PgHGgqfke/BOGXp9lq/cfrFcBMuYV1yS2ssBNDEsoQ17DBmMSwHX+WNG4+Lql47
 mxsIetXCy4ERnGZgTYHD/2jh4vmGCergD9agydhWVRjbl26ZzvbJXjqJm8fP6ghM+Aov
 o46YL4o7qSO9P0dc8WALH5TW042vySLJbrRcP3Bp6VCWTAiYDKqIdfzJQ8gI8+riESYP
 SXow==
X-Gm-Message-State: AFqh2kpatx9NmJ5k/yr5If2y/8hYkmy0jAzb1Y+KcRSlM1oWwAay4zZx
 Ab0zsE9byNG0WlYskQ2AhWhwtAxglEKuZJGZ0+71iA==
X-Google-Smtp-Source: AMrXdXuVvfBU1pokGNSB0GCsBkhaY6r0NoMYg/hddhXgCQjhW42vfSWTZ97vcrTxcZ6HVXwM/Y3X2ljULdgzLR4TiH8=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr587266ybp.130.1673979748355; Tue, 17
 Jan 2023 10:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20230117165522.2104380-1-arnd@kernel.org>
In-Reply-To: <20230117165522.2104380-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Jan 2023 19:22:16 +0100
Message-ID: <CACRpkdb0rA8DmiGj79f6+6qOCChUuQrYzmQ+Yjk6BxeBzjM4_A@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: visionox: add backlight dependency
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 5:55 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added driver uses the backlight subsystem but is missing the
> corresponding Kconfig dependency:
>
> arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-visionox-vtdr6130.o: in function `visionox_vtdr6130_probe':
> panel-visionox-vtdr6130.c:(.text+0xdee): undefined reference to `devm_backlight_device_register'
>
> Fixes: 65dc9360f741 ("drm: panel: Add Himax HX8394 panel controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
