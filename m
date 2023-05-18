Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3C7080B0
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 14:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D5810E517;
	Thu, 18 May 2023 12:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ED710E517
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 12:05:58 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-55db055b412so27579117b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 05:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684411558; x=1687003558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL3eiATgzSA2ovHT7vBhqzczz2ZnSH9amS5jJrBLHWw=;
 b=IGrqT235/B5ITqxKVojXRk9kSChAVqH2uUb7sfsjkPT2wuWgmXGw40QavnZOBwL1O7
 KWcre8/GceW+jEZfbM1GhQNVRLi71ioS6qOMlvCZ6BmO/u8KdoZYl7X+yTWw/XhDTykP
 wxxSM6JkfhigJnNxVp2cDecSBvxGGnIaGf2dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684411558; x=1687003558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RL3eiATgzSA2ovHT7vBhqzczz2ZnSH9amS5jJrBLHWw=;
 b=irKGfJxeRrJ4qldZRiMBglmuUtVZszC5XnSUcgUjk8tjb3FY6keziS5Ko2Ws1d8AGK
 AnBMUZofXQJdKBB2kHnFfKD0DvymftMlQWJBPlmofnrhIUllq+bYBUDjlo8XlzOOXKer
 fW9zMkJeddEYdsbAe4aor2cc2nWmtHJwotbGDPKPDvZ/WesP49TLqiskwccgSOJ+oTEk
 cNFtoZyYlXg5kYKk4ifzSurS5oHRZ6l7mQ6UcQC6QOWoRht/mmoQQg4WIpPUzXGRKVgY
 NcL8ccWcFbzd2qL7LMsn0J2hgyPzvC4Q5D+Uw1kBJc9Bq2w3n6CNoDF5sDewDhtkF27j
 R6Zw==
X-Gm-Message-State: AC+VfDz6vQzO3HAFttycN4n0ULNyI+kTZW6jnq3S9eoPgMdd1JCvLTAC
 7fW0lQj6NZIbjoC1NVIdssPS6mx/W+8yXtpw6szQSA==
X-Google-Smtp-Source: ACHHUZ4VtqU+ct+qgqlQijOJr0lmAT4qilj39KRzvbV5+c/1QbK+kt0FxIk7sCik+on6KMT+DuvSXC3nlzNjgVWuXIQ=
X-Received: by 2002:a05:690c:102:b0:55f:5d6a:97fb with SMTP id
 bd2-20020a05690c010200b0055f5d6a97fbmr1477843ywb.9.1684411557812; Thu, 18 May
 2023 05:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-6-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-6-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 May 2023 17:35:46 +0530
Message-ID: <CAMty3ZBXO-S_X7H8erzLHmV0ePwq=DXJzmytsg2Vye1rgTk84Q@mail.gmail.com>
Subject: Re: [PATCH V6 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  To facilitate this, we need to cache the hs_clock
> based on what is generated from the PLL.
>
> The phy_mipi_dphy_get_default_config_for_hsclk function
> configures the DPHY timings in pico-seconds, and a small macro
> converts those timings into clock cycles based on the hs_clk.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Michael Walle <michael@walle.cc>
> ---

Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
