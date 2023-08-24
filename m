Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778A78799F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D070A10E5B5;
	Thu, 24 Aug 2023 20:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193E210E5B5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:52:18 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50098cc8967so353814e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692910334; x=1693515134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLD88l6nfbCK8qQhLvGjFf0/R5bFvFW7oJpPe1xAIgU=;
 b=hpw7wUKMvd8KCbsqyNBVA/GDcsbV8Cv9GNQxd6mWs6v+2AzVsV3BEV1Bh6FMqFYEeI
 bajlysTpCZ4zyByqvSaPvfiWAnlqJCATVfJQvhCYPMIwcFzlKtYKTjASqHX8JsEr0/md
 W9Jf2B180GdO1DlxC5Lfdzb8u5eWixZ0t20rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692910334; x=1693515134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLD88l6nfbCK8qQhLvGjFf0/R5bFvFW7oJpPe1xAIgU=;
 b=ctBK9cHQEP53+OiHaQQubyosFcigIFDHVjNlLRckGYnKdMCW/zAHdH3qfLllSbXn96
 Ab3MKUthrZUI7KCmh9UQCp7nn1mAOSfcn/zv0I28gAwDQ88l+ZDqwI5Xysv0OsEd+dKc
 WLBVDykBM97OBSlSIYQHG71b83Af90HxfIO0iDJL/Q+ZGFoJ5Rjn+IyReosKy6LA3f3n
 x51yr5sl0ew0nlfZQGIvlsN3C+56rNe1tgpsdGThl3NxDGrH/qoW3FT6ExqD/ABg7e5U
 uMv68fZvjqo35ijZGVvNfbemS0EJVFEMEq6Ue8ESM+X+I59+3llI9mOwbBoF6PR1Bfl0
 Myjw==
X-Gm-Message-State: AOJu0YyreR1O8e2BsHCHgZaxTqjELV5Svr+qlHx9tTcvuIMuZU8BcHhY
 PcUmPEmXgOxlEwFYthJINmAApr9MOWALLj9WC8xP52+h
X-Google-Smtp-Source: AGHT+IGPA8H+3R5QrcBMQsiFmJCnsfm22JCDeION8Zi11LMY+d5Z2Csekvrp0tUzOdV6r/bmuhuMBw==
X-Received: by 2002:a05:6512:453:b0:4fe:5a25:2678 with SMTP id
 y19-20020a056512045300b004fe5a252678mr9520824lfk.8.1692910333554; 
 Thu, 24 Aug 2023 13:52:13 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 v9-20020a170906488900b0099cc36c4681sm66298ejq.157.2023.08.24.13.52.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 13:52:13 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fef2fafee2so30375e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:52:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:400:46db:1bf2 with SMTP id
 m2-20020a05600c3b0200b0040046db1bf2mr52771wms.2.1692910332441; Thu, 24 Aug
 2023 13:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
 <20230824182609.GA6477@pendragon.ideasonboard.com>
In-Reply-To: <20230824182609.GA6477@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Aug 2023 13:51:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
Message-ID: <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 24, 2023 at 11:26=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Biju,
>
> Thank you for the patch.
>
> On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> > The driver has an ID table, but it uses the wrong API for retrieving ma=
tch
> > data and that will lead to a crash, if it is instantiated by user space=
 or
> > using ID. From this, there is no user for the ID table and let's drop i=
t
> > from the driver as it saves some memory.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> I wonder, as the device can only be instantiated from OF, should we add
>
>         depends on OF
>
> to Kconfig, and drop the
>
> #if IS_ENABLED(CONFIG_OF)
>
> from the driver ?

In my opinion we shouldn't add the "depends on OF" since that will
decrease the amount of compile testing. It's somewhat the opposite of
adding "if COMPILE_TEST" to your driver. ;-)

I think we could get rid of one of the "#if" statements in the driver
anyway as of commit c9e358dfc4a8 ("driver-core: remove conditionals
around devicetree pointers") from ~12 years ago. If we did something
similar in "struct drm_bridge" we could drop both #ifs.


-Doug
