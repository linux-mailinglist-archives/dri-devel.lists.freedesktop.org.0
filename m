Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06975C29F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 11:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BED10E63A;
	Fri, 21 Jul 2023 09:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7B010E63A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 09:11:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-991fe70f21bso268343566b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689930679; x=1690535479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VM3KGadjDOYHGZ48CafeghyP+SvOLq0YqUvtd5Ztz2M=;
 b=Ywzlu3+6SQgXc6CxnRdfrOev1LvalA/Mzdak59xCHnJpYFrR7trnuUUuNGI1LWo6p4
 rkCNo5xMLr3CsWYWWvQGWs+udNN10OImgWhIq6wmRU1TINy++ynyL0JbIa1BcmeRdk1K
 TRsPwZp/K2v6pXUFlicQ7sW7QmxuCY+irJceospNhpG5zaptQN7lZiikzzmodPJj87ix
 03CVJE3M/xdwma4oSc5X3XEFyKFV+bP4w9BW5h1iDzkN9pgcSdR4IUr4SCQYHakpfKXU
 uMb8jdDEA1mBG8qajnD88uvmzVnLCmGKa9Z+r+p7M3NYLpAJN5JJu2XUdogU7oYbkNV9
 JUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689930679; x=1690535479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VM3KGadjDOYHGZ48CafeghyP+SvOLq0YqUvtd5Ztz2M=;
 b=LZ1Zo7lQlfp6M2AhDJOlXonFycjRiepB7P15K6AkkT1y3w6PadCPWNKEqRYNBduXSf
 RUNk23gr312ONUUBX8+LTw29sU/MTZ6kXcEmU96yzd1KX0eSzpNK3xGFksN4oc0z9sPE
 dS+DY0a+eHphMqGT5EaMZM05zlmDIHjP9b0KvqeKOlfWsS2/TNG4npG6MDv8Ukq/gkfe
 c0oLKh8+bCWQaOKRJ9LLNArUyTEMIZEpASzjHK7hzWZy2i2NLIw3RuaG8Lsd/7u+5AOe
 gHxt4zSAGtX7+lcJfbn03e6sehyuaoutSDoOQZ3hr7IJmgctSMNbNiSKb0gQ5lcS+2r3
 zKYw==
X-Gm-Message-State: ABy/qLYDiZvGb9QgvWt7wb2OH8dRGhdhc0yqU/sKYcoBOBJ2keCJomjB
 q2B/jKBXoj5J7+xJiUiqFQs/ESZYzt+8xD/IQEqywp+8cmk=
X-Google-Smtp-Source: APBJJlG23C9IQ8C77apuuCpxCvPq7IQ3XI4qgYHy56Nc3u0wfmova7/RDtmPGqd0Fia+p0KcdtIUzY/HD9E5C/4nMG8=
X-Received: by 2002:a17:906:328f:b0:993:f611:7c95 with SMTP id
 15-20020a170906328f00b00993f6117c95mr1123747ejw.39.1689930678523; Fri, 21 Jul
 2023 02:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230721090332.1528569-1-victor.liu@nxp.com>
In-Reply-To: <20230721090332.1528569-1-victor.liu@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jul 2023 12:10:42 +0300
Message-ID: <CAHp75Vd3e66G1jWnrXX7jgcP3bQ5m91Z=Sd=e8hHF4nr39wJXQ@mail.gmail.com>
Subject: Re: [PATCH v3] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "andy@kernel.org" <andy@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 11:58=E2=80=AFAM Ying Liu <victor.liu@nxp.com> wrot=
e:
>
> If gpio pin is in input state but backlight is currently off due to

GPIO

> default pull downs, then initial power state is set to FB_BLANK_UNBLANK
> in DT boot mode with phandle link and the backlight is effectively
> turned on in gpio_backlight_probe(), which is undesirable according to
> patch description of commit ec665b756e6f ("backlight: gpio-backlight:
> Correct initial power state handling").
>
> Quote:

> ---
> If in DT boot we have phandle link then leave the GPIO in a state which t=
he
> bootloader left it and let the user of the backlight to configure it furt=
her.
> ---

Just use ---8<--- or drop these completely, as your (commit message of
the) patch is broken now.

>
> So, let's drop output gpio direction check and only check gpio value to s=
et

GPIO
GPIO

> the initial power state.
>
> Fixes: 706dc68102bc ("backlight: gpio: Explicitly set the direction of th=
e GPIO")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

--=20
With Best Regards,
Andy Shevchenko
