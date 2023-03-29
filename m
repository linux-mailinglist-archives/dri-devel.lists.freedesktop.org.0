Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE3D6CF1E3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 20:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD5810E176;
	Wed, 29 Mar 2023 18:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E278710E176
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 18:10:40 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-54184571389so308331107b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680113440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=;
 b=eDsYeqiG8GB4aZVHJzDU7byR1P1jPt7YE7V+7LrQkBjkHGKR65terpAGMEbNbrpWtc
 GbKOZDyCq7ZL/+Zsg31N3BVfxEvsJ1GDaWJFB38pSjVUW4/6WGSR96i/6pIpJUY1T9+N
 2W7sklR7qOx9HkWIJmhgVq8bUgKpEeVJ7TTmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680113440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s36Q4sLQX/3/tv2niFl6Gc9T++Xctk19QhnwqMt3BVM=;
 b=bjfRIWySBk5dyFD/Eee40iWMoo6tbFyyyAspNkYBX/FiTdrK7PI3pfojvYe3Ls1i4l
 ZjGtMnaTLuU7B5oP5ycQMCwsn+l3KQtz+2XMslZxSgR51hCY5Po/HaxS4MWSWSdZse2Q
 LZeKhqIkTGjgzxHFGQRHatG/z7vH+MwaZit/3/D+EYB4IGaC9TH24N/VriUTt/5SchUj
 Bd0GAZGw3FHcl+52Nr9JSLd1GWYWnMB15M8Mz4yBWDnnhLkb7+X29H46Ap476RxOOOwS
 YbWsG9685KFYqNcMI2dzU4QlC9A1w6NNq9NoVu/j6ww5RWzvbkPc40OE5n/8HDexmg3V
 1qJw==
X-Gm-Message-State: AAQBX9cMahBzWEhUfBk53YDiZQemKuMroQlKmpLxA587e5OsEQoF0D6h
 rTuwal4+hvsa4OQJnmQD/Ul3fSVRUPO+BvKlDtUrRg==
X-Google-Smtp-Source: AKy350bTV90Nmmdqq5XdDMT52Ufu5ut5fzXMHi+iq0KHhNlusnr1XWTmvpO5LoXs+iXfO3xl7HbVrgeRFLebGR+jpH0=
X-Received: by 2002:a81:ac46:0:b0:544:6828:3c09 with SMTP id
 z6-20020a81ac46000000b0054468283c09mr10157919ywj.0.1680113440045; Wed, 29 Mar
 2023 11:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 23:40:28 +0530
Message-ID: <CAMty3ZD3SY-WCtYK0dexdLxCk8d+2tJ=D9xb5uR06jPGCd=56g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add generic-display-mux driver and bindings
To: Pin-yen Lin <treapking@chromium.org>
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
 Nicolas Boichat <drinkcat@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, chrome-platform@lists.linux.dev,
 Guenter Roeck <groeck@chromium.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 18, 2023 at 4:47=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> This series is developed for and tested on MT8173 board, and the layout i=
s:
>
>                                   /-- anx7688
> -- MT8173 HDMI bridge -- GPIO mux
>                                   \-- native HDMI

What is the part number of this GPIO mux? Does mux gpio interrupt
based and able to switch output HDMI and DP. If so, how this gpio
interrupt is different than the HPD in native HDMI? I mean does HPD
have any detection bottlenecks with mux gpio interrupt?

I do have GPIO Mux that input DSI and two outputs DMD/HDMI Input and
HDMI Out. 2x1 with 1x2 mux.

I'm thinking having a generic mux to select the specific out number of
outputs with associated interface outputs can be a viable solution to
address all use cases here.

Thanks,
Jagan.
