Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BC64D9A3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F4210E519;
	Thu, 15 Dec 2022 10:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7B10E51F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:37:16 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3b48b139b46so34852207b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8xobVd8f5cIr7Kkj75EnRmTNDqYZhm2cXmeUBp3q7Z4=;
 b=hWAknL/ycG5f/6vZyK+0mgTB4/u3qknPTFFRKWIE9SopJ4SYh46RzRqGRYNvY4JYhQ
 KfGE9bW0DiH24HzhrdCy1GA4Pj6MfpQweh2bXwYgz9pWKGrf38XkP5TZ/OaGEFEdfqe7
 Azm7tauswLZ8HQRoW2p+PtaBaBaWLTdZ3SPI8Xs8/s2uVd5bBqCVuVT9BsIkevFQZDfC
 yUgDiAVEPjAzDkWET0HFGuQYQJG0nbW4JrMuBchs9xRAaZEdc7tcixe4gxIoNA+PKP18
 CxMZmhdPO/JrsdxiW3uYikiQQ62GL+fjl0/NwMh6SCsy0IcggFlbHOEGk6sazyZo0jUf
 RFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8xobVd8f5cIr7Kkj75EnRmTNDqYZhm2cXmeUBp3q7Z4=;
 b=s9hI103kxIK7dLJ1uZt1NMS31HrkxblMMVHG0D0DGqVQUZlkUFcWtKVNmu2AWeO17H
 7tArlLy1M5mp50jqTKe2o/69DKbeAHiBINoCBvg69V2DPHgwLoIFr2PrX8hKW4APW0K0
 eT1KT5KY2Q7QFy8maHiSTYQVLDvl1cwlaKMr6zC3bcW0bijd0mMOeWVuzvredzJrwv7K
 jYTSgTnKdaZo3D5zN0MLB3Qa7LcdI5QXsMGYqrTTA3ZNCOkaHJvZf2ogPxQlh8t+9b/s
 Kq3pCfWljI/byrvJBdMWxdhZu4X0Hf3xitV4PAcj/j+veyoLmq+FmITHYVfnapGvIVb3
 UP9A==
X-Gm-Message-State: ANoB5pnVtnIlQwF4cDace3/mH3NK6ez5Lu3LC6qyKTzCCS3bSrA7EyTt
 SK9Yjzv/zLmrj4oV1a14x398+vEgsj3aWThCr8rhIgqXHTkjem7daE8=
X-Google-Smtp-Source: AA0mqf6bx5onp0asvYUodNc+Cdhrc3Wqz8dd/iTAPqLXE25zD3UFR76dPXpXK7xK71bI4aD5Sny+Dtzy2iH3uPTd6PM=
X-Received: by 2002:a81:b54b:0:b0:391:f64b:e3bb with SMTP id
 c11-20020a81b54b000000b00391f64be3bbmr26235170ywk.49.1671100635548; Thu, 15
 Dec 2022 02:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20221214180611.109651-1-macroalpha82@gmail.com>
 <20221214180611.109651-4-macroalpha82@gmail.com>
In-Reply-To: <20221214180611.109651-4-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Dec 2022 11:37:03 +0100
Message-ID: <CACRpkdZjX7E7Sm7F5sPCwUmnnw6A9imYwytfSb_R1S_qsdgo0A@mail.gmail.com>
Subject: Re: [PATCH V5 3/4] drm/panel: Add Magnachip D53E6EA8966 Panel Driver
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

looks good to me, just very minor nitpicks:

On Wed, Dec 14, 2022 at 7:06 PM Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Support Magnachip D53E6EA8966 based panels such as the Samsung
> AMS495QA01 panel as found on the Anbernic RG503. Note this driver
> supports only the AMS495QA01 today which receives video signals via DSI,
> however it receives commands via 3-wire SPI.

using DBI.

>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Is your Kconfig snippet missing:

        depends on BACKLIGHT_CLASS_DEVICE

?

> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>

Not needed anymore, right?

With these fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
