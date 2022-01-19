Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276449378C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189BD10EBB5;
	Wed, 19 Jan 2022 09:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4BE10EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:43:15 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 n16-20020a17090a091000b001b46196d572so2102379pjn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dbd6K2EXZQ3nddK61UlQKh6WscvPVU8DNsk9wwBVt84=;
 b=ZIKEVGFcVCgzvu45d6+j5JsUDEiaOywWYTWAyO09q+tz7TmpQzu7+h4ZXNudsVSwHo
 nqW1EfOq7+grdo5k/9Fx+/kmkSklWrcts3pABjPydP0zsS8A/BUi/89uMGfEdyvYQ+gG
 1qhg7qm+VP29PN5YjNBZEzIu6OdvGR881RnK5tDaaA7vjGYHXwEUc3EWXYA8yll6lYWC
 J+vKeyzVWuKMu4dDTcdu0lx69r8Vo1oYycJK0H/howSJE8JZYqPPtVrKl9RzMXM/2s0s
 ivqb6OZhL/JGxEW2ZzTguG8ykGIYnGeI1xMIV5/7ljROKuwtc/H6L1e4oId7CzUefUg9
 HhhQ==
X-Gm-Message-State: AOAM531w5PFlfATjBRKEasWoqa0xXk/LYIgkltLLCVCVmhCWl7vL+zBv
 tYx627S/4eXs06/l6qmjQzwbM7bKaUSwfGox
X-Google-Smtp-Source: ABdhPJz5zVDsGHiUqHQQEHYPDO0pb41GkfEFD5BILd/HaIcVzbXuUyo77nrDmWTuYfggG5ggA4aLMw==
X-Received: by 2002:a17:90a:c096:: with SMTP id
 o22mr2257820pjs.3.1642585395329; 
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53])
 by smtp.gmail.com with ESMTPSA id lx10sm3960796pjb.4.2022.01.19.01.43.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso5868583pjh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:43:15 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr11960099vka.0.1642585384422; 
 Wed, 19 Jan 2022 01:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jan 2022 10:42:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdja+XaXGP7YFfSgFCTHzOHQkuV5EF_9AFWY2tppyRWA@mail.gmail.com>
Message-ID: <CAMuHMdVdja+XaXGP7YFfSgFCTHzOHQkuV5EF_9AFWY2tppyRWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Rob Herring <robh@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 dmaengine@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Wed, Jan 19, 2022 at 2:50 AM Rob Herring <robh@kernel.org> wrote:

> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
>
> The array of phandles case boils down to needing:
>
> items:
>   maxItems: 1
>
> The phandle plus args cases should typically take this form:
>
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
>
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.

> Signed-off-by: Rob Herring <robh@kernel.org>

The Renesas parts look good to me.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
