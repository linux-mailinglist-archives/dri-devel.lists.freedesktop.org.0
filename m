Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D6A60ED1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3493810E301;
	Fri, 14 Mar 2025 10:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A+XcxhQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F91D10E301
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:28:15 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5499e3ec54dso2033177e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741948093; x=1742552893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
 b=A+XcxhQiEo1S54ZKsTQobNHL2FQUbQFd7reC9PCFyk1PNB9wRROhzDUu09NLmN61XE
 KYi6x8bUbVY6ZPe0mukgREIXGTKEFPiTkJ37k9N+NhJxi99CzAZA0LNO1+d4LzIuHIBI
 +QJIPDmpRP4YdD1SFYAeZ955TSR8lxZWs2FVE9jINFHpVLOHh8puavTlaOEZsNWwJGu7
 AdxDh1h/DQMmSOdoKidmDYzvzu6eTeN9Avd92OwgnGvdmFyn2hArLFmfxFSs6SBdYNjz
 S+rbGPRY/Ol/LKBFcyhG9ve+aSJWKBUHP/O/r9ZTZHDDgfUb/qf3etDbHr/tQwYk2Cqn
 syAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741948093; x=1742552893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lhUJ6eiiWP9IJ/FYhzjbXh+LAJRJWyTLSUXs2Uq9+Y=;
 b=rrripK5i6unHuqOf3t3MGii0WJTlSG2v74OcEZeAADD1doybtS7/SKuOdyDUkLnh74
 b84hVQfhIarlmalzbrpXEanDd7kbIE2pZTLQg/5kXtrtwJSCHv5xAJ7j/Nbf+BEYh5jV
 ne+g/rQZoS9le77HjQemE5mBYTkGObIdQxsMycg3YkU3OohsFPw3vljq8kMrPLIgNHEP
 5ANTlmm/mLGmMszUNSBfB3jcnK+r2JyyuGsoQr6l0w/z/+R/0iruNLgibiTRS9MxQlRD
 BcBU7Wi4Ke4UiusbMhtE0xyIYfYoHsWXWlwJmDlGFQlr1TYwhql7ZECzHMetj4BdeSk8
 KKeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnhh7r4Tw44wQUtRg7Sa6/KIsDKOWK1DbjNaAB4RYOP0ElkWUCY1Lxgbopczn+fJusw9KRTmFp/co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqmNgtJ2UZjwnViTIw7CHzFzi6dHWmX6qOpKAvlyPZvAYOvsY6
 5DYL2XSTQOL3/W/AnzcDL7N87pAsM0lBzQvU+BQLHcnSzNyRmdzvgdkYPAzv6lFygwBKNEcb54f
 JfCKgjpIdeInZX6ZE6sceAkR3tgtMsfkNJ7wTTg==
X-Gm-Gg: ASbGncstaNdTlA9/6uII8JfKl0eU/8ggNlzcIg4bCDgmTmr2vk1QQjJ+1Rp8qPbK+La
 Po804LNbV4IjLyqHbLh+CT5P+/xIZX4vLFrIiiVldF8J6vxdl730OWP3jW5rBk/iS8zLZJB7vKh
 9SBnMHaYFShbm1vgcAtTzebE0=
X-Google-Smtp-Source: AGHT+IEn/Zc2evX7ABWKYXK/Rs9IfMZdPR9tSjfOKy1a8kRLZcgdXcqx09hfLow4+l9JiJIqttYJQGRGb5b/H78iKJ8=
X-Received: by 2002:a05:6512:3087:b0:549:7330:6a5a with SMTP id
 2adb3069b0e04-549c3913d63mr621103e87.23.1741948093287; Fri, 14 Mar 2025
 03:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250309193612.251929-1-linux@treblig.org>
 <20250309193612.251929-5-linux@treblig.org>
In-Reply-To: <20250309193612.251929-5-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:28:02 +0100
X-Gm-Features: AQ5f1Jo6nSq2AFqXUDepXvu8J8Xduf-drgRoP8FzPPUsiMaA2xVOQZlsv65trtc
Message-ID: <CACRpkdY2oZtu4vtTwHRMFxaoYWu3B5bfPN==thz=BT2F6BHQQw@mail.gmail.com>
Subject: Re: [PATCH 4/9] mfd: pcF50633-gpio: Remove
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org, 
 lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com, 
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, brgl@bgdev.pl, 
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Mar 9, 2025 at 8:36=E2=80=AFPM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
>
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
