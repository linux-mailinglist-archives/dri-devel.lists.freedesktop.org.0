Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70E6BAC41
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABA310E97B;
	Wed, 15 Mar 2023 09:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCE010E97B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:36:09 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5418d54d77bso184827677b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678872968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYQoOskS+fbvCREhTpPzMDMuJWMQA/zd7RgkP+TyrM0=;
 b=IQN/hY56AbzZ1v2FNrGKUmXjBUm+cmnyDS6LJ1GMiRmH1s6fI7E3mQs9CP1LWCfVP1
 h1Ig6rWIWGZ6Uui0rrAERUJMswRoZTiXS6BjtL4PsrONzJkeYRpdh/Oij44FVXpPdhLa
 U70GNF6Ggj/OYTWlhdHy+ppyU3tEVKA8+CdUQIcoyJmB2cwJ3qIDzvVuh4Dd9Dj8QIK4
 4Iv+eFEL1FUlyfxOWTIOYABtdbDa4dv6+O/fAizrqtML9621qRECcljq7DSUdzYc1yXY
 QejbhKMIgmAqy6hSLZ39y3qyKMig7JYxK54ljrnNUwSNRZG4uTe6g697VkNtlWe5UMdM
 lC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678872968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYQoOskS+fbvCREhTpPzMDMuJWMQA/zd7RgkP+TyrM0=;
 b=uG7+iSKiQM22+oF8V/THV4Zk/9b+nw0H8/7ucYnPSiek3IdPQhK5oeU3kiETbHdY04
 tTSziuABSFa65rGAR/JmXjGaPt4cO+EGWlBlDDgZGQIUXkBxeXnwe6mI602roGTAei4x
 ofiFmsMvsJzAdw7iC+7JbW2PMgqmHufzY6YWN2EdOrR9TcTfBHTjwD7IdHPyEqe/NNEy
 XK/6zqukOM1qfXRRZdQgKli9UwFwt5dSL35cFhcfOibhlrxqstwd6hrAOpP4rifVTT+1
 flOWulpF4ZMfp3hrrSktnZqOQh39t2t0pG/yoYgFnV+W1SET11QNxlru0I1vBaAKexpZ
 aulQ==
X-Gm-Message-State: AO0yUKXlNfek71bxhw+jd0gncyXxYKg2jzN393BIqzAGgmhlzpiruWYD
 yF9eSWjcD3+8hIUOQLqKy2CxHqSpeguqC2YfrvUI1A==
X-Google-Smtp-Source: AK7set9G1e6Y6bwnztfxt/btqXMvwl4/wb2VsLK7KvPZgdg17nAVO2TJC+1fSD6PY4UewmkcTq3WBx4R9IGiqLo9n3o=
X-Received: by 2002:a81:ae4a:0:b0:541:8995:5334 with SMTP id
 g10-20020a81ae4a000000b0054189955334mr8175964ywk.3.1678872968658; Wed, 15 Mar
 2023 02:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-19-45cbc68e188b@baylibre.com>
 <CAAOTY_-wEzu6JavEAyRo8njOLRMq3i3wEcemNsuMaK00W9QqpQ@mail.gmail.com>
In-Reply-To: <CAAOTY_-wEzu6JavEAyRo8njOLRMq3i3wEcemNsuMaK00W9QqpQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 10:35:57 +0100
Message-ID: <CAFGrd9pa3c3eZcuGg7AmHL8kOAkyx96hwjwnMuO-G9BR1ORJ_w@mail.gmail.com>
Subject: Re: [PATCH 19/21] drm/mediatek: dpi: add support for dpi clock
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lun. 13 mars 2023 =C3=A0 16:21, Chun-Kuang Hu <chunkuang.hu@kernel.org> =
a =C3=A9crit :
>
> >
> > +       dpi->dpi_clk =3D devm_clk_get_optional(dev, "dpi");
>
> For MT8365, DPI clock is not optional, so make sure that MT8365 DPI
> should have this clock.

This should be check and notified at build time thanks to the
device-tree binding. Do you prefer this?:
#IF MT8365_SOC
    dpi->dpi_clk =3D devm_clk_get(dev, "dpi");

Regards,
Alex
