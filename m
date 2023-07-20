Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE575AEE0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A6710E141;
	Thu, 20 Jul 2023 12:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF410E141
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 12:56:44 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4716e4adb14so342654e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689857803; x=1690462603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1ZGppFUGoT15EF4YCw8tI150/zjcmWJj2k2NeFQg9w=;
 b=es0BgeZaDaDOKqofQU0YHlAOa+KzCTxpREmCuxqWHQtEkfGhmDdxb7N5cUZJTGgMvx
 xMw9eFq+UZ86AKpp5hN/YnRtAuHi/UOqxhNZEc+5zikZVHRPSyAO5roxPCpH6cCTJ47U
 7iiH8DkYAsiIeyNfME+fDNAsOIVby8Xbooiw1MDp+iquFx23/TVerqTlvCw6AHD/gHf/
 Za/chXdMetU6rmRSlu0Oaa8ls9PFUMxAcQCVN6p/0jR6wSL1LVUW2o5K0b2un+wGgrwK
 r1LxlIcX/bB0QRy8XyTF2wz8b/0qcqfMtNSeSQrDqE6tEJqI3uns8+/tKYlWUfXj9YZT
 C+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689857803; x=1690462603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1ZGppFUGoT15EF4YCw8tI150/zjcmWJj2k2NeFQg9w=;
 b=KU0IYAO3/eYxWVaJ6nntoB7/MdPP4Kvj/irypjHIb+gVwxqwUE/WYDR0UESFgDpKuU
 8rvLLrCqBcz5og53+ZHVXnXrgoY3n092lzwOt5u9lCI09F+DKPYXwOrwuAWe06waNhA5
 T+GozV6/TGIeYp0Is0uD3QXLN7o9KRdueMZCtkjGwUf640CsewJrYCVpW9aasMZNWN/c
 SJW2hz5TK7V67YLbl6HgMGdZWBtHb7vqw1lMAedp7ce8fmtq3ue29ZPPWnOk2jPiWdvm
 03cKBOxQAix+YSbf8MoH1VzxJ3gmX/fwZa06E+rwtQ8zXt16h4+WzP1RW1MtqS+Yls2H
 7lDg==
X-Gm-Message-State: ABy/qLYSOKEe1Urr9X7goV1hRJHtxldpRz6dqQZbJnHfImPJFFW5cDz/
 b8SFs9opQGioMwXZ39tETFoGkRBQQySLV1PjiKla3Q==
X-Google-Smtp-Source: APBJJlEee1o0YKvrMhtsL8MF+yRoXumnj5SDxTztT8XCVutkM3cq6ZpTzwL4P1daguUDMQI5ldv8Cm3SKluYLA9wjIc=
X-Received: by 2002:a1f:cc86:0:b0:481:388e:b908 with SMTP id
 c128-20020a1fcc86000000b00481388eb908mr5707827vkg.6.1689857803203; Thu, 20
 Jul 2023 05:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230720061105.154821-1-victor.liu@nxp.com>
 <20230720112742.GA2525277@aspen.lan>
In-Reply-To: <20230720112742.GA2525277@aspen.lan>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jul 2023 14:56:32 +0200
Message-ID: <CAMRc=MfbWjWTdU4ToFMp_ZV6eGdRnjD--Y+qsN329TsLFGQYxg@mail.gmail.com>
Subject: Re: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Ying Liu <victor.liu@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "lee@kernel.org" <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 1:27=E2=80=AFPM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Jul 20, 2023 at 06:06:27AM +0000, Ying Liu wrote:
> > Bootloader may leave gpio direction as input and gpio value as logical =
low.
> > It hints that initial backlight power state should be FB_BLANK_POWERDOW=
N
> > since the gpio value is literally logical low.
>
> To be honest this probably "hints" that the bootloader simply didn't
> consider the backlight at all :-) . I'd rather the patch description
> focus on what circumstances lead to the current code making a bad
> decision. More like:
>
>   If the GPIO pin is in the input state but the backlight is currently
>   off due to default pull downs then ...
>
> > So, let's drop output gpio
> > direction check and only check gpio value to set the initial power stat=
e.
>
> This check was specifically added by Bartosz so I'd be interested in his
> opinion of this change (especially since he is now a GPIO maintainer)!
>
> What motivates (or motivated) the need to check the direction rather
> than just read that current logic level on the pin?
>
>
> Daniel.
> [I'm done but since Bartosz and Linus were not on copy of the original
> thread I've left the rest of the patch below as a convenience ;-) ]
>

This was done in commit: 706dc68102bc ("backlight: gpio: Explicitly
set the direction of the GPIO").

Let me quote myself from it:

--
The GPIO backlight driver currently requests the line 'as is', without
actively setting its direction. This can lead to problems: if the line
is in input mode by default, we won't be able to drive it later when
updating the status and also reading its initial value doesn't make
sense for backlight setting.
--

I agree with Thomas that it's highly unlikely the bootloader "hints"
at any specific backlight settings. That being said, the change itself
looks correct to me. The other branch of that if will always unblank
the backlight if the GPIO is in input mode which may not be desirable.
I don't see any obvious problem with this change, just make sure the
commit message makes more sense.

Bartosz
