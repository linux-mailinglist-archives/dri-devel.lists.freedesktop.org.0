Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FA794096
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 17:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0E410E6A1;
	Wed,  6 Sep 2023 15:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C97F10E6A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 15:42:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so96788866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694014950; x=1694619750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/MJXhHq22hXwGov3L8E3lwBxOOyN2+wzo2q2f2Z9Pw=;
 b=YxYScucHRrhIV73QWxWcMlFBx5pyG5f1YkTux03CGahgfFrVanKbS3wF0MBQrpyDtC
 6jInQEdVLiJYDzWsy4KoklJuSfBp+yTg9KoY79X7zjKCJE1OjirdmPbWLHqnY3IexhG5
 glS6SgwLLEC+T3WzPY7uzuqCDNsm1nGxqkGjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694014950; x=1694619750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/MJXhHq22hXwGov3L8E3lwBxOOyN2+wzo2q2f2Z9Pw=;
 b=FUmVZICOlgU3JJL9/wDeY2LjpjyBxxr3XEDhyPqb7eOYJWXeKJP1c1PnrTt68LoFs3
 FjmcdNB+KR1tvfhI8Kkbi1SuL9ypBmjheklp3K8amWk/e24AoRU1FumtH8C9pIbAp6Tt
 rqY2bSYX7YEXfeOGvtBS2Eh6AXMogGFGJmkAVSfpYSn8ZiGliixvLuupnwvywqtSQ5Ft
 C7gYf+cz5Nm6IkaZPoGYcK3wLGtxo5hWA1f+qtPs8uAZnHoawdweWoZ7ESt8IsEm3NPN
 zfJfFIc1iZG7r/sCsIItS+/ZeOg6DcOg6MOaTo7ef92oNVKxAusWxA0MFNS/PooDiIyj
 OxMA==
X-Gm-Message-State: AOJu0Yzto5hu1nECWd8/sf8RLZZmOok++Oratp8OxLTsEdnfSl72MYB7
 jKwU2RdiqsDqxRl6YckurfhiU2ReJdsJEJqYFy9zeZyE
X-Google-Smtp-Source: AGHT+IHhExJH58RbJnSBHRDW6SlY0fKvL8+122j7wG56VsecrSSBH2UASPUyNc5yyRkLFNTSE5FRYw==
X-Received: by 2002:a17:906:c106:b0:9a5:7dec:fab9 with SMTP id
 do6-20020a170906c10600b009a57decfab9mr3352129ejc.9.1694014950569; 
 Wed, 06 Sep 2023 08:42:30 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 jo26-20020a170906f6da00b00982d0563b11sm9083322ejb.197.2023.09.06.08.42.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 08:42:30 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-521e046f6c7so13400a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:42:29 -0700 (PDT)
X-Received: by 2002:a50:a6de:0:b0:528:ef2:7613 with SMTP id
 f30-20020a50a6de000000b005280ef27613mr163805edc.7.1694014949290; Wed, 06 Sep
 2023 08:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230831080938.47454-1-biju.das.jz@bp.renesas.com>
 <20230831080938.47454-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831080938.47454-4-biju.das.jz@bp.renesas.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Sep 2023 08:42:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRZz8W91U=9krOsKgtNmK_PAEg4c6OXtbJiLJcstSvYA@mail.gmail.com>
Message-ID: <CAD=FV=XRZz8W91U=9krOsKgtNmK_PAEg4c6OXtbJiLJcstSvYA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] drm/bridge: Drop CONFIG_OF conditionals around
 of_node pointers
To: Biju Das <biju.das.jz@bp.renesas.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Guillaume BRUN <the.cheaterman@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 31, 2023 at 1:10=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Having conditional around the of_node pointers turns out to make driver
> code use ugly #ifdef and #if blocks. So drop the conditionals.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v5->v6:
>  * Added Rb tag from Douglas Anderson.
>  * Dropped conditionals from remaining drm/bridge drivers.
> v5:
>  * Split from patch#2
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
>  drivers/gpu/drm/bridge/panel.c                     | 2 --
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 2 --
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 2 --
>  4 files changed, 8 deletions(-)

I think this has had enough time to marinate, so landed to drm-misc-next:

481fc9e7e11d drm/bridge: Drop CONFIG_OF conditionals around of_node pointer=
s
