Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F41899D8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 11:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AA36E28A;
	Wed, 18 Mar 2020 10:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8CC6E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 10:47:03 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id l14so23119985ilj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChJRimBxnTbA03roY4ImNXu/QOZAFQmM9aZ0DvgZyss=;
 b=M7UcYpJJ1RDQlXdGC55v616bnVhhxcSbI7p7cjF7lC73j2icPSbW9xDjUWSUgCOzsN
 xDiQjQqDuDpy1p/aeJrhbYGtq4qTrY0iqN2YhQtPY5zcN9YxgSMXMDfIXe5e5rQE0tZC
 V6yM7Rw4W/Z76hXRtTrZWTRyvUcViAz0uBPfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChJRimBxnTbA03roY4ImNXu/QOZAFQmM9aZ0DvgZyss=;
 b=WSOyqReMjNHN25z+NO2vqLi3D8Z5dVljXfxH4d+8hziEl23EX2gpe8kaqD9eWZHd0Y
 sa4f+PxV+tBcp1COXFPhizu1vECh8eJ+tftAQEdO5S2bAEjGJd6iiISVgNbjtVwgQ+Nw
 vRJaenxRcrxBtI7Gc4cKHSeeG+p7r925ju8ZPUBhyyS8b+F3JT5sbFVTPFOB36cfjbij
 CpgeHZYtzGmxKiFW8nwanGRs07cRSk5QcCBtYa/hkeuZH/kZC48ySI9gDiMlOYeWTgVI
 xCuAg5b8TwciTD3qJQFYaoXmTTYKw3JfgA5xHbA/i369gZuxMq79iQKd2Iry+my8w7X2
 2ZRg==
X-Gm-Message-State: ANhLgQ3/0iVJnVFwHoSEfQ4AQxvVXucpwZWQIqsWtmJ/COlganZXmfLp
 Q5JgHj5FWVW4K5WxI8j9LZPeY+iU75zKqJ/JcqVWnTeCDPA=
X-Google-Smtp-Source: ADFU+vuJdvRD/Zp10f0MW07j0n+KougFGQxImVVwXDl2vuBshphJe25zJcL6+uMJZORniwHGcDAe6F57tp5u8+CVJYI=
X-Received: by 2002:a92:9f1b:: with SMTP id u27mr3434011ili.173.1584528422401; 
 Wed, 18 Mar 2020 03:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-9-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-9-sam@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 18 Mar 2020 16:16:51 +0530
Message-ID: <CAMty3ZD2kuD0nwWXDAD6R58Z2GFy1Ap7HfnEtYqwARQqs0nMfQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/36] dt-bindings: display: convert
 feiyang,fy07024di26a30d to DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree <devicetree@vger.kernel.org>, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam Ravmborg,

I send the series for panels which I worked already [1], would like to
send the next version for those. will that work for you?

[1] https://patchwork.kernel.org/cover/11315063/

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
